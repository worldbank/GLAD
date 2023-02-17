*=========================================================================*
* GLOBAL LEARNING ASSESSMENT DATABASE (GLAD)
* Project information at: https://github.com/worldbank/GLAD
*
* Metadata to be stored as 'char' in the resulting dataset (do NOT use ";" here)
local region      = "WLD"
local year        = "2003"
local assessment  = "TIMSS"
local master      = "v01_M"
local adaptation  = "wrk_A_GLAD"
local module      = "ALL"
local ttl_info    = "Joao Pedro de Azevedo [eduanalytics@worldbank.org]"
local dofile_info = "last modified by Ahmed Raza in January 29, 2021"
*
* Steps:
* 0) Program setup (identical for all assessments)
* 1) Open all rawdata, lower case vars, save in temp_dir
* 2) Combine all rawdata into a single file (merge and append)
* 3) Standardize variable names across all assessments
* 4) ESCS and other calculations (by Aroob, from Feb 2019)
* REPEAT 1-4 TWICE: once for lower grade (L), once for upper grade (U)
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

    *****************************************************************************
    * IMPORTANT!!!  THIS CODE BASICALLY BUILDS TWO DTAs (lower/upper idgrade)	  *
    * then append (could be a loop, pending more changes in the original pieces)*
    *****************************************************************************
    **********************   LOWER IDGRADE SECTION   ****************************

    *---------------------------------------------------------------------------
    * L.1) Open all rawdata, lower case vars, save in temp_dir
    *---------------------------------------------------------------------------
    // PLACEHOLDER: bring the list of countries as macro
    foreach cnt in ARM AUS BFL COT  CQU CYP ENG HKG HUN IRN ITA JPN LTU LVA MAR MDA NLD NOR NZL PHL RUS SCO SGP SVN TUN TWN UIN USA YEM {

      // Temporary copies of the 3 rawdatasets needed for each country (new section)
      foreach prefix in ASA ASG ACG {
        if `from_datalibweb'==1 {
          noi edukit_datalibweb, d(country(`region') year(`year') type(EDURAW) surveyid(`surveyid') filename(`prefix'`cnt'.dta) `shortcut')
        }
        else {
          use "`input_dir'/`prefix'`cnt'.dta", clear
        }
        rename *, lower
        compress
        save "`temp_dir'/`prefix'.dta", replace
      }

      // Merge the 3 rawdatasets into a single TEMP country file
      use "`temp_dir'/ASA.dta", clear
      merge 1:1 idcntry idschool idstud using "`temp_dir'/ASG.dta", keep(master match) nogen
      merge m:1 idcntry idschool using "`temp_dir'/ACG.dta", keep(master match) nogen
      save "`temp_dir'/TEMP_`surveyid'_l_`cnt'.dta", replace
    }

    noi disp as res "{phang}Step L.1 completed (`output_file'){p_end}"


    *---------------------------------------------------------------------------
    * L.2) Combine all rawdata into a single file (merge and append)
    *---------------------------------------------------------------------------

    fs "`temp_dir'/TEMP_`surveyid'_l_*.dta"
    local firstfile: word 1 of `r(files)'
    use "`temp_dir'/`firstfile'", clear
    foreach f in `r(files)' {
      if "`f'" != "`firstfile'" append using "`temp_dir'/`f'"
    }

    noi disp as res "{phang}Step L.2 completed (`output_file'){p_end}"


    *---------------------------------------------------------------------------
    * L.3) Standardize variable names across all assessments
    *---------------------------------------------------------------------------
    // For each variable class, we create a local with the variables in that class
    //     so that the final step of saving the GLAD dta  knows which vars to save

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
    * Cleaning grades for Russia/Slovenia: Participated in Grade 4 (per report)
    replace idgrade = 4 if idcntry_raw == 643 // = Russia = RUS
    replace idgrade = 4 if idcntry_raw == 705 // = Slovenia = SVN
    label var idgrade "Grade ID"
    *</_idgrade_>

    *<_idclass_>
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
    local valuevars	"score_timss* level_timss*"

    *<_score_assessment_subject_pv_>
    foreach pv in 01 02 03 04 05 {
      clonevar  score_timss_math_`pv' = asmmat`pv'
      label var score_timss_math_`pv' "Plausible value `pv': `assessment' score for math"
      char      score_timss_math_`pv'[clo_marker] "number"
      clonevar  score_timss_science_`pv' = asssci`pv'
      label var score_timss_science_`pv' "Plausible value `pv': `assessment' score for science"
      char      score_timss_science_`pv'[clo_marker] "number"
    }
    *</_score_assessment_subject_pv_>

    *<_level_assessment_subject_pv_>
    foreach pv in 01 02 03 04 05 {
      clonevar  level_timss_math_`pv'  = asmibm`pv'
      label var level_timss_math_`pv' "Plausible value `pv': `assessment' level for math"
      char      level_timss_math_`pv'[clo_marker] "factor"
      clonevar  level_timss_science_`pv' = assibm`pv'
      label var level_timss_science_`pv' "Plausible value `pv': `assessment' level for science"
      char      level_timss_science_`pv'[clo_marker] "factor"
    }
    *</_level_assessment_subject_pv_>


    // TRAIT Vars:
    local traitvars	"age urban* male escs qescs has_qescs"

    *<_age_>
    gen int age = asdage  if  !missing(asdage)  &  asdage != 99
    label var age "Learner age at time of assessment"
    *</_age_>

    *<_urban_>
    gen byte urban = (inlist(acbgcomu,1, 2, 3, 4, 5))  if  !missing(acbgcomu)  &  acbgcomu != 9
    label var urban "School is located in urban/rural area"
    *</_urban_>

    *<_urban_o_>
    decode acbgcomu, g(urban_o)
    label var urban_o "Original variable of urban: population size of the school area"
    *</_urban_o_>

    *<_male_>
    gen byte male = (itsex == 2)  &  !missing(itsex)
    label var male "Learner gender is male/female"
    *</_male_>


    // SAMPLE Vars:
    local samplevars "learner_weight jkzone jkrep"

    *<_learner_weight_>
    clonevar learner_weight  = totwgt
    label var learner_weight "Total learner weight"
    *</_learner_weight_>

    *<_jkzone_>
    label var jkzone "Jackknife zone"
    *</_jkzone_>

    *<_jkrep_>
    label var jkrep "Jackknife replicate code"
    *</_jkrep_>


    noi disp as res "{phang}Step L.3 completed (`output_file'){p_end}"


    *---------------------------------------------------------------------------
    * L.4) ESCS and other calculations (by Aroob, from Feb 2019)
    *---------------------------------------------------------------------------

    *NOT replacing IDCNTRY for England and Scotland (original do file)
    *replace IDCNTRY = 826 if inlist(IDCNTRY,927,926,928)
    *replace IDCNTRY = 056 if inlist(IDCNTRY,956,957)
    *Identifying whether the datasets are nationally representative
    gen n_res = 0 if inlist(idcntry,927,926,928,956,957)

    *** QUICK FIX ****
    rename *, upper
    ******************

    *Score and thresholds:
    foreach pv in 01 02 03 04 05 {
      clonevar SCORE_MATH`pv' = ASMMAT`pv'
      clonevar SCORE_SCIENCE`pv' = ASSSCI`pv'
      clonevar MATH_THRESHOLD`pv' = ASMIBM`pv'
      clonevar SCIENCE_THRESHOLD`pv' = ASSIBM`pv'
    }
    foreach var of varlist MATH_THRESHOLD* SCIENCE_THRESHOLD*{
      gen LOW_`var' = (`var' > 1) & !missing(`var')
      gen INT_`var' = (`var' > 2)	& !missing(`var')
      gen HIGH_`var' = (`var' > 3) & !missing(`var')
      gen ADV_`var' = (`var' > 4) & !missing(`var')
    }

    foreach var of varlist ASBGBOOK ASBGPS01 ASBGPS02 ASBGPS03 ASBGPS04 ASBGPS05 ASBGPS06 ASBGPS07 ASBGPS08 ASBGPS09 ASBGPS10 ASBGPS11 ASBGPS12 ASBGPS13 ASBGPS14 ASBGPS15 ASBGPS16 ASBGMBRN ASBGFBRN ASBGBORN {
      tab `var'
      replace `var' = . if inlist(`var',9)
    }

    *Developing ESCS variable
    gen NBOOK = ASBGBOOK if ASBGBOOK != 9
    foreach var of varlist ASBGPS01 ASBGPS02 ASBGPS03 ASBGPS04 ASBGPS05 ASBGPS06 ASBGPS07 ASBGPS08 ASBGPS09 ASBGPS10 ASBGPS11 ASBGPS12 ASBGPS13 ASBGPS14 ASBGPS15 ASBGPS16 ASBGMBRN ASBGFBRN ASBGBORN {
      tab `var', m
      *hist `var'
      replace `var' = 0 if `var' == 2
    }

    alphawgt NBOOK ASBGPS01 ASBGPS02 ASBGPS03 ASBGPS04 ASBGPS05 ASBGPS06 ASBGPS07 ASBGPS08 ASBGPS09 ASBGPS10 ASBGPS11 ASBGPS12 ASBGPS13 ASBGPS14 ASBGPS15 ASBGPS16   [weight = TOTWGT], detail std item label
    bysort IDCNTRY: mdesc NBOOK ASBGPS01 ASBGPS02 ASBGPS03 ASBGPS04 ASBGPS05 ASBGPS06 ASBGPS07 ASBGPS08 ASBGPS09 ASBGPS10 ASBGPS11 ASBGPS12 ASBGPS13 ASBGPS14 ASBGPS15 ASBGPS16
    tab NBOOK, gen(dbook)
    foreach var of varlist 	dbook* ASBGPS01 ASBGPS02 ASBGPS03 ASBGPS04 ASBGPS05 ASBGPS06 ASBGPS07 ASBGPS08 ASBGPS09 ASBGPS10 ASBGPS11 ASBGPS12 ASBGPS13 ASBGPS14 ASBGPS15 ASBGPS16 {
      bysort IDCNTRY IDSCHOOL: egen `var'_mean = mean(`var')
      bysort IDCNTRY: egen `var'_mean_cnt = mean(`var')
      replace `var' = `var'_mean if missing(`var')
      replace `var' = `var'_mean_cnt if missing(`var')
      egen `var'_std = std(`var')
    }

    bysort IDCNTRY: mdesc NBOOK ASBGPS01 ASBGPS02 ASBGPS03 ASBGPS04 ASBGPS05 ASBGPS06 ASBGPS07 ASBGPS08 ASBGPS09 ASBGPS10 ASBGPS11 ASBGPS12 ASBGPS13 ASBGPS14 ASBGPS15 ASBGPS16

    pca dbook*_std ASBGPS01_std ASBGPS02_std ASBGPS03_std ASBGPS04_std ASBGPS05_std ASBGPS06_std ASBGPS07_std ASBGPS08_std ASBGPS09_std ASBGPS10_std ASBGPS11_std ASBGPS12_std ASBGPS13_std ASBGPS14_std ASBGPS15_std ASBGPS16_std [weight = TOTWGT]
    predict HOMEPOS
    pca dbook*_std ASBGPS01_std ASBGPS02_std ASBGPS03_std ASBGPS04_std ASBGPS05_std ASBGPS06_std ASBGPS07_std ASBGPS08_std ASBGPS09_std ASBGPS10_std ASBGPS11_std ASBGPS12_std ASBGPS13_std ASBGPS14_std ASBGPS15_std [weight = TOTWGT]
    predict HOMEPOS1
    pca dbook*_std ASBGPS01_std ASBGPS02_std ASBGPS03_std ASBGPS04_std ASBGPS05_std ASBGPS06_std ASBGPS07_std ASBGPS08_std ASBGPS09_std ASBGPS10_std ASBGPS11_std ASBGPS12_std ASBGPS13_std  [weight = TOTWGT]
    predict HOMEPOS2
    pca dbook*_std ASBGPS01_std ASBGPS02_std ASBGPS03_std ASBGPS04_std ASBGPS05_std ASBGPS06_std ASBGPS07_std ASBGPS08_std ASBGPS09_std ASBGPS10_std ASBGPS11_std ASBGPS12_std  [weight = TOTWGT]
    predict HOMEPOS3
    pca dbook*_std ASBGPS01_std ASBGPS02_std ASBGPS03_std ASBGPS04_std ASBGPS05_std ASBGPS06_std ASBGPS07_std ASBGPS08_std ASBGPS09_std ASBGPS10_std ASBGPS11_std  [weight = TOTWGT]
    predict HOMEPOS4
    pca dbook*_std ASBGPS01_std ASBGPS02_std ASBGPS03_std ASBGPS04_std ASBGPS05_std ASBGPS06_std ASBGPS07_std ASBGPS08_std ASBGPS09_std ASBGPS10_std  [weight = TOTWGT]
    predict HOMEPOS5
    pca dbook*_std ASBGPS01_std ASBGPS02_std ASBGPS03_std ASBGPS04_std ASBGPS05_std ASBGPS06_std ASBGPS07_std ASBGPS08_std  [weight = TOTWGT]
    predict HOMEPOS6
    pca dbook*_std ASBGPS01_std ASBGPS02_std ASBGPS03_std ASBGPS04_std ASBGPS05_std ASBGPS06_std ASBGPS07_std  [weight = TOTWGT]
    predict HOMEPOS7
    pca dbook*_std ASBGPS01_std ASBGPS02_std ASBGPS03_std ASBGPS04_std ASBGPS05_std ASBGPS06_std  [weight = TOTWGT]
    predict HOMEPOS8
    pca dbook*_std ASBGPS01_std ASBGPS02_std ASBGPS03_std ASBGPS04_std ASBGPS05_std  [weight = TOTWGT]
    predict HOMEPOS9
    pca dbook*_std ASBGPS01_std ASBGPS02_std ASBGPS03_std ASBGPS04_std [weight = TOTWGT]
    predict HOMEPOS10

    forvalues i = 1/10 {
      replace HOMEPOS = HOMEPOS`i' if missing(HOMEPOS)
    }

    gen LANGATHOME = 1 if inlist(ASBGOLAN,1,2)
    replace LANGATHOME = 0 if inlist(ASBGOLAN,3,4)

    *Data on early childhood education not available.
    gen NATIVE = 1 if ASBGBORN == 1 | ASBGMBRN == 1 | ASBGFBRN == 1
    replace NATIVE = 0 if (ASBGMBRN == 0 & ASBGFBRN == 0)

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
      
    noi disp as res "{phang}Step L.4 completed (`output_file'){p_end}"

    // FINISHED LOWER GRADE TEMP FILE
    save "`temp_dir'/TEMP_`surveyid'_l.dta", replace

    *****************************************************************************
    * IMPORTANT!!!  THIS CODE BASICALLY BUILDS TWO DTAs (lower/upper idgrade)	  *
    * then append (could be a loop, pending more changes in the original pieces)*
    *****************************************************************************
    **********************   UPPER IDGRADE SECTION   ****************************

    *---------------------------------------------------------------------------
    * U.1) Open all rawdata, lower case vars, save in temp_dir
    *---------------------------------------------------------------------------
    // PLACEHOLDER: bring the list of countries as macro
    foreach cnt in ARM AUS BFL BGR BHR BSQ BWA CHL COT  CQU CYP EGY ENG EST GHA HKG HUN IDN IRN ISR ITA JOR JPN KOR LBN LTU LVA MAR MDA MKD MYS NLD NOR NZL PHL PSE ROM RUS SAU SCG SCO SGP SVK SVN SWE SYR TUN TWN UIN USA ZAF {

      // Temporary copies of the 3 rawdatasets needed for each country (new section)
      foreach prefix in BSA BSG BCG {
        if `from_datalibweb'==1 {
          noi edukit_datalibweb, d(country(`region') year(`year') type(EDURAW) surveyid(`surveyid') filename(`prefix'`cnt'.dta) `shortcut')
        }
        else {
          use "`input_dir'/`prefix'`cnt'.dta", clear
        }
        rename *, lower
        compress
        save "`temp_dir'/`prefix'.dta", replace
      }

      // Merge the 3 rawdatasets into a single TEMP country file
      use "`temp_dir'/BSA.dta", clear
      merge 1:1 idcntry idschool idstud using "`temp_dir'/BSG.dta", keep(master match) nogen
      merge m:1 idcntry idschool using "`temp_dir'/BCG.dta", keep(master match) nogen
      save "`temp_dir'/TEMP_`surveyid'_u_`cnt'.dta", replace
    }
    noi disp as res "{phang}Step U.1 completed (`output_file'){p_end}"


    *---------------------------------------------------------------------------
    * U.2) Combine all rawdata into a single file (merge and append)
    *---------------------------------------------------------------------------

    fs "`temp_dir'/TEMP_`surveyid'_u_*.dta"
    local firstfile: word 1 of `r(files)'
    use "`temp_dir'/`firstfile'", clear
    foreach f in `r(files)' {
      if "`f'" != "`firstfile'" append using "`temp_dir'/`f'"
    }

    noi disp as res "{phang}Step U.2 completed (`output_file'){p_end}"


    *---------------------------------------------------------------------------
    * U.3) Standardize variable names across all assessments
    *---------------------------------------------------------------------------
    // For each variable class, we create a local with the variables in that class
    //     so that the final step of saving the GLAD dta  knows which vars to save

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
    * Cleaning grades for Slovenia: Participated in Grade 8 (per report)
    replace idgrade = 8 if idcntry_raw == 705 // = Slovenia = SVN
    label var idgrade "Grade ID"
    *</_idgrade_>

    *<_idclass_>
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
    local valuevars	"score_timss* level_timss*"

    *<_score_assessment_subject_pv_>
    foreach pv in 01 02 03 04 05 {
      clonevar  score_timss_math_`pv' = bsmmat`pv'
      label var score_timss_math_`pv' "Plausible value `pv': `assessment' score for math"
      char      score_timss_math_`pv'[clo_marker] "number"
      clonevar  score_timss_science_`pv' = bsssci`pv'
      label var score_timss_science_`pv' "Plausible value `pv': `assessment' score for science"
      char      score_timss_science_`pv'[clo_marker] "number"
    }
    *</_score_assessment_subject_pv_>

    *<_level_assessment_subject_pv_>
    foreach pv in 01 02 03 04 05 {
      clonevar  level_timss_math_`pv' = bsmibm`pv'
      label var level_timss_math_`pv' "Plausible value `pv': `assessment' level for math"
      char      level_timss_math_`pv'[clo_marker] "factor"
      clonevar  level_timss_science_`pv' = bssibm`pv'
      label var level_timss_science_`pv' "Plausible value `pv': `assessment' level for science"
      char      level_timss_science_`pv'[clo_marker] "factor"
    }
    *</_level_assessment_subject_pv_>


    // TRAIT Vars:
    local traitvars	"age urban* male escs qescs has_qescs"

    *<_age_>
    gen int age = bsdage  if  !missing(bsdage)  &  bsdage != 99
    label var age "Learner age at time of assessment"
    *</_age_>

    *<_urban_>
    gen byte urban = (inlist(bcbgcomu,1, 2, 3, 4, 5))  if  !missing(bcbgcomu)  &  bcbgcomu != 9
    label var urban "School is located in urban/rural area"
    *</_urban_>

    *<_urban_o_>
    decode bcbgcomu, g(urban_o)
    label var urban_o "Original variable of urban: population size of the school area"
    *</_urban_o_>

    *<_male_>
    gen byte male = (itsex == 2)  &  !missing(itsex)
    label var male "Learner gender is male/female"
    *</_male_>


    // SAMPLE Vars:
    local samplevars "learner_weight jkzone jkrep"

    *<_learner_weight_>
    clonevar learner_weight  = totwgt
    label var learner_weight "Total learner weight"
    *</_learner_weight_>

    *<_jkzone_>
    label var jkzone "Jackknife zone"
    *</_jkzone_>

    *<_jkrep_>
    label var jkrep "Jackknife replicate code"
    *</_jkrep_>


    noi disp as res "{phang}Step U.3 completed (`output_file'){p_end}"


    *---------------------------------------------------------------------------
    * U.4) ESCS and other calculations (by Aroob, from Feb 2019)
    *---------------------------------------------------------------------------

    *NOT replacing IDCNTRY for England and Scotland (original do file)
    *replace IDCNTRY = 826 if inlist(IDCNTRY,927,926,928)
    *replace IDCNTRY = 056 if inlist(IDCNTRY,956,957)
    *Identifying whether the datasets are nationally representative
    gen n_res = 0 if inlist(idcntry,927,926,928,956,957)

    *** QUICK FIX ****
    rename *, upper
    ******************

    *Score and thresholds:
    foreach pv in 01 02 03 04 05 {
      clonevar SCORE_MATH`pv' = BSMMAT`pv'
      clonevar SCORE_SCIENCE`pv' = BSSSCI`pv'
      clonevar MATH_THRESHOLD`pv' = BSMIBM`pv'
      clonevar SCIENCE_THRESHOLD`pv' = BSSIBM`pv'
    }
    foreach var of varlist MATH_THRESHOLD* SCIENCE_THRESHOLD*{
      gen LOW_`var' = (`var' > 1) & !missing(`var')
      gen INT_`var' = (`var' > 2) & !missing(`var')
      gen HIGH_`var' = (`var' > 3) & !missing(`var')
      gen ADV_`var' = (`var' > 4) & !missing(`var')
    }

    foreach var of varlist BSBGBOOK BSBGPS01 BSBGPS02 BSBGPS03 BSBGPS04 BSBGPS05 BSBGPS06 BSBGMFED BSBGFMED BSBGPS01 BSBGPS02 BSBGPS03 BSBGPS04 BSBGPS05 BSBGPS06 BSBGPS07 BSBGPS08 BSBGPS09 BSDGEDUP BSBGMBRN BSBGFBRN BSBGBORN {
      tab `var'
      replace `var' = . if inlist(`var',9,99)
    }

    *Developing variable ESCS:
    gen NBOOK = BSBGBOOK if BSBGBOOK != 9
    foreach var of varlist  BSBGPS01 BSBGPS02 BSBGPS03 BSBGPS04 BSBGPS05 BSBGPS06 BSBGPS01 BSBGPS02 BSBGPS03 BSBGPS04 BSBGPS05 BSBGPS06 BSBGPS07 BSBGPS08 BSBGPS09 BSBGMBRN BSBGFBRN BSBGBORN {
      tab `var', m
      replace `var' = 0 if `var' == 2
    }
    tab NBOOK, gen(dbook)

    *Filling in missing values:
    foreach var of varlist dbook* BSBGPS01 BSBGPS02 BSBGPS03 BSBGPS04 BSBGPS05 BSBGPS06 BSBGPS07 BSBGPS08 BSBGPS09 {
      bysort IDCNTRY IDSCHOOL: egen `var'_mean = mean(`var')
      bysort IDCNTRY: egen `var'_mean_cnt = mean(`var')
      replace `var' = `var'_mean if missing(`var')
      replace `var' = `var'_mean_cnt if missing(`var')
      egen `var'_std = std(`var')
    }

    bysort IDCNTRY: mdesc dbook* BSBGPS01 BSBGPS02 BSBGPS03 BSBGPS04 BSBGPS05 BSBGPS06 BSBGPS07 BSBGPS08 BSBGPS09
    alphawgt dbook* BSBGPS01 BSBGPS02 BSBGPS03 BSBGPS04 BSBGPS05 BSBGPS06 BSBGPS07 BSBGPS08 BSBGPS09 [weight = TOTWGT], detail std item label
    pca dbook*_std BSBGPS01_std BSBGPS02_std BSBGPS03_std BSBGPS04_std BSBGPS05_std BSBGPS06_std BSBGPS07_std BSBGPS08_std BSBGPS09_std [weight = TOTWGT]
    predict HOMEPOS
    pca dbook*_std BSBGPS01_std BSBGPS02_std BSBGPS03_std BSBGPS04_std BSBGPS05_std BSBGPS06_std BSBGPS07_std BSBGPS08_std  [weight = TOTWGT]
    predict HOMEPOS1
    pca dbook*_std BSBGPS01_std BSBGPS02_std BSBGPS03_std BSBGPS04_std BSBGPS05_std BSBGPS06_std BSBGPS07_std  [weight = TOTWGT]
    predict HOMEPOS2
    pca dbook*_std BSBGPS01_std BSBGPS02_std BSBGPS03_std BSBGPS04_std BSBGPS05_std BSBGPS06_std [weight = TOTWGT]
    predict HOMEPOS3
    pca dbook*_std BSBGPS01_std BSBGPS02_std BSBGPS03_std BSBGPS04_std BSBGPS05_std  [weight = TOTWGT]
    predict HOMEPOS4
    pca dbook*_std BSBGPS01_std BSBGPS02_std BSBGPS03_std BSBGPS04_std  [weight = TOTWGT]
    predict HOMEPOS5
    pca dbook*_std BSBGPS01_std BSBGPS02_std BSBGPS03_std BSBGPS05_std BSBGPS06_std BSBGPS07_std BSBGPS08_std  [weight = TOTWGT]
    predict HOMEPOS6

    replace HOMEPOS = HOMEPOS6 if inlist(IDCNTRY,11800) & missing(HOMEPOS)
    forvalues i = 1/5 {
      replace HOMEPOS = HOMEPOS`i' if missing(HOMEPOS)
    }

    egen HIEDU = rowmax(BSBGMFED BSBGFMED)
    label values HIEDU BSBGMFED

    *Filling in missing values for HIEDU:
    bysort IDCNTRY IDSCHOOL: egen HIEDU_mode = mode(HIEDU), maxmode
    bysort IDCNTRY : egen HIEDU_mode_cnt = mode(HIEDU), maxmode
    replace HIEDU = HIEDU_mode if missing(HIEDU)
    replace HIEDU = HIEDU_mode_cnt if missing(HIEDU)

    polychoricpca HIEDU HOMEPOS [weight = TOTWGT], score(ESCS) nscore(1)
    ren ESCS1 ESCS

    *Identify countries with missing information on Education or Occupation:
    gen tag_missing_education = .
    levelsof IDCNTRY, local (country)
    foreach c of local country {
      mdesc HIEDU if IDCNTRY == `c'
      replace tag_missing_education = 1 if r(percent) == 100 & IDCNTRY == `c'
    }

    gen LANGATHOME = 1 if inlist(BSBGOLAN,1,2)
    replace LANGATHOME = 0 if inlist(BSBGOLAN,3,4)

    *Data on early childhood education not available.
    gen NATIVE = 1 if BSBGBORN == 1 | BSBGMBRN == 1 | BSBGFBRN == 1
    replace NATIVE = 0 if (BSBGMBRN == 0 & BSBGFBRN == 0)

    bysort IDCNTRY IDSTUD: egen SCHESCS = mean(ESCS)
    bysort IDCNTRY: egen CNTESCS = mean(ESCS)

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
    
    
    noi disp as res "{phang}Step U.4 completed (`output_file'){p_end}"

    // FINISHED UPPER GRADE TEMP FILE
    save "`temp_dir'/TEMP_`surveyid'_u.dta", replace

    *****************************************************************************
    * IMPORTANT!!!  THIS CODE BASICALLY BUILDS TWO DTAs (lower/upper idgrade)	  *
    * then append (could be a loop, pending more changes in the original pieces)*
    *****************************************************************************
    **********************   APPENDING BOTH FILES   ****************************

    // Opens up the file from the first loop (LOWER grade)
    // Appends with the file from second loop (UPPER grade)
    use "`temp_dir'/TEMP_`surveyid'_l", clear
    append using "`temp_dir'/TEMP_`surveyid'_u"

     
     * Adjustment after the append: rename science vars to scie so that ados don't break because of characterlimit. 
    
    ren score_timss_science_01 score_timss_scie_01
    ren score_timss_science_02 score_timss_scie_02
    ren score_timss_science_03 score_timss_scie_03
    ren score_timss_science_04 score_timss_scie_04
    ren score_timss_science_05 score_timss_scie_05
    
    ren level_timss_science_01 level_timss_scie_01
    ren level_timss_science_02 level_timss_scie_02
    ren level_timss_science_03 level_timss_scie_03
    ren level_timss_science_04 level_timss_scie_04
    ren level_timss_science_05 level_timss_scie_05

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
    edukit_save, filename("`output_file'") path("`output_dir'") dir2delete("`temp_dir'")  ///
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
