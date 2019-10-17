*=========================================================================*
* GLOBAL LEARNING ASSESSMENT DATABASE (GLAD)
* Project information at: https://github.com/worldbank/GLAD
*
* Metadata to be stored as 'char' in the resulting dataset (do NOT use ";" here)
local region      = "LAC"
local year        = "2006"
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
    foreach prefix in l3 m3 Cuestionario_QA3 Cuestionario_QF3 l6 m6 c6 Cuestionario_QA6 Cuestionario_QF6 {
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

    // Though we avoid renaming variables, in this assessment all subjects used
    // the same varnames for score and level, so we must rename before merging
    foreach subject in read math science {
      if "`subject'"=="read" {
        local prefix = "l"
      }
      if "`subject'"=="math"	{
        local prefix = "m"
      }
      if "`subject'"=="science" {
        local prefix = "c"
      }
      foreach grade in 3 6 {
        if (`grade'==6 | "`subject'"!="science") {
          // Opens file for that grade (prefix) and subject
          use "`temp_dir'/`prefix'`grade'.dta", clear
          foreach var of varlist   puntaje_estandar_final	 nivel	peso_estudiante {
            rename `var'	`var'_`subject'
          }
          save "`temp_dir'/`prefix'`grade'.dta", replace
        }
      }
    }

    // Grade 3
    use "`temp_dir'/l3.dta", clear
    merge 1:1 pais id_alumno using "`temp_dir'/m3.dta", keep(master match using) nogen
    merge 1:1 pais id_alumno using "`temp_dir'/Cuestionario_QA3.dta", keep(master match using) nogen
    merge 1:1 pais id_alumno using "`temp_dir'/Cuestionario_QF3.dta", keep(master match using) nogen
    save "`temp_dir'/P_3.dta", replace

    // Grade 6
    use "`temp_dir'/l6.dta", clear
    merge 1:1 pais id_alumno using "`temp_dir'/m6.dta", keep(master match using) nogen
    merge 1:1 pais id_alumno using "`temp_dir'/c6.dta", keep(master match using) nogen
    merge 1:1 pais id_alumno using "`temp_dir'/Cuestionario_QA6.dta", keep(master match using) nogen
    merge 1:1 pais id_alumno using "`temp_dir'/Cuestionario_QF6.dta", keep(master match using) nogen
    save "`temp_dir'/P_6.dta", replace

    // Append both grades
    use "`temp_dir'/P_3.dta", clear
    append using "`temp_dir'/P_6.dta"

    noi disp as res "{phang}Step 2 completed (`output_file'){p_end}"


    *---------------------------------------------------------------------------
    * 3) Standardize variable names across all assessments
    *---------------------------------------------------------------------------
    // For each variable class, we create a local with the variables in that class
    // so that the final step of saving the GLAD dta  knows which vars to save

    // ID Vars:
    local idvars "idcntry_raw idschool idgrade idlearner"  // idclass does not exist

    *<_idcntry_raw_>
    clonevar idcntry_raw = pais_num
    label var idcntry_raw "Country ID, as coded in rawdata"
    *</_idcntry_raw_>

    *<_idschool_>
    clonevar idschool = centro_educativo
    destring idschool, replace
    label var idschool "School ID"
    *</_idschool_>

    *<_idgrade_>
    clonevar idgrade = grado
    destring idgrade, replace
    label var idgrade "Grade ID"
    *</_idgrade_>

    *<_idclass_>
    gen int idclass = -99		// PLACEHOLDER: double check documentation to make sure it doesnt exist
    label var idclass "Class ID"
    *</_idclass_>

    *<_idlearner_>
    clonevar idlearner = id_alumno
    destring idlearner, replace
    label var idlearner "Learner ID"
    *</_idlearner_>

    // Drop any value labels of idvars, to be okay to append multiple surveys
    foreach var of local idvars {
      label values `var' .
    }


    // VALUE Vars:
    local valuevars	"score_llece* level_llece*"

    *<_score_assessment_subject_pv_>
    foreach subject in read math science {
      clonevar  score_llece_`subject' = puntaje_estandar_final_`subject'
      label var score_llece_`subject' "Llece score for `subject'"
      char      score_llece_`subject'[clo_marker] "number"
    }
    *</_score_assessment_subject_pv_>

    *<_level_assessment_subject_pv_>
    * Lowest scores are level A, best scores are level E
    * Recodes to be consistent with LLECE 2013, which uses number levels
    label define level_serce 4 "E" 3 "D" 2 "C" 1 "B" 0 "A"
    foreach subject in read math science {
      encode nivel_`subject', gen(level_llece_`subject') label(level_serce)
      label var level_llece_`subject' "Llece level for `subject'"
      char      level_llece_`subject'[clo_marker] "factor"
    }
    *</_level_assessment_subject_pv_>


    // TRAIT Vars:
    local traitvars	"age urban* male escs"

    *<_age_>
    clonevar  age = qa3_item_1		if  idgrade==3
    replace   age = qa6_item_1		if  idgrade==6
    destring  age, replace
    replace   age = .a if inlist(age,98,99)
    label var age "Learner age at time of assessment"
    *</_age_>

    *<_urban_>
    gen byte  urban = (inlist(admrur,1,2))	if !missing(admrur)
    label var urban "School is located in urban/rural area"
    *</_urban_>

    *<_male_>
    gen byte male = .
    replace  male = 0 if (qa3_item_2 == "Femenino"  & idgrade==3)
    replace  male = 1 if (qa3_item_2 == "Masculino" & idgrade==3)
    replace  male = 0 if (qa6_item_2 == "Femenino"  & idgrade==6)
    replace  male = 1 if (qa6_item_2 == "Masculino" & idgrade==6)
    label var male "Learner gender is male/female"
    *</_male_>


    // SAMPLE Vars:
    local samplevars "strata learner_weight*"

    *<_strata_>
    clonevar  strata = estrato
    label var strata "Strata"
    *</_strata_>

    *<_learner_weight*_>
    foreach subject in read math science {
      clonevar  learner_weight_`subject' = peso_estudiante_`subject'
      label var learner_weight_`subject' "Learner weight for `subject'"
    }
    clonevar  learner_weight_quest = peso_estudiante
    label var learner_weight_quest "Learner weight for questionnaire"
    // Because some analysis require learner_weight, we will set the default for reading
    clonevar  learner_weight = learner_weight_read
    *</_learner_weight*_>


    noi disp as res "{phang}Step 3 completed (`output_file'){p_end}"


    *---------------------------------------------------------------------------
    * 4) ESCS and other calculations (by Aroob, from Feb 2019)
    *---------------------------------------------------------------------------

    *** QUICK FIX ****
    rename *, upper
    ******************

    *Standardization:
    gen LOW_READING_PROFICIENCY = inlist(NIVEL_READ,"C","D","E")

    *Creating variable for socio-economic variable
    *Education of Parents:
    gen AEDU = .
    gen BEDU = .
    foreach f in A B {
      forvalues i = 1/7 {
        replace `f'EDU = `i' if QF_ITEM_2_`i'_`f' == "1"
      }
    }
    egen HIEDU = rowmax(AEDU BEDU)
    label define HIEDU 1 "No Education" 2 "Incomplete primary" 3 "Complete primary" 4 "Incomplete secondary" 5 "Complete secondary" 6 "Incomplete university" 7 "Complete university"
    label values HIEDU HIEDU

    **Replacing missing values of HIEDU:
    bysort PAIS CENTRO_EDUCATIVO: egen HIEDU_mode = mode(HIEDU), maxmode
    bysort PAIS: egen HIEDU_mode_cnt = mode(HIEDU), maxmode
    replace HIEDU = HIEDU_mode if missing(HIEDU)
    replace HIEDU = HIEDU_mode_cnt if missing(HIEDU)

    destring QF_ITEM_7, replace
    gen floor_material = QF_ITEM_8 if !inlist(QF_ITEM_8,"","X","Y","Z")
    destring floor_material, replace
    *Coding to be consistent with LLECE 2013:
    recode floor_material (4 = 1 "Land") (3 = 2 "Cement") (5 = 3 "Unpolished wooden boards") (2 = 4 "Tiles, ceramics or similar") ( 1 = 5 "Polished wood or carpeted floor"), gen(floor_material_r)
    drop floor_material
    ren floor_material_r floor_material
    foreach var of varlist QF_ITEM_9* QF_ITEM_10* {
      replace `var' = "" if inlist(`var',"X","Y","Z")
      destring `var', replace
      replace `var' = 0 if `var' == 2
    }
    gen NBOOK = QF_ITEM_11 if !inlist(QF_ITEM_11,"X","Y","Z")
    destring NBOOK, replace
    label define NBOOK 1 "No books" 2 "Less than 10 books" 3 "Between 10 and 50 books" 4 "More than 50 books"
    label values NBOOK NBOOK
    bysort PAIS: mdesc floor_material QF_ITEM_9* QF_ITEM_10* NBOOK
    *Generating variable for HOMEPOSS:
    foreach var of varlist floor_material QF_ITEM_9* QF_ITEM_10* NBOOK {
      bysort PAIS CENTRO_EDUCATIVO: egen `var'_mean = mean(`var')
      bysort PAIS: egen `var'_mean_cnt = mean(`var')
      replace `var' = `var'_mean if missing(`var')
      replace `var' = `var'_mean_cnt if missing(`var')
      egen `var'_std = std(`var')
    }

    alphawgt floor_material_std QF_ITEM_9*_std QF_ITEM_10*_std NBOOK_std [weight = PESO_ESTUDIANTE], detail std item label
    pca floor_material_std QF_ITEM_9*_std QF_ITEM_10*_std NBOOK_std [weight = PESO_ESTUDIANTE]
    predict HOMEPOS
    *Occupation of parents not available
    polychoricpca HIEDU HOMEPOS [weight = PESO_ESTUDIANTE], score(ESCS) nscore(1)
    ren ESCS1 ESCS
    bysort PAIS_NUM LLAVEPAISCENTRO IDGRADE: egen SCHESCS = mean(ESCS)
    bysort PAIS_NUM IDGRADE: egen CNTESCS = mean(ESCS)

    *** QUICK FIX ****
    rename *, lower
    ******************

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
