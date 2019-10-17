*=========================================================================*
* GLOBAL LEARNING ASSESSMENT DATABASE (GLAD)
* Project information at: https://github.com/worldbank/GLAD
*
* Metadata to be stored as 'char' in the resulting dataset (do NOT use ";" here)
local region      = "LAC"
local year        = "1997"
local assessment  = "LLECE"
local master      = "v01_M"
local adaptation  = "wrk_A_GLAD"
local module      = "ALL"
local ttl_info    = "Joao Pedro de Azevedo [eduanalytics@worldbank.org]"
local dofile_info = "last modified by Diana Goldemberg in October 8, 2019"
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
    foreach prefix in LE_Al_Tu LE_Di_Es MA_Al_Tu MA_Di_Es {
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
    * What was supposed to be a unique ID, is not really unique ID, and all datasets are at the student level
    * event the school_principal files, which is quite unusual. This is a "creative" workaround.
    local original_id_vars 		= "pais escuela nivel paralelo nolista"
    local original_sample_vars  = "estrato estrato2 estrato3"
    local original_score_vars 	= "puntaje pnjez"

    * PRE-CLEAN	each of the TEMP files
    foreach prefix in LE_Al_Tu LE_Di_Es MA_Al_Tu MA_Di_Es {
      use "`temp_dir'/`prefix'.dta", clear

      // Prints out info before doing the pre-clean, for we will change nobs (not features)
      describe
      noi disp as res "Pre-cleaning `prefix':" _newline ///
              "{phang}originally `r(N)' observations{p_end}"

      ds `original_id_vars' `original_sample_vars' `original_score_vars', not
      local original_quest_vars = "`r(varlist)'"

      // Around 0.5% of observations are not uniquely identified, most have two copies
      duplicates tag `original_id_vars', gen(not_unique_id)
      drop if not_unique_id > 1		// for the student files this drops no obs, but for the principals it does drop 0.4% of obs
      sort `original_id_vars' `original_sample_vars' `original_score_vars'
      by `original_id_vars': generate str2 obs = "_1" if (_n==1)
      by `original_id_vars': replace obs = "_2" if (_n==2)

      // We reshape wide to compare those copies and delete the questionnaire if differently marked in both
      reshape wide `original_score_vars' `original_quest_vars', i(`original_id_vars') j(obs) string

      // Delete the scores/questionnaire if they don't match for a student, and restore original var name
      foreach v in `original_score_vars' `original_quest_vars' {
        capture confirm numeric variable `v'_1
        if !_rc {
          replace `v'_1 = .   if (`v'_1!=`v'_2  & !missing(`v'_2))
        }
        else {
          replace `v'_1 = ""  if (`v'_1!=`v'_2  & !missing(`v'_2))
        }
        // Makes the dataset long again, with 0.5% less observations, but now uniquely identified
        rename  `v'_1	`v'
        drop 	`v'_2
      }

      // Though we avoid renaming variables, in this assessment both subjects used the same varnames,
      // so we must rename SCORES before merging reading and math in next step
      if  substr("`prefix'",1,2)=="LE" {
        local subject = "read"
      }
      if  substr("`prefix'",1,2)=="MA" {
        local subject = "math"
      }
      qui foreach v in `original_score_vars' {
        rename `v'	`v'_`subject'
      }

      // Prints out info before saving, for we will changed nobs (not features)
      describe
      noi disp as res "{phang}cleaned to `r(N)' observations{p_end}"

      // Now this should be a unique id
      isid `original_id_vars'
      save "`temp_dir'/`prefix'.dta", replace
    }


    * Now can sticht together all datasets. First one per subject

    * Combines student_tutor questionnaires with principal_school
    foreach prefix in LE MA {
      use "`temp_dir'/`prefix'_Al_Tu.dta", replace
      merge 1:1 `original_id_vars' using "`temp_dir'/`prefix'_Di_Es.dta", nogen
      save "`temp_dir'/`prefix'.dta", replace
    }

    * Then combines reading and math
    use "`temp_dir'/LE.dta", replace
    merge 1:1 `original_id_vars' using "`temp_dir'/MA.dta", nogen

    noi disp as res "{phang}Step 2 completed (`output_file'){p_end}"


    *---------------------------------------------------------------------------
    * 3) Standardize variable names across all assessments
    *---------------------------------------------------------------------------
    // For each variable class, we create a local with the variables in that class
    //     so that the final step of saving the GLAD dta  knows which vars to save

    // ID Vars:
    local idvars	"idcntry_raw idschool idgrade idclass idlearner"

    *<_idcntry_raw_>
    clonevar idcntry_raw = pais
    label var idcntry_raw "Country ID, as coded in rawdata"
    *</_idcntry_raw_>

    *<_idschool_>
    clonevar idschool = escuela
    label var idschool "School ID"
    *</_idschool_>

    *<_idgrade_>
    clonevar idgrade = nivel
    label var idgrade "Grade ID"
    *</_idgrade_>

    *<_idclass_>
    encode paralelo, generate(idclass) label(lclass)
    label var idclass "Class ID"
    *</_idclass_>

    *<_idlearner_>
    clonevar idlearner = nolista
    label var idlearner "Learner ID"
    *</_idlearner_>

    // Drop any value labels of idvars, to be okay to append multiple surveys
    foreach var of local idvars {
      label values `var' .
    }


    // VALUE Vars:
    local valuevars	"score_llece* level_llece*"

    *<_score_assessment_subject_pv_>
    clonevar  score_llece_read = pnjez_read
    clonevar  score_llece_math = pnjez_math
    foreach subject in read math {
      label var score_llece_`subject' "Llece score for `subject'"
      char      score_llece_`subject'[clo_marker] "number"
    }
    *</_score_assessment_subject_pv_>

    *<_level_assessment_subject_pv_>
    foreach subject in read math {
      generate  level_llece_`subject' = .a	// PLACEHOLDER: they didnt provide levels, have to create one
      label var level_llece_`subject' "Llece level for `subject'"
      char      level_llece_`subject'[clo_marker] "factor"
    }
    *</_level_assessment_subject_pv_>


    // TRAIT Vars:
    local traitvars	"age urban* male escs"

    *<_age_>
    clonevar age = alu1
    label var age "Learner age at time of assessment"
    *Age self-reported by students, includes a few implausible values such as 0 and 80
    *</_age_>

    *<_urban_>
    gen byte urban = inlist(res3,"A","B","C","D","E")	if !missing(res3)
    replace  urban = .a if  inlist(res3,"#","&")	// Invalid responses
    label var urban "School is located in urban/rural area"
    *</_urban_>

    *<_urban_o_>
    clonevar urban_o = res3
    label var urban_o "Original variable of urban"	// PLACEHOLDER: check value labels and documentation for clues
    *</_urban_o_>

    *<_male_>
    gen byte male = (alu2 == "A") 		if !missing(alu2)
    replace  male = .a if  inlist(alu2,"#","&")	// Invalid responses
    *Original gender variable coded as A for male, B for female, # and & for invalid and "" for missing
    label var male "Learner gender is male/female"
    *</_male_>


    // SAMPLE Vars:
    local samplevars "strata* learner_weight*"

    *<_strata_>
    clonevar strata1 = estrato
    clonevar strata2 = estrato2
    clonevar strata3 = estrato3
    label var strata1 "TBD"	// PLACEHOLDER: check value labels and documentation for clues
    label var strata2 "TBD"	// PLACEHOLDER: check value labels and documentation for clues
    label var strata3 "TBD" // PLACEHOLDER: check value labels and documentation for clues
    *</_strata_>

    *<_learner_weight_>
    gen learner_weight = 1	// PLACEHOLDER: they didnt provide weights. Check documentation.
    label var learner_weight "Learner weight"
    *</_learner_weight_>

    noi disp as res "{phang}Step 3 completed (`output_file'){p_end}"


    *---------------------------------------------------------------------------
    * 4) ESCS and other calculations (by Aroob, from Feb 2019)
    *---------------------------------------------------------------------------
    // There was never a HAD file for PERCE, so this section is TBD
    gen escs = .

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
