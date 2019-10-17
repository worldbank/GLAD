*=========================================================================*
* GLOBAL LEARNING ASSESSMENT DATABASE (GLAD)
* Project information at: https://github.com/worldbank/GLAD
*
* Metadata to be stored as 'char' in the resulting dataset (do NOT use ";" here)
local region      = "WLD"
local year        = "2007"
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
    foreach cnt in ADU ARM AUS AUT CAB CBC COL COT CQU CZE DEU DNK DZA ENG GEO HKG HUN IRN ITA JPN KAZ KWT LTU LVA MAR MNG NLD NOR NZL QAT RUS SCO SGP SLV SVK SVN SWE TUN TWN UKR UMA UMN USA YEM {

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
    * Cleaning grades for Dubai: Participated in Grade 4 (per report)
    replace idgrade = 4 if idcntry_raw == 7841 // = Dubai = ADU national_level = 0
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
    gen byte urban = (inlist(ac4gcomu,1, 2, 3, 4, 5))  if  !missing(ac4gcomu)  &  ac4gcomu != 9
    label var urban "School is located in urban/rural area"
    *</_urban_>

    *<_urban_o_>
    decode ac4gcomu, g(urban_o)
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
      gen INT_`var' = (`var' > 2) & !missing(`var')
      gen HIGH_`var' = (`var' > 3) & !missing(`var')
      gen ADV_`var' = (`var' > 4) & !missing(`var')
    }

    *Creating a variable for socio-economic status:
    foreach var of varlist AS4GBOOK AS4GTH01 AS4GTH02 AS4GTH03 AS4GTH04 AS4GTH05 AS4GTH06 AS4GTH07 AS4GTH08 AS4GTH09 AS4GBORN AS4GMBRN AS4GFBRN {
      replace `var' = . if inlist(`var',8,9,99)
    }
    gen NBOOK = AS4GBOOK if AS4GBOOK != 9
    foreach var of varlist AS4GTH01 AS4GTH02 AS4GTH03 AS4GTH04 AS4GTH05 AS4GTH06 AS4GTH07 AS4GTH08 AS4GTH09 AS4GBORN AS4GMBRN AS4GFBRN {
      tab `var', m
      *hist `var'
      replace `var' = 0 if `var' == 2
    }
    alphawgt NBOOK AS4GTH01 AS4GTH02 AS4GTH03 AS4GTH04 AS4GTH05 AS4GTH06 AS4GTH07 AS4GTH08 AS4GTH09 [weight = TOTWGT], detail std item label
    bysort IDCNTRY: mdesc NBOOK AS4GTH01 AS4GTH02 AS4GTH03 AS4GTH04 AS4GTH05 AS4GTH06 AS4GTH07 AS4GTH08 AS4GTH09
    tab NBOOK, gen(dbook)
    foreach var of varlist dbook* AS4GTH01 AS4GTH02 AS4GTH03 AS4GTH04 AS4GTH05 AS4GTH06 AS4GTH07 AS4GTH08 AS4GTH09  {
      bysort IDCNTRY IDSCHOOL : egen `var'_mean = mean(`var')
      bysort IDCNTRY: egen `var'_mean_cnt = mean(`var')
      replace `var' = `var'_mean if missing(`var')
      replace `var' = `var'_mean_cnt if missing(`var')
      egen `var'_std = std(`var')
    }
    *Some countries are not asked the additional items:
    pca dbook*_std AS4GTH01_std AS4GTH02_std AS4GTH03_std AS4GTH04_std AS4GTH05_std AS4GTH06_std AS4GTH07_std AS4GTH08_std AS4GTH09_std [weight = TOTWGT]
    predict HOMEPOS
    pca dbook*_std AS4GTH01_std AS4GTH02_std AS4GTH03_std AS4GTH04_std AS4GTH05_std AS4GTH06_std AS4GTH07_std AS4GTH08_std  [weight = TOTWGT]
    predict HOMEPOS1
    pca dbook*_std AS4GTH01_std AS4GTH02_std AS4GTH03_std AS4GTH04_std AS4GTH05_std AS4GTH06_std AS4GTH07_std  [weight = TOTWGT]
    predict HOMEPOS2
    pca dbook*_std AS4GTH01_std AS4GTH02_std AS4GTH03_std AS4GTH04_std AS4GTH05_std AS4GTH06_std  [weight = TOTWGT]
    predict HOMEPOS3
    pca dbook*_std AS4GTH01_std AS4GTH02_std AS4GTH03_std AS4GTH04_std AS4GTH05_std  [weight = TOTWGT]
    predict HOMEPOS4
    forvalues i = 1/4 {
      replace HOMEPOS = HOMEPOS`i' if missing(HOMEPOS)
    }

    *Creating a variable for Language at home:
    gen LANGATHOME = 1 if inlist(AS4GOLAN,1,2)
    replace LANGATHOME = 0 if inlist(AS4GOLAN,3,4)

    *Data on early childhood education not available.
    *Creating a variable for Nativity:
    gen NATIVE = 1 if inlist(ASDGBORN,1,2)
    replace NATIVE = 0 if ASDGBORN == 3

    *** QUICK FIX ***********************
    * Comment out piece below until we  *
    * remove replacing original vars    *
    *************************************

    /*
    *Creating a variable for Computer Use of Students:
    replace ASDGCAVL = . if ASDGCAVL == 9
    recode ASDGCAVL (1=5) (2=4) (4=2) (5=1), gen(COMPUSE)

    *Creating a variable on schoolenvironment for students:
    replace ASDGPBSS = . if ASDGPBSS == 9
    recode ASDGPBSS (1=3) (3=1), gen(SPSS)

    *Creating a variable for index of time spend on Mathematics homework:
    replace ASDMTMH = . if ASDMTMH == 9
    recode ASDMTMH (1 = 3) (3=1), gen (TMH)

    *Creating a variable for index of time spend on Mathematics homework:
    replace ASDSTSH = . if ASDSTSH == 9
    recode ASDSTSH (1 = 3) (3=1), gen (TSH)

    *Creating a variable for instructional time for Maths:
    *gen MIT = ATDMYIT if ATDMYIT! = 999

    *Creating a variable for instructional time for Science:
    *gen SIT = ATDSYIT if ATDSYIT! = 999

    *Creating a variable for Frequence of Lesson planning collaboration among teachers:
    *gen FTCOLL = ATDGCOLL if ATDGCOLL != 9

    *Creating a variable for Adequate Work Condition:
    *replace  ATDMTAWC = . if ATDMTAWC == 9
    *recode ATDMTAWC (1=3) (3=1), gen(AWC)

    *Creating a variable for Teachers' Perception of School Climate
    *replace ATDGTPSC = . if ATDGTPSC == 9
    *recode ATDGTPSC (1=3) (3=1), gen(TPSC)

    *Creating a variable for the feeling of safety in a school for a teacher:
    *replace ATDGTPSS = . if ATDGTPSS == 9
    *recode ATDGTPSS (1=3) (3=1), gen(TPSS)

    *Creating a variable for good attendance at school:
    *replace ACDGAS = . if ACDGAS == 9
    *recode ACDGAS (1=3) (3=1), gen(GAS)

    *Creating a variable for School Resources for Mathematics Instruction:
    replace ACDSRMI = . if ACDSRMI == 9
    recode ACDSRMI (1=3) (3=1), gen(SRMI)

    *Creating a variable for School Resources for Science Instruction:
    replace ACDSRSI = . if ACDSRSI == 9
    recode ACDSRSI (1=3) (3=1), gen(SRSI)

    *Creating a variable for Principal's perception of School Climate:
    replace ACDGPPSC = . if ACDGPPSC == 9
    recode ACDGPPSC (1=3) (3=1), gen(PPSC)

    *Creating a variable for Parental Involvement from School:
    foreach var of varlist AC4GAPSE AC4GAPRF AC4GAPVO AC4GAPCH AC4GAPSC {
      replace `var' = . if `var' == 9
      replace `var' = 0 if `var' == 2
    }
    alphawgt AC4GAPSE AC4GAPRF AC4GAPVO AC4GAPCH AC4GAPSC [weight = TOTWGT], detail std item label generate(SPARINV)  // very low alpha

    *Create variables for Ability Grouping:
    foreach var of varlist AC4MGAMC AC4SGASC {
      replace `var' = . if `var' == 9
      replace `var' = 0 if `var' == 2
    }
    gen MAG = AC4MGAMC
    gen SAG = AC4SGASC

    *Creating a variable for Participation in Professional Development according to principal:
    foreach var of varlist AC4GPDIC AC4GPDSG AC4GPDIK AC4GPDTS AC4GPDUT {
      replace `var' = . if `var' == 9
    }
    alphawgt AC4GPDIC AC4GPDSG AC4GPDIK AC4GPDTS AC4GPDUT [weight = TOTWGT], detail std item label generate(SPPD)  //

    *Creating a variable for Teacher Evaluation:
    foreach var of varlist AC4MEPOS AC4MEPOE AC4MEPSA AC4MEPTR {
      replace `var' = . if `var' == 9
      replace `var' = 0 if `var' == 2
    }
    alphawgt AC4MEPOS AC4MEPOE AC4MEPSA AC4MEPTR [weight = TOTWGT], detail std item label generate(STEVAL)  // very low alpha
    */

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
    foreach cnt in ADU ARM AUS BGR BHR BIH BSQ BWA CBC COL COT CQU CYP CZE DZA EGY ENG GEO GHA HKG HUN IDN IRN ISR ITA JOR JPN KOR KWT LBN LTU MAR MLT MNG MYS OMN NOR PSE QAT ROM RUS SAU SCG SCO SGP SLV SVN SWE SYR THA TUN TUR TWN UKR UMA UMN USA {

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
    * Cleaning grades for Dubai: Participated in Grade 8 (per report)
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
    gen int age = bsdage  if  !missing(bsdage)  &  bsdage != 99
    label var age "Learner age at time of assessment"
    *</_age_>

    *<_urban_>
    gen byte urban = (inlist(bc4gcomu,1, 2, 3, 4, 5))  if  !missing(bc4gcomu)  &  bc4gcomu != 9
    label var urban "School is located in urban/rural area"
    *</_urban_>

    *<_urban_o_>
    decode bc4gcomu, g(urban_o)
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

    *Generating variable for Native:
    gen NATIVE = 1 if BS4GBORN == 1 | BS4GMBRN == 1 | BS4GFBRN == 1
    replace NATIVE = 0 if (BS4GMBRN == 0 & BS4GFBRN == 0)

    *Generating variable for Lanuageathome:
    gen LANGATHOME = 1 if inlist(BS4GOLAN,1,2)
    replace LANGATHOME = 0 if inlist(BS4GOLAN,3,4)

    *Generating variable for socio-economic status:
    foreach var of varlist BS4GBOOK BS4GTH01 BS4GTH02 BS4GTH03 BS4GTH04 BS4GTH05 BS4GTH06 BS4GTH07 BS4GTH08 BS4GTH09 BS4GMBRN BS4GFBRN BS4GBORN {
      replace `var' = . if inlist(`var',8,9,99)
    }
    gen NBOOK = BS4GBOOK if BS4GBOOK != 9
    foreach var of varlist  BS4GTH01 BS4GTH02 BS4GTH03 BS4GTH04 BS4GTH05 BS4GTH06 BS4GTH07 BS4GTH08 BS4GTH09 BS4GMBRN BS4GFBRN BS4GBORN {
      tab `var', m
      replace `var' = 0 if `var' == 2
    }
    *Checking IRT:
    *irt 1pl BS4GTH01 BS4GTH02 BS4GTH03 BS4GTH04 BS4GTH05 BS4GTH06 BS4GTH07 BS4GTH08 BS4GTH09 [pweight = TOTWGT]
    *predict HOMEPOS_i
    tab NBOOK, gen(dbook)
    foreach var of varlist dbook* BS4GTH01 BS4GTH02 BS4GTH03 BS4GTH04 BS4GTH05 BS4GTH06 BS4GTH07 BS4GTH08 BS4GTH09 {
      bysort IDCNTRY IDSCHOOL: egen `var'_mean = mean(`var')
      bysort IDCNTRY: egen `var'_mean_cnt = mean(`var')
      replace `var' = `var'_mean if missing(`var')
      replace `var' = `var'_mean_cnt if missing(`var')
      egen `var'_std = std(`var')
    }
    alphawgt dbook* BS4GTH01 BS4GTH02 BS4GTH03 BS4GTH04 BS4GTH05 BS4GTH06 BS4GTH07 BS4GTH08 BS4GTH09 [weight = TOTWGT], detail std item label
    /*Comparison with IRT:
    pca  BS4GTH01_std BS4GTH02_std BS4GTH03_std BS4GTH04_std BS4GTH05_std BS4GTH06_std BS4GTH07_std BS4GTH08_std BS4GTH09_std [weight = TOTWGT]
    predict HOMEPOS_c
    egen HOMEPOS_min = min(HOMEPOS_c)
    egen HOMEPOS_max = max(HOMEPOS_c)
    gen HOMEPOS_s = (HOMEPOS_c - HOMEPOS_min)/(HOMEPOS_max - HOMEPOS_min)
    reg SCORE_MATH1 HOMEPOS_s
    reg SCORE_MATH1 HOMEPOS_i
    */
    pca  dbook*_std BS4GTH01_std BS4GTH02_std BS4GTH03_std BS4GTH04_std BS4GTH05_std BS4GTH06_std BS4GTH07_std BS4GTH08_std BS4GTH09_std [weight = TOTWGT]
    predict HOMEPOS
    pca  dbook*_std BS4GTH01_std BS4GTH02_std BS4GTH03_std BS4GTH04_std BS4GTH05_std BS4GTH06_std BS4GTH07_std BS4GTH08_std [weight = TOTWGT]
    predict HOMEPOS1
    pca  dbook*_std BS4GTH01_std BS4GTH02_std BS4GTH03_std BS4GTH04_std BS4GTH05_std BS4GTH06_std BS4GTH07_std [weight = TOTWGT]
    predict HOMEPOS2
    pca  dbook*_std BS4GTH01_std BS4GTH02_std BS4GTH03_std BS4GTH04_std BS4GTH05_std BS4GTH06_std [weight = TOTWGT]
    predict HOMEPOS3
    pca  dbook*_std BS4GTH01_std BS4GTH02_std BS4GTH03_std BS4GTH04_std BS4GTH05_std [weight = TOTWGT]
    predict HOMEPOS4
    pca  dbook*_std BS4GTH01_std BS4GTH03_std BS4GTH04_std BS4GTH06_std BS4GTH07_std BS4GTH08_std BS4GTH09_std [weight = TOTWGT]
    predict HOMEPOS5
    replace HOMEPOS = HOMEPOS5 if inlist(IDCNTRY,470) & missing(HOMEPOS)
    forvalues i = 1/4 {
      replace HOMEPOS = HOMEPOS`i' if missing(HOMEPOS)
    }
    *Genearting HIEDU:
    foreach var of varlist BS4GMFED BS4GFMED {
      replace `var' = . if inlist(`var',8,99)
    }
    egen HIEDU = rowmax(BS4GMFED BS4GFMED)

    *Filling in missing HIEDU:
    bysort IDCNTRY IDSCHOOL: egen HIEDU_mode = mode(HIEDU), maxmode
    bysort IDCNTRY : egen HIEDU_mode_cnt = mode(HIEDU), maxmode
    replace HIEDU = HIEDU_mode if missing(HIEDU)
    replace HIEDU = HIEDU_mode_cnt if missing(HIEDU)
    label values HIEDU BS4GMFED
    polychoricpca HIEDU HOMEPOS [weight = TOTWGT],score(ESCS) nscore(1)
    ren ESCS1 ESCS

    *Standardizing ESCS:
    bysort IDCNTRY: egen ESCS_mean = mean(ESCS)
    bysort IDCNTRY: egen ESCS_sd = sd(ESCS)
    gen ESCS_std = (ESCS - ESCS_mean)/ESCS_sd

    *Generating variable for sense of belonging in school:
    recode BS4GALBS (1=4) (2=3) (3=2) (4=1) (9=.), gen(LIKESCHOOL)
    foreach var of varlist BS4GSTOL BS4GHURT  BS4GMADE BS4GMFUN BS4GLEFT {
      recode `var' (1=0) (2=1) (9= .), gen(`var'_n)
    }

    *The variable LIKESCHOOL is producing unexpected results: removing from the SPBS
    alphawgt BS4GSTOL_n BS4GHURT_n  BS4GMADE_n BS4GMFUN_n BS4GLEFT_n [weight = TOTWGT], detail std item label  gen(SPBS)
    *Standardizing:
    egen SPBS_std = std(SPBS)

    *Student Effort:
    *Generating variable for Time spent on Maths homework:
    gen HADDINSTM = BSDMTMH if BSDMTMH!= 9

    *Generating Expected Education Variable <EXPEDU>
    gen EXPEDU = BS4GHFSG if !inlist(BS4GHFSG,6,9)
    label values EXPEDU BS4GHFSG

    gen SCHSIZE = BC4GTENR if BC4GTENR != 99999
    gen CLSIZE = BC4GEENR if BC4GEENR != 99999

    *Generating school mean socio-economic status:
    bysort IDCNTRY IDSCHOOL: egen SCHESCS = mean(ESCS)
    bysort IDCNTRY: egen CNTESCS = mean(ESCS)

    *Generating Variable for School Resources:
    foreach var of varlist BC4GST01 BC4GST02 BC4GST03 BC4GST04 BC4GST05 BC4GST06 BC4MST07 BC4MST08 BC4MST09 BC4MST10 BC4MST11 BC4SST12 BC4SST13 BC4SST14 BC4SST15 BC4SST16 BC4SST17 BC4GSH18 BC4GSH19 {
      replace `var' = . if `var' == 9
      recode `var' (1=4) (2=3) (3=2) (4=1), gen(`var'_n)
    }
    foreach var of varlist BC4SSLAB BC4STASE BC4GHTTE {
      replace `var' = . if `var' == 9
      replace `var' = 0 if `var' == 2
    }
    replace BC4GCMPS = . if BC4GCMPS == 9999
    replace BC4GCMPI = . if inlist(`var',6,9)
    recode BC4GCMPI (4=1) (3=2) (2=3) (1=4), gen(BC4GCMPI_n)
    alphawgt BC4GST01_n BC4GST02_n BC4GST03_n BC4GST04_n BC4GST05_n BC4GST06_n BC4MST07_n BC4MST08_n BC4MST09_n BC4MST10_n BC4MST11_n BC4SST12_n BC4SST13_n BC4SST14_n BC4SST15_n BC4SST16_n BC4SST17_n BC4GSH18_n BC4GSH19_n BC4SSLAB BC4STASE BC4GHTTE BC4GCMPS BC4GCMPI_n [weight = TOTWGT], detail std item label generate(SCHRCS)

    *Standardizing SCHRCS:
    bysort IDCNTRY: egen SCHRCS_mean = mean(SCHRCS)
    bysort IDCNTRY: egen SCHRCS_sd = sd(SCHRCS)
    gen SCHRCS_std = (SCHRCS - SCHRCS_mean)/SCHRCS_sd

    *Generating variable for Learning Environment:
    foreach var of varlist BC4GFP* {
      tab `var'
      recode `var' (1=5) (2=4) (4=2) (5=1) (9=.), gen(`var'_n)
    }
    foreach var of varlist BC4GSP* {
      tab `var'
      recode `var' (1=3) (3=1) (9=.), gen(`var'_n)
    }
    alphawgt BC4GFP*_n BC4GSP*_n [weight = TOTWGT], detail item label std gen(LE)
    *Standardizing LE:
    bysort IDCNTRY: egen LE_mean = mean(LE)
    bysort IDCNTRY: egen LE_sd = sd(LE)
    gen LE_std = (LE - LE_mean)/LE_sd

    *Genearting variable for schools' emphasis on parental involvement:
    *Generating variable for parental involvement:
    foreach var of varlist BC4GAPSE BC4GAPRF BC4GAPVO BC4GAPCH BC4GAPSC {
      tab `var'
      replace `var' = . if `var' == 9
      replace `var' = 0 if `var' == 2
    }
    alphawgt BC4GAPSE BC4GAPRF BC4GAPVO BC4GAPCH BC4GAPSC [weight = TOTWGT], detail item std label gen(SEPI)
    *Standardizing SEPI:
    bysort IDCNTRY: egen SEPI_mean = mean(SEPI)
    bysort IDCNTRY: egen SEPI_sd = sd(SEPI)
    gen SEPI_std = (SEPI - SEPI_mean)/SEPI_sd

    *Generate variable for tracking/ability grouping:
    recode BC4MGAMC (2=0) (9 = .), gen(ABGROUP)

    *Generating a variable for Weekly Instruction time:
    recode BC4GDSOI (1=6) (2=5.5) (3=5) (4=4.5) (5=4) (6/9 = .), gen(NDAYS)
    replace BC4GMTIT = . if BC4GMTIT == 99
    gen WIT = NDAYS*BC4GMTIT

    *Genearting a variable for professional development opportunities:
    foreach var of varlist BC4GPDIC BC4GPDSG BC4GPDIK BC4GPDTS BC4GPDUT {
      tab `var'
      replace `var' = . if `var' == 9
    }
    alphawgt BC4GPDIC BC4GPDSG BC4GPDIK BC4GPDTS BC4GPDUT [weight = TOTWGT], detail item label std gen(PROFDEV)
    *Standardizing PROFDEV:
    egen PROFDEV_std = std(PROFDEV)

    *Generate variable for TPSS:
    recode BSDGPBSS (3=1) (1=3) (9=.), gen(TPSS)

    foreach var of varlist BC4GAPAD BC4GAPIL BC4GAPST BC4GAPTE BC4GAPPR BC4GAPOT {
      replace `var' = . if `var' == 999
    }

    gen EXPEDU_UNI = 1 if inlist(EXPEDU,4,5)
    replace EXPEDU_UNI = 0 if inlist(EXPEDU,1,2,3)

    *Generating variable for student faced instance of bulling:
    gen BULLIED = 1 if (BS4GSTOL == 1 |  BS4GHURT == 1 | BS4GMADE == 1 | BS4GMFUN == 1 | BS4GLEFT == 1)
    replace BULLIED = 0 if  (BS4GSTOL == 2 & BS4GHURT == 2 & BS4GMADE == 2 & BS4GMFUN == 2 & BS4GLEFT == 2)

    *Generating a variable for Instruction time:
    gen INST_TIME_WEEK = BCDGHW if BCDGHW != 999

    foreach var of varlist BC4GCHTS BC4GCHTU BC4GCHTC BC4GCHES BC4GCHPS BC4GCHPI BC4GCHSR BC4GCHSD {
      replace `var' = . if `var' == 9
    }

    foreach var of varlist BC4MSOEM BC4SSOES BC4MSORM {
      tab `var'
      replace `var' = . if `var' == 9
    }

    foreach var of varlist BC4MEPOS BC4MEPOE BC4MEPSA BC4MEPTR {
      replace `var' = . if `var' == 9
      replace `var' = 0 if `var' == 2
    }

    *Cleaning remaining variables:
    foreach var of varlist BS4GOLAN BS4GHFSG BS4MAWEL BS4MAMOR BS4MACLM BS4MAENJ BS4MASTR BS4MAQKY BS4MABOR BS4MALIK BS4MAHDL BS4MAOSS BS4MAUNI BS4MAGET BS4MHASM BS4MHWFD BS4MHGSA BS4MHGCT BS4MHEFR BS4MHFRR BS4MHEXP BS4MHMDL BS4MHSCP BS4MHROH BS4MHLSP BS4MHWPO BS4MHWSG BS4MHBHC BS4MHHQT BS4MHCAL BS4MHCOM BS4GUSEC BS4GCHOM BS4GCSCH BS4GCELS BS4MCSWM BS4SCSWS BS4GALBS BS4GATTB BS4GATSB BS4GSTOL BS4GHURT BS4GMADE BS4GMFUN BS4GLEFT BS4GWATV BS4GPLCG BS4GPLFD BS4GJOHM BS4GWKPJ BS4GPLSP BS4GREBO BS4GUSIN BS4GDOHW BS4MOHWG BS4GBRNC BS4BSBIO BS4BAWEL BS4BAMOR BS4BACLM BS4BAENJ BS4BASTR BS4BAQKY BS4BABOR BS4BALIK BS4BAHDL BS4BAOSS BS4BAUNI BS4BAGET BS4BHOBS BS4BHDEI BS4BHPEI BS4BHCEI BS4BHWGO BS4BHTEX BS4BHFAP BS4BHLAW BS4BHEOS BS4BHMDL BS4BHROH BS4BHLSP BS4BHWPO BS4BHBHC BS4BHHQT BS4BHCOM BS4EARTH BS4EAWEL BS4EAMOR BS4EACLM BS4EAENJ BS4EASTR BS4EAQKY BS4EABOR BS4EALIK BS4EAHDL BS4EAOSS BS4EAUNI BS4EAGET BS4EHOBS BS4EHDEI BS4EHPEI BS4EHCEI BS4EHWGO BS4EHTEX BS4EHFAP BS4EHLAW BS4EHEOS BS4EHMDL BS4EHROH BS4EHLSP BS4EHWPO BS4EHBHC BS4EHHQT BS4EHCOM BS4CCHEM BS4CAWEL BS4CAMOR BS4CACLM BS4CAENJ BS4CASTR BS4CAQKY BS4CABOR BS4CALIK BS4CAHDL BS4CAOSS BS4CAUNI BS4CAGET BS4CHOBS BS4CHDEI BS4CHPEI BS4CHCEI BS4CHWGO BS4CHTEX BS4CHFAP BS4CHLAW BS4CHEOS BS4CHMDL BS4CHROH BS4CHLSP BS4CHWPO BS4CHBHC BS4CHHQT BS4CHCOM BS4PPHY BS4PAWEL BS4PAMOR BS4PACLM BS4PAENJ BS4PASTR BS4PAQKY BS4PABOR BS4PAHDL BS4PAOSS BS4PAUNI BS4PAGET BS4PHOBS BS4PHDEI BS4PHPEI BS4PHCEI BS4PHWGO BS4PHTEX BS4PHFAP BS4PHLAW BS4PHEOS BS4PHMDL BS4PHROH BS4PHLSP BS4PHWPO BS4PHBHC BS4PHHQT BS4PHCOM BS4BCSWB BS4ECSWE BS4CCSWC BS4PCSWP BS4BOHWG BS4EOHWG BS4COHWG BS4POHWG BSDGEDUP BSDGBORN BSDGCAVL BSDMTMH BSDSTSH BSDBTSH BSDETSH BSDCTSH BSDPTSH BSDMPATM BSDSPATS BSDBPATS BSDEPATS BSDCPATS BSDPPATS BSDMSVM BSDSSVS BSDBSVS BSDESVS BSDCSVS BSDPSVS BSDMSCM BSDSSCS BSDBSCS BSDESCS BSDCSCS BSDPSCS BSDGPBSS BC4GSBED BC4GSBEA BC4GNALA BC4GDSOI BC4GCHTS BC4GCHTU BC4GCHTC BC4GCHES BC4GCHPS BC4GCHPI BC4GCHSR BC4GCHSD BC4MGAMC BC4MSOEM BC4MSORM BC4SGASC BC4SSOES BC4SSORS BC4GPDIC BC4GPDSG BC4GPDIK BC4GPDTS BC4GPDUT BC4MEPOS BC4MEPOE BC4MEPSA BC4MEPTR BC4SEPOS BC4SEPOE BC4SEPTR BC4MFVAY BC4SFVAY BC4SFVCY BC4MRRTM BC4SRRTS BC4GRRTO BC4GFP01 BC4GFP02 BC4GFP03 BC4GFP04 BC4GFP05 BC4GFP06 BC4GFP07 BC4GFP08 BC4GFP09 BC4GFP10 BC4GFP11 BC4GFP12 BC4GFP13 BC4GSP01 BC4GSP02 BC4GSP03 BC4GSP04 BC4GSP05 BC4GSP06 BC4GSP07 BC4GSP08 BC4GSP09 BC4GSP10 BC4GSP11 BC4GSP12 BC4GSP13 BC4GST01 BC4GST02 BC4GST03 BC4GST04 BC4GST05 BC4GST06 BC4MST07 BC4MST08 BC4MST09 BC4MST10 BC4MST11 BC4SST12 BC4SST13 BC4SST14 BC4SST15 BC4SST16 BC4GSH18 BC4GSH19 BC4SSLAB BC4STASE BCDGAS BCDSRMI BCDSRSI BCDGPPSC BC4GCMPI {
      replace `var' = . if `var' == 9
    }
    foreach var of varlist BS4MSHWM BS4BSHWM BS4ESHWM BS4CSHWM BS4PSHWM BC4GHTIT {
      replace `var' = . if `var' == 99
    }
    foreach var of varlist BC4GDYSO BC4GAPAD BC4GAPIL BC4GAPST BC4GAPTE BC4GAPPR BC4GAPOT BCDGHW {
      replace `var' = . if `var' == 999
    }
    foreach var of varlist BC4GTENR BC4GEENR  {
        replace `var' = . if `var' == 99999
    }

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
