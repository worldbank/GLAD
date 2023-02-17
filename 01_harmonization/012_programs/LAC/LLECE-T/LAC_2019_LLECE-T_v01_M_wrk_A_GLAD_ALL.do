*=========================================================================*
* GLOBAL LEARNING ASSESSMENT DATABASE (GLAD)
* Project information at: https://github.com/worldbank/GLAD
*
* Metadata to be stored as 'char' in the resulting dataset (do NOT use ";" here)
local region      = "LAC"
local year        = "2019"
local assessment  = "LLECE-T"
local master      = "v01_M"
local adaptation  = "wrk_A_GLAD"
local module      = "ALL"
local ttl_info    = "Joao Pedro de Azevedo [eduanalytics@worldbank.org]"
local dofile_info = "last modified by Alison Gilberto in May 17, 2022"  /* change date*/
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
  local shortcut = "fileserver"	 // TODO: revert to global after dlw permission issue is solved
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
    local input_dir	= "${input}/`surveyid'/Data/Stata" //** AG modified this
	*local input_dir = "${input}/EAP/EAP_2019_SEA-PLM_V01_M/Data" //** YW modified this
  }

  // Confirm if the final GLAD file already exists in the local clone
  cap confirm file "`output_dir'/`output_file'.dta"
  // If the file does not exist or overwrite_files local is set to one, run the do
  if (_rc == 601) | (`overwrite_files') {

    // Filter the master country list to only this assessment-year
    use "${clone}/01_harmonization/011_rawdata/master_countrycode_list.dta", clear
    *** NOTE: cannot use the local assessment (LLECE-T) to filter the master cty list
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
    // Variables that have the same name in all disciplines datasets
    // need to be renamed or they won't be copied when merging datasets
    local vars_to_rename "mat_1 mat_2 mat_3 mat_4 mat_5 lan_1 lan_2 lan_3 lan_4 lan_5 mat_l1 mat_l2 mat_l3 mat_l4 mat_l5 lan_l1 lan_l2 lan_l3 lan_l4 lan_l5 " //  /* excluido puntaje_estandar media_pais se_pais se_reg nivel i_pais ii_pais iii_pais iv_pais i_reg ii_reg iii_reg iv_reg*/

    // Open all raw datasets
    foreach prefix in ERCE_2019_HSE ERCE_2019_QA3 ERCE_2019_QA6 ERCE_2019_QD3 ERCE_2019_QD6 ERCE_2019_QF3 ERCE_2019_QF6 ERCE_2019_QP3 ERCE_2019_QP6 /*PE3_all_TERCE PL3_all_TERCE PM3_all_TERCE PC6_all_TERCE PE6_all_TERCE PL6_all_TERCE PM6_all_TERCE QA3 QF3 QA6 QF6 */ {
      if `from_datalibweb'==1 {
        noi edukit_datalibweb, d(country(`region') year(`year') type(EDURAW) surveyid(`surveyid') filename(`prefix'.dta) `shortcut')
      }
      else {
        use "`input_dir'/`prefix'.dta", clear
      }

      // Destring if possible
      capture destring idstud idschool idclass, replace

      // Only the first 3 letters of the prefixes (ie: ERCE_2019_QA3 becomes QA3)
      local shortprefix = substr("`prefix'",-3,.) //("`prefix'",1,3)

      rename *, lower
      compress
      save "`temp_dir'/`shortprefix'.dta", replace
    }

    noi disp as res "{phang}Step 1 completed (`output_file'){p_end}"

    *---------------------------------------------------------------------------
    * 2) Combine all rawdata into a single file (merge and append)
    *---------------------------------------------------------------------------


    // Grade 3
    use "`temp_dir'/QA3.dta", clear //Cuestionario Estudiantes
    merge 1:1 idcntry idstud using "`temp_dir'/QF3.dta", keep(master match using) nogen //Cuestionario de Familias
    merge m:1 idcntry idschool using "`temp_dir'/QD3.dta", keep(master match using) nogen //Cuestionario de Directores	
	*merge m:1 idcntry idschool using "`temp_dir'/QP3.dta", keep(master match using) nogen // teacher questionnaire 
    replace grade = 3 if missing(grade)
    save "`temp_dir'/P_3.dta", replace

    // Grade 6
    use "`temp_dir'/HSE.dta", clear //Cuestionario HSE
	merge 1:1 idcntry idstud using "`temp_dir'/QA6.dta", keep(master match using) nogen //Cuestionario Estudiantes
    merge 1:1 idcntry idstud using "`temp_dir'/QF6.dta", keep(master match using) nogen //Cuestionario de Familias
    merge m:1 idcntry idschool using "`temp_dir'/QD6.dta", keep(master match using) nogen //Cuestionario de Directores
	*merge m:1 idcntry idschool using "`temp_dir'/QP6.dta", keep(master match using) nogen // teacher questionnaire
    replace grade = 6 if missing(grade)
    save "`temp_dir'/P_6.dta", replace

    // Append both grades
    use "`temp_dir'/P_3.dta", clear
    append using "`temp_dir'/P_6.dta"
  
    noi disp as res "{phang}Step 2 completed (`output_file'){p_end}"


    *---------------------------------------------------------------------------
    * 3) Standardize variable names across all assessments
    *---------------------------------------------------------------------------
    // For each variable class, we create a local with the variables in that class
    //     so that the final step of saving the GLAD dta  knows which vars to save

    // ID Vars:
    local idvars	"idcntry_raw idschool idgrade idclass idlearner"

    *<_idcntry_raw_>
    clonevar idcntry_raw = idcntry
    label var idcntry_raw "Country ID, as coded in rawdata"
    *</_idcntry_raw_>

    *<_idschool_>
    label var idschool "School ID"
    *</_idschool_>

    *<_idgrade_>
	clonevar idgrade = grade //
    label var idgrade "Grade ID"
    *</_idgrade_>

    *<_idclass_>
    replace idclass = -99 	if  missing(idclass)	// Had missing values which would cause error when checking id
    label var idclass "Class ID"
    *</_idclass_>

    *<_idlearner_>
    clonevar idlearner = idstud
    label var idlearner "Learner ID"
    *</_idlearner_>

    // Drop any value labels of idvars, to be okay to append multiple surveys
    foreach var of local idvars {
      label values `var' .
    }

	// VALUE Vars:
		local valuevars	"score_llece* level_llece*"
	
	*<_score_assessment_subject_pv_>
	forvalues pv = 1/5 {
		// Reading
		clonevar  score_llece_read_0`pv' = lan_`pv'
		label var score_llece_read_0`pv' "Plausible value `pv': `assessment' score for read"
		char      score_llece_read_0`pv'[clo_marker] "number"
		// Mathematics
		clonevar  score_llece_math_0`pv' = mat_`pv'
		label var score_llece_math_0`pv' "Plausible value `pv': `assessment' score for math"
		char      score_llece_math_0`pv'[clo_marker] "number"
	}
	
	*</_score_assessment_subject_pv_>

	*<_level_assessment_subject_pv_>
				
	forvalues pv = 1/5 {
		// Reading
		label define lblevels`pv' 1 "I" 2 "II" 3 "III" 4 "IV" 
        encode lan_l`pv', gen(level_llece_read_0`pv') label(lblevels`pv')
        label define lblevels`pv' 1 "Level I" 2 "Level 2" 3 "Level 3" 4 "Level 4" , modify
        label list lblevels`pv'
		label var level_llece_read_0`pv' "Plausible value `pv': `assessment' level for read"
		char      level_llece_read_0`pv'[clo_marker] "factor"
		// Mathematics
		label define lblevels2`pv' 1 "I" 2 "II" 3 "III" 4 "IV" 
        encode mat_l`pv', gen(level_llece_math_0`pv') label(lblevels2`pv')
        label define lblevels2`pv' 1 "Level I" 2 "Level 2" 3 "Level 3" 4 "Level 4" , modify
        label list lblevels2`pv'
	    label var level_llece_math_0`pv' "Plausible value `pv': `assessment' level for math"
		char      level_llece_math_0`pv'[clo_marker] "factor"
	}
		
	*</_level_assessment_subject_pv_>

    // TRAIT Vars:
    local traitvars	"age urban* male qescs has_qescs"

    *<_age_>
    clonevar age = edad
    label var age "Learner age at time of assessment"
    *</_age_>

    *<_urban_>
    gen byte urban = (rural == 1) if !missing(rural)	
    label var urban "School is located in urban/rural area"
    *</_urban_>

    *<_male_>
    gen byte male = .
    replace  male = (sex == 0) 
    label var male "Learner gender is male/female"
    *</_male_>


    // SAMPLE Vars:
    local samplevars "strata learner_weight weight_replicate*"
	
	*<_learner_weight_>
    clonevar  learner_weight = wt
	label var learner_weight "Learner weight"
    *</_learner_weight*_>

    *<_strata_>
    *clonevar strata = idstrat
    label var strata "Strata"
    *</_strata_>
	
	*<_weight_replicateN_>
	forvalues i=1(1)100 {
		clonevar  weight_replicate`i' = brr`i'
		label var weight_replicate`i' "Replicated weight `i'"
	}
	*</_weight_replicateN_>


    noi disp as res "{phang}Step 3 completed (`output_file'){p_end}"

   *---------------------------------------------------------------------------
    * 4) ESCS and other calculations (by Aroob, from Feb 2019)
    *---------------------------------------------------------------------------
	* use the syntax used for SSA_2014_PASEC
	*** QUICK FIX ****
    rename *, upper
    ******************

    *Generating variable for Early Childhood education:
	gen ECE = 1 if PREE == 1 

	*Generating variable for number of books:
	gen NBOOKS = LIBH

	*Generating variable for Socio-Economic Status:
	foreach var in E6IT03_01 E6IT03_02 E6IT03_03 E6IT03_04 E6IT03_05 E6IT03_06 {
		clonevar clone_`var' = `var'
		recode clone_`var' (1=1) (2=0) 	
	}
		
	egen hhsize = rowtotal(clone_E6IT03_01 clone_E6IT03_02 clone_E6IT03_03 clone_E6IT03_04 clone_E6IT03_05 clone_E6IT03_06) 
	egen hedu = rowmax(E6IT09 E6IT15)

	*SES description is available - the SES variable given by the database will be used:
	*Using principal component analysis:
	clonevar ESCS = ISECF // values between -2.68 & 3.31
    *Replacing missing values:
	bysort COUNTRY IDSCHOOL IDGRADE: egen ESCS_mean = mean(ESCS)
	bysort COUNTRY IDGRADE: egen ESCS_mean_cnt = mean(ESCS)
	replace ESCS = ESCS_mean if IDGRADE == 6 & missing(ESCS)
	replace ESCS = ESCS_mean_cnt if IDGRADE == 6 & missing(ESCS)
		
	*The data contain assets and housing conditions
    bysort IDCNTRY IDSCHOOL IDGRADE: egen SCHESCS = mean(ESCS)
    bysort IDCNTRY IDGRADE: egen CNTESCS = mean(ESCS)

    *** QUICK FIX ****
    rename *, lower
    ******************
	* use the syntax used for LAC_2013_LLECE
	* Quintiles of ESCS // this setion of the code used to be in 0221 or 0222.
	* This is the variable used to compute results by Socio Economic Status
	*<_qescs_>
	tempvar cntrycode
	sum idcntry_raw
	if (`r(N)' != 0) {
		tostring idcntry_raw, gen(`cntrycode')
	}
	else {
		clonevar `cntrycode' = idcntry_raw
	}
	cap: sum qescs
	if (_rc!=0) {
		gen byte qescs = .
		levelsof idgrade, local(grades)
		levelsof `cntrycode', local(countries)
		foreach country of local countries {
			foreach grade of local grades {
				capture drop qaux
				capture xtile qaux = escs if `cntrycode' == "`country'" & idgrade == `grade' [aw = learner_weight] , nq(5)
				if _rc == 0 replace qescs = qaux if `cntrycode' == "`country'" & idgrade == `grade'
			}
		}
	}
	label var qescs "Quintiles of Socio-Economic Status"
	*</_qescs_>

	 *<_has_qescs_>
	gen byte has_qescs = (qescs != .)
	label var has_qescs "Dummy variable for observations with a valid QESCS"
	*</_has_qescs_>

    noi disp as res "{phang}Step 4 completed (`output_file'){p_end}"

  

    *---------------------------------------------------------------------------
    * 5) Bring WB countrycode & harmonization thresholds, and save dtas
    *---------------------------------------------------------------------------

    // Brings World Bank countrycode from ccc_list
    // NOTE: the *assert* is intentional, please do not remove it.
    // if you run into an assert error, edit the 011_rawdata/master_countrycode_list.csv
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
