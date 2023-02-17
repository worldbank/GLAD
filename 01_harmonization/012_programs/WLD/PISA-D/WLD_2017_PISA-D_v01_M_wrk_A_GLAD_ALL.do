*=========================================================================*
* GLOBAL LEARNING ASSESSMENT DATABASE (GLAD)
* Project information at: https://github.com/worldbank/GLAD
*
* Metadata to be stored as 'char' in the resulting dataset (do NOT use ";" here)
local region      = "WLD"
local year        = "2017"
local assessment  = "PISA-D"
local master      = "v01_M"
local adaptation  = "wrk_A_GLAD"
local module      = "ALL"
local ttl_info    = "Joao Pedro de Azevedo [eduanalytics@worldbank.org]"
local dofile_info = "created by Aroob, last modified by Joao Pedro on February 5, 2022"
*
* Steps:
* 0) Program setup (identical for all assessments)
* 1) Open all rawdata, lower case vars, save in temp_dir
* 2) Combine all rawdata into a single file (merge and append)
* 3) Standardize variable names across all assessments
* 4) ESCS and other calculations
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

    // Filter the master country list to only this assessment-year -
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

    foreach file in CY1MDAI_STU_COG CY1MDAI_STU_QQQ CY1MDAI_SCH_QQQ CY1MDAP_BTN_STU_CMB cy1mda_btn_stu_cmb_rwgts {
      if `from_datalibweb'==1 {
        noi edukit_datalibweb, d(country(`region') year(`year') type(EDURAW) surveyid(`surveyid') filename(`file'.dta) `shortcut')
      }
      else {
        use "`input_dir'/`file'.dta", clear
      }
      rename *, lower
      compress
      save "`temp_dir'/`file'.dta", replace
    }

    noi disp as res "{phang}Step 1 completed (`output_file'){p_end}"


    *---------------------------------------------------------------------------
    * 2) Combine all rawdata into a single file (merge and append)
    *---------------------------------------------------------------------------

    use "`temp_dir'\CY1MDAP_BTN_STU_CMB.dta", clear
    *merge student and weight datafiles
    merge 1:1 fullid using "`temp_dir'\cy1mda_btn_stu_cmb_rwgts.dta"
    save "`temp_dir'\BTN_2017_PISA.dta", replace

    use "`temp_dir'\CY1MDAI_STU_COG.dta", clear
    merge 1:1 cntryid cnt cntschid cntstuid using "`temp_dir'\CY1MDAI_STU_QQQ.dta", assert(match) nogen
    merge m:1 cntryid cnt cntschid using "`temp_dir'\CY1MDAI_SCH_QQQ.dta", assert(match) nogen
    append using "`temp_dir'\BTN_2017_PISA.dta"

    noi disp as res "{phang}Step 2 completed (`output_file'){p_end}"


    *---------------------------------------------------------------------------
    * 3) Standardize variable names across all assessments
    *---------------------------------------------------------------------------
    // For each variable class, we create a local with the variables in that class
    //     so that the final step of saving the GLAD dta  knows which vars to save

    // ID Vars:
    local idvars "idcntry_raw idschool idlearner"

    *<_idcntry_raw_>
    clonevar  idcntry_raw = cnt
    label var idcntry_raw "Country ID, as coded in rawdata"
    *</_idcntry_raw_>

    *<_idschool_>
    clonevar  idschool = cntschid
    replace   idschool = schoolid if cnt == "BTN"
    label var idschool "School ID"
    *</_idschool_>

    *<_idclass_>
    * Class ID not available
    gen idclass = -99
    label var idclass "Class ID"
    *</_idclass_>*/

    *<_idlearner_>
    clonevar  idlearner = cntstuid
    replace   idlearner = studentid if cnt == "BTN"
    label var idlearner "Learner ID"
    *</_idlearner_>


    // VALUE Vars: 	  /* CHANGE HERE FOR YOUR ASSESSMENT!!! PIRLS EXAMPLE */
    local valuevars	"score_pisa* level_pisa*"

    *<_score_assessment_subject_pv_>
    foreach pv in 1 2 3 4 5 6 7 8 9 10 {
      * The convention includes a leading zero for pvs 1-9
      local auxpv = string(`pv',"%02.0f")
      clonevar  score_pisa_read_`auxpv' = pv`pv'read
      label var score_pisa_read_`auxpv' "Plausible value `pv': `assessment' score for read"
      clonevar  score_pisa_math_`auxpv' = pv`pv'math
      label var score_pisa_math_`auxpv' "Plausible value `pv': `assessment' score for math"
      clonevar  score_pisa_scie_`auxpv' = pv`pv'scie
      label var score_pisa_scie_`auxpv' "Plausible value `pv': `assessment' score for science"
      * CLO markers
      foreach subject in read math scie {
        char score_pisa_`subject'_`auxpv'[clo_marker] "number"
      }
    }
    *</_score_assessment_subject_pv_>

    *<_level_assessment_subject_pv_>
    * Proficiency levels to be created
    label define level_pisa_read -2 "<1c" -1 "1c" 0 "1b" 1 "1a" 2 "2" 3 "3" 4 "4" 5 "5" 6 "6"
    label define level_pisa_math                  0 "<1" 1 "1"  2 "2" 3 "3" 4 "4" 5 "5" 6 "6"
    label define level_pisa_scie      -1 "<1b" 0 "1b" 1 "1a" 2 "2" 3 "3" 4 "4" 5 "5" 6 "6"
    foreach pv in 1 2 3 4 5 6 7 8 9 10 {
      * The convention includes a leading zero for pvs 1-9
      local auxpv = string(`pv',"%02.0f")
      *For reading - According to PISA 2015 report
      gen int level_pisa_read_`auxpv' = -2 if pv`pv'read < 190
      replace level_pisa_read_`auxpv' = -1 if pv`pv'read >= 190 & pv`pv'read < 262
      replace level_pisa_read_`auxpv' =  0 if pv`pv'read >= 262 & pv`pv'read < 335
      replace level_pisa_read_`auxpv' =  1 if pv`pv'read >= 335 & pv`pv'read < 407
      replace level_pisa_read_`auxpv' =  2 if pv`pv'read >= 407 & pv`pv'read < 480
      replace level_pisa_read_`auxpv' =  3 if pv`pv'read >= 480 & pv`pv'read < 553
      replace level_pisa_read_`auxpv' =  4 if pv`pv'read >= 553 & pv`pv'read < 626
      replace level_pisa_read_`auxpv' =  5 if pv`pv'read >= 626 & pv`pv'read < 698
      replace level_pisa_read_`auxpv' =  6 if pv`pv'read >= 698 & !missing(pv`pv'read)
      label var    level_pisa_read_`auxpv' "Plausible value `pv': PISA level for read"
      label values level_pisa_read_`auxpv' level_pisa_read
      *For mathematics - According to PISA 2015 report
      gen int level_pisa_math_`auxpv' = 0 if pv`pv'math <  358
      replace level_pisa_math_`auxpv' = 1 if pv`pv'math >= 358 & pv`pv'math < 420
      replace level_pisa_math_`auxpv' = 2 if pv`pv'math >= 420 & pv`pv'math < 482
      replace level_pisa_math_`auxpv' = 3 if pv`pv'math >= 482 & pv`pv'math < 545
      replace level_pisa_math_`auxpv' = 4 if pv`pv'math >= 545 & pv`pv'math < 607
      replace level_pisa_math_`auxpv' = 5 if pv`pv'math >= 607 & pv`pv'math < 669
      replace level_pisa_math_`auxpv' = 6 if pv`pv'math >= 669 & !missing(pv`pv'math)
      label var    level_pisa_math_`auxpv' "Plausible value `pv': PISA level for math"
      label values level_pisa_math_`auxpv' level_pisa_math
      *For scie - According to PISA 2015 report
      gen int level_pisa_scie_`auxpv' = -1 if pv`pv'scie <  261
      replace level_pisa_scie_`auxpv' =  0 if pv`pv'scie >= 261 & pv`pv'scie < 335
      replace level_pisa_scie_`auxpv' =  1 if pv`pv'scie >= 335 & pv`pv'scie < 410
      replace level_pisa_scie_`auxpv' =  2 if pv`pv'scie >= 410 & pv`pv'scie < 484
      replace level_pisa_scie_`auxpv' =  3 if pv`pv'scie >= 484 & pv`pv'scie < 559
      replace level_pisa_scie_`auxpv' =  4 if pv`pv'scie >= 559 & pv`pv'scie < 633
      replace level_pisa_scie_`auxpv' =  5 if pv`pv'scie >= 633 & pv`pv'scie < 708
      replace level_pisa_scie_`auxpv' =  6 if pv`pv'scie >= 708 & !missing(pv`pv'scie)
      label var    level_pisa_scie_`auxpv' "Plausible value `pv': PISA level for science"
      label values level_pisa_scie_`auxpv' level_pisa_scie
      * CLO markers
      foreach subject in read math scie {
        char level_pisa_`subject'_`auxpv'[clo_marker] "factor"
      }
    }
    *</_level_assessment_subject_pv_>


    // TRAIT Vars:
    local traitvars	"idgrade age urban* male escs*"

    *<_age_>
    replace age = .	if age  == 9999
    label var age "Learner age at time of assessment"
    *</_age_>

    *<_idgrade_>
    clonevar idgrade = st001d01t
    label var idgrade "Grade ID"
    *</_idgrade_>

    *<_urban_>
    recode ruralstr (2 = 0 "Rural") (1 = 1 "Urban"), gen(urban)
    label var urban "School is located in urban/rural area"
    *</_urban_>

    *<_male_>
    gen byte male = .
    replace  male = 0 if (st004d01t == 1 | tfgender == 1)
    replace  male = 1 if (st004d01t == 2 | tfgender == 2)
    label var male "Learner gender is male/female"
    *</_male_>


    // SAMPLE Vars:
    local samplevars "learner_weight weight_replicate*"

    *<_learner_weight_>
    clonevar learner_weight  = w_fstuwt
    label var learner_weight "Total learner weight"
    *</_learner_weight_>

    *<_weight_replicateN_>
    forvalues i=1(1)80 {
    clonevar  weight_replicate`i' = w_fsturwt`i'
    label var weight_replicate`i' "Replicate weight `i'"
    }

    noi disp as res "{phang}Step 3 completed (`output_file'){p_end}"


    *---------------------------------------------------------------------------
    * 4) ESCS and other calculations
    *---------------------------------------------------------------------------

    // Placeholder for other operations that we may want to include (kept in ALL-BASE)

    *<_escs_>
    clonevar escs = escs15
    label var escs "Index for socio-economic status"
    *</escs_>
	
	* Quintiles of ESCS // this setion of the code used to be in 0221 or 0222.
	* This is the variable used to compute results by Socio Economic Status.
	* Ensure that CNTRY Identifer is used as STRING.
	* This is not PISA original Quintiles of SES. Need to decide which one should be prefered.
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
    edukit_save, filename("`output_file'") path("`output_dir'") dir2delete("`temp_dir'") idvars(`idvars')             ///
                 varc("key `keyvars'; value `valuevars'; trait `traitvars'; sample `samplevars'") ///
                 metadata("`metadata'") collection("GLAD")

    noi disp as res "Creation of `output_file'.dta completed"

  }

  else {
    noi disp as txt "Skipped creation of `output_file'.dta (already found in clone)"
    // Still loads it, to generate documentation
    use "`output_dir'/`output_file'.dta", clear
  }
}
