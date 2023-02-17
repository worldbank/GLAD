*=========================================================================*
* GLOBAL LEARNING ASSESSMENT DATABASE (GLAD)
* Project information at: https://github.com/worldbank/GLAD
*
* Metadata to be stored as 'char' in the resulting dataset (do NOT use ";" here)
local region      = "WLD"
local year        = "2006"
local assessment  = "PIRLS"
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
    // PLACEHOLDER: bring the list of countries as macro
    foreach cnt in AUT BFL BFR BGR CAB CBC CNS COT CQU DEU DNK ENG ESP FRA GEO HKG HUN IDN IRN IS5 ISL ISR ITA KWT LTU LUX LVA MAR MDA MKD NLD NO5 NOR NZL POL QAT ROM RUS SCO SGP SVK SVN SWE TTO TWN USA ZAF {

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
      merge 1:1 idcntry idschool idclass idstud using "`temp_dir'/ASG.dta", keep(master match) nogen
      merge 1:1 idcntry idschool idstud using "`temp_dir'/ASH.dta", keep(master match) nogen
      merge m:1 idcntry idschool using "`temp_dir'/ACG.dta", keep(master match) nogen
      save "`temp_dir'/TEMP_`surveyid'_p_`cnt'.dta", replace
    }

    noi disp as res "{phang}Step 1 completed (`output_file'){p_end}"


    *---------------------------------------------------------------------------
    * 2) Combine all rawdata into a single file (merge and append)
    *---------------------------------------------------------------------------

    fs "`temp_dir'/TEMP_`surveyid'_p_*.dta"
    local firstfile: word 1 of `r(files)'
    use "`temp_dir'/`firstfile'", clear
    foreach f in `r(files)' {
      if "`f'" != "`firstfile'" append using "`temp_dir'/`f'"
    }

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
    * Cleaning grades for Slovenia: Participated in Grade 4 (per report)
    replace idgrade = 4 if idcntry == 705 // SVN = Slovenia
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
    local valuevars	"score_pirls* level_pirls*"

    *<_score_assessment_subject_pv_>
    foreach pv in 01 02 03 04 05 {
      clonevar  score_pirls_read_`pv' = asrrea`pv'
      label var score_pirls_read_`pv' "Plausible value `pv': `assessment' score for read"
      char      score_pirls_read_`pv'[clo_marker] "number"
    }
    *</_score_assessment_subject_pv_>

    *<_level_assessment_subject_pv_>
    foreach pv in 01 02 03 04 05 {
      clonevar  level_pirls_read_`pv' = asribm`pv'
      label var level_pirls_read_`pv' "Plausible value `pv': `assessment' level for read"
      char      level_pirls_read_`pv'[clo_marker] "factor"
    }
    *</_level_assessment_subject_pv_>


    // TRAIT Vars:
    local traitvars	"age urban* male escs qescs has_qescs"

    *<_age_>
    gen age = asdage  if  !missing(asdage)  &  asdage != 99
    label var age "Learner age at time of assessment"
    *</_age_>

    *<_urban_>
    gen byte urban = (inlist(acbgctas, 2, 3, 4, 5, 6))  if  !missing(acbgctas)  &  acbgctas != 9
    label var urban "School is located in urban/rural area"
    *</_urban_>

    *<_urban_o_>
    decode acbgctas, g(urban_o1)
    label var urban_o1 "Original variable of urban: population size of the school area"
    decode acbgcomm, g(urban_o2)
    label var urban_o2 "Original variable of urban: school is located in urban/rural area"
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


    noi disp as res "{phang}Step 3 completed (`output_file'){p_end}"


    *---------------------------------------------------------------------------
    * 4) ESCS and other calculations (by Aroob, from Feb 2019)
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
      clonevar SCORE_READING`pv' = ASRREA`pv'
      clonevar THRESHOLD`pv' = ASRIBM`pv'
    }
    foreach var of varlist THRESHOLD* {
      gen LOW_`var' = (`var' > 1)
      gen INT_`var' = (`var' > 2)
      gen HIGH_`var' = (`var' > 3)
      gen ADV_`var' = (`var' > 4)
    }

    *Calculation of ESCS:
    gen NBOOK = ASBGBOOK if ASBGBOOK != 9
    foreach var of varlist ASBGTA1 ASBGTA2 ASBGTA3 ASBGTA4 ASBGTA5 ASBGTA6 ASBGTA7 ASBGTA8 ASBGTA9 ASBGTA10 {
      replace `var' = . if `var' == 9
      replace `var' = 0 if `var' == 2
    }
    foreach var of varlist ASDHOCCP ASDHEDUP ASDHPEMP {
      replace `var' = . if inlist(`var',7,9)
    }
    *Recoding ASDHOCCP and ASDHEDUP
    recode ASDHOCCP (1=6) (2=5) (3=4) (4=3) (5=2) (6=1), gen(HIOCC)
    recode ASDHEDUP (1=5) (2=4) (3=3) (4=2) (5=1), gen(HIEDU)
    recode ASDHPEMP (1=4) (2=3) (3=2) (4=1), gen(PAREMP)
    alphawgt NBOOK ASBGTA1 ASBGTA2 ASBGTA3 ASBGTA4 ASBGTA5 ASBGTA6 ASBGTA7 ASBGTA8 ASBGTA9 ASBGTA10 [weight = TOTWGT], detail std item label
    bysort IDCNTRY: mdesc NBOOK ASBGTA1 ASBGTA2 ASBGTA3 ASBGTA4 ASBGTA5 ASBGTA6 ASBGTA7 ASBGTA8 ASBGTA9 ASBGTA10
    tab NBOOK, gen(dbooks)
    foreach var of varlist  dbooks* ASBGTA1 ASBGTA2 ASBGTA3 ASBGTA4 ASBGTA5 ASBGTA6 ASBGTA7 ASBGTA8 ASBGTA9 ASBGTA10 {
      bysort IDCNTRY IDSCHOOL: egen `var'_mean = mean(`var')
      bysort IDCNTRY: egen `var'_mean_cnt = mean(`var')
      replace `var' = `var'_mean if missing(`var')
      replace `var' = `var'_mean_cnt if missing(`var')
      egen `var'_std = std(`var')
    }
    pca  dbooks*_std ASBGTA1_std ASBGTA2_std ASBGTA3_std ASBGTA4_std ASBGTA5_std ASBGTA6_std ASBGTA7_std ASBGTA8_std ASBGTA9_std ASBGTA10_std [weight = TOTWGT]
    predict HOMEPOS
    pca  dbooks*_std ASBGTA1_std ASBGTA2_std ASBGTA3_std ASBGTA4_std ASBGTA5_std ASBGTA6_std ASBGTA7_std ASBGTA8_std ASBGTA9_std [weight = TOTWGT]
    predict HOMEPOS1
    pca dbooks*_std ASBGTA1_std ASBGTA2_std ASBGTA3_std ASBGTA4_std ASBGTA5_std ASBGTA6_std ASBGTA7_std ASBGTA8_std [weight = TOTWGT]
    predict HOMEPOS2
    pca dbooks*_std ASBGTA1_std ASBGTA2_std ASBGTA3_std ASBGTA4_std ASBGTA5_std ASBGTA6_std ASBGTA7_std [weight = TOTWGT]
    predict HOMEPOS3
    pca dbooks*_std ASBGTA1_std ASBGTA2_std ASBGTA3_std ASBGTA4_std ASBGTA5_std ASBGTA6_std [weight = TOTWGT]
    predict HOMEPOS4
    forvalues i = 1/4 {
      replace HOMEPOS = HOMEPOS`i' if missing(HOMEPOS)
    }

    *Replacing missing values of HIEDU and HIOCC:
    bysort IDCNTRY IDSCHOOL: egen HIEDU_mode = mode(HIEDU), maxmode
    bysort IDCNTRY: egen HIEDU_mode_cnt = mode(HIEDU), maxmode
    replace HIEDU = HIEDU_mode if missing(HIEDU)
    replace HIEDU = HIEDU_mode_cnt if missing(HIEDU)

    bysort IDCNTRY IDSCHOOL: egen HIOCC_mode = mode(HIOCC), maxmode
    bysort IDCNTRY: egen HIOCC_mode_cnt = mode(HIOCC), maxmode
    replace HIOCC = HIOCC_mode if missing(HIOCC)
    replace HIOCC = HIOCC_mode_cnt if missing(HIOCC)

    polychoricpca HIEDU HIOCC HOMEPOS [weight = TOTWGT], score(ESCS) nscore(1)
    ren ESCS1 ESCS
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
