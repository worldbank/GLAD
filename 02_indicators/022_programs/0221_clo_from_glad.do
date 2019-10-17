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
* 3) Structure GLAD dataset as wide to prepare for collapse
* 4) Calculate aggregate statistics by subgroup for CLO from GLAD
* 5) Revert the wide to long in subgroups
* 6) Save CLO dta and generate documentation
*    Creates log with timestamps in documentation folder
*
* Metadata to be stored as 'char' in the resulting dataset (do NOT use ";" here)
local adaptation  = "wrk_A_GLAD"
local module_in   = "ALL"
local module_out  = "CLO"
local ttl_info    = "Joao Pedro de Azevedo [eduanalytics@worldbank.org]"
local dofile_info = "last modified by Diana Goldemberg in October 8, 2019"
* Note: files will also maintain chars region year assessment master from GLAD
*==============================================================================*


*-------------------------------------------------------------------------------
* 0) Program setup
*-------------------------------------------------------------------------------
* Execution parameters

* The CLO file will have groupvars that combine id and trait groupvars
local id_groupvars    = "countrycode idgrade"
local trait_groupvars = "male urban"

* Turning these locals off to 0 will save time, but generate incomplete CLO files (shortcut for Learning Poverty)
local collapse_factor_vars = 1	// If 1, factor variables in GLAD are collapsed (ie: level_pirls_read)
local collapse_number_vars = 1	// If 1, number variables in GLAD are collapsed (ie: score_pirls_read)

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
qui foreach survey of global surveys_to_process {

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

    * Set which type of mean aggregation depending on which assessment or year,
    * and give an error if none is explicitly defined.
    if inlist("`assessment'", "LLECE", "LLECE-T", "SACMEQ") local pv_aggregate = 0
    else if inlist("`assessment'", "PIRLS", "TIMSS")        local pv_aggregate = 1
    else if "`assessment'"=="PASEC" & `year'==1996          local pv_aggregate = 0
    else if "`assessment'"=="PASEC" & `year'==2014          local pv_aggregate = 1
    else {
      noi disp as err "{phang}the routine is not well defined for `survey'.{p_end}"
      error 2222
    }

    * Resets random seed at the beginning of each file for reproducibility
    set seed $master_seed

    * Set up folders in clone and define locals to be used in this do-file
    glad_local_folder_setup , r("`region'") y("`year'") as("`assessment'") ma("`master'") ad("`adaptation'")
    local temp_dir     "`r(temp_dir)'"
    local output_dir   "`r(output_dir)'"
    local surveyid     "`r(surveyid)'"
    local output_file  "`surveyid'_`adaptation'_`module_out'"
    local input_file   "`surveyid'_`adaptation'_`module_in'"

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

        *---------------
        * 2a) Open the GLAD micro data that the indicators will be calculated from

        * Open flexibly the GLAD dta from input_dir or datalibweb
        if $from_datalibweb_GLAD_02 == 1 noi edukit_datalibweb, d(country(`region') year(`year') type(GLAD) surveyid(`surveyid') filename(`input_file') $shortcut_GLAD_02)
        else use "`input_dir'/`input_file'.dta", clear

        * Harmonization of proficiency on-the-fly, based on thresholds as CPI
        glad_hpro_as_cpi


        *---------------
        * 2b) Check that metadata match what was specified, and prepare metadata for the file generated in this do-file

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

        * Keep only observations that are groupings at the national_level
        * Ex: Madrid (idcntry_raw=724005) participated in PIRLS 2016 and
        * will be dropped, but Spain (idcntry_raw=724) is kept.
        * This is important because both are mapped to countrycode ESP in GLAD
        keep if national_level == 1


        *---------------------------------------------------------------------------
        * 3) Structure GLAD dataset as wide to prepare for collapse
        *---------------------------------------------------------------------------
        noi disp as txt "{phang}structuring the GLAD input...{p_end}"

        *---------------
        * 3a) Prepare lists of variables to be aggregated in indicators in CLO

        * All valuevars in GLAD should be aggregated (score* level* hpro*)
        * They are saved in the GLAD metadata, in a way to help CLO.
        * Besides the collective listing in char _dta[valuevars],
        * each valuevariable has char valuevariable[clo_marker], taking
        * the options: number (score_*), factor (level_*) or dummy (hpro_*)
        * For the numbers and dummies, taking a simple average is enough,
        * but the factors needs to become dummies before collapsing

        * Reset all lists
        local glad_number_vars  ""	     // ie: score_*
        local glad_factor_vars  ""       // ie: level_*
        local glad_dummy_vars   ""       // ie: hpro_*
        * List of dummies being created from glad_factor_vars
        local glad_factor_dummy_vars ""	 // ie: d*_level_*
        * NOTE: though we could just play wild cards to populate those
        * lists, the idea is to be flexible, given that names may change

        * Reads from metadata all the valuevariables in GLAD
        local glad_valuevars :          char _dta[valuevars]
        local glad_onthefly_valuevars : char _dta[onthefly_valuevars]
        * Creates a union of both lists of valuevars
        local glad_vars : list glad_valuevars | glad_onthefly_valuevars

        * Loops through all glad_vars to read their clo_marker
        foreach var of local glad_vars {
          * Read the clo_marker and update the appropriate list
          local var_clo_marker : char `var'[clo_marker]
          if "`var_clo_marker'"=="number" local glad_number_vars `glad_number_vars' `var'
          if "`var_clo_marker'"=="factor" local glad_factor_vars `glad_factor_vars' `var'
          if "`var_clo_marker'"=="dummy"  local glad_dummy_vars  `glad_dummy_vars'  `var'
        }

        * Variables from GLAD that compose the indicators in CLO (may have pv ending, ie: hpro_read or hpro_read_01...05)
        * the list starts with only the dummy_vars, the most important indicator for calculating Learning Poverty
        local this_indicators_vars "`glad_dummy_vars'"

        * Given that calculating the indicators for score (ie: score_pirls_read_01...05, score_lleve_math)
        * takes a long time for pv assessments, only includes in the list of indicator_vars if explicitly set
        if `collapse_number_vars' == 1 {
          * Adds number_vars, such as score, to list of indicators
          local this_indicators_vars "`this_indicators_vars' `glad_number_vars'"
        }

        * Again, given that pv_collapsing factor variables takes a long time,
        * the option to do so for factor vars must be explicitly set
        * plus they must be transformed into dummies first
        if `collapse_factor_vars' == 1 {
          * Loop over factor variables, transforming them into dummies
          foreach factorvar of local glad_factor_vars {
            * Each factorvar become several dummies, corresponding to the marginal share of students in each level
            tab `factorvar', generate(`factorvar'd)

            * In case it's all missing values, no `factorvar'_d will be generated
            if `r(r)' == 0  clonevar `factorvar'd = `factorvar'

            * Tab, gen adds the number at the end of the varname,
            * but we would like it to be at the beginning
            rename `factorvar'd* d*`factorvar'

            * Keeps track of all factor_dummies created
            unab new_factor_dummy_vars : d*`factorvar'
            local glad_factor_dummy_vars "`glad_factor_dummy_vars' `new_factor_dummy_vars'"

            * Remove original factor var (keep only resulting dummies)
            drop `factorvar'
          }

          * Adds factor_vars, such as level - transformed into dummies, to list of indicators
          local this_indicators_vars "`this_indicators_vars' `glad_factor_dummy_vars'"
        }


        * Indicators in this CLO file (NO pv ending, ie: score_llece_read, score_pirls_read, hpro_read)
        * - if there are no pv endings, the same indicator_vars become the indicators
        if `pv_aggregate' == 0 local this_indicators "`this_indicators_vars'"
        * - if there are pv endings, we need to "dry" the list by removing pvs
        else if `pv_aggregate' == 1 {
          * Resets the list
          local this_indicators ""
          foreach indicator_var of local this_indicators_vars {
            * Remove the pv ending and update the list
            local indicator = substr("`indicator_var'",1,strlen("`indicator_var'")-3)
            local this_indicators `this_indicators' `indicator'
          }
          * Remove duplicates from the list
          local this_indicators : list uniq this_indicators
        }

        * Final variables in CLO, which are 'this_indicators' with prefixes added (ie: n_hpro_read, m_hpro_read, se_hpro_read)
        local final_vars ""
        * Loop over indicators that will be in this CLO
        foreach indicator of local this_indicators {
          * Update the list of the CLO vars we want to end up with in the end
          local final_vars "`final_vars' n_`indicator' m_`indicator' se_`indicator'"

          * Create list of variables related to THIS indicator
          if `pv_aggregate' == 0 		  cap ds `indicator'
          else if `pv_aggregate' == 1 cap ds `indicator'_??
          local `indicator'_pv_vars `r(varlist)'
        }


        *---------------
        * 3b) Prapare Trait vars

        * Generate vars with number of observation per subgroup
        bysort `id_groupvars': gen  n_total = _N
        local trait_n_vars "n_total"
        local traitgroups "all"
        foreach var of local trait_groupvars {
          bys `id_groupvars' : egen n_`var' = total(`var')
          local trait_n_vars `trait_n_vars' n_`var'

          * Indicators will be aggregates for all learners, and learners seperated into
          * binary categories like, urban and male. These are called "traits". This loop
          * creates a local will the variable suffixes for the levels the indicators will
          * be aggregated on, for example: all, male=0, male=1 etc.
          local traitgroups "`traitgroups' `var'0 `var'1"
        }

        * For each trait var (male, urban etc.) create one copy of the indicator variables
        * that only have values for each value 1 and 0 for that trait var. So for male
        * observations, create copy of the indicator where all observations for which male is not 1 are missing.
        foreach valuevar of local this_indicators_vars {
          foreach trait of local trait_groupvars {
            * Creates new variables for each factorial value of trait
            separate `valuevar', by(`trait') gen(`valuevar'_`trait')
          }
          * Order all values next to the indicator variable that has values for
          * all observations and give that variable the suffix "_all"
          order `valuevar'_*, after(`valuevar')
          rename `valuevar' `valuevar'_all
        }


        *-----------------------------------------------------------------------
        * 4) Calculate aggregate statistics by subgroup for CLO from GLAD
        *-----------------------------------------------------------------------

        * The GLAD data is micro data, meaning one observation per learner.
        * This section generates aggregated statisitcs from the microdata,
        * so that there is one value per country per grade.
        * For each trait group (e.g. all, male=1, male=0 etc.) the mean and
        * standard errors of the mean (se) are calculated, and the number of
        * observations in those calculations (N) is also recorded.

        *---------------
        * 4a) The simple case for assessments where plausible values does not exist

        if `pv_aggregate' == 0 {

          noi disp as txt "{phang}collapsing values...{p_end}"

          * Reset locals
          local meanvars 	""
          local sevars 	  ""
          local countvars ""

          * Generate the varnames that will be generated on all score variables
          foreach indicator of local this_indicators {
            foreach trait of local traitgroups {
              local meanvars 	"`meanvars'  m_`indicator'_`trait'  = `indicator'_`trait'"
              local sevars 	  "`sevars'    se_`indicator'_`trait' = `indicator'_`trait'"
              local countvars "`countvars' n_`indicator'_`trait'  = `indicator'_`trait'"
            }
          }

          * Generate all means, se and Ns
          collapse (mean) `meanvars'  (semean) `sevars' (count) `countvars' (max) `trait_n_vars' [aw=learner_weight], by(`id_groupvars') fast
        }

        *---------------
        * 4b) The advance case for assessments where plausible values are
        *     required to be used when calculating aggregated statistics

        else if `pv_aggregate' == 1 {

          * The aggragation using plausible values is done per country and grade

          * Create a variable 1,2,3 etc for each unique combination of values in id_groupvars
          egen id_combo = group(`id_groupvars'), lname(id_label)

          * Get a list of all combinations of countrycode and idgrade
          levelsof id_combo, local(id_combos)
          local    n_combos = `r(r)'
          * Local to keep track of how far in the loop one is
          local    i_combo = 1

          * Prepared file is saved (is re-opened after every combo pv-collapse)
          save "`temp_dir'/TEMP_`output_file'_prepv.dta", replace

          * Starts empty dataset into which all combo results will be appended
          touch "`temp_dir'/TEMP_`output_file'_aggregates.dta", replace


          * For each combination of countrycode and idgrade do a pv-collapse
          foreach  id_combo of local id_combos {

            * Starts fresh with the prepared file and keep only the combo of this iteration
            use "`temp_dir'/TEMP_`output_file'_prepv.dta", clear
            keep if id_combo == `id_combo'

            * Different grades had different replicate weights be sure to check this section
            * when including another year for this is only guaranteed for PASEC 2014
            if "`assessment'"=="PASEC" {
              if idgrade == 2	local pv_mode = "rw(weight_replicate1-weight_replicate45)" // for grade 2
              else            local pv_mode =	"rw(weight_replicate1-weight_replicate90)" // for all other grades, which is just grade 6
            }
            * For all othere assessments the settings are built into the command pv so pv_mode is the name of the assessment
            else local pv_mode = lower("`assessment'")

            * Displays progress of the combo loop within an assessment-year
            noi disp as txt "{phang2}pv aggregating on countrycode-grade `i_combo' of `n_combos' (id_combo=`: label id_label `id_combo'', assesment=`assessment', year=`year'){p_end}"

            * Loop over each indicator in this data set
            foreach indicator of local this_indicators {

              noi disp as txt "{phang2}indicator: `indicator'; pv-vars: ``indicator'_pv_vars'{p_end}"

              * Loop over each trait
              foreach subgroup in `traitgroups' {

                local pv_vars ""

                * Start by assuming that pv calculation is possible, but the
                * loop below test that assumtption and pv calulation is skipped
                * if no observations or missing weights which otherwise would
                * make the pv calculation crash
                local can_calculate_pv = 1
                foreach var of local `indicator'_pv_vars  {

                  sum `var'_`subgroup'

                  * PV not possible if no observation for this subgroup
                  if `r(N)'==0 local can_calculate_pv = 0

                  else {
                    * Loop over subgroup and test that there are weights, otherwise do not calculate
                    foreach weight in jkzone jkrep learner_weight {
                      sum `weight' if !missing(`var'_`subgroup')
                      if `r(mean)'==0   local can_calculate_pv = 0
                    }
                  }

                  * Generate a local of all variables that will go into this
                  local pv_vars `pv_vars' `var'_`subgroup'
                }

                * Only attempts to calculate pv if got the okay above
                if `can_calculate_pv' {

                  * Displays progress of a subgroup within a combo loop
                  noi disp as txt "{phang2}- calculating pv for subgroup=`subgroup'{p_end}"

                  * Syntax is slightly different for each assessment which is captured in the local pv_mode. For TIMSS
                  * and PIRLS, it's simply timss / pirls. For PASEC, it's the replicate weights, which are different by grade
                  pv, pv(`pv_vars') jkzone(jkzone) jkrep(jkrep) weight(learner_weight) jrr `pv_mode' : mean @pv [aw=@w]

                  * Create variables to store estimates (mean and std error of mean) and num of obs (N)
                  matrix pv_mean = e(b)
                  matrix pv_Var  = e(V)
                  gen  m_`indicator'_`subgroup'  = pv_mean[1,1]
                  gen  se_`indicator'_`subgroup' = sqrt(pv_Var[1,1])
                  gen  n_`indicator'_`subgroup'  = e(N)
                }

                * If skipped calculating pv because had missing values/weights
                else {
                  noi disp as txt "{phang2}- skipping pv for subgroup=`subgroup'{p_end}"
                  gen  m_`indicator'_`subgroup'  = .
                  gen  se_`indicator'_`subgroup' = .
                  gen  n_`indicator'_`subgroup'  = .
                }

              * Move to next subgroup (ie: all, male0, urban1)
              }
            * Move to the next indicator (ie: score_llece_math)
            }

            * Keep only one row per aggregration level
            keep if _n == 1

            * Append the results of this id group in the file where aggregates results are stored
            append using "`temp_dir'/TEMP_`output_file'_aggregates.dta"
            save "`temp_dir'/TEMP_`output_file'_aggregates.dta", replace

            * Increment the counter that displays progress
            local ++i_combo

          * Move to the next combo (countrycode * idgrade)
          }
        * Ends the pv case
        }


        *---------------------------------------------------------------------------
        * 5) Revert the wide to long in subgroups
        *---------------------------------------------------------------------------

        * Reshape data so that there is one row per country per grade per trait
        * groups (for example: all, male=1, male=0 etc.). Previously there was one
        * row per country and grade and the trait groups were in multiple variables
        reshape long `final_vars', i(`id_groupvars') j(subgroup) string

        * Cleaning the subgroup strings, to make them more readeable
        replace subgroup = subinstr(subgroup, "_" , "", 1)
        foreach trait of local trait_groupvars {
          replace subgroup = subinstr(subgroup, "`trait'", "`trait'=", 1)
        }


        * Beautify CLO (labels lost after collapse)
        order `id_groupvars' subgroup
        label var subgroup "Subgroups of `id_groupvars'"
        label var n_total  "# learners, by `id_groupvars'"
        format %10.0fc n_total

        foreach trait of local trait_groupvars {
          label var n_`trait' "# `trait' learners, by `id_groupvars'"
          format %10.0fc n_`trait'
        }

        foreach var of local this_indicators {
          label var m_`var'  "Mean of `var'"
          label var se_`var' "Standard error of m_`var'"
          label var n_`var'  "Number of observations used to calculate m_`var'"
          format %10.4f  m_`var' se_`var'
          format %10.0fc n_`var'
        }

        * We can safely drop n_d*_level_assessment_subject variables
        * for it's equal to the n_score_assessment_subject, thus redundant
        if `collapse_factor_vars' == 1 {
          foreach indicator of local this_indicators {
            * If the indicator is part of the factor dummy vars
            if strpos("`glad_factor_dummy_vars'", "`indicator'") > 0 {
              * Get rid of the n_ for each dummy
              local get_rid_off  "n_`indicator'"
              drop `get_rid_off'
              * Update local with final vars to drop the others
              local final_vars : list final_vars - get_rid_off              
            }
          }
        }
        
        * Keep only variables that are now relevant and order the variables intuitively
        local  orderkeepvars `id_groupvars' subgroup `final_vars' `trait_n_vars'
        keep  `orderkeepvars'
        order `orderkeepvars'


        *---------------------------------------------------------------------------
        * 6) Save CLO dta and generate documentation
        *---------------------------------------------------------------------------
        * Erase _dta chars, so nothing old (from GLAD and reshapes) is left behind
        local chars_to_clean: char _dta[]
        foreach c in `chars_to_clean' {
          char _dta[`c']
        }

        * This function compresses the dataset, adds metadata passed in the arguments as chars, save CLO.dta
        edukit_save, filename("`output_file'") path("`output_dir'")  dir2delete("`temp_dir'")  ///
                     idvars("`id_groupvars' subgroup") ///
                     varc("value `final_vars'; trait `trait_n_vars'") ///
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
      if `generate_documentation'==1 {
        cd "${clone}/00_documentation"
        local md_output_file = strlower("`output_file'")
        noi disp as txt "Documentation of `output_file'.dta being processed" _newline
        noi dyntext "dyntext_CLO.txt", saving("${clone}/00_documentation/`md_output_file'.md") replace
      }

      * Line to include in the log file so we can keep track of how long tasks take
      local str_to_log_`i_log' = "{phang}... saved `output_file'.dta at $S_TIME{p_end}"
      local ++i_log

  * Ends condition to only run survey if .do existed
  }
* Move to the next survey
}

*-------------------------------------------------------------------------------
* Creates log with timestamps in documentation folder
*-------------------------------------------------------------------------------
* Final strings to log, wrt to documentation
if `generate_documentation'==1  local str_to_log_`i_log' = "All CLO datasets were generated, with corresponding markdown documentation."
else                            local str_to_log_`i_log' = "All CLO datasets were generated, without documentation (only available for Stata version>=15)."

* Creates a log with what was saved in str_to_log (list of generated dtas with timestamps)
log using "${output}/0221_create_CLOs_`today'_`time'_runswitch$run_switch.log", replace name("Indicators")

* Display all that was saved in str_to_log_*
forvalues j = 1(1)`i_log' {
  noi disp as res "`str_to_log_`j''"
}

log close _all
*-------------------------------------------------------------------------------