*=========================================================================*
* GLOBAL LEARNING ASSESSMENT DATABASE (GLAD)
* Project information at: https://github.com/worldbank/GLAD
*
* Metadata to be stored as 'char' in the resulting dataset (do NOT use ";" here)
local region      = "LAC"
local year        = "2013"
local assessment  = "LLECE"
local master      = "v01_M"
local adaptation  = "wrk_A_GLAD"
local module      = "ALL"
local ttl_info    = "Joao Pedro de Azevedo [eduanalytics@worldbank.org]"
local dofile_info = "last modified by Joao Pedro Azevedo in Feb 05, 2022"  /* change date*/
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
  local shortcut = " "		// PLACEHOLDER!!! revert to global after dlw issue solved
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
    foreach prefix in PL3 PM3 QA3 QF3 PL6 PM6 PC6 QA6 QF6 {
      if `from_datalibweb'==1 {
        noi edukit_datalibweb, d(country(`region') year(`year') type(EDURAW) surveyid(`surveyid') filename(`prefix'.dta) `shortcut')
      }
      else {
        use "`input_dir'/`prefix'.dta", clear
      }
      capture destring idstud idschool idclass, replace
      rename *, lower
      compress
      save "`temp_dir'/`prefix'.dta", replace
    }

    noi disp as res "{phang}Step 1 completed (`output_file'){p_end}"

    *---------------------------------------------------------------------------
    * 2) Combine all rawdata into a single file (merge and append)
    *---------------------------------------------------------------------------

    // Grade 3
    use "`temp_dir'/PL3.dta", clear
    merge 1:1 idcntry idstud using "`temp_dir'/PM3.dta", keep(master match using) nogen
    merge 1:1 idcntry idstud using "`temp_dir'/QA3.dta", keep(master match using) nogen
    merge 1:1 idcntry idstud using "`temp_dir'/QF3.dta", keep(master match using) nogen
    save "`temp_dir'/P_3.dta", replace

    // Grade 6
    use "`temp_dir'/PL6.dta", clear
    merge 1:1 idcntry idstud using "`temp_dir'/PM6.dta", keep(master match using) nogen
    merge 1:1 idcntry idstud using "`temp_dir'/PC6.dta", keep(master match using) nogen
    merge 1:1 idcntry idstud using "`temp_dir'/QA6.dta", keep(master match using) nogen
    merge 1:1 idcntry idstud using "`temp_dir'/QF6.dta", keep(master match using) nogen
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
    clonevar  score_llece_read    = ptje_eqserce_lec3	 if  idgrade==3
    replace   score_llece_read    = ptje_eqserce_lec6	 if  idgrade==6
    clonevar  score_llece_math    = ptje_eqserce_mat3	 if  idgrade==3
    replace   score_llece_math    = ptje_eqserce_mat6	 if  idgrade==6
    clonevar  score_llece_sci 	= ptje_eqserce_cie6	 if  idgrade==6
    foreach subject in read math science {
	  if ("`subject'" == "science") {
		local subject2 "sci"
	  }
	  else {
		local subject2 "`subject'"
	  } 
      label var score_llece_`subject2' "Llece score for `subject'"
      char      score_llece_`subject2'[clo_marker] "number"
    }
    *</_score_assessment_subject_pv_>

    *<_level_assessment_subject_pv_>
    gen     nivel_read = nivel_lec3    if  idgrade==3
    replace nivel_read = nivel_lec6    if  idgrade==6
    gen     nivel_math = nivel_mat3    if  idgrade==3
    replace nivel_math = nivel_mat6    if  idgrade==6
    gen     nivel_sci  = nivel_cie6 	if  idgrade==6
    label define level_terce 0 "Bajo I" 1 "I" 2 "II" 3 "III" 4 "IV"
    foreach subject in read math science {
	  if ("`subject'" == "science") {
		local subject2 "sci"
	  }
	  else {
		local subject2 "`subject'"
	  } 
      encode nivel_`subject2', gen(level_llece_`subject2') label(level_terce)
      label var level_llece_`subject2' "Llece level for `subject'"
      char      level_llece_`subject2'[clo_marker] "factor"
    }
    *</_level_assessment_subject_pv_>


    // TRAIT Vars:
    local traitvars	"age urban* male escs qescs has_qescs"

    *<_age_>
    clonevar age = edad
    label var age "Learner age at time of assessment"
    *</_age_>

    *<_urban_>
    gen byte urban = (ruralidad == 1)	if !missing(ruralidad)	// ruralidad coded as 1=urban 2=rural
    label var urban "School is located in urban/rural area"
    *</_urban_>

    *<_male_>
    gen byte male = .
    replace  male = 0 if (dqa3it02 == 1 & idgrade==3)	 // dqaGit02 coded as 1=female 2=male 3=dont know
    replace  male = 1 if (dqa3it02 == 2 & idgrade==3)
    replace  male = 0 if (dqa6it02 == 1 & idgrade==6)
    replace  male = 1 if (dqa6it02 == 2 & idgrade==6)
    label var male "Learner gender is male/female"
    *</_male_>


    // SAMPLE Vars:
    local samplevars "strata learner_weight*"

    *<_learner_weight*_>
    clonevar  learner_weight_quest = wgt
    label var learner_weight_quest "Learner weight for questionnaire"
    clonevar  learner_weight_read = w2lec3				if  idgrade==3
    replace   learner_weight_read = w2lec6				if  idgrade==6
    label var learner_weight_read "Learner weight for read"
    clonevar  learner_weight_math = w2mat3				if  idgrade==3
    replace   learner_weight_math = w2mat6				if  idgrade==6
    label var learner_weight_math "Learner weight for math"
    clonevar  learner_weight_sci  = w2cie6			if  idgrade==6
    label var learner_weight_sci  "Learner weight for science"
    // Because some analysis require learner_weight, we will set the default for reading
    clonevar  learner_weight = learner_weight_read
    *</_learner_weight*_>

    *<_strata_>
    clonevar strata = idstrat
    label var strata "Strata"
    *</_strata_>


    noi disp as res "{phang}Step 3 completed (`output_file'){p_end}"


    *---------------------------------------------------------------------------
    * 4) ESCS and other calculations (by Aroob, from Feb 2019)
    *---------------------------------------------------------------------------

    *** QUICK FIX ****
    rename *, upper
    ******************

    *Standarzing variables:
    foreach var of varlist NIVEL_LEC3 NIVEL_LEC6 {
      encode `var', gen(`var'_n)
    }
    gen LOW_READING_PROFICIENCY = (NIVEL_LEC3_n > 2) & !missing(NIVEL_LEC3_n) if IDGRADE == 3
    replace LOW_READING_PROFICIENCY = (NIVEL_LEC6_n >2) & !missing(NIVEL_LEC6_n) if IDGRADE == 6

    *Creating variable for socio-economic variable
    *Education of Parents:
    foreach var of varlist DQFIT09_0* {
      replace `var' = . if inlist(`var',7,9)
    }
    egen HIEDU= rowmax(DQFIT09_01 DQFIT09_02)
    label values HIEDU DQFIT09_01

    **Replacing missing values of HIEDU:
    bysort IDCNTRY IDSCHOOL: egen HIEDU_mode = mode(HIEDU), maxmode
    bysort IDCNTRY: egen HIEDU_mode_cnt = mode(HIEDU), maxmode
    replace HIEDU = HIEDU_mode if missing(HIEDU)
    replace HIEDU = HIEDU_mode_cnt if missing(HIEDU)

    gen PAREMP = .
    replace PAREMP = 3 if DQFIT10_01 == 1 | DQFIT10_02 == 1 // Atleast one parent working full time.
    replace PAREMP = 4 if DQFIT10_01 == 1 & DQFIT10_02 == 1 // Both parents working full time.
    replace PAREMP = 2 if DQFIT10_01 == 2 & DQFIT10_02 == 2 // Both parents working part time.
    replace PAREMP = 1 if missing(PAREMP) // Other situations
    replace PAREMP = . if inlist(DQFIT10_01,5,9) & inlist(DQFIT10_02,5,9)

    *Generating HOMPEPOSSESSIONS INDEX:
    foreach var of varlist DQFIT13 DQFIT14 DQFIT15* DQFIT16* DQFIT21 {
      replace `var' = . if `var' == 9
    }
    *Generating variable for HOMEPOSS:
    alphawgt DQFIT13 DQFIT14 DQFIT15* DQFIT16* DQFIT21 [weight = WGT], detail std item label

    foreach var of varlist DQFIT13 DQFIT14 DQFIT15* DQFIT16* DQFIT21 {
      bysort IDCNTRY IDSCHOOL: egen `var'_mean = mean(`var')
      bysort IDCNTRY : egen `var'_mean_cnt = mean(`var')
      replace `var' = `var'_mean if missing(`var')
      replace `var' = `var'_mean_cnt if missing(`var')
      egen `var'_std = std(`var')
    }

    pca DQFIT13_std DQFIT14_std DQFIT15*_std DQFIT16*_std DQFIT21_std [weight = WGT]
    predict HOMEPOS

    polychoricpca HIEDU HOMEPOS [weight = WGT], score(ESCS) nscore(1)
    ren ESCS1 ESCS

    bysort IDCNTRY IDSCHOOL IDGRADE: egen SCHESCS = mean(ESCS)
    bysort IDCNTRY IDGRADE: egen CNTESCS = mean(ESCS)

    *** QUICK FIX ****
    rename *, lower
    ******************
	
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
