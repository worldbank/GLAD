*=========================================================================*
* GLOBAL LEARNING ASSESSMENT DATABASE (GLAD)
* Project information at: https://github.com/worldbank/GLAD
*
* Metadata to be stored as 'char' in the resulting dataset (do NOT use ";" here)
local region      = "WLD"
local year        = "2011"
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
    foreach cnt in AAD ADU ARE ARM AUS AUT AZE BFL BHR BWA CAB CHL  COT CQU  CZE DEU DNK ENG ESP FIN GEO HKG HND HRV HUN IRL IRN  ITA JPN KAZ KOR KWT  LTU MAR MLT NIR NLD NOR NZL OMN POL PRT QAT ROM RUS SAU SGP SRB SVK SVN SWE THA TUN TUR TWN USA YE6 YEM {

      // Temporary copies of the 4 rawdatasets needed for each country (new section)
      foreach prefix in ASA ASG ASH ACG {
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

      // Merge the 4 rawdatasets into a single TEMP country file
      use "`temp_dir'/ASA.dta", clear
      merge 1:1 idcntry idschool idstud using "`temp_dir'/ASG.dta", keep(master match) nogen
      merge 1:1 idcntry idschool idstud using "`temp_dir'/ASH.dta", keep(master match) nogen
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
      clonevar  level_timss_math_`pv' = asmibm`pv'
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
    gen byte urban = (inlist(acbg05a,1, 2, 3, 4, 5))  if  !missing(acbg05a)  &  acbg05a != 9
    label var urban "School is located in urban/rural area"
    *</_urban_>

    *<_urban_o_>
    decode acbg05a, g(urban_o1)
    label var urban_o1 "Original variable of urban: population size of the school area"
    decode acbg05b, g(urban_o2)
    label var urban_o2 "Original variable of urban: school is located in urban/rural area"
    *</_urban_o_>

    *<_male_>
    gen byte male = (itsex == 2)  &  !missing(itsex)
    label var male "Learner gender is male/female"
    *</_male_>


    // SAMPLE Vars:
    local samplevars "learner_weight jkzone jkrep"

    *<_learner_weight_>
    clonevar learner_weight = totwgt
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
      gen INT_`var' = (`var' > 2) & !missing(`var')
      gen HIGH_`var' = (`var' > 3) & !missing(`var')
      gen ADV_`var' = (`var' > 4) & !missing(`var')
    }

    foreach var of varlist ASBG04 ASBG05A ASBG05B ASBG05C ASBG05D ASBG05E ASBG05F ASBG05G ASBG05H ASBG05I ASBG05J ASBG05K ASDHOCCP ASDHEDUP {
      tab `var'
      replace `var' = . if inlist(`var',7,9,99)
    }
    replace ASDHEDUP = . if ASDHEDUP == 6

    *Developing variable ESCS:
    gen NBOOK = ASBG04
    foreach var of varlist ASBG05A ASBG05B ASBG05C ASBG05D ASBG05E ASBG05F ASBG05G ASBG05H ASBG05I ASBG05J ASBG05K {
      tab `var', m
      *hist `var'
      replace `var' = 0 if `var' == 2
    }

    alphawgt NBOOK ASBG05A ASBG05B ASBG05C ASBG05D ASBG05E ASBG05F ASBG05G ASBG05H ASBG05I ASBG05J ASBG05K  [weight = TOTWGT], detail std item label
    bysort IDCNTRY: mdesc NBOOK ASBG05A ASBG05B ASBG05C ASBG05D ASBG05E ASBG05F ASBG05G ASBG05H ASBG05I ASBG05J ASBG05K
    tab NBOOK, gen(dbook)
    foreach var of varlist dbook* ASBG05A ASBG05B ASBG05C ASBG05D ASBG05E ASBG05F ASBG05G ASBG05H ASBG05I ASBG05J ASBG05K {
      bysort IDCNTRY IDSCHOOL : egen `var'_mean = mean(`var')
      bysort IDCNTRY: egen `var'_mean_cnt = mean(`var')
      replace `var' = `var'_mean if missing(`var')
      replace `var' = `var'_mean_cnt if missing(`var')
      egen `var'_std = std(`var')
    }
    *Some countries are not asked the additional items:
    pca dbook*_std ASBG05A_std ASBG05B_std ASBG05C_std ASBG05D_std ASBG05E_std ASBG05F_std ASBG05G_std ASBG05H_std ASBG05I_std ASBG05J_std ASBG05K_std [weight = TOTWGT]
    predict HOMEPOS
    pca dbook*_std ASBG05A_std ASBG05B_std ASBG05C_std ASBG05D_std ASBG05E_std ASBG05F_std ASBG05G_std ASBG05H_std ASBG05I_std ASBG05J_std  [weight = TOTWGT]
    predict HOMEPOS1
    pca dbook*_std ASBG05A_std ASBG05B_std ASBG05C_std ASBG05D_std ASBG05E_std ASBG05F_std ASBG05G_std ASBG05H_std ASBG05I_std  [weight = TOTWGT]
    predict HOMEPOS2
    pca dbook*_std ASBG05A_std ASBG05B_std ASBG05C_std ASBG05D_std ASBG05E_std ASBG05F_std ASBG05G_std ASBG05H_std [weight = TOTWGT]
    predict HOMEPOS3
    pca dbook*_std ASBG05A_std ASBG05B_std ASBG05C_std ASBG05D_std ASBG05E_std ASBG05F_std ASBG05G_std [weight = TOTWGT]
    predict HOMEPOS4
    pca dbook*_std ASBG05A_std ASBG05B_std ASBG05C_std ASBG05D_std ASBG05E_std ASBG05F_std [weight = TOTWGT]
    predict HOMEPOS5
    pca dbook*_std ASBG05A_std ASBG05B_std ASBG05C_std ASBG05D_std ASBG05E_std [weight = TOTWGT]
    predict HOMEPOS6
    forvalues i = 1/6 {
      replace HOMEPOS = HOMEPOS`i' if missing(HOMEPOS)
    }

    *Recoding ASDHOCCP ASDHEDUP to be in the same direction as HOMEPOS
    recode ASDHOCCP (1=6) (2=5) (3=4) (4=3) (5=2) (6=1), gen(HIOCC)
    recode ASDHEDUP (1=5) (2=4) (4=2) (5=1), gen(HIEDU)

    *Filling in missing HIEDU HOMEPOS
    *Replacing missing values of HIEDU and HIOCC:
    bysort IDCNTRY IDSCHOOL: egen HIEDU_mode = mode(HIEDU), maxmode
    bysort IDCNTRY: egen HIEDU_mode_cnt = mode(HIEDU), maxmode
    replace HIEDU = HIEDU_mode if missing(HIEDU)
    replace HIEDU = HIEDU_mode_cnt if missing(HIEDU)

    bysort IDCNTRY IDSCHOOL: egen HIOCC_mode = mode(HIOCC), maxmode
    bysort IDCNTRY: egen HIOCC_mode_cnt = mode(HIOCC), maxmode
    replace HIOCC = HIOCC_mode if missing(HIOCC)
    replace HIOCC = HIOCC_mode_cnt if missing(HIOCC)

    polychoricpca HIEDU HOMEPOS [weight = TOTWGT], score(ESCS) nscore(1)
    ren ESCS1 ESCS
    gen LANGATHOME = 1 if inlist(ASBG03,1,2)
    replace LANGATHOME = 0 if inlist(ASBG03,3,4)
    *Data on early childhood education available:
    gen ECE = 1 if ASBH04A == 1
    replace ECE = 0 if ASBH04A == 2
    bysort IDCNTRY IDSCHOOL: egen SCHESCS = mean(ESCS)
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
    foreach cnt in AAD ADU ARE ARM AUS BHR BWA CAB CHL  COT CQU ENG FIN GEO GHA HKG HND HUN IDN IRN ISR ITA JOR JPN KAZ KOR LBN  LTU MAR MKD MYS NOR NZL OMN PSE QAT ROM RUS SAU SGP SVN SWE SYR THA TUN TUR TWN UKR USA ZAF {

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
    gen byte urban = (inlist(bcbg05a,1, 2, 3, 4, 5))  if  !missing(bcbg05a)  &  bcbg05a != 9
    label var urban "School is located in urban/rural area"
    *</_urban_>

    *<_urban_o_>
    decode bcbg05a, g(urban_o1)
    label var urban_o1 "Original variable of urban: population size of the school area"
    decode bcbg05b, g(urban_o2)
    label var urban_o2 "Original variable of urban: school is located in urban/rural area"
    *</_urban_o_>

    *<_male_>
    gen byte male = (itsex == 2)  &  !missing(itsex)
    label var male "Learner gender is male/female"
    *</_male_>


    // SAMPLE Vars:
    local samplevars "learner_weight jkzone jkrep"

    *<_learner_weight_>
    clonevar learner_weight = totwgt
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

    *Generating variable for NATIVE:
    *Data on early childhood education not available.
    gen NATIVE = 1 if BSBG09A == 1 | BSBG08B == 1 | BSBG08A == 1
    replace NATIVE = 0 if (BSBG08B == 0 & BSBG08A == 0)

    *Generating indicator for Lanaguage at home.
    gen LANGATHOME = 1 if inlist(BSBG03,1,2)
    replace LANGATHOME = 0 if inlist(BSBG03,3,4)

    *Generating variable for ESCS:
    foreach var of varlist BCBG05A BSBG04 BSBG05A BSBG05B BSBG05C BSBG05D BSBG05E BSBG05F BSBG05G BSBG05H BSBG05I BSBG05J BSBG05K BSBG06A BSBG06B {
      tab `var'
      replace `var' = . if inlist(`var',8,9,99)
    }
    gen NBOOK = BSBG04
    foreach var of varlist  BSBG05A BSBG05B BSBG05C BSBG05D BSBG05E BSBG05F BSBG05G BSBG05H BSBG05I BSBG05J BSBG05K {
      tab `var', m
      *hist `var'
      replace `var' = 0 if `var' == 2
    }
    alphawgt NBOOK  BSBG05A BSBG05B BSBG05C BSBG05D BSBG05E BSBG05F BSBG05G BSBG05H BSBG05I BSBG05J BSBG05K [weight = TOTWGT], detail std item label
    bysort IDCNTRY: mdesc NBOOK  BSBG05A BSBG05B BSBG05C BSBG05D BSBG05E BSBG05F BSBG05G BSBG05H BSBG05I BSBG05J BSBG05K
    tab NBOOK, gen(dbook)
    foreach var of varlist dbook*  BSBG05A BSBG05B BSBG05C BSBG05D BSBG05E BSBG05F BSBG05G BSBG05H BSBG05I BSBG05J BSBG05K  {
      bysort IDCNTRY IDSCHOOL: egen `var'_mean = mean(`var')
      bysort IDCNTRY: egen `var'_mean_cnt = mean(`var')
      replace `var' = `var'_mean if missing(`var')
      replace `var' = `var'_mean_cnt if missing(`var')
      egen `var'_std = std(`var')
    }
    *Some countries are not asked the additional items:
    pca dbook*_std  BSBG05A_std BSBG05B_std BSBG05C_std BSBG05D_std BSBG05E_std BSBG05F_std BSBG05G_std BSBG05H_std BSBG05I_std BSBG05J_std BSBG05K_std [weight = TOTWGT]
    predict HOMEPOS
    pca dbook*_std  BSBG05A_std BSBG05B_std BSBG05C_std  BSBG05E_std BSBG05F_std BSBG05G_std BSBG05H_std BSBG05I_std  [weight = TOTWGT]
    predict HOMEPOS1
    pca dbook*_std  BSBG05A_std BSBG05B_std BSBG05C_std BSBG05D_std BSBG05E_std BSBG05F_std BSBG05G_std BSBG05H_std BSBG05I_std BSBG05J_std [weight = TOTWGT]
    predict HOMEPOS2
    pca dbook*_std  BSBG05A_std BSBG05B_std BSBG05C_std BSBG05D_std BSBG05E_std BSBG05F_std BSBG05G_std BSBG05H_std BSBG05I_std  [weight = TOTWGT]
    predict HOMEPOS3
    pca dbook*_std  BSBG05A_std BSBG05B_std BSBG05C_std BSBG05D_std BSBG05E_std BSBG05F_std BSBG05G_std BSBG05H_std [weight = TOTWGT]
    predict HOMEPOS4
    pca dbook*_std  BSBG05A_std BSBG05B_std BSBG05C_std BSBG05D_std BSBG05E_std BSBG05F_std BSBG05G_std  [weight = TOTWGT]
    predict HOMEPOS5
    pca dbook*_std  BSBG05A_std BSBG05B_std BSBG05C_std BSBG05D_std BSBG05E_std BSBG05F_std [weight = TOTWGT]
    predict HOMEPOS6
    pca dbook*_std  BSBG05A_std BSBG05B_std BSBG05C_std BSBG05D_std BSBG05E_std [weight = TOTWGT]
    predict HOMEPOS7
    replace HOMEPOS = HOMEPOS1 if IDCNTRY == 376 & missing(HOMEPOS)
    forvalues i = 2/7 {
      replace HOMEPOS = HOMEPOS`i' if missing(HOMEPOS)
    }

    recode BSDGEDUP (5 = 1) (4 = 2) (2=4) (1= 5) (99 = .), gen(HIEDU)
    label values HIEDU

    *Replacing missing values of HIEDU:
    bysort IDCNTRY IDSCHOOL: egen HIEDU_mode = mode(HIEDU), maxmode
    bysort IDCNTRY: egen HIEDU_mode_cnt = mode(HIEDU), maxmode
    replace HIEDU = HIEDU_mode if missing(HIEDU)
    replace HIEDU = HIEDU_mode_cnt if missing(HIEDU)

    polychoricpca HIEDU HOMEPOS [weight = TOTWGT],score(ESCS) nscore(1)
    ren ESCS1 ESCS

    *Variables derived by TIMSS:

    *Generating variable for Time spent on Math Homework:
    recode BSDMWKHW (1=3) (3=1) (9= .), gen(TMH)
    label var TMH "TIME SPENT ON MATH HOMEWORK"

    *Generating variable for Time spent on Science Homework:
    recode BSDSWKHW (1=3) (3=1) (9= .), gen(TSH)
    label var TSH "TIME SPENT ON SCIENCE HOMEWORK"

    *Generating variable for Overall Instruction Time in a Year:
    gen YIT = BCDG06HY if BCDG06HY!= 9999
    label var YIT "Yearly Instruction Time"

    *Variable derived by team:

    *School Questionnaire:
    *Generate variable for School size: SCHSIZE
    replace BCBG01 = . if BCBG01 == 99999
    ren BCBG01 SCHSIZE

    *Generating variable for School Resources:
    replace BCBG07 = . if BCBG07 == 999
    foreach var of varlist BCBG08A BCBG08B {
      replace `var' = . if `var' == 9
    }
    foreach var of varlist BCBG09* {
      recode `var' (4=1) (3=2) (2=3) (1=4) (9=.), gen(`var'_n)
    }
    alphawgt BCBG07 BCBG08A BCBG08B BCBG09*_n [weight = TOTWGT], detail std item label generate(SCHRCS)

    *Generating variable for Schools' emphasis on parental involvement:
    foreach var of varlist BCBG10* {
      replace `var' = . if `var' == 9
    }
    alphawgt BCBG10* [weight = TOTWGT], detail std item label generate(SEPI)

    *Genearting variable for Pricipal's Perception of School Climate:
    foreach var of varlist BCBG11* {
      recode `var' (5=1) (4=2) (2=4) (1=5) (9 = .), gen(`var'_n)
    }
    alphawgt BCBG11*_n [weight = TOTWGT], detail std item label generate(PPSC)

    *Generating variable for School's evaluation of teachers:
    foreach var of varlist BCBG13* BCBG14* {
      replace `var' = . if `var' == 9
      replace `var' = 0 if `var' == 2
    }
    alphawgt BCBG13* BCBG14* [weight = TOTWGT], detail std item label generate(STEVAL)

    *Student Questionnaire:

    *Generating variable for expected level of education for student:
    gen EXPEDU = BSBG07 if !inlist(BSBG07,7,99)
    label values EXPEDU BSBG07

    *Generating variable for Parental Involvment:
    foreach var of varlist BSBG11* {
      recode `var' (4=1) (3=2) (2=3) (1=4) (9=.), gen(`var'_n)
    }
    alphawgt BSBG11*_n [weight = TOTWGT], detail std item label generate(PI)

    *Genearting a variable for feeling of safety at school:
    foreach var of varlist BSBG12* {
      recode `var' (4=1) (3=2) (2=3) (1=4) (9 =.), gen(`var'_n)
    }
    foreach var of varlist BSBG13* {
      replace `var' = . if `var' == 9
    }
    alphawgt BSBG12*_n BSBG13* [weight = TOTWGT], detail std item label generate(SPSS)

    bysort IDCNTRY IDSCHOOL: egen SCHESCS = mean(ESCS)
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

    * Adjustment after the append: rename science vars to scie 
    
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
    edukit_save, filename("`output_file'") path("`output_dir'") dir2delete("`temp_dir'") ///
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
