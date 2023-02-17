*=========================================================================*
* GLOBAL LEARNING ASSESSMENT DATABASE (GLAD)
* Project information at: https://github.com/worldbank/GLAD
*
* Metadata to be stored as 'char' in the resulting dataset (do NOT use ";" here)
local region      = "MLI" // Mali
local year        = "2011"
local assessment  = "PASEC"
local master      = "v01_M"
local adaptation  = "wrk_A_GLAD"
local module      = "ALL"
local ttl_info    = "Joao Pedro de Azevedo [eduanalytics@worldbank.org]"
local dofile_info = "last modified by Diana Goldemberg in January 23, 2020"
*
* Steps:
* 0) Program setup (identical for all assessments)
* 1) Open all rawdata, lower case vars, save in temp_dir
* 2) Combine all rawdata into a single file (merge and append)
* 3) Standardize variable names across all assessments
* 4) ESCS and other calculations (TBD)
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

    // Filter the master country list to only this assessment-year:
    *** SEGMENT NOT NEEDED FOR GLAD OF A SINGLE COUNTRY ***

    // Tokenized elements from the header to be passed as metadata
    local glad_description  "This dataset is part of the Global Learning Assessment Database (GLAD). It contains microdata from `assessment' `year'. Each observation corresponds to one learner (student or pupil), and the variables have been harmonized."
    local metadata          "region `region'; year `year'; assessment `assessment'; master `master'; adaptation `adaptation'; module `module'; ttl_info `ttl_info'; dofile_info `dofile_info'; description `glad_description'"

    *---------------------------------------------------------------------------
    * 1) Open all rawdata, lower case vars, save in temp_dir
    *---------------------------------------------------------------------------
    foreach filename in MALI_2A MALI_5A {
      if `from_datalibweb'==1 {
        noi edukit_datalibweb, d(country(`region') year(`year') type(EDURAW) surveyid(`surveyid') filename(`filename'.dta) `shortcut')
      }
      else {
        use "`input_dir'/`filename'.dta", clear
      }
      rename *, lower
      gen str filename = "`filename'"
      compress
      save "`temp_dir'/TEMP_`filename'.dta", replace
    }

    noi disp as res "{phang}Step 1 completed (`output_file'){p_end}"


    *---------------------------------------------------------------------------
    * 2) Combine all rawdata into a single file (merge and append)
    *---------------------------------------------------------------------------
    use "`temp_dir'/TEMP_MALI_2A.dta", clear
    append using "`temp_dir'/TEMP_MALI_5A.dta", force

    noi disp as res "{phang}Step 2 completed (`output_file'){p_end}"

    *---------------------------------------------------------------------------
    * 3) Standardize variable names across all assessments
    *---------------------------------------------------------------------------
    // For each variable class, we create a local with the variables in that class
    //     so that the final step of saving the GLAD dta  knows which vars to save

    // ID Vars:
    local idvars	"idschool idgrade idlearner"  // no idclass & idcntry_raw does not exist for EGRA (single country)

    *<_idschool_>
    clonevar idschool = numecole
    label var idschool "School ID"
    *</_idschool_>

    *<_idgrade_>
    gen int idgrade = 2 if filename == "MALI_2A"
    replace idgrade = 5 if filename == "MALI_5A"
    label var idgrade "Grade ID"
    *</_idgrade_>

    *<_idclass_>
    gen int idclass = -99	// PLACEHOLDER: double check documentation to make sure it doesnt exist / give more informative missing value
    label var idclass "Class ID"
    *</_idclass_>

    *<_idlearner_>
    clonevar idlearner = numeleve
    label var idlearner "Learner ID"
    *</_idlearner_>


    // VALUE Vars:
    local valuevars	"score_pasec* level_pasec*"

    *<_score_assessment_subject_pv_>
    foreach moment in ini fin {
      clonevar score_pasec_read_`moment' = s`moment'2f if idgrade == 2
      replace  score_pasec_read_`moment' = s`moment'5f if idgrade == 5
      clonevar score_pasec_math_`moment' = s`moment'2m if idgrade == 2
      replace  score_pasec_math_`moment' = s`moment'5m if idgrade == 5
      char     score_pasec_read_`moment'[clo_marker] "number"
      char     score_pasec_math_`moment'[clo_marker] "number"
    }
    label var score_pasec_read_ini	"Pasec score for read (initial)"
    label var score_pasec_read_fin	"Pasec score for read (final)"
    label var score_pasec_math_ini	"Pasec score for math (initial)"
    label var score_pasec_math_fin	"Pasec score for math (final)"
    *</_score_assessment_subject_pv_>

    *<_level_assessment_subject_pv_>
    // Data does not contain a variable for levels, but the documentation provides this conversion
    // for details: RapportMali- E3.pdf pages 29-38
    label define lblevels 1 "Level I" 2 "Level 2" 3 "Level 3" 4 "Level 4" .a "Missing test score"
    foreach moment in ini fin {
      gen byte  level_pasec_read_`moment': lblevels = .a
      gen byte  level_pasec_math_`moment': lblevels = .a
      // Reading, grade 2
      replace level_pasec_read_`moment' = 4 if s`moment'2f < 9999 & idgrade == 2
      replace level_pasec_read_`moment' = 3 if s`moment'2f < 565  & idgrade == 2
      replace level_pasec_read_`moment' = 2 if s`moment'2f < 527  & idgrade == 2
      replace level_pasec_read_`moment' = 1 if s`moment'2f < 450  & idgrade == 2
      // Reading, grade 5
      replace level_pasec_read_`moment' = 4 if s`moment'5f < 9999  & idgrade == 5
      replace level_pasec_read_`moment' = 3 if s`moment'5f < 626   & idgrade == 5
      replace level_pasec_read_`moment' = 2 if s`moment'5f < 506.2 & idgrade == 5
      replace level_pasec_read_`moment' = 1 if s`moment'5f < 426.3 & idgrade == 5
      // Mathematics, grade 2 (no level 4 exist)
      replace level_pasec_math_`moment' = 3 if s`moment'2m < 9999 & idgrade == 2
      replace level_pasec_math_`moment' = 2 if s`moment'2m < 549  & idgrade == 2
      replace level_pasec_math_`moment' = 1 if s`moment'2m < 469  & idgrade == 2
      // Mathematics, grade 5 (no level 4 exist)
      replace level_pasec_math_`moment' = 3 if s`moment'5m < 9999  & idgrade == 5
      replace level_pasec_math_`moment' = 2 if s`moment'5m < 650.5 & idgrade == 5
      replace level_pasec_math_`moment' = 1 if s`moment'5m < 509.1 & idgrade == 5
      // Char markers to facilitate CLO
      char level_pasec_read_`moment'[clo_marker] "factor"
      char level_pasec_math_`moment'[clo_marker] "factor"
    }
    label var level_pasec_read_ini "Pasec level for read (initial)"
    label var level_pasec_read_fin "Pasec level for read (final)"
    label var level_pasec_math_ini "Pasec level for math (initial)"
    label var level_pasec_math_fin "Pasec level for math (final)"
    *</_level_assessment_subject_pv_>


    // TRAIT Vars:
    local traitvars	"age urban* male escs"   // PLACEHOLDER: TBD

    *<_age_>
    clonevar age = qe22_imp if idgrade == 2
    replace  age = qe52_imp if idgrade == 5
    * There are 3 learner age vars: from learner/teacher/principal questionnaire
    * we chose to report the one from the learners' questionnaires
    label var age "Learner age at time of assessment"
    *</_age_>

    *<_urban_>
    gen byte urban = inlist(qd38_imp, 1, 2) if !missing(qd38_imp)
    label var urban "School is located in urban/rural area"
    *</_urban_>

    *<_urban_o_>
    decode qd38_imp, g(urban_o)
    label var urban_o "Original variable of urban: school is located in urban/rural area"
    *</_urban_o_>

    *<_male_>
    clonevar male = qe21 if idgrade == 2
    replace  male = qe51 if idgrade == 5
    label var male "Learner gender is male/female"
    *</_male_>

    // SAMPLE Vars:
    local samplevars "learner_weight strata"

    *<_learner_weight_>
    clonevar  learner_weight = poidseleve0
    label var learner_weight "Learner weight"
    *</_learner_weight_>

    *<_strata_>
    clonevar  strata = numstrate
    label var strata "Strata"
    *</_strata_>

    * Survey setup, considering two-stage sampling
    svyset idschool [pw = learner_weight], strata(strata) || _n

    noi disp as res "{phang}Step 3 completed (`output_file'){p_end}"

    *---------------------------------------------------------------------------
    * 4) ESCS and other calculations (TBD)
    *---------------------------------------------------------------------------
    // This section is TBD
    gen escs = .a

    noi disp as res "{phang}Step 4 completed (`output_file'){p_end}"

    *---------------------------------------------------------------------------
    * 5) Bring WB countrycode & harmonization thresholds, and save dtas
    *---------------------------------------------------------------------------

    // Brings World Bank countrycode from ccc_list
    *** SEGMENT NOT NEEDED FOR FILE IS FOR A SINGLE COUNTRY ***
    gen countrycode = "`region'"
    label var countrycode "WB country code (3 letters)"

    // Surveyid is needed to merge harmonization proficiency thresholds
    gen str surveyid = "`region'_`year'_`assessment'"
    label var surveyid "Survey ID (Region_Year_Assessment)"

    gen byte national_level = 1

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
