*==============================================================================*
* SUBTASK 0122: CREATE GLAD FROM EDURAW (IN DATALIBWEB OR INPUT PATH)
* Project information at: https://github.com/worldbank/GLAD
* Author: Diana Goldemberg
*==============================================================================*

*-------------------------------------------------------------------------------
* Program setup
*-------------------------------------------------------------------------------
* Whether we generate documentation for each .dta or no depends on Stata version
local generate_documentation = ( c(version)>=15 )

* A log file will be created at the end of this do, with task timestamps
* these locals (str_to_log_*) will keep track of each line to log
local str_to_log_1 = "Generating all GLAD datasets... (from_datalibweb = $from_datalibweb; shortcut = $shortcut_GLAD)"
local str_to_log_2 = "Started task at $S_TIME."
local i_log = 3
* Save timestamps for naming the log by initial time
local today = subinstr("$S_DATE"," ","_",.)
local time  = subinstr("$S_TIME",":","-",.)

*-------------------------------------------------------------------------------


*-------------------------------------------------------------------------------
* Loop for each GLAD to be created
*-------------------------------------------------------------------------------
* Basically, it runs region_year_assessment_v_M_v_A_GLAD.do files in 012_programs
* that are part of the surveys_to_process in the current run_switch

* Loop over all surveys to process (ie: WLD_2001_PIRLS)
qui foreach survey of global surveys_to_process {

  * Parsing region year and assessment from survey
  gettoken region aux_token  : survey,    parse("_")
  gettoken trash  aux_token  : aux_token, parse("_")
  gettoken year   aux_token  : aux_token, parse("_")
  gettoken trash  assessment : aux_token, parse("_")
  noi disp "{phang}Survey `survey' (region `region' year `year' assessment `assessment'):{p_end}"

  // IMPORTANT: this calls ONLY the wrk vintage. to produced different vintages, the microdata must be called through datalibweb. Edit must be done in 022_run.do
  local vintage = "wrk"  
  
  * Test if there are do-file for this survey in "${clone}/01_harmonization/012_programs"
  * Note that there may be multiple files according to master vintage
  local survey_do_files : dir "${clone}/01_harmonization/012_programs/`region'/`assessment'/" files "`survey'_v01_M_`vintage'_A_GLAD_ALL.do", respectcase 

  * If no file is found, log the unfortunate survey and move on
  if `"`survey_do_files'"' == "" {
    local str_to_log_`i_log' = "{phang}... skipped `survey' for no do-file was found for this survey{p_end}"
    local ++i_log
  }

  * If some do file is found for this survey
  else {
    * Loop over all do-files found in the folder for this survey
    foreach this_do_file of local survey_do_files {

      * Create GLAD: each *.do ends with the creation of a similarly named *.dta
      noi do "${clone}/01_harmonization/012_programs/`region'/`assessment'/`this_do_file'"

      * Harmonization of proficiency on-the-fly, based on thresholds as CPI
      glad_hpro_as_cpi 

      * Generates the documentation for the newly created fullname.dta
      * but only works if Stata is version 15 or above (when dyntext was created)
      if `generate_documentation'==1 {
        cd "${clone}/00_documentation"
        * Name for the md file is the same as the do-file, changing the file extension only
        local md_output_file = subinstr(strlower("`this_do_file'"),".do",".md",.)
        noi dyntext "dyntext_GLAD.txt", saving("${clone}/00_documentation/`md_output_file'") replace
      }

      * Line to include in the log file so we can keep track of how long tasks take
      local str_to_log_`i_log' = "{phang}... ended `this_do_file' at $S_TIME{p_end}"
      local ++i_log

    }
  }
}


*-------------------------------------------------------------------------------
* Creates log with timestamps in documentation folder
*-------------------------------------------------------------------------------
* Final strings to log, wrt to documentation
if `generate_documentation'==1 local str_to_log_`i_log' = "All GLAD datasets were generated, with corresponding markdown documentation."
else                           local str_to_log_`i_log' = "All GLAD datasets were generated, without documentation (only available for Stata version>=15)."

* Creates a log with what was saved in str_to_log (list of generated dtas with timestamps)
log using "${output}/0122_create_GLADs_`today'_`time'_runswitch$run_switch.log", replace name("Harmonization")

* Display all that was saved in str_to_log_*
forvalues j = 1(1)`i_log' {
  noi disp as res "`str_to_log_`j''"
}

log close _all
*-------------------------------------------------------------------------------
