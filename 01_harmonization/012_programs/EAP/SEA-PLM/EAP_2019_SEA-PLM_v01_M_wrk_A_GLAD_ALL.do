*=========================================================================*
* GLOBAL LEARNING ASSESSMENT DATABASE (GLAD)
* Project information at: https://github.com/worldbank/GLAD
*
* Metadata to be stored as 'char' in the resulting dataset (do NOT use ";" here)
local region      = "EAP"   /* LAC, SSA, WLD or CNT such as KHM RWA */
local year        = "2019"  /* 2015 */
local assessment  = "SEA-PLM" /* PIRLS, PISA, EGRA, etc */
local master      = "v01_M" /* usually v01_M, unless the master (eduraw) was updated*/
local adaptation  = "wrk_A_GLAD" /* no need to change here */
local module      = "ALL"  /* for now, we are only generating ALL and ALL-BASE in GLAD */
local ttl_info    = "Joao Pedro de Azevedo [eduanalytics@worldbank.org]" /* no need to change here */
local dofile_info = "last modified by Joao Pedro Azevedo in Feb 05, 2022"  /* change date*/
*
* Steps:
* 0) Program setup (identical for all assessments)
* 1) Open all rawdata, lower case vars, save in temp_dir
* 2) Combine all rawdata into a single file (merge and append)
* 3) Standardize variable names across all assessments
* 4) ESCS and other calculations
* 5) Bring WB countrycode & harmonization thresholds, and save dtas
*=========================================================================*

noisily {

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
    local input_dir	= "${input}/EAP/EAP_2019_SEA-PLM_V01_M/Data" //** YW modified this
  } 

  // Confirm if the final GLAD file already exists in the local clone
  cap confirm file "`output_dir'/`output_file'.dta"
  
  // If the file does not exist or overwrite_files local is set to one, run the do
  if (_rc == 601) | (`overwrite_files') {

    // Filter the master country list to only this assessment-year
	use "${clone}/01_harmonization/011_rawdata/master_countrycode_list.dta", clear
	keep if (assessment == "`assessment'") & (year == `year')
	tostring idcntry_raw, replace
  
    keep idcntry_raw national_level countrycode
		save "`temp_dir'/countrycode_list.dta", replace // modified the temp_dir

    // Tokenized elements from the header to be passed as metadata
    local glad_description  "This dataset is part of the Global Learning Assessment Database (GLAD). It contains microdata from `assessment' `year'. Each observation corresponds to one learner (student or pupil), and the variables have been harmonized."
    local metadata          "region `region'; year `year'; assessment `assessment'; master `master'; adaptation `adaptation'; module `module'; ttl_info `ttl_info'; dofile_info `dofile_info'; description `glad_description'"
  
    *---------------------------------------------------------------------------
    * 1) Open all rawdata, lower case vars, save in temp_dir
    *---------------------------------------------------------------------------

    /***** SEA-PLM 2019 *****/

       // Temporary copies of the 3 raw datasets needed  (new section)
       foreach prefix in sea-plm_regional_students sea-plm_regional_schools sea-plm_regional_parents sea-plm_regional_parents_no_indices {
	       if `from_datalibweb' == 1 {
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

    ***** SEA-PLM 2019 *****
	use "`temp_dir'/sea-plm_regional_students.dta", clear
	merge m:1 cnt fullid using "`temp_dir'/sea-plm_regional_parents", keep(master match using) nogen
	merge m:1 cnt fullid using "`temp_dir'/sea-plm_regional_parents_no_indices", keep(master match using) nogen
    merge m:1 cnt schid stidstrt stidsch using "`temp_dir'/sea-plm_regional_schools.dta", keep(master match using) nogen
    save "`temp_dir'/sea-plm_regional.dta", replace
    ***** END OF SEA-PLM 2019  *****/

    noi disp as res "{phang}Step 2 completed (`output_file'){p_end}"
	

    *---------------------------------------------------------------------------
    * 3) Standardize variable names across all assessments
    *---------------------------------------------------------------------------
    // For each variable class, we create a local with the variables in that class
    //     so that the final step of saving the GLAD dta  knows which vars to save

    // Every manipulation of variable must be enclosed by the ddi tags
    // Use clonevar instead of rename (preferable over generate)
    // The labels should be the same.
    // The generation of variables was commented out and should be replaced as needed

    // ID Vars:
    local idvars "idschool idgrade idclass idlearner"

    *<_idcntry_raw_>
    clonevar idcntry_raw = cnt
    label var idcntry_raw "Country ID, as coded in rawdata"
    *</_idcntry_raw_>

    *<_idschool_		
		* Unique School ID is schid - Make IDS unique
		rename idschool idschool_o // **YW renaming the original idschool var b/c it overlaps with the clone one
		sort schid
		by schid: gen dup = cond(_N==1,0,_n)
		sort dup schid
		by dup: gen idschool = _n
		drop dup
		label var idschool "School ID"
    *</_idschool_>

    *<_idgrade_>
    gen idgrade = 5 // Grade info not available, generating 5 based on survey 
		label var idgrade "Grade ID"
    *</_idgrade_>

    *<_idclass_>
		*Unique ID class is IDSCHOOL - turning the values unique
		sort idschool_o
		by idschool_o: gen dup = cond(_N==1,0,_n)
		sort dup idschool_o
		by dup: gen idclass = _n	
    label var idclass "Class ID"
		drop dup
    *</_idclass_>

    *<_idlearner_>
		sort fullid
		by fullid: gen dup = cond(_N==1,0,_n)
		sort dup fullid
		by dup: gen idlearner = _n	
		drop dup
		drop fullid
    label var idlearner "Learner ID"
    *</_idlearner_>


    // VALUE Vars: 	  /* SEA-PLM */
    local valuevars	"score_saplm_* level_saplm_*"

    *<_score_assessment_subject_pv_>
		foreach pv in 1 2 3 4 5 {		
			local auxpv = string(`pv')
			clonevar score_saplm_read_0`auxpv' = pv`pv'_r
      label var score_saplm_read_0`auxpv' "Plausible value `pv': `assessment' score for reading"
			char      score_saplm_read_0`auxpv'[clo_marker] "number"
			
			clonevar score_saplm_write_0`auxpv' = pv`pv'_w
			label var score_saplm_write_0`auxpv' "Plausible value `pv': `assessment' score for writing"
			char      score_saplm_write_0`auxpv'[clo_marker] "number" 
			
			clonevar score_saplm_math_0`auxpv' = pv`pv'_m
			label var score_saplm_math_0`auxpv' "Plausible value `pv': `assessment' score for mathematics"
			char      score_saplm_math_0`auxpv'[clo_marker] "number"
			
		}
		
    *</_score_assessment_subject_pv_>

    *<_level_assessment_subject_pv_>
			foreach pv in 1 2 3 4 5 {		
				local auxpv = string(`pv')
				clonevar level_saplm_read_0`auxpv' = pl_pv`pv'_r
				label var level_saplm_read_0`auxpv' "Plausible value `pv': `assessment' level for reading"
				char      level_saplm_read_0`auxpv'[clo_marker] "factor"
							
				
	/*			clonevar level_seaplm_write_0`auxpv' = pl_pv`pv'_w
				label var level_seaplm_write_0`auxpv' "Plausible value `pv': `assessment' level for writing"
				char      level_seaplm_write_0`auxpv'[clo_marker] "factor" */
				
				clonevar level_saplm_math_0`auxpv' = pl_pv`pv'_m
				label var level_saplm_math_0`auxpv' "Plausible value `pv': `assessment' level for mathematics"	
				char      level_saplm_math_0`auxpv'[clo_marker] "factor"
				
				}
	}
    *</_level_assessment_subject_pv_>


    // TRAIT Vars:
    local traitvars	"age urban* male escs qescs has_qescs"

    *<_age_>
    gen age = s_age		if !missing(s_age) & s_age < 97
		replace age = round(age, 1)
    label var age "Learner age at time of assessment"
    *</_age_>

    *<_urban_>
		encode sc09q01 if sc09q01!= "7" & sc09q01 != "8" & sc09q01 != "9", gen(urban)
		replace urban = 0 if urban == 1 
		replace urban = 1 if urban >= 2 // * 2. a small town 3. a town 4. a city 5. a big city
    label var urban "School is located in urban/rural area"
    *</_urban_>

    *<_urban_o_>
		gen urban_o1 = sc09q01
		label var urban_o1 "Original variable of urban: school is located in area described as"
		
		gen urban_o2 = c_schsize
    label var urban_o2 "Original variable of urban: population size of the school area"
    *</_urban_o_>

    *<_male_>
		encode gender if gender == "2" | gender == "1" & gender != "7" & gender != "9" & gender != "8" , gen(male)
		replace male = 0 if male == 1
		replace male = 1 if male == 2

    label var male "Learner gender is male/female"
    *</_male_>
		
		// SAMPLE Vars:
		local samplevars "strata learner_weight weight_replicate*"
	
		*<_learner_weight_>
		clonevar learner_weight = wt2019
		label var learner_weight "Learner weight"
		*</_learner_weight_>

		*<_strata_>
		clonevar  strata = stidstrt
		destring strata, replace
		label var strata "Strata"
		*</_strata_>


		*<_weight_replicateN_>
		forvalues i=1(1)95 {
		  clonevar  weight_replicate`i' = rwgt`i'
			label var weight_replicate`i' "Replicate weight `i'"
		}
		*</_weight_replicateN_>

    noi disp as res "{phang}Step 3 completed (`output_file'){p_end}"


    *---------------------------------------------------------------------------
    * 4) ESCS and other calculations
    *---------------------------------------------------------------------------
    local saplmvars "ses_quintile city language school_type school_type_o asian_identity escs*"
		
    // Placeholder for other operations that we may want to include (kept in ALL-BASE)
	*<_escs_>
	**Clone SES Calculation
	clonevar escs = ses
	label var escs "Socioeconomic status: SEA-PLM"
				
	** Household Asset Index
	clonevar escs_homeres = homeres
	label var escs_homeres "Home Resource Index Based on Household Assets"
		
	** Save Household Assets
	foreach var in st10q15 st10q16 st11q01 pa05q01 pa05q02 pa05q05 pa05q08 pa05q09 pa05q10 pa05q11 pa05q12 pa05q13 pa05q14 pa05q15 pa05q16 pa05q18 pa05q19 pa05q20 pa06q01 pa07q01 {
		clonevar escs_`var' = `var'
		local x : variable label `var'
		label var escs_`var' "Household asset `x'"
	}
		
	** Parental education
	clonevar escs_pared = pared if pared <= 5
	replace escs_pared = 6 if escs_pared == 1
	replace escs_pared = 5 if escs_pared == 2 // this is ISCED 4 and 5
	replace escs_pared = 2 if escs_pared == 4
	replace escs_pared = 1 if escs_pared == 5
	label var escs_pared "Highest parental education (ISCED)"
		
	** Parental Occupation
	gen byte escs_pocc =(inlist(pocc, 1, 2, 3, 4, 5, 6))  if  !missing(pocc)
	label var escs_pocc
	*</_escs_>
		
		
    *<_ses_quintile_>
	gen ses_quintile = . // sea-plm ses different from GLAD escs
    levelsof idcntry_raw, local (c)
    foreach cc of local c {
		_ebin ses [weight = learner_weight] if idcntry_raw == "`cc'" , gen(q_`cc') nquantiles(5)
		replace ses_quintile = q_`cc' if missing(ses_quintile)
		drop q_`cc'
    }
    label define ses_quintile 1 "q1" 2 "q2" 3 "q3" 4 "q4" 5 "q5", modify
    label value ses_quintile ses_quintile
    label var ses_quintile "Income quintile: SEA-PLM calculations"
    *</_ses_>
	
	// SEA-PLM Specific variables:
	*<_city_>
	encode sc09q01, gen(city)
	replace city = 1 if city == 4 | city == 5 
	replace city = 2 if city == 2 | city == 3
	replace city = 3 if city == 1 
	replace city = -98 if city >= 7
	label var city "School is located in city (1), town (2), village (3)"
    *<_city_>

    *<_language_>
    gen language = s_lang if !inlist(s_lang, 7,8,9) // describes if test prescribed is same language as the one spoken at home
    replace language = -99 if inlist(s_lang, 7,8,9)
	replace language = 2 if language == 0
    label define language 1 "LangTest" 2 "LangOther"
    label value language language
    label var language "Language of test (1), other language (2)"
    *</_language_>

    *<_school_type_>
	encode sc05q01 if sc05q01  != "7" | sc05q01 != "8" | sc05q01 != "9", gen (school_type)
    replace school_type = -99 if inlist(school_type, 7, 8, 9)
	replace school_type = 3 if school_type == 1 // public school - match labeling from PISA
	replace school_type = 1 if school_type == 0 
    label define school_type 1 "PvtIND" 2 "PvtDEP" 3 "Public", replace
    label value school_type school_type
    label var school_type "Type of ownership and decision-making power of schools"
    *</_school_type_>

    *<_school_type_o_> - original school type variable
	encode sc05q01 if sc05q01  != "7" | sc05q01 != "8" | sc05q01 != "9", gen (school_type_o)
    replace school_type_o = -98 if sc05q01 == "8" | sc05q01 == "9" 
    replace school_type_o = -97 if sc05q01 == "7"
    label define school_type_o 1 "PublicSch" 2 "PvtSch", modify
    label value school_type_o school_type_o
    label var school_type_o "Type of school - Public or Private"
    *</_school_type_o_>
		
	*<_asian_identity_>
	clonevar asian_identity = asident
	label var asian_identity "Student identifies as Asian from 0 - 100 scale"
	*</_asian_identity_>
	
	* Quintiles of ESCS // this setion of the code used to be in 0221 or 0222.
	* This is the variable used to compute results by Socio Economic Status.
	* Ensure that CNTRY Identifer is used as STRING.
	*<_qescs_>
	tempvar cntrycode
	cap: confirm numeric variable idcntry_raw
	if (_rc == 0) {
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

    *** QUICK FIX ****
    rename *, lower
    ******************
	
    noi disp as res "{phang}Step 4 completed (`output_file'){p_end}"


    *---------------------------------------------------------------------------
    * 5) Bring WB countrycode & harmonization thresholds, and save dtas
    *---------------------------------------------------------------------------
		// YW: TEMP SOLUTION
		drop if idschool_o == ""
    // Brings World Bank countrycode from ccc_list
    // NOTE: the *assert* is intentional, please do not remove it.
    // if you run into an assert error, edit the 011_rawdata/master_countrycode_list.csv
		clonevar countrycode = idcntry_raw
		gen national_level = 1
		merge m:m countrycode using "`temp_dir'/countrycode_list.dta", keep(match) assert(match using) nogen

    // Surveyid is needed to merge harmonization proficiency thresholds
    gen str surveyid = "`region'_`year'_`assessment'"
    label var surveyid "Survey ID (Region_Year_Assessment)"

    // New variable class: keyvars (not IDs, but rather key to describe the dataset)
    local keyvars "surveyid countrycode national_level"

    // Update valuevars to include newly created harmonized vars (from the ado)
    local valuevars : list valuevars | resultvars

    // This function compresses the dataset, adds metadata passed in the arguments as chars, save GLAD_BASE.dta
    // which contains all variables, then keep only specified vars and saves GLAD.dta, and delete files in temp_dir
		edukit_save,  filename("`output_file'") path("`output_dir'") dir2delete("`temp_dir'")              ///
		idvars(`idvars') varc(key `keyvars'; value `valuevars'; trait `traitvars'; sample `samplevars') /// 
		metadata("`metadata'") collection("GLAD")

    noi disp as res "Creation of `output_file'.dta completed"

  }

  else {
    noi disp as txt "Skipped creation of `output_file'.dta (already found in clone)"
    // Still loads it, to generate documentation
    use "`output_dir'/`output_file'.dta", clear
  }

