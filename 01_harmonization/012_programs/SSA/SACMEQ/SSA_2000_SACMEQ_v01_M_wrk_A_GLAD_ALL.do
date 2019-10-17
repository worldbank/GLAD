*=========================================================================*
* GLOBAL LEARNING ASSESSMENT DATABASE (GLAD)
* Project information at: https://github.com/worldbank/GLAD
*
* Metadata to be stored as 'char' in the resulting dataset (do NOT use ";" here)
local region      = "SSA"
local year        = "2000"
local assessment  = "SACMEQ"
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
    foreach prefix in back_03_2000_06_9 {
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
    // Nothing to append. All data in a single file
    // PLACEHOLDER!!!! DOUBLE CHECK IN indir that this prefix is the only dta

    noi disp as res "{phang}Step 2 completed (`output_file'){p_end}"


    *---------------------------------------------------------------------------
    * 3) Standardize variable names across all assessments
    *---------------------------------------------------------------------------
    // For each variable class, we create a local with the variables in that class
    // so that the final step of saving the GLAD dta  knows which vars to save

    // ID Vars:
    local idvars "idcntry_raw idschool idgrade idclass idlearner"

    *<_idcntry_raw_>
    clonevar idcntry_raw = idcntry
    label var idcntry_raw "Country ID, as coded in rawdata"
    *</_idcntry_raw_>

    *<_idschool_>
    label var idschool "School ID"
    *</_idschool_>

    *<_idgrade_>
    gen int idgrade = 6
    label var idgrade "Grade ID"
    *</_idgrade_>

    *<_idclass_>
    label var idclass "Class ID"
    *</_idclass_>

    *<_idlearner_>
    clonevar idlearner = idpupil
    replace  idlearner = -99 if missing(idlearner)
    label var idlearner "Learner ID"
    *</_idlearner_>

    // Drop any value labels of idvars, to be okay to append multiple surveys
    foreach var of local idvars {
      cap label values `var' .
    }


    // VALUE Vars:
    local valuevars	"score_sacmeq* level_sacmeq*"

    *<_score_assessment_subject_pv_>
    clonevar  score_sacmeq_read = zralocp
    clonevar  score_sacmeq_math = zmalocp
    foreach subject in read math {
      label var score_sacmeq_`subject' "Sacmeq score for `subject'"
      char      score_sacmeq_`subject'[clo_marker] "number"
    }
    *</_score_assessment_subject_pv_>

    *<_level_assessment_subject_pv_>
    clonevar  level_sacmeq_read = zralevp
    clonevar  level_sacmeq_math = zmalevp
    foreach subject in read math {
      label var level_sacmeq_`subject' "Sacmeq level for `subject'"
      char      level_sacmeq_`subject'[clo_marker] "factor"
    }
    *</_level_assessment_subject_pv_>


    // TRAIT Vars:
    local traitvars	"age urban* male escs"

    *<_age_>
    gen age = zpagemon/12	// Age was in months
    label var age "Learner age at time of assessment"
    *</_age_>

    *<_urban_>
    clonevar urban = zsloc
    label var urban "School is located in urban/rural area"
    *</_urban_>

    *<_urban_o_>
    clonevar urban_o = slocat
    // PLACEHOLDER!!! check the documentation on how to label this
    label var urban_o "TBD"
    *</_urban_o_>

    *<_male_>
    gen byte male  = (zpsex==0) & !missing(zpsex) // Originally coded 0 = boy, 1 = girl
    label var male "Learner gender is male/female"
    *</_male_>


    // SAMPLE Vars:
    local samplevars "strata learner_weight*"

    *<_learner_weight_>
    clonevar  learner_weight = pweight2
    label var learner_weight "Learner weight"
    *</_learner_weight_>

    *<_strata_>
    encode stratum, gen(strata)
    label var strata "Strata"
    *</_strata_>


    noi disp as res "{phang}Step 3 completed (`output_file'){p_end}"


    *---------------------------------------------------------------------------
    * 4) ESCS and other calculations (by Aroob, from Feb 2019)
    *---------------------------------------------------------------------------

    *** QUICK FIX ****
    rename *, upper
    ******************

    gen LOW_READING_PROFICIENCY_WB  = (ZRALEVP >= 4) & !missing(ZRALEVP)
    gen LOW_READING_PROFICIENCY_UIS = (ZRALEVP >= 3) & !missing(ZRALEVP)

    *Dolata S. states the ESCS variable to be zpsesscr
    egen ESCS = std(ZPSESSCR)

    gen ABSENCE_LAST_MONTH = PABSENT
    gen SPEAK_ENGLISH = ZPENGLIS

    gen STUDENT_ACCOMODATION = 1 if PSTAY == 1
    replace STUDENT_ACCOMODATION = 0 if inlist(PSTAY,2,3,4)
    label define STUDENT_ACCOMODATION 1 "With Parents" 0 "Relatives/Hostel/Alone"
    label values STUDENT_ACCOMODATION STUDENT_ACCOMODATION

    gen REGULAR_MEALS = ZPREGME

    *Home level Variables:
    gen HOME_INTEREST = ZPHMINT

    *Teacher Level Variables:
    gen TCHSEX = ZXSEX
    gen TCHAGE = ZXAGELVL
    gen TCHEDU = XQACAD
    gen TEACHER_TRAINING = 1 if inlist(XQPROF,3,4,5,6)
    replace TEACHER_TRAINING = 0 if inlist(XQPROF,1,2)
    label define TEACHER_TRAINING 1 "One or more years of trianing" 0 "No or less than one year of training"
    label values TEACHER_TRAINING TEACHER_TRAINING
    gen TCH_ABSENTEEISM = STCHPR02
    gen TCHEXP = YEXPER
    gen INSERVICE_COURSES = YINSERVC
    gen TCHESCS = ZXHPOS13

    *School Level Variables:
    *School's average socio-economic status:
    bysort IDCNTRY IDSCH: egen SCHESCS = mean(ESCS)
    bysort IDCNTRY: egen CNTESCS = mean(ESCS)

    gen TEACHER_LIVING_CONDITION = 1 if XLIVING == 4
    replace TEACHER_LIVING_CONDITION = 0 if inlist(XLIVING,1,2,3)
    label define TEACHER_LIVING_CONDITION 1 "Good" 0 "Not Good"
    label values TEACHER_LIVING_CONDITION TEACHER_LIVING_CONDITION

    *Frequency of testing:
    gen FREQ_TESTING = 1 if inlist(TTESTREA,4,5,6)
    replace FREQ_TESTING = 0 if inlist(TTESTREA,1,2,3)
    label define FREQ_TESTING 1 "More than once per term" 0 "Once or less than once per term"
    label values FREQ_TESTING FREQ_TESTING

    *Frequency of meeting parents:
    gen FREQ_MEET_PARENTS = 1 if XMEETPAR == 4
    replace FREQ_MEET_PARENTS = 0 if inlist(XMEETPAR,1,2,3)
    label define FREQ_MEET_PARENTS 1 "Meet parents at least once a month" 0 "Less than once a month"
    label values FREQ_MEET_PARENTS FREQ_MEET_PARENTS

    *Frequency of homework
    gen FREQ_HW = 1 if PHMWKR == 4
    replace FREQ_HW = 0 if PHMWKR < 4
    label define FREW_HW 1 "Most days" 0 "Once or twice each week or less"
    label values FREQ_HW FREQ_HW

    *School Level Variables (DIRECTOR):
    gen DSEX = ZSSEX
    gen DAGE = ZSAGELVL
    gen DEDU = SQACADEM
    *Director's qualification:
    gen DTRAINING = 1 if inlist(SQTT,3,4,5,6)
    replace DTRAINING = 0 if inlist(SQTT,1,2)
    label define DTRAINING 1 "One or more years of training" 0 "No or less than one year of training"
    label values DTRAINING DTRAINING

    gen D_TCH_EXP = SEXPTCH
    gen STUDENT_ABSENTEEISM = SPUPPR02
    gen SCHRCS = ZSRTOT22
    gen CLSIZE = XCLSIZE

    *Generating Schooling building condition:
    gen SCHOOL_CONDITION = 1 if SCONDIT == 5
    replace SCHOOL_CONDITION = 0 if inlist(SCONDIT,1,2,3,4)
    label define SCHOOL_CONDITION 1 "Good" 0 "Not Good"
    label values SCHOOL_CONDITION SCHOOL_CONDITION

    gen PUPIL_TEACHER_RATIO = ZSPTRATI
    gen SCHSIZE = SFENROL
    gen PUPIL_TOILET_RATIO = ZSTRATIO

    label var ESCS ""

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
