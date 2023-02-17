*==============================================================================*
*!  PROGRAM: CREATE CLO (COUNTRY LEVEL OUTCOMES) FROM GLAD MICRODATA
*!  Project information at: https://github.com/worldbank/GLAD
*!  Joao Pedro Azevedo, EduAnalytics   version 1.3.1  6fev2022
*      accept different types of missing values. This is required for PISA.
*  Joao Pedro Azevedo, EduAnalytics   version 1.3     3fev2022
*      Fix pv_mode option for TIMSS 2019. Pre-existing condition was creating
*      and error with the PASEC 2019 condition. Use 'inlist' for more robust 
*      code.
*  Ahmed Raza, EduAnalytics   version 1.2.1     3fev2022
*      Delete observatiosn with missing data
*  Diana Goldemberg, EduAnalytics   version 1.2   3set2020
*==============================================================================*

/* The use case of this program is:
    a GLAD_ALL.dta file is open and needs to be "collapsed" into a CLO.dta
    Note: opening the GLAD file and saving the CLO file are NOT in this program

   Steps:
   0) Error checking on passed (and implied) options
   1) Prepare list of variables to be aggregated in indicators in CLO
   2) Structure GLAD dataset as wide to prepare for collapse
   3) Aggregate statistics by group-subgroup (pv or not pv)
   4) Revert the wide to long in subgroups

*/

cap program drop glad_microdata_to_clo
program  define  glad_microdata_to_clo, rclass

  version 17

  syntax, ASSessment(string) Year(int) GROUPS(varlist) [SUBgroups(varlist)] ///
         [DUMMY_vars(varlist)] [FACTOR_vars(varlist)] [NUMBER_vars(varlist)]

  local syntaxerror 2222

  quietly {

    *---------------------------------------------------------------------------
    * 0) Error checking on passed (and implied) options
    *---------------------------------------------------------------------------

    * Though those were allowed as program options, it would be unusual
    * to have anything different from group(countrycode idgrade)
    * and subgroup(male urban)
    local id_groupvars      = "`groups'"
    local trait_groupvars   = "`subgroups'"
    //local id_groupvars    = "countrycode idgrade"
    //local trait_groupvars = "male urban"

    * In particular, if subgroup vars are not dummies, we have a problem.
    if "`subgroups'" != "" {
      foreach trait of varlist `trait_groupvars' {
        cap assert inlist(`trait', 0, 1, 2, 3, 4, 5, ., .a, .b, .c)
        if _rc {
          noi disp as err "{phang}only dummy variable can be transformed in subgroups, and you passed {it: subgroups(`trait')}{p_end}"
          exit `syntaxerror'
        }
      }
    }

    * Set which type of mean aggregation depending on which assessment or year,
    * and give an error if none is explicitly defined
   if inlist("`assessment'", "LLECE", "SACMEQ") local pv_aggregate = 0
    else if "`assessment'" == "PASEC" & `year' == 1996   local pv_aggregate = 0
	else if "`assessment'" == "LLECE-T" & `year' == 2013 local pv_aggregate = 0 
    else if ("`assessment'" == "PASEC") & inlist(`year', 2014, 2019) {
      local pv_aggregate = 1
      * pv_mode are options on the pv command that will be used later on
      local pv_mode = "rw(weight_replicate*)"
    }
	
    else if inlist("`assessment'", "PIRLS", "TIMSS", "SEA-PLM", "SEAPLM", "AMPLB") {
      local pv_aggregate = 1
      local pv_mode = lower("`assessment'")
    }
	else if ("`assessment'" == "LLECE-T") & `year' == 2019  local pv_aggregate = 1
    else if "`assessment'" == "PISA" & `year' >= 2000 local pv_aggregate = 1
    else {
      noi disp as err "{phang}the routine is not well defined for `assesment' `year'.{p_end}"
      exit `syntaxerror'
    }



    * Each GLAD file has value variables that are factors (level_*),
    * numbers (score_* fgt1_* fgt2_*) and dummies (bmp_* sdg411_*). Generating a CLO with only the
    * number_vars is much faster and enough for Leaning Poverty (but incomplete)

    * At least one of the variable types must be specified
    if "`factor_vars'" == "" & "`number_vars'" == "" & "`dummy_vars'" == "" {
      noi disp as error `"{phang}You must specify some variables in {it: dummy_vars, factor_vars or number_vars}{p_end}"'
      exit `syntaxerror'
    }


    *---------------------------------------------------------------------------
    * 1) Prepare list of variables to be aggregated in indicators in CLO
    *---------------------------------------------------------------------------

    * Factor vars (ie: level_pirls_read) cannot be directly collapsed,
    * it first must be transformed into dummies (ie: d1_level_pirls_read)
    if "`factor_vars'" != "" {

      * Placeholder for a list of dummies being created from factor_vars
      local factor_dummy_vars ""

      * Loop over factor variables, transforming them into dummies
      foreach factor_var of local factor_vars {

        * Each factorvar become several dummies, corresponding to the marginal share of students in each level
        tab `factor_var', generate(`factor_var'd)

        * In case it's all missing values, no `factorvar'_d will be generated
        if `r(r)' == 0  clonevar `factor_var'd = `factor_var'

        * Tab, gen adds the number at the end of the varname,
        * but we would like it to be at the beginning
        rename `factor_var'd*  d*`factor_var'

        * Keeps track of all factor_dummies created
        unab new_factor_dummy_vars : d*`factor_var'
        local factor_dummy_vars "`factor_dummy_vars' `new_factor_dummy_vars'"

        * Remove original factor var (keep only resulting dummies)
        drop `factor_var'
      }
    }

    * List of variables to be aggregated in indicators in CLO
    local this_indicators_vars "`number_vars' `dummy_vars' `factor_dummy_vars'"


    * Indicators in this CLO file (NO pv ending, ie: score_llece_read, score_pirls_read, bmp_read)
    * - if there are no pv endings, the same indicator_vars become the indicators
    if `pv_aggregate' == 0 local this_indicators "`this_indicators_vars'"

    * - if there are pv endings, we need to "dry" the list by removing pvs
    else if `pv_aggregate' == 1 {

      * Resets the list
      local this_indicators ""

      foreach indicator_var of local this_indicators_vars {

        * Remove the pv ending and update the list
        local indicator = substr("`indicator_var'", 1, strlen("`indicator_var'")-3)
        local this_indicators `this_indicators' `indicator'

      }

      * Remove duplicates from the list
      local this_indicators : list uniq this_indicators
    }

    * Final variables in CLO, which are 'this_indicators' with prefixes added (ie: n_sdg411_read, m_sdg411_read, se_sdg411_read)
    local final_vars ""

    * Loop over indicators that will be in this CLO
    foreach indicator of local this_indicators {

      * Update the list of the CLO vars we want to end up with in the end
      local final_vars "`final_vars' n_`indicator' m_`indicator' se_`indicator'"

    }

    *---------------------------------------------------------------------------
    * 2) Structure GLAD dataset as wide to prepare for collapse
    *---------------------------------------------------------------------------

    noi disp as txt "{phang}structuring the GLAD input...{p_end}"

    * The dataset is long on id_groupvars already
    * But it needs to be made wide on trait_groupvars

    * Generate vars with number of observation per subgroup
    * that is n_total, n_urban, n_male
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
      local traitgroups "`traitgroups' `var'0 `var'1 `var'2 `var'3 `var'4 `var'5"
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
      if "`subgroups'" != ""  order `valuevar'_*, after(`valuevar')
      rename `valuevar' `valuevar'_all
    }


    *-----------------------------------------------------------------------
    * 3) Aggregate statistics by group-subgroup (pv or not pv)
    *-----------------------------------------------------------------------

    * The GLAD data is micro data, meaning one observation per learner.
    * This section generates aggregated statistics from the microdata,
    * so that there is one value per group(countrycountry idgrade),
    * for each subgroup (e.g. all, male=1, male=0, urban=1, etc.) the mean and
    * standard errors of the mean (se) are calculated, and the number of
    * observations in those calculations (N) is also recorded.

    *---------------

    * The aggragation using plausible values is done per combo of whichever vars
    * were passed in -groups- option (usually, countrycode and idgrade)

    * Create a variable 1,2,3 etc for each unique combination of values in id_groupvars
    egen id_combo = group(`id_groupvars'), lname(id_label)

    * Get a list of all combinations of countrycode and idgrade
    levelsof id_combo, local(id_combos)
    local    n_combos = `r(r)'
    * Local to keep track of how far in the loop one is
    local    i_combo = 1

    * Prepared file is preserved (restored after every combo calculation)
    * note: frames would be faster but Stata v16 is required
    preserve

      * Starts empty dataset into which all combo results will be appended
      clear
      tempfile TEMP_aggregates
      save `TEMP_aggregates', replace emptyok

    * Back to the prepared file
    restore

    * For each combination of countrycode and idgrade do a pv-collapse
    foreach  id_combo of local id_combos {

      * Preserve the prepared file again before keep the combo of this iteration
	  
      preserve
	  
        keep if id_combo == `id_combo'

        * Displays progress of the combo loop within an assessment-year
        noi disp as txt "{phang}aggregating on combo `i_combo' of `n_combos' (`assessment' `year' `: label id_label `id_combo''){p_end}"

        * Exception for PASEC 2014 or 2019: replicate weights are grade-specific
        * and having weight variables entirely missing is an issue with pv
		* problem found in IDGRADE=2
        if "`assessment'" == "PASEC" & (`year' == 2014 | `year' == 2019) {
          foreach wgt_var of varlist weight_replicate* {
            capture assert missing(`wgt_var')
            if !_rc  drop `wgt_var'
          }
        }
		
        * Loop over each indicator in this dataset
        foreach indicator of local this_indicators {

          * Displays progress of an indicator within a combo loop
          * but only if pv_aggregate is on (the slow case)
          if `pv_aggregate' noi disp as txt "{phang2}indicator: `indicator'{p_end}"

          * Loop over each trait subgroup
          foreach subgroup in `traitgroups' {

            //* Displays progress of a subgroup within a combo loop
            //* but only if pv_aggregate is on (the slow case)
            //if `pv_aggregate' noi disp as txt "{phang2}- calculating for subgroup = `subgroup'{p_end}"

            * Placeholders for what will be calculated in this loop iteration
            gen  m_`indicator'_`subgroup'  = .
            gen  se_`indicator'_`subgroup' = .
            gen  n_`indicator'_`subgroup'  = .

            *---------------
            * 3a) The simple case for assessments where plausible values does not exist
            if `pv_aggregate' == 0 {

              * LLECE is a special case because it has different weights by subject
              * so we will need to re-set the svyset according to the indicator
              if "`assessment'" == "LLECE" {

                * Assume the indicator should be calculater with questionnaire weights
                * Unless it contains a specific subject in its name
                local indicator_wgt "learner_weight_quest"
                foreach subject in read math science {
                  if strpos("`indicator'", "`subject'") != 0 local indicator_wgt "learner_weight_`subject'"
                }

                * (re)set the survey with the weights of this subject
                svyset idschool [pw = `indicator_wgt'], strata(strata) || _n
              }

              * Check if there is any svyset defined for this svy
              svyset

              * If no svyset is defined, do it with summarize
              if "`r(settings)'" == ", clear" {

                capture summarize `indicator'_`subgroup' [aw = learner_weight]

                * If summarize successed, store the estimates over the placeholders
                if _rc == 0 & r(N) > 0 {
                  replace m_`indicator'_`subgroup'  = r(mean)
                  replace se_`indicator'_`subgroup' = r(sd)/sqrt(r(N))
                  replace n_`indicator'_`subgroup'  = r(N)
                }

              }

              * If some svyset is defined, use it to summarize
              else {

                * Store svyset parameters
                local psu      "`r(su1)'"
                local strata   "`r(strata1)'"
                local wvar     "`r(wvar)'"

                capture svy: mean `indicator'_`subgroup'

                * If svy mean succeed, store the estimates over the placeholders
                if _rc == 0 {
                  matrix svy_mean = e(b)
                  matrix svy_Var  = e(V)
                  * The 3 variables (mean, se_mean, N) we care about
                  replace m_`indicator'_`subgroup'  = svy_mean[1,1]
                  replace se_`indicator'_`subgroup' = sqrt(svy_Var[1,1])
                  replace n_`indicator'_`subgroup'  = e(N)

                  * Also note the number of PSU and Strata used
                  local n_mean = e(N)
                  local psu_mean = e(N_psu)
                  local strata_mean = e(N_strata)

                  * If the se_mean was not calculated because some strata had a single PSU
                  if sqrt(svy_Var[1,1]) == 0 & svy_mean[1,1] != 0 {

                    * Create a dummy that tells which observations should be included in se_mean
                    gen valid = (!missing(`indicator'_`subgroup') & !missing(`wvar'))
                    bys valid `strata' `psu' : gen unique_psu_in_strata = (_n == 1)
                    bys valid `strata' : egen n_psu_in_strata = sum(unique_psu_in_strata)
                    gen byte include_for_se = (valid == 1 & n_psu_in_strata > 1)

                    * Repeat the estimate with less observations, to record the se_mean
                    svy : mean `indicator'_`subgroup' if include_for_se
                    matrix svy_Var  = e(V)
                    replace se_`indicator'_`subgroup' = sqrt(svy_Var[1,1])

                    * Note how many obs/psu/strata were ignored
                    local dropped_n = `n_mean' - e(N)
                    local dropped_psu = `psu_mean' - e(N_psu)
                    local dropped_strata = `strata_mean' - e(N_strata)
                    local dropped_note "Dropped: `dropped_n' obs in `dropped_psu' PSU in `dropped_strata' strata"
                    noi disp as err "{phang2}`dropped_note' (`indicator'_`subgroup'){p_end}"

                    * Drop variables created just for the se_mean calculation
                    drop valid unique_psu_in_strata n_psu_in_strata include_for_se
                  }

                }

              }

            * End non-pv case
            }


            *---------------
            * 3b) The advance case for assessments where plausible values are
            *     required to be used when calculating aggregated statistics
            if `pv_aggregate' == 1 {

              * The pv calculation may crash if no observations or missing weights
              * which is why we add a capture

              * Syntax is slightly different for each assessment which is captured in the local pv_mode. For TIMSS
              * and PIRLS, it's simply timss / pirls. For PASEC, it's the replicate weights, which are different by grade
			  
              if "`assessment'" == "PISA" & `year' == 2000 {
                foreach subject in read math science {
                  if strpos("`indicator'","`subject'") != 0  local subj = "`subject'"
                }
                foreach sub of local subj {
                  gen learner_weight = learner_weight_`sub'
                  forvalues i = 1/80 {
                    gen weight_replicate_`i' = weight_replicate`i'_`sub'
                  }
                }
                capture pv, pv(`indicator'_??_`subgroup') brr weight(learner_weight) fays(0.5) rw(weight_replicate_*) : mean @pv [aw=@w]
                drop learner_weight
                drop weight_replicate_*
              }
			  
			  else if "`assessment'" == "PISA" & `year' != 2000 {
                capture pv, pv(`indicator'_??_`subgroup') brr weight(learner_weight) fays(0.5) rw(weight_replicate*) : mean @pv [aw=@w]
              }
				
			  else if "`assessment'" == "SEA-PLM" {
                capture pv, pv(`indicator'_??_`subgroup') brr weight(learner_weight) fays(0.5) rw(weight_replicate*) : mean @pv [aw=@w]
			  } 
			  
			  else if "`assessment'" == "AMPLB" & `year' == 2021 {
                capture pv, pv(`indicator'_??_`subgroup') brr weight(learner_weight) fays(0.5) rw(weight_replicate*) : mean @pv [aw=@w]
              }
              else if "`assessment'" == "AMPLB" & `year' == 2019 & (countrycode == "BDI" | countrycode == "KEN" | countrycode == "ZMB") {
				capture pv, pv(`indicator'_??_`subgroup') brr weight(learner_weight) fays(0.5) rw(weight_replicate1-weight_replicate216) : mean @pv [aw=@w]
			  }
              else if "`assessment'" == "AMPLB" & `year' == 2019 & (countrycode == "SEN") {
				capture pv, pv(`indicator'_??_`subgroup') brr weight(learner_weight) fays(0.5) rw(weight_replicate1-weight_replicate178) : mean @pv [aw=@w]
			  }
			  else if "`assessment'" == "AMPLB" & `year' == 2019 & (countrycode == "CIV") {
				capture pv, pv(`indicator'_??_`subgroup') brr weight(learner_weight) fays(0.5) rw(weight_replicate1-weight_replicate175) : mean @pv [aw=@w]
			  }
			  else if "`assessment'" == "AMPLB" & `year' == 2019 & countrycode == "BFA" {
				capture pv, pv(`indicator'_??_`subgroup') brr weight(learner_weight) fays(0.5) rw(weight_replicate*) : mean @pv [aw=@w]
			  }
			  
			  else if "`assessment'" == "LLECE-T" & `year' == 2019 {
				capture pv, pv(`indicator'_??_`subgroup') brr weight(learner_weight) fays(0.5) rw(weight_replicate*) : mean @pv [aw=@w]
			  }
			  
			  else {
                capture pv, pv(`indicator'_??_`subgroup') jkzone(jkzone) jkrep(jkrep) weight(learner_weight) jrr `pv_mode' : mean @pv [aw=@w]
              }

              * If pv successed, store the estimates over the placeholders
              if _rc == 0 {
                matrix pv_mean = e(b)
                matrix pv_Var  = e(V)
                replace m_`indicator'_`subgroup'  = pv_mean[1,1]
                replace se_`indicator'_`subgroup' = sqrt(pv_Var[1,1])
                replace n_`indicator'_`subgroup'  = e(N)
              }
            * End pv case
            }
          * Move to next subgroup (ie: all, male0, urban1)
          }
        * Move to the next indicator (ie: score_llece_math)
        }

        * Keep only one row per aggregration level
        keep if _n == 1

        * Append the results of this id group in the file where aggregates results are stored
        append using `TEMP_aggregates'
        save `TEMP_aggregates', replace

      * Back to file preserved in memory with all combos
      restore

      * Increment the counter that displays progress
      local ++i_combo

    * Move to the next combo (countrycode * idgrade)
    }


    *---------------------------------------------------------------------------
    * 4) Revert the wide to long in subgroups
    *---------------------------------------------------------------------------
    * Back to the file with aggregate results
    use `TEMP_aggregates', clear

    * Reshape data so that there is one row per country per grade per trait
    * groups (for example: all, male=1, male=0 etc.). Previously there was one
    * row per country and grade and the trait groups were in multiple variables
    reshape long `final_vars', i(`id_groupvars') j(subgroup) string

    * Cleaning the subgroup strings, to make them more readeable
    replace subgroup = subinstr(subgroup, "_" , "", 1)
    foreach trait of local trait_groupvars {
      replace subgroup = "`trait'=0" if subgroup == "`trait'0"
      replace subgroup = "`trait'=1" if subgroup == "`trait'1"
      replace subgroup = "`trait'=2" if subgroup == "`trait'2"
      replace subgroup = "`trait'=3" if subgroup == "`trait'3"
      replace subgroup = "`trait'=4" if subgroup == "`trait'4"
      replace subgroup = "`trait'=5" if subgroup == "`trait'5"
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
    if "`factor_vars'" != "" {
      foreach indicator of local this_indicators {
        * If the indicator is part of the factor dummy vars
        if strpos("`factor_dummy_vars'", "`indicator'") > 0 {
          * Get rid of the n_ for each dummy
          local get_rid_off  "n_`indicator'"
          drop `get_rid_off'
          * Update local with final vars to drop the others
          local final_vars : list final_vars - get_rid_off
        }
      }
    }

    * Include the assessment and year in the final dataset just in case
    gen strL assessment = "`assessment'"
    gen int year = `year'
    label var assessment "Assessment"
    label var year "Year of assessment"

    * Keep only variables that are now relevant and order the variables intuitively
    local  orderkeepvars assessment year `id_groupvars' subgroup `final_vars' `trait_n_vars'
    keep  `orderkeepvars'
    order `orderkeepvars'

    noi disp as res "{phang}done{p_end}"

    * Return metadata about the final file in an integrated way for edukit_save
    return local idvars "assessment year `id_groupvars' subgroup"
    return local valuevars "`final_vars'"
    return local traitvars "`trait_n_vars'"

  }
  
  
   * This removes missing values from the final dataset. 
   tempvar rmiss 
   egen `rmiss' = rowmiss( n_* m_* se_*)
   sum `rmiss'
   local max = r(max)
   drop if `rmiss' == `max'
  
   
end