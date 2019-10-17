*==============================================================================*
* GLOBAL LEARNING ASSESSMENT DATABASE (GLAD)
* Project information at: https://github.com/worldbank/GLAD
*==============================================================================*

qui {

  *-----------------------------------------------------------------------------
  * Check that project profile was loaded, otherwise stops code
  *-----------------------------------------------------------------------------
  cap assert ${GLAD_profile_is_loaded} == 1
  if _rc != 0 {
  	noi disp as error "Please execute the profile_GLAD initialization do in the root of this project and try again."
  	exit
  }


  *-----------------------------------------------------------------------------
  * Switches for parallel processing in multiple Stata sessions
  *-----------------------------------------------------------------------------
  * Offer to split the task in parallel processing
  noi di as txt "{pstd}The time required to run this script may be very long. If you want to split the script by running only a subset of the surveys in this Stata session, type your chosen subset (1, 2, 3 or 4) and hit enter. In case you want to run all surveys in this Stata session, type 0 and hit enter to continue.{p_end}", _request(run_switch)
  if inlist(${run_switch}, 0, 1, 2, 3, 4) != 1 {
    noi di as error "{pstd}Input is not supported, so code is aborted. You must type a single number, either 0 (full script) or 1 , 2, 3 or 4 (for subsets)is not REPLACE so code is aborted.{p_end}"
    error 104
  }


  * The division of surveys in switches was done by processing time (known a posteriori)
  local surveys_in_switch_1 "WLD_2006_PIRLS WLD_2011_PIRLS WLD_2003_TIMSS"
  local surveys_in_switch_2 "WLD_2016_PIRLS WLD_2007_TIMSS"
  local surveys_in_switch_3 "WLD_2001_PIRLS WLD_2011_TIMSS"
  local surveys_in_switch_4 "LAC_2006_LLECE LAC_2013_LLECE LAC_2013_LLECE-T SSA_2000_SACMEQ SSA_2007_SACMEQ SSA_2014_PASEC WLD_2015_TIMSS"
  * Not including draft surveys "LAC_1997_LLECE SSA_1995_SACMEQ SSA_1996_PASEC WLD_All_EGRA"

  * Builds global of surveys to process based on the chosen switch
  if $run_switch == 0 {
    noi disp as res "This Stata session will process all available assessments (PIRLS, TIMSS, LLECE, PASEC and SACMEQ)."
    global surveys_to_process "`surveys_in_switch_1' `surveys_in_switch_2' `surveys_in_switch_3' `surveys_in_switch_4'"
  }
  else if $run_switch == 1 {
    noi disp as res "This Stata session will process only: `surveys_in_switch_1'."
    global surveys_to_process "`surveys_in_switch_1'"
  }
  else if $run_switch == 2 {
    noi disp as res "This Stata session will process only: `surveys_in_switch_2'."
    global surveys_to_process "`surveys_in_switch_2'"
  }
  else if $run_switch == 3 {
    noi disp as res "This Stata session will process only: `surveys_in_switch_3'."
    global surveys_to_process "`surveys_in_switch_3'"
  }
  else if $run_switch == 4 {
    noi disp as res "This Stata session will process only: `surveys_in_switch_4'."
    global surveys_to_process "`surveys_in_switch_4'"
  }
  else {
    noi disp as err "Programming error: code should never reach here as run_switch must be 0, 1, 2, 3 or 4."
  }
}


*-------------------------------------------------------------------------------
* Tasks in this project
*-------------------------------------------------------------------------------
* TASK 01_HARMONIZATION: creates GLAD from EDURAW (in datalibweb or input path)
do "${clone}/01_harmonization/012_programs/012_run.do"

* TASK 02_INDICATORS: creates the CLOs from GLADs (in datalibweb or clone)
do "${clone}/02_indicators/022_programs/022_run.do"

* TASK 03_DATALIBWEB: publish/compare clone files to those already on DLW
* do "${clone}/03_datalibweb/032_programs/032_run.do"
*-------------------------------------------------------------------------------

exit
