*==============================================================================*
* SUBTASK 0221: CREATE CLO FROM GLAD (IN DATALIBWEB OR CLONE)
* Project information at: https://github.com/worldbank/GLAD
* Authors: Diana Goldemberg and Kristoffer Bjarkefur
*
* Steps:
* 0) Program setup
*    Loop for each CLO to be created:
* 1) Setup for CLO-run, including checking if file already exists
* 2) Open and check the GLAD dataset which is the input for CLO
* 3) Calls the ADO that "collapses" glad microdata into CLO <--- MOST IMPORTANT!
* 4) Save CLO dta and generate documentation
*    End of the loop for each CLO file
* 5) Creates log with timestamps in documentation folder
*
* Metadata to be stored as 'char' in the resulting dataset (do NOT use ";" here)
local adaptation  = "wrk_A_GLAD"
local module_in   = "ALL"
local module_out  = "ESCS"
local ttl_info    = "Joao Pedro de Azevedo [eduanalytics@worldbank.org]"
local dofile_info = "last modified by Diana Goldemberg in April 15, 2020"
*==============================================================================*


*-------------------------------------------------------------------------------
* 0) Program setup
*-------------------------------------------------------------------------------
* Execution parameters

* Whether the loop will generate documentation for each .dta or no depends on Stata version
local generate_documentation = ( c(version)>=15 )

* A log file will be created at the end of this do, with task timestamps
* these locals (str_to_log_*) will keep track of each line to log
local str_to_log_1 = "Generating all CLO datasets... (from_datalibweb = $from_datalibweb_GLAD_02; shortcut = $shortcut_GLAD)"
local str_to_log_2 = "Started task at $S_TIME."
local i_log = 3
* Save timestamps for naming the log by initial time
local today = subinstr("$S_DATE"," ","_",.)
local time  = subinstr("$S_TIME",":","-",.)
*-------------------------------------------------------------------------------


*-------------------------------------------------------------------------------
* Loop for each CLO to be created
*-------------------------------------------------------------------------------
* Basically, it creates region_year_assessment_v_M_v_A_GLAD_CLO.dta for all
* surveys that are part of the surveys_to_process in the current run_switch

* Loop over all surveys to process (ie: WLD_2001_PIRLS)
noi foreach survey of global surveys_to_process {

  * Parsing region year and assessment from survey
  gettoken region aux_token  : survey,    parse("_")
  gettoken trash  aux_token  : aux_token, parse("_")
  gettoken year   aux_token  : aux_token, parse("_")
  gettoken trash  assessment : aux_token, parse("_")

  * Finds the latest master vintage for this survey in 012_programs
  * which should also be the same as the latest master vintage in datalibweb

  * Starts by testing that v01_M exist, otherwise just log unfortunate survey and move on
  cap confirm file "${clone}/01_harmonization/012_programs/`region'/`assessment'/`survey'_v01_M_`adaptation'_`module_in'.do"
  if _rc != 0 {
    local str_to_log_`i_log' = "{phang}... skipped `survey' for v01_M was NOT found for this survey{p_end}"
    local ++i_log
  }

  else {
    * Starting from master 1 (we know it exists, or would not be in this else)
    local i_master = 1
    * Assumes next master may exist
    local try_next_master = 1
    * Test that assumption
    while `try_next_master' == 1 {
      local next_i = `i_master' + 1
      local master = "v0`next_i'_M"
      * Check if a higher master exist, if yes, update counter, if no, stop loop
      cap confirm file "${clone}/01_harmonization/012_programs/`region'/`assessment'/`survey'_`master'_`adaptation'_`module_in'.do"
      if _rc == 0 local ++i_master
      else        local try_next_master = 0
    }
    * Revert back to the highest available master
    local master = "v0`i_master'_M"

    * The while loop will have exited with the local master having what we will use,
    * that is, the highest available master for which a survey GLAD exists
    noi disp as res _newline "Processing the latest master vintage of `survey', that is `master'."

    *---------------------------------------------------------------------------
    * 1) Setup for CLO-run, including checking if file already exists
    *---------------------------------------------------------------------------

    * Resets random seed at the beginning of each file for reproducibility
    set seed $master_seed

    * Set up folders in clone and define locals to be used in this do-file
    glad_local_folder_setup , r("`region'") y("`year'") as("`assessment'") ma("`master'") ad("`adaptation'")
    local temp_dir     "`r(temp_dir)'"
    local output_dir   "`r(output_dir)'"
    local surveyid     "`r(surveyid)'"
    local output_file  "`surveyid'_`adaptation'_`module_out'"
    * TODO: better management of adaptations as of now not possible because of filename
    * Once ALL is no longer confused with ALL-BASE (changed to BASE), this could be improved
    local wrk_input_file   "`surveyid'_wrk_A_GLAD_`module_in'.dta"
    local v01_input_file   "`surveyid'_v01_A_GLAD_`module_in'.dta"

    * If user does not have access to or chooses not to use datalibweb, point to GLAD location
    if $from_datalibweb_GLAD_02 == 0    local input_dir "${input}/`region'/`region'_`year'_`assessment'/"

    * Confirm if the final CLO file already exists in the output_dir
    cap confirm file "`output_dir'/`output_file'.dta"
    * If the file does not exist or overwrite_files local is set to one, continue
    if (_rc == 601) | ($overwrite_files_GLAD_02) {

      *---------------------------------------------------------------------------
      * 2) Open and check the GLAD dataset which is the input for CLO
      *---------------------------------------------------------------------------
      noi disp as txt "{phang}start working on `output_file'...{p_end}"

      * Open flexibly the GLAD dta from input_dir or datalibweb
      if $from_datalibweb_GLAD_02 == 1 {
        noi edukit_datalibweb, d(country(`region') year(`year') type(GLAD) surveyid(`surveyid') filename(`v01_input_file') $shortcut_GLAD_02)
        * Datalibweb quirck is changing the varname, so change back
        cap rename code countrycode
        cap drop code year
      }
      else use "`input_dir'/`wrk_input_file'", clear

      * Harmonization of proficiency on-the-fly, based on thresholds as CPI
      quietly glad_hpro_as_cpi

      * Keep only observations that are groupings at the national_level
      * Ex: Madrid (idcntry_raw = 724005) participated in PIRLS 2016 and
      * will be dropped, but Spain (idcntry_raw = 724) is kept.
      * This is important because both are mapped to countrycode ESP in GLAD
      keep if national_level == 1
		

      * Check that metadata of GLAD input_file matches that of the CLO being built
      local chars_to_check  "region year assessment master adaptation"
      foreach c of local chars_to_check {
        local c_in_glad : char _dta[`c']
        local c_in_clo    "``c''"
        assert "`c_in_glad'" == "`c_in_clo'"
      }

      * Tokenized elements from the header and loop
      local clo_description   "This dataset contains harmonized aggregated data from `assessment' `year' and is part of the Country Level Outcomes (CLO)"
      local metadata          "region `region'; year `year'; assessment `assessment'; master `master'; adaptation `adaptation'; module `module_out'; ttl_info `ttl_info'; dofile_info `dofile_info'; description `clo_description'"

      *---------------------------------------------------------------------------
      * 3) Calls the ADO that "collapses" glad microdata into CLO
      *---------------------------------------------------------------------------
      * This line should be inside the GLAD, once it moves there, erase from here
      if "`assessment'" == "SACMEQ" {
        svyset idschool [pw = learner_weight], strata(strata) || _n
      }

      * Quintiles of ESCS
      gen byte qescs = .
      levelsof idgrade, local(grades)
      levelsof countrycode, local(countries)
      foreach country of local countries {
        foreach grade of local grades {
          capture drop qaux
          capture xtile qaux = escs if countrycode == "`country'" & idgrade == `grade' [aw = learner_weight] , nq(5)
          if _rc == 0 replace qescs = qaux if countrycode == "`country'" & idgrade == `grade'
        }
      }

      gen byte has_qescs = (qescs != .)

      * This is the most important line in this do-file
      * Check the ado for more details on how this step is performed
      * The -groups- and -subgroups- options may be customized but only
      * recommended to change if you know exactly what you are doing
	  * this code now creates bowth the SDG 4.1.1 indicator and its complement (BMP)

	  noisily glad_microdata_to_clo, ass(`assessment') year(`year') ///
          groups(countrycode idgrade) subgroups(male urban has_qescs qescs)         ///
          dummy_vars(sdg411_* bmp_*) factor_vars(level_*) number_vars(score_* fgt1_* fgt2_*)

      * Store locals returned from the ado
      local idvars    "`r(idvars)'"
      local valuevars "`r(valuevars)'"
      local traitvars "`r(traitvars)'"

      *---------------------------------------------------------------------------
      * 4) Save CLO dta and generate documentation
      *---------------------------------------------------------------------------
      * Erase _dta chars, so nothing old (from GLAD and reshapes) is left behind
      local chars_to_clean: char _dta[]
      foreach c in `chars_to_clean' {
        char _dta[`c']
      }

      * This function compresses the dataset, adds metadata passed in the arguments as chars, save CLO.dta
      edukit_save, filename("`output_file'") path("`output_dir'")  dir2delete("`temp_dir'")  ///
                   idvars("`idvars'") varc("value `valuevars'; trait `traitvars'") ///
                   metadata("`metadata'") collection("CLO")

      noi disp as res "Creation of `output_file'.dta completed"

    }

    else {
      noi disp as txt "Skipped creation of `output_file'.dta (already found in clone)"
      * Still loads it, to generate documentation
      use "`output_dir'/`output_file'.dta", clear
    }

    * Generates the documentation for the newly created fullname.dta
    * but only works if Stata is version 15 or above (when dyntext was created)
    if `generate_documentation' == 1 {
      cd "${clone}/00_documentation"
      local md_output_file = strlower("`output_file'")
      noi disp as txt "Documentation of `output_file'.dta being processed" _newline
      noi dyntext "dyntext_CLO.txt", saving("${clone}/00_documentation/`md_output_file'.md") replace
    }
    

    * Line to include in the log file so we can keep track of how long tasks take
  //  local str_to_log_`i_log' = "{phang}... saved `output_file'.dta at $S_TIME{p_end}"
  //  local ++i_log

  * Ends condition to only run survey if .do existed
  }
* Move to the next survey
}

*-------------------------------------------------------------------------------
* 5) Creates log with timestamps in documentation folder
*-------------------------------------------------------------------------------
* Final strings to log, wrt to documentation
if `generate_documentation' == 1 local str_to_log_`i_log' = "All CLO datasets were generated, with corresponding markdown documentation."
else                             local str_to_log_`i_log' = "All CLO datasets were generated, without documentation (only available for Stata version>=15)."

* Creates a log with what was saved in str_to_log (list of generated dtas with timestamps)
log using "${output}/0221_create_CLOs_`today'_`time'_runswitch$run_switch.log", replace name("Indicators")

* Display all that was saved in str_to_log_*
forvalues j = 1(1)`i_log' {
  noi disp as res "`str_to_log_`j''"
}

log close _all
*-------------------------------------------------------------------------------
