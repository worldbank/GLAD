*=========================================================================*
* GLOBAL LEARNING ASSESSMENT DATABASE (GLAD)
* Project information at: https://github.com/worldbank/GLAD
*
* Metadata to be stored as 'char' in the resulting dataset (do NOT use ";" here)
local region      = "WLD"
local year        = "2015"
local assessment  = "TIMSS"
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
    foreach cnt in AAD ABA ADU ARE ARM AUS BFL BGR BHR CAN CHL COT CQU CYP CZE DEU DNK ENG ESP FIN FRA GEO HKG HRV HUN IDN IRL IRN ITA JPN KAZ KOR KWT  LTU MAR NIR NLD NO4 NOR NZL OMN POL PRT QAT RUS SAU SGP SRB SVK SVN SWE TUR TWN USA {

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

    // Some countries had Numeracy Data
    foreach cnt in ABA BHR IDN IRN JOR KWT MAR ZAF {

      // Temporary copies of the 4 rawdatasets needed for each country (new section)
      foreach prefix in NSA NSG NSH NCG {
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
      use "`temp_dir'/NSA.dta", clear
      merge 1:1 idcntry idschool idstud using "`temp_dir'/NSG.dta", keep(master match) nogen
      merge 1:1 idcntry idschool idstud using "`temp_dir'/NSH.dta", keep(master match) nogen
      merge m:1 idcntry idschool using "`temp_dir'/NCG.dta", keep(master match) nogen
      save "`temp_dir'/TEMP_`surveyid'_l_`cnt'_N.dta", replace
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
    * Cleaning grades for Oman: Participated in Grade 4 (per report)
    replace idgrade = 4 if idcntry_raw == 512 // = Oman = OMN
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
    local traitvars	"age urban* male escs"

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

    *Generating variable for NATIVE:
    gen NATIVE = 1 if ASBG07 == 1 | ASBG06B == 1 | ASBG06A == 1
    replace NATIVE = 0 if (ASBG06B == 0 & ASBG06A == 0)
    label variable NATIVE "Native"

    *Generating variable for Language at home
    gen LANGATHOME = 1 if inlist(ASBG03,1,2)
    replace LANGATHOME = 0 if inlist(ASBG03,3,4)
    label var LANGATHOME "Speaks language of test at home"

    *Generating variable for early childhood education
    gen ECE = 1 if inlist(ASDHAPS,1,2,3)
    replace ECE = 0 if ASDHAPS == 0
    label var ECE "Received Early Childhood Education/Pre-primary education"
    label define lyes 0 "No" 1 "Yes"
    label values ECE lyes

    *Generating duration for early childhood education
    gen DURECE = ASDHAPS if ASDHAPS != 9

    *Generating ESCS:
    foreach var of varlist ASBG04 ASBG05A ASBG05B ASBG05C ASBG05D ASBG05E ASBG05F ASBG05G ASBG05H ASBG05I ASBG05J ASBG05K ASDHOCCP ASDHEDUP ASBG06A ASBG06B ASBG07 {
      tab `var'
      replace `var' = . if inlist(`var',7,9,99)
    }
    replace ASDHEDUP = . if ASDHEDUP == 6
    gen NBOOK = ASBG04 if ASBG04 != 9

    foreach var of varlist ASBG05A ASBG05B ASBG05C ASBG05D ASBG05E ASBG05F ASBG05G ASBG05H ASBG05I ASBG05J ASBG05K ASBG06A ASBG06B ASBG07 {
      tab `var', m
      *hist `var'
      replace `var' = 0 if `var' == 2
    }

    alphawgt NBOOK ASBG05A ASBG05B ASBG05C ASBG05D ASBG05E ASBG05F ASBG05G ASBG05H ASBG05I ASBG05J ASBG05K  [weight = TOTWGT], detail std item label
    mdesc NBOOK ASBG05A ASBG05B ASBG05C ASBG05D ASBG05E ASBG05F ASBG05G ASBG05H ASBG05I ASBG05J ASBG05K
    tab NBOOK, gen(dbook)
    foreach var of varlist dbook* ASBG05A ASBG05B ASBG05C ASBG05D ASBG05E ASBG05F ASBG05G ASBG05H ASBG05I ASBG05J ASBG05K {
      bysort IDCNTRY IDSCHOOL: egen `var'_mean = mean(`var')
      bysort IDCNTRY: egen `var'_mean_cnt = mean(`var')
      replace `var' = `var'_mean if missing(`var')
      replace `var' = `var'_mean_cnt
      egen `var'_std = std(`var')
    }
    *Some countries are not asked the additional items:
    *Identifying those countries:
    gen tag_missing_5H = .
    gen tag_missing_5I = .
    gen tag_missing_5J = .
    gen tag_missing_5K = .
    levelsof IDCNTRY, local(country)
    foreach c of local country {
      mdesc ASBG05H if IDCNTRY == `c'
      replace tag_missing_5H = 1 if r(percent) == 100 & IDCNTRY == `c'
      mdesc ASBG05I if IDCNTRY == `c'
      replace tag_missing_5I = 1 if r(percent) == 100 & IDCNTRY == `c'
      mdesc ASBG05J if IDCNTRY == `c'
      replace tag_missing_5J = 1 if r(percent) == 100 & IDCNTRY == `c'
      mdesc ASBG05K if IDCNTRY == `c'
      replace tag_missing_5K = 1 if r(percent) == 100 & IDCNTRY == `c'
    }
    pca dbook*_std ASBG05A_std ASBG05B_std ASBG05C_std ASBG05D_std ASBG05E_std ASBG05F_std ASBG05G_std ASBG05H_std ASBG05I_std ASBG05J_std ASBG05K_std [weight = TOTWGT]
    predict HOMEPOS
    pca dbook*_std ASBG05A_std ASBG05B_std ASBG05C_std ASBG05D_std ASBG05E_std ASBG05F_std ASBG05G_std ASBG05H_std ASBG05I_std ASBG05J_std [weight = TOTWGT]
    predict HOMEPOS1
    pca dbook*_std ASBG05A_std ASBG05B_std ASBG05C_std ASBG05D_std ASBG05E_std ASBG05F_std ASBG05G_std ASBG05H_std ASBG05I_std [weight = TOTWGT]
    predict HOMEPOS2
    pca dbook*_std ASBG05A_std ASBG05B_std ASBG05C_std ASBG05D_std ASBG05E_std ASBG05F_std ASBG05G_std ASBG05H_std [weight = TOTWGT]
    predict HOMEPOS3
    pca dbook*_std ASBG05A_std ASBG05B_std ASBG05C_std ASBG05D_std ASBG05E_std ASBG05F_std ASBG05G_std [weight = TOTWGT]
    predict HOMEPOS4
    replace HOMEPOS = HOMEPOS1 if missing(HOMEPOS)
    replace HOMEPOS = HOMEPOS2 if missing(HOMEPOS)
    replace HOMEPOS = HOMEPOS3 if missing(HOMEPOS)
    replace HOMEPOS = HOMEPOS4 if missing(HOMEPOS)

    *Recoding ASDHOCCP ASDHEDUP to be in the same direction as HOMEPOS
    recode ASDHOCCP (1=6) (2=5) (3=4) (4=3) (5=2) (6=1), gen(HIOCC)
    recode ASDHEDUP (1=5 "University or Higher") (2=4 "Post-Secondary but not University") (3=3 "Upper Secondary") (4=2 "Lower Secondary") (5=1 "Some Primary, Lower Secondary or No Education"), gen(HIEDU)
    gen tag_missing_occupation = .
    gen tag_missing_education = .
    levelsof IDCNTRY, local (country)
    foreach c of local country {
      mdesc HIOCC if IDCNTRY == `c'
      replace tag_missing_occupation = 1 if r(percent) == 100 & IDCNTRY == `c'
      mdesc HIEDU if IDCNTRY == `c'
      replace tag_missing_education = 1 if r(percent) == 100 & IDCNTRY == `c'
    }
    *Two countries do not have information on education and occupation: United States of America and IDCNTRY == 926
    foreach var of varlist HIEDU HIOCC {
      bysort IDCNTRY IDSCHOOL: egen `var'_mode = mode(`var'), maxmode
      bysort IDCNTRY: egen `var'_mode_cnt = mode(`var'), maxmode
      replace `var' = `var'_mode if missing(`var')
      replace `var' = `var'_mode_cnt if missing(`var')
    }
    polychoricpca HIEDU HOMEPOS [weight = TOTWGT], score(ESCS) nscore(1)
    ren ESCS1 ESCS

    *Standardizing ESCS variable:
    bysort IDCNTRY: egen ESCS_mean = mean(ESCS)
    bysort IDCNTRY: egen ESCS_sd = sd(ESCS)
    gen ESCS_std = (ESCS - ESCS_mean)/ESCS_sd

    *Confirming that countries with missing occupation do not have information on education too.
    assert tag_missing_education == tag_missing_occupation

    *Generating variable for feeling of belonging:
    foreach var of varlist ASBG11* {
      replace `var' = . if `var' == 9
      recode `var' (4=1) (3=2) (2=3) (1=4), gen(`var'_n)
    }
    foreach var of varlist ASBG12* {
      replace `var' = . if `var' == 9
    }
    alphawgt ASBG11*_n ASBG12* [weight = TOTWGT], detail std item label generate(SPBS)
    *Standardizing SPBS:
    bysort IDCNTRY: egen SPBS_mean = mean(SPBS)
    bysort IDCNTRY: egen SPBS_sd = sd(SPBS)
    gen SPBS_std = (SPBS - SPBS_mean)/SPBS_sd

    *Gen variable for Additional Instruction in Math:
    gen HADDINSTM = ASDHAPS if ASDHAPS != 9

    *Generating variable for expected level of education to be attained by the student:
    gen EXPEDU = ASBH21
    replace EXPEDU = . if EXPEDU == 9
    label values EXPEDU ASBH21

    *Generating school-level variables:
    *Mean school level ESCS:
    bysort IDCNTRY IDSCHOOL: egen SCHESCS = mean(ESCS_std)
    bysort IDCNTRY : egen CNTESCS = mean(ESCS_std)

    *Creating variable for school resources:
    foreach var of varlist ACBG09A ACBG09B ACBG11 ACBG12A ACBG12B ACBG13 ACBG13AA ACBG13AB ACBG13BA ACBG13BB ACBG14AA ACBG14AB ACBG14AC ACBG14AD ACBG14AE ACBG14AF ACBG14AG ACBG14AH ACBG14AI ACBG14BA ACBG14BB ACBG14BC ACBG14BD ACBG14BE ACBG14CA ACBG14CB ACBG14CC ACBG14CD {
      tab `var'
    }
    foreach var of varlist ACBG14* {
      replace `var' = . if `var' == 9
      recode `var' (4=1) (3=2) (2=3) (1=4), gen(`var'_n)
    }
    foreach var of varlist ACBG13A* {
      replace `var' = . if inlist(`var',96,99)
    }
    foreach var of varlist ACBG13B* {
      replace `var' = . if inlist(`var',6,9)
    }
    foreach var of varlist ACBG09A ACBG09B ACBG12A ACBG12B ACBG13 {
      replace `var' = . if inlist(`var',6,9)
      replace `var' = 0 if `var' == 2
    }
    replace ACBG11 = . if ACBG11 == 9999
    alphawgt ACBG09A ACBG09B ACBG11 ACBG12A ACBG12B ACBG13 ACBG13AA ACBG13AB ACBG13BA ACBG13BB ACBG14AA_n ACBG14AB_n ACBG14AC_n ACBG14AD_n ACBG14AE_n ACBG14AF_n ACBG14AG_n ACBG14AH_n ACBG14AI_n ACBG14BA_n ACBG14BB_n ACBG14BC_n ACBG14BD_n ACBG14BE_n ACBG14CA_n ACBG14CB_n ACBG14CC_n ACBG14CD_n [weight = TOTWGT], detail std item label generate(SCHRCS)
    *Standardizing school resources:
    bysort IDCNTRY: egen SCHRCS_mean = mean(SCHRCS)
    bysort IDCNTRY: egen SCHRCS_sd = sd(SCHRCS)
    gen SCHRCS_std = (SCHRCS - SCHRCS_mean)/SCHRCS_sd

    *Generating variable for school environment:
    foreach var of varlist ACBG15* {
      tab `var'
      recode `var' (1=5) (2=4) (4=2) (5=1) (9=.), gen(`var'_n)
    }
    foreach var of varlist ACBG16* ACBG17*{
      recode `var' (1=4) (2=3) (3=2) (4=1) (9=.), gen(`var'_n)
    }
    alphawgt ACBG15*_n ACBG16*_n ACBG17*_n  [weight = TOTWGT], detail std item label generate(LE)
    *Standardizing LE:
    bysort IDCNTRY: egen LE_mean = mean(LE)
    bysort IDCNTRY: egen LE_sd = sd(LE)
    gen LE_std = (LE - LE_mean)/LE_sd

    *Generating Ability grouping:
    gen ABGROUP = 1 if ACBG10A == 1
    replace ABGROUP = 0 if ACBG10A == 2


    *Generating variable for Instructional time (in minutes per week)
    replace ACDG08HY = . if ACDG08HY == 9999
    gen YIT = ACDG08HY
    label var YIT "Yearly instructional time (in minutes)"

    *Generating variable for parental perception of school quality:
    foreach var of varlist ASBH11* {
      tab `var'
      recode `var' (1=4) (2=3) (3=2) (4=1) (9=.), gen(`var'_n)
    }
    alphawgt ASBH11*_n [weight = TOTWGT],detail std item label generate(PPSQ)
    *Standardizing:
    egen PPSQ_std = std(PPSQ)

    *Generting parental variables:

    *Generating variable for Parental Involvement in Education:
    foreach var of varlist ASBH02* {
      replace `var' = . if `var' == 9
      recode `var' (3=1) (1=3), gen(`var'_n)
    }
    foreach var of varlist ASBH09BA ASBH09BB ASBH09BC {
      replace `var' = . if inlist(`var',6,9)
      recode `var' (1=5) (2=4) (3=3) (4=2) (5=1), gen(`var'_n)
    }
    alphawgt ASBH02*_n ASBH09BA_n ASBH09BB_n ASBH09BC_n [weight = TOTWGT], detail std item label generate(PI)
    *Standardizing PI:
    egen PI_std = std(PI)


    *** QUICK FIX ****
    rename *, lower
    ******************

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
    foreach cnt in AAD ABA ADU ARE ARM AUS BHR BWA CAN CHL COT CQU EGY ENG GEO HKG HUN IRL IRN ISR ITA JOR JPN KAZ KOR KWT LBN LTU MAR MLT MYS NO8 NOR NZL OMN QAT RUS SAU SGP SVN SWE THA TUR TWN USA ZAF {

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
    * Cleaning grades for Dubai/Oman: Participated in Grade 8 (per report)
    replace idgrade = 8 if idcntry_raw == 512 // = Oman = OMN
    replace idgrade = 8 if idcntry_raw == 7841 // = Dubai = ADU national_level = 0
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
    local traitvars	"age urban* male escs"

    *<_age_>
    gen int age = bsdage  if  !missing(bsdage)  &  bsdage!= 99
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

    *Generating variable: ESCS
    foreach var of varlist BSBG04 BSBG05 BSBG06A BSBG06B BSBG06C BSBG06D BSBG06E BSBG06F BSBG06G BSBG06H BSBG06I BSBG06J BSBG06K BSBG07A BSBG07B {
      tab `var'
      replace `var' = . if inlist(`var',8,9,99)
    }
    gen NBOOK = BSBG04 if BSBG04 != 9
    foreach var of varlist  BSBG06A BSBG06B BSBG06C BSBG06D BSBG06E BSBG06F BSBG06G BSBG06H BSBG06I BSBG06J BSBG06K {
      tab `var', m
      *hist `var'
      replace `var' = 0 if `var' == 2
    }
    alphawgt NBOOK  BSBG05 BSBG06A BSBG06B BSBG06C BSBG06D BSBG06E BSBG06F BSBG06G BSBG06H BSBG06I BSBG06J BSBG06K [weight = TOTWGT], detail std item label
    bysort IDCNTRY: mdesc NBOOK  BSBG05 BSBG06A BSBG06B BSBG06C BSBG06D BSBG06E BSBG06F BSBG06G BSBG06H BSBG06I BSBG06J BSBG06K
    tab NBOOK, gen(dbook)
    foreach var of varlist dbook*  BSBG05 BSBG06A BSBG06B BSBG06C BSBG06D BSBG06E BSBG06F BSBG06G BSBG06H BSBG06I BSBG06J BSBG06K {
      bysort IDCNTRY IDSCHOOL: egen `var'_mean = mean(`var')
      bysort IDCNTRY: egen `var'_mean_cnt = mean(`var')
      replace `var' = `var'_mean if missing(`var')
      replace `var' = `var'_mean_cnt if missing(`var')
      egen `var'_std = std(`var')
    }
    *Some countries are not asked the additional items:
    pca dbook*_std  BSBG05_std BSBG06A_std BSBG06B_std BSBG06C_std BSBG06D_std BSBG06E_std BSBG06F_std BSBG06G_std BSBG06H_std BSBG06I_std BSBG06J_std BSBG06K_std [weight = TOTWGT]
    predict HOMEPOS
    pca dbook*_std  BSBG05_std BSBG06A_std BSBG06B_std BSBG06C_std BSBG06D_std BSBG06E_std BSBG06F_std BSBG06G_std BSBG06H_std BSBG06I_std BSBG06J_std  [weight = TOTWGT]
    predict HOMEPOS1
    pca dbook*_std  BSBG05_std BSBG06A_std BSBG06B_std BSBG06C_std BSBG06D_std BSBG06E_std BSBG06F_std BSBG06G_std BSBG06H_std BSBG06I_std [weight = TOTWGT]
    predict HOMEPOS2
    pca dbook*_std  BSBG05_std BSBG06A_std BSBG06B_std BSBG06C_std BSBG06D_std BSBG06E_std BSBG06F_std BSBG06G_std BSBG06H_std [weight = TOTWGT]
    predict HOMEPOS3
    pca dbook*_std  BSBG05_std BSBG06A_std BSBG06B_std BSBG06C_std BSBG06D_std BSBG06E_std BSBG06F_std BSBG06G_std [weight = TOTWGT]
    predict HOMEPOS4
    pca dbook*_std  BSBG05_std BSBG06A_std BSBG06B_std BSBG06C_std BSBG06D_std BSBG06E_std BSBG06F_std [weight = TOTWGT]
    predict HOMEPOS5
    pca dbook*_std  BSBG05_std BSBG06A_std BSBG06B_std BSBG06C_std BSBG06D_std BSBG06E_std [weight = TOTWGT]
    predict HOMEPOS6
    pca dbook*_std  BSBG05_std BSBG06A_std BSBG06B_std BSBG06C_std BSBG06E_std BSBG06F_std BSBG06G_std [weight = TOTWGT]
    predict HOMEPOS7
    forvalues i = 1/7 {
      replace HOMEPOS = HOMEPOS`i' if missing(HOMEPOS)
    }
    egen HIEDU = rowmax(BSBG07A BSBG07B)

    *Replacing missing values of HIEDU:
    bysort IDCNTRY IDSCHOOL: egen HIEDU_mode = mode(HIEDU), maxmode
    bysort IDCNTRY: egen HIEDU_mode_cnt = mode(HIEDU), maxmode
    replace HIEDU = HIEDU_mode if missing(HIEDU)
    replace HIEDU = HIEDU_mode_cnt if missing(HIEDU)

    label values HIEDU BSBG07A
    polychoricpca HIEDU HOMEPOS [weight = TOTWGT], score(ESCS) nscore(1)
    ren ESCS1 ESCS

    *Identify countries with missing information on Education or Occupation:
    gen tag_missing_education = .
    levelsof IDCNTRY, local (country)
    foreach c of local country {
      mdesc HIEDU if IDCNTRY == `c'
      replace tag_missing_education = 1 if r(percent) == 100 & IDCNTRY == `c'
    }
    gen LANGATHOME = 1 if inlist(BSBG03,1,2)
    replace LANGATHOME = 0 if inlist(BSBG03,3,4)
    label var LANGATHOME "Speaks language of test at home"
    *Data on early childhood education not available.
    gen NATIVE = 1 if BSBG10A == 1 | BSBG09A == 1 | BSBG09B == 1
    replace NATIVE = 0 if (BSBG09A == 0 & BSBG09B == 0)

    bysort IDCNTRY IDSCHOOL : egen SCHESCS = mean(ESCS)
    bysort IDCNTRY: egen CNTESCS = mean(ESCS)

    *** QUICK FIX ****
    rename *, lower
    ******************

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
