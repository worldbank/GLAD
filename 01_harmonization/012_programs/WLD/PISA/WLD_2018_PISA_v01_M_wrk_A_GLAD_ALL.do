*=========================================================================*
* GLOBAL LEARNING ASSESSMENT DATABASE (GLAD)
* Project information at: https://github.com/worldbank/GLAD
*
* Metadata to be stored as 'char' in the resulting dataset (do NOT use ";" here)
local region      = "WLD"
local year        = "2018"
local assessment  = "PISA"
local master      = "v01_M"
local adaptation  = "wrk_A_GLAD"
local module      = "ALL"
local ttl_info    = "Joao Pedro de Azevedo [eduanalytics@worldbank.org]"
local dofile_info = "created by Aishwarya, last modified by Joao Pedro Azevedo on February 5, 2022"
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
  local from_datalibweb = 0 // PLACEHOLDER - exception for eduraw files exceed 1Gb
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

    foreach file in CY07_MSU_STU_QQQ CY07_MSU_SCH_QQQ {
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

    use "`temp_dir'\CY07_MSU_STU_QQQ.dta", clear
    merge m:1 cnt cntschid using "`temp_dir'\CY07_MSU_SCH_QQQ.dta", assert(master match) nogen

    noi disp as res "{phang}Step 2 completed (`output_file'){p_end}"


    *---------------------------------------------------------------------------
    * 3) Standardize variable names across all assessments
    *---------------------------------------------------------------------------
    // For each variable class, we create a local with the variables in that class
    //     so that the final step of saving the GLAD dta knows which vars to save

    // ID Vars:
    local idvars "idcntry_raw idschool idlearner"

    *<_idcntry_raw_>
    clonevar  idcntry_raw = cnt
    label var idcntry_raw "Country ID, as coded in rawdata"
    *</_idcntry_raw_>

    *<_idschool_>
    clonevar  idschool = cntschid
    label var idschool "School ID"
    *</_idschool_>

    *<_idlearner_>
    clonevar  idlearner = cntstuid
    label var idlearner "Learner ID"
    *</_idlearner_>


    // VALUE Vars:
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
      clonevar  score_pisa_glcm_`auxpv' = pv`pv'glcm
      label var score_pisa_glcm_`auxpv' "Plausible value `pv': `assessment' score for global competences"
      * Marker to facilitate country-level outcomes consolidation
      foreach subject in read math scie glcm {
        char score_pisa_`subject'_`auxpv'[clo_marker] "number"
      }
    }
    *</_score_assessment_subject_pv_>

    *<_level_assessment_subject_pv_>
    * Proficiency levels to be created
    label define level_pisa_read -2 "<1c" -1 "1c" 0 "1b" 1 "1a" 2 "2" 3 "3" 4 "4" 5 "5" 6 "6"
    label define level_pisa_math                  0 "<1" 1 "1"  2 "2" 3 "3" 4 "4" 5 "5" 6 "6"
    label define level_pisa_scie      -1 "<1b" 0 "1b" 1 "1a" 2 "2" 3 "3" 4 "4" 5 "5" 6 "6"
    label define level_pisa_glcm .z "Not yet defined by OECD/PISA" // likely available in Feb2020
    foreach pv in 1 2 3 4 5 6 7 8 9 10 {
      * The convention includes a leading zero for pvs 1-9
      local auxpv = string(`pv',"%02.0f")
      *For reading - According to PISA 2018 report
      gen int level_pisa_read_`auxpv' = -2 if pv`pv'read <  190
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
      *For mathematics - According to PISA 2018 report
      gen int level_pisa_math_`auxpv' = 0 if pv`pv'math <  358
      replace level_pisa_math_`auxpv' = 1 if pv`pv'math >= 358 & pv`pv'math < 420
      replace level_pisa_math_`auxpv' = 2 if pv`pv'math >= 420 & pv`pv'math < 482
      replace level_pisa_math_`auxpv' = 3 if pv`pv'math >= 482 & pv`pv'math < 545
      replace level_pisa_math_`auxpv' = 4 if pv`pv'math >= 545 & pv`pv'math < 607
      replace level_pisa_math_`auxpv' = 5 if pv`pv'math >= 607 & pv`pv'math < 669
      replace level_pisa_math_`auxpv' = 6 if pv`pv'math >= 669 & !missing(pv`pv'math)
      label var    level_pisa_math_`auxpv' "Plausible value `pv': PISA level for math"
      label values level_pisa_math_`auxpv' level_pisa_math
      *For scie - According to PISA 2018 report
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
      *For global competences, the levels are not yet defined (Expected Feb 2020)
      gen int level_pisa_glcm_`auxpv' = .z
      label var    level_pisa_glcm_`auxpv' "Plausible value `pv': PISA level for global competences"
      label values level_pisa_glcm_`auxpv' level_pisa_glcm
      * Marker to facilitate country-level outcomes consolidation
      foreach subject in read math scie glcm {
        char level_pisa_`subject'_`auxpv'[clo_marker] "factor"
      }
    }
    *</_level_assessment_subject_pv_>


    // TRAIT Vars:
    local traitvars	"idgrade age urban* male escs* qescs has_qescs"

    *<_idgrade_>
    clonevar idgrade = st001d01t
    mvdecode idgrade, mv(96 = .z \ 97 = .a \ 98 = .b \ 99 = .c)
    label copy ST001D01T idgrade
    label values idgrade idgrade
    label define idgrade 96 "" 97 "" 98 "" 99 "", modify
    label define idgrade .a "Not Applicable" .b "Invalid" .c "No Answer" .z "Missing", add
    label var idgrade "Grade ID"
    *</_idgrade_>

    *<_age_>
    mvdecode age, mv(9996 = .z \ 9997 = .a \ 9998 = .b \ 9999 = .c)
    label var age "Learner age at time of assessment"
    *</_age_>

    *<_urban_>
    recode sc001q01ta (1 = 0 "Rural") (2/5 = 1 "Urban") (97 = .a "Not Administered") (98 = .b "Invalid") (99 = .c "No Response"), gen(urban)
    label var urban "School is located in urban/rural area"
    *</_urban_>

    *<_urban_o_>
    decode sc001q01ta, gen(urban_o)
    label var urban_o "Original variable of urban: population size of the school area"
    *</_urban_o_>*/

    *<_male_>
    recode st004d01t (2 = 1 "Male") (1 = 0 "Female"), gen(male)
    label var male "Learner gender is male/female"
    *</_male_>


    // SAMPLE Vars:
    local samplevars "learner_weight* weight_replicate*"

    *<_learner_weight_>
    clonevar learner_weight  = w_fstuwt
    label var learner_weight "Total learner weight"
    *</_learner_weight_>

    *<_weight_replicateN_>
    forvalues i = 1(1)80 {
      clonevar  weight_replicate`i' = w_fsturwt`i'
      label var weight_replicate`i' "Replicate weight `i'"
    }
    *</_weight_replicateN_>

    noi disp as res "{phang}Step 3 completed (`output_file'){p_end}"


    *---------------------------------------------------------------------------
    * 4) ESCS and other calculations
    *---------------------------------------------------------------------------

    // Placeholder for other operations that we may want to include (kept in ALL-BASE)

    *<_escs_>
    * escs already available
    *</_escs_>

    *<_escs_quintile_>
    gen escs_quintile = .
    levelsof idcntry_raw, local (c)
    foreach cc of local c {
      _ebin escs [weight = learner_weight] if idcntry_raw == "`cc'" , gen(q_`cc') nquantiles(5)
      replace escs_quintile = q_`cc' if missing(escs_quintile)
      drop q_`cc'
    }
    label define escs_quintile 1 "q1" 2 "q2" 3 "q3" 4 "q4" 5 "q5", modify
    label value escs_quintile escs_quintile
    label var escs_quintile "Income quintile"
    *</_escs_quintile_>

    // PISA Vars:
    local pisavars "city native language ece school_type school_type_o"

    *<_city_>
    recode sc001q01ta (4/5 = 1 "City") (2/3 = 2 "Town") (1 = 3 "Village") (98/99 = -98), gen(city)
    label var city "School is located in city (1), town (2), village (3)"
    *<_city_>

    *<_native_>
    gen native = immig if !inlist(immig,8,9)
    replace native = -98 if inlist(immig,8,9)
    label define native 1 "N" 2 "SGen" 3 "FGen"
    label value native native
    label var native "Learner is native (1), second-generation (2), first-generation (3)"
    *</_native_>

    *<_language_>
    gen language = st022q01ta if !inlist(st022q01ta,97,98,99)
    replace language = -97 if inlist(st022q01ta, 97)
    replace language = -98 if inlist(st022q01ta, 98, 99)
    label define language 1 "LangTest" 2 "LangOther"
    label value language language
    label var language "Language of test (1), other language (2)"
    *</_language_>

    *<_ece_>
    gen ece = -98
    replace ece = 1 if st125q01na == 7
    replace ece = 2 if durecec == 0 & st125q01na != 7
    replace ece = 3 if inlist(durecec,1,2,3,4,5,6,7,8) & st125q01na != 7
    label var ece "Attended early childhood education"
    label define ece 1 "NoECE" 2 "ECE1" 3 "ECE2", modify
    label value ece ece
    *</_ece_>*

    *<_school_type_>
    gen school_type = schltype if !inlist(schltype,8,9)
    replace school_type = -98 if inlist(schltype, 8, 9)
    label define school_type 1 "PvtIND" 2 "PvtDEP" 3 "Public"
    label value school_type school_type
    label var school_type "Type of ownership and decision-making power of schools"
    *</_school_type_>

    *<_school_type_o_> - original school type variable
    gen school_type_o = sc013q01ta if !inlist(sc013q01ta,8,9)
    replace school_type_o = -98 if inlist(sc013q01ta,8, 9)
    replace school_type_o = -97 if inlist(sc013q01ta,7)
    label define school_type_o 1 "PublicSch" 2 "PvtSch", modify
    label value school_type_o school_type_o
    label var school_type_o "Type of school - Public or Private"
    *</_school_type_o_>

    * Labelling mising values of PISAVARS
    * Avoid changing the original variables that will remain in ALL-BASE
    labmv `pisavars', mv(-97 .a -98 .b -99 .z )
    foreach label in `pisavars' {
      label define `label' .a "Not Applicable" .b "No Response" .z "Missing", modify
    }
    foreach var in `pisavars' {
      local vlab : value label `var'
      if "`vlab'" == ""  {
        label define l`var' .a "Not Applicable" .b "No Response"  .z "Missing", modify
        capture label val `var' l`var'
      }
    }

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
                 varc("key `keyvars'; value `valuevars'; trait `traitvars'; pisa `pisavars'; sample `samplevars'") ///
                 metadata("`metadata'") collection("GLAD")

    noi disp as res "Creation of `output_file'.dta completed"

  }

  else {
    noi disp as txt "Skipped creation of `output_file'.dta (already found in clone)"
    // Still loads it, to generate documentation
    use "`output_dir'/`output_file'.dta", clear
  }
}
