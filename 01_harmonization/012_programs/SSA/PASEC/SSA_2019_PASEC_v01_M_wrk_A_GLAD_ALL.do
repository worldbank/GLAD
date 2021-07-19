*=========================================================================*
* GLOBAL LEARNING ASSESSMENT DATABASE (GLAD)
* Project information at: https://github.com/worldbank/GLAD
*
* Metadata to be stored as 'char' in the resulting dataset (do NOT use ";" here)
local region      = "SSA"
local year        = "2019"
local assessment  = "PASEC"
local master      = "v01_M"
local adaptation  = "wrk_A_GLAD"
local module      = "ALL"
local ttl_info    = "Joao Pedro de Azevedo [eduanalytics@worldbank.org]"
local dofile_info = "last modified by Alison Gilberto in May 14, 2021"
*
* Steps:
* 0) Program setup (identical for all assessments)
* 1) Open all rawdata, lower case vars, save in temp_dir
* 2) Combine all rawdata into a single file (merge and append)
* 3) Standardize variable names across all assessments
* 4) ESCS and other calculations (by Aroob, from Feb 2019)
* 5) Bring WB countrycode & harmonization thresholds, and save dtas
*=========================================================================*


quietly {

	*---------------------------------------------------------------------------
	* 0) Program setup (identical for all assessments)
	*---------------------------------------------------------------------------

	// Parameters ***NEVER COMMIT CHANGES TO THOSE LINES!***
	//  - whether takes rawdata from datalibweb (==1) or from indir (!=1), global in 01_run.do
	local from_datalibweb = $from_datalibweb
	//  - whether checks first if file exists and attempts to skip this do file
	local overwrite_files = $overwrite_files
	//  - optional shortcut in datalibweb
	local shortcut = "$shortcut"
	//  - setting random seed at the beginning of each do for reproducibility
	set seed $master_seed

	// Set up folders in clone and define locals to be used in this do-file
	glad_local_folder_setup , r("`region'") y("`year'") as("`assessment'") ma("`master'") ad("`adaptation'")
	local temp_dir     "`r(temp_dir)'"
	local output_dir   "`r(output_dir)'"
	local surveyid     "`r(surveyid)'"
	local output_file  "`surveyid'_`adaptation'_`module'"

	// If user does not have access to datalibweb, point to raw microdata location
	if `from_datalibweb' == 0 {
		local input_dir	= "${input}/`region'/`region'_`year'_`assessment'/`surveyid'/Data/Stata"
	}
  
	// Confirm if the final GLAD file already exists in the local clone
	cap confirm file "`output_dir'/`output_file'.dta"
	// If the file does not exist or overwrite_files local is set to one, run the do
	if (_rc == 601) | (`overwrite_files') {

		// Filter the master country list to only this assessment-year
		use "${clone}/01_harmonization/011_rawdata/master_countrycode_list.dta", clear
		keep if (assessment == "`assessment'") & (year == `year')
		// Most assessments use the numeric idcntry_raw but a few (ie: PASEC 1996) have instead idcntry_raw_str
		if use_idcntry_raw_str[1] == 1 {
			drop   idcntry_raw
			rename idcntry_raw_str idcntry_raw
		}
		keep idcntry_raw national_level countrycode
		save "`temp_dir'/countrycode_list.dta", replace

		// Tokenized elements from the header to be passed as metadata
		local glad_description  "This dataset is part of the Global Learning Assessment Database (GLAD). It contains microdata from `assessment' `year'. Each observation corresponds to one learner (student or pupil), and the variables have been harmonized."
		local metadata          "region `region'; year `year'; assessment `assessment'; master `master'; adaptation `adaptation'; module `module'; ttl_info `ttl_info'; dofile_info `dofile_info'; description `glad_description'"

		*---------------------------------------------------------------------------
		* 1) Open all rawdata, lower case vars, save in temp_dir
		*---------------------------------------------------------------------------
		foreach prefix in PASEC2019_GRADE2  PASEC2019_GRADE6 {
			if `from_datalibweb'==1 {
				noi edukit_datalibweb, d(country(`region') year(`year') type(EDURAW) surveyid(`surveyid') filename(`prefix'.dta) `shortcut')

			}
			else {
				use "`input_dir'/`prefix'.dta", clear
			}
			rename *, lower
			compress
			save "`temp_dir'/`prefix'.dta", replace
		}

		noi disp as res "{phang}Step 1 completed (`output_file'){p_end}"


		*---------------------------------------------------------------------------
		* 2) Combine all rawdata into a single file (merge and append)
		*---------------------------------------------------------------------------

		use "`temp_dir'/PASEC2019_GRADE2.dta", clear
		gen idgrade = 2
		append using "`temp_dir'/PASEC2019_GRADE6.dta"
		replace idgrade = 6 if missing(idgrade)

		noi disp as res "{phang}Step 2 completed (`output_file'){p_end}"


		*---------------------------------------------------------------------------
		* 3) Standardize variable names across all assessments
		*---------------------------------------------------------------------------
		// For each variable class, we create a local with the variables in that class
		// so that the final step of saving the GLAD dta  knows which vars to save

		// ID Vars:
		local idvars "idcntry_raw idschool idgrade idlearner"  // idclass does not exist

		*<_idcntry_raw_>
		clonevar idcntry_raw = id_pays
		label var idcntry_raw "Country ID, as coded in rawdata"
		*</_idcntry_raw_>

		*<_idschool_>
		clonevar idschool = id_ecole
		destring idschool, replace
		label var idschool "School ID"
		*</_idschool_>

		*<_idgrade_>
		label var idgrade "Grade ID"
		*</_idgrade_>

		*<_idclass_>
		gen int idclass = -99		// PLACEHOLDER: double check documentation to make sure it doesnt exist
		label var idclass "Class ID"
		*</_idclass_>

		*<_idlearner_>
		clonevar idlearner = id_eleve
		destring idlearner, replace
		label var idlearner "Learner ID"
		*</_idlearner_>

		// Drop any value labels of idvars, to be okay to append multiple surveys
		foreach var of local idvars {
			label values `var' .
		}


		// VALUE Vars:
		local valuevars	"score_pasec* level_pasec*"

		*<_score_assessment_subject_pv_>
		forvalues pv = 1/5 {
			clonevar  score_pasec_read_0`pv' = lect_pv`pv'
			label var score_pasec_read_0`pv' "Plausible value `pv': `assessment' score for read"
			char      score_pasec_read_0`pv'[clo_marker] "number"
			clonevar  score_pasec_math_0`pv' = maths_pv`pv'
			label var score_pasec_math_0`pv' "Plausible value `pv': `assessment' score for math"
			char      score_pasec_math_0`pv'[clo_marker] "number"
		}
		*</_score_assessment_subject_pv_>

		*<_level_assessment_subject_pv_>
		// Data does not contain a variable for levels, but the documentation provides this conversion
    ****WHERE IS SUPPOSED TO BE SAVED THIS DOC? WHO CHOOSE "WEB21"?***
		// for details: SSA_2014_PASEC_v01_M/Doc/Reports/RE_Pasec2014_GB_web21.pdf
		label define lblevels 0 "Below Level I" 1 "Level I" 2 "Level 2" 3 "Level 3" 4 "Level 4" .a "Missing test score"
		forvalues pv = 1/5 {
			gen level_pasec_read_0`pv': lblevels = .a
			gen level_pasec_math_0`pv': lblevels = .a
			// Reading, grade 2
			replace level_pasec_read_0`pv' = 4 if lect_pv`pv'<99999 & idgrade == 2
			replace level_pasec_read_0`pv' = 3 if lect_pv`pv'<610.4 & idgrade == 2
			replace level_pasec_read_0`pv' = 2 if lect_pv`pv'<540.0 & idgrade == 2
			replace level_pasec_read_0`pv' = 1 if lect_pv`pv'<469.5 & idgrade == 2
			replace level_pasec_read_0`pv' = 0 if lect_pv`pv'<399.1 & idgrade == 2
			// Reading, grade 6
			replace level_pasec_read_0`pv' = 4 if lect_pv`pv'<99999 & idgrade == 6
			replace level_pasec_read_0`pv' = 3 if lect_pv`pv'<595.1 & idgrade == 6
			replace level_pasec_read_0`pv' = 2 if lect_pv`pv'<518.4 & idgrade == 6
			replace level_pasec_read_0`pv' = 1 if lect_pv`pv'<441.7 & idgrade == 6
			replace level_pasec_read_0`pv' = 0 if lect_pv`pv'<365.0 & idgrade == 6
			// Mathematics, grade 2 (no level 4 exist)
			replace level_pasec_math_0`pv' = 3 if maths_pv`pv'<99999 & idgrade == 2
			replace level_pasec_math_0`pv' = 2 if maths_pv`pv'<577.7 & idgrade == 2
			replace level_pasec_math_0`pv' = 1 if maths_pv`pv'<489.0 & idgrade == 2
			replace level_pasec_math_0`pv' = 0 if maths_pv`pv'<400.3 & idgrade == 2
			// Mathematics, grade 6 (no level 4 exist)
			replace level_pasec_math_0`pv' = 3 if maths_pv`pv'<99999 & idgrade == 6
			replace level_pasec_math_0`pv' = 2 if maths_pv`pv'<609.6 & idgrade == 6
			replace level_pasec_math_0`pv' = 1 if maths_pv`pv'<521.5 & idgrade == 6
			replace level_pasec_math_0`pv' = 0 if maths_pv`pv'<433.3 & idgrade == 6
			label var level_pasec_read_0`pv' "Plausible value `pv': `assessment' level for read"
		  label var level_pasec_math_0`pv' "Plausible value `pv': `assessment' level for math"
			char      level_pasec_read_0`pv'[clo_marker] "factor"
			char      level_pasec_math_0`pv'[clo_marker] "factor"
		}
		*</_level_assessment_subject_pv_>


		// TRAIT Vars:
		local traitvars	"age urban* male escs"

		*<_age_>
		gen     age = qe22 if idgrade == 2
		replace age = qe62 if idgrade == 6
		label var age "Learner age at time of assessment"
		*</_age_>

		*<_urban_>
    *check if 3 is there 
		gen byte urban = (qd31<3) if !missing(qd31) 
		label var urban "School is located in urban/rural area"
		*</_urban_>

		*<_urban_o_>
		decode qd31, g(urban_o)
		label var urban_o "Original variable of urban: school is located in area described as"
		*</_urban_o_>

		*<_male_>
		gen     male = (qe23==1) if !missing(qe23) & idgrade == 2
		replace male = (qe63==1) if !missing(qe63) & idgrade == 6
		label var male "Learner gender is male/female"
		*</_male_>


		// SAMPLE Vars:
		local samplevars "strata learner_weight jkzone jkrep weight_replicate*"

		*<_learner_weight_>
		clonevar  learner_weight = rwgt0
		label var learner_weight "Learner weight"
		*</_learner_weight_>

		*<_strata_>
		clonevar  strata = id_strate
		label var strata "Strata"
		*</_strata_>

		*<_jkzone_>
		label var jkzone "Jackknife zone"
		*</_jkzone_>

		*<_jkrep_> 
		label var jkrep "Jackknife replicate code" // In 2014 was 1/0 ; in 2019 is 2/0
		*</_jkrep_>

		*<_weight_replicateN_>
		forvalues i=1(1)90 {
			clonevar  weight_replicate`i' = rwgt`i'
			label var weight_replicate`i' "Replicate weight `i'"
		}
		*</_weight_replicateN_>

		noi disp as res "{phang}Step 3 completed (`output_file'){p_end}"


		*---------------------------------------------------------------------------
		* 4) ESCS and other calculations (by Aroob, from Feb 2019)
		*---------------------------------------------------------------------------

		*** QUICK FIX ****
		rename *, upper
		******************

		*Generating variable for Early Childhood education:
		gen ECE = 1 if QE66 == 1 | QE25 == 1
		replace ECE = 0 if QE66 == 2 // for grade 6
    replace ECE = 0 if QE25 == 2 // add for grade 2

		*Generating variable for number of books:
		gen NBOOKS = QE632

		*Generating variable for Socio-Economic Status:
    
    *In 2014 (QE628) the answer was yes or no. 
    gen QE639_w_home=1 if QE639==1 // 1 if "Abonnement, robinet"
    replace QE639_w_home=0 if QE639==2 | QE639==3| QE639==4| QE639==5| QE639==6 
    replace QE639_w_home=6 if QE639==96 // invalid 
    replace QE639_w_home=9 if QE639==99 // missing
    
		foreach var of varlist QE635* QE636* QE638 QE633 QE639_w_home QE621* {
			replace `var' = 0 if `var' == 2
		} // only for grade 6

		gen hhsize = 1
    // will be the minimun number of members in the house: 
    foreach var of varlist QE64A-QE64G {
    	replace hhsize = hhsize +1 if `var'==1
      replace hhsize = 0 if `var'==2
      replace hhsize = 6 if `var'==6
      replace hhsize = 9 if `var'==9
    }
		egen hedu = rowtotal(QE621A QE621B)
    
		*wall related variable structure changed in 2019.

		*Using principal component analysis:
		egen ESCS = std(SES)
		*Replacing missing values:
		bysort PAYS ID_ECOLE IDGRADE: egen ESCS_mean = mean(ESCS)
		bysort PAYS IDGRADE: egen ESCS_mean_cnt = mean(ESCS)
		replace ESCS = ESCS_mean if IDGRADE == 6 & missing(ESCS)
		replace ESCS = ESCS_mean_cnt if IDGRADE == 6 & missing(ESCS)

		*The data contain assets and housing conditions
		bysort IDCNTRY_RAW IDSCHOOL IDGRADE: egen SCHESCS = mean(ESCS)
		bysort IDCNTRY_RAW IDGRADE: egen CNTESCS = mean(ESCS)

		*** QUICK FIX ****
		rename *, lower
		******************

		noi disp as res "{phang}Step 4 completed (`output_file'){p_end}"


		*---------------------------------------------------------------------------
		* 5) Bring WB countrycode & harmonization thresholds, and save dtas
		*---------------------------------------------------------------------------

		// Brings World Bank countrycode from ccc_list
		// NOTE: the *assert* is intentional, please do not remove it.
		// if you run into an assert error, edit manually the 011_rawdata/master_countrycode_list.csv
		merge m:1 idcntry_raw using "`temp_dir'/countrycode_list.dta", keep(match) assert(match using) nogen

		// Surveyid is needed to merge harmonization proficiency thresholds
		gen str surveyid = "`region'_`year'_`assessment'"
		label var surveyid "Survey ID (Region_Year_Assessment)"
  
		// New variable class: keyvars (not IDs, but rather key to describe the dataset)
		local keyvars "surveyid countrycode national_level"

		// This function compresses the dataset, adds metadata passed in the arguments as chars, save GLAD_BASE.dta
		// which contains all variables, then keep only specified vars and saves GLAD.dta, and delete files in temp_dir
		edukit_save, filename("`output_file'") path("`output_dir'") dir2delete("`temp_dir'")              ///
		             idvars("`idvars'") varc("key `keyvars'; value `valuevars'; trait `traitvars'; sample `samplevars'") ///
		             metadata("`metadata'") collection("GLAD")

		noi disp as res "Creation of `output_file'.dta completed"

	}

	else {
		noi disp as txt "Skipped creation of `output_file'.dta (already found in clone)"
		// Still loads it, to generate documentation
		use "`output_dir'/`output_file'.dta", clear
	}
}
