*==============================================================================*
* PROGRAM: HARMONIZATION OF PROFICIENCY ON THE FLY (THRESHOLDS AS CPI IN GMD)
* Project information at: https://github.com/worldbank/GLAD
* Author: Diana Goldemberg
*==============================================================================*

/* The use case of this program is: GLAD.dta have valuevars score_* and level_*
   stored in them. But the harmonization, according to proficiency thresholds,
   is done 'on the fly', like the CPI adjusts in the GMD collection.

   That is, datalibweb has the GLAD microdata stored without the harmonization,
   and whenever a file is queried, the harmonization thresholds are merged
   on the fly and the proficiency dummies are calculated.
*/

cap program drop glad_hpro_as_cpi
program  define  glad_hpro_as_cpi, rclass

  syntax ,

  * Brings thresholds triplets defined in dta which should sit in DLW (our version of CPI.dta)
  merge m:1 surveyid idgrade using "${clone}/01_harmonization/011_rawdata/lp_thresholds_as_cpi.dta", keep(match) gen(merge_thresholds)
  * This merge should have an assert, but we want a more informative error message, thus we do it manually
  cap assert inlist(merge_thresholds, 2 , 3)  // equivalent to assert(match using)
  if _rc {
    noi di as error "{pstd}New surveys have been added to the GLAD collection, but not to the thresholds_as_cpi file in 011_raw_data. Please add the appropriate surveys in for the following cases:{p_end}"
    noi tab surveyid idgrade if merge_thresholds == 1
    error 2222
  }
  * Drop the merge_thresholds variables after the assert
  drop merge_thresholds

  * Each prefix_threshold is a triplet: prefix_threshold_var, prefix_threshold_val, prefix_threshold_res

  * Loop through all threshold triplets (specifically, prefix_threshold_res but could be val or var)
  ds *_threshold_res
  foreach threshold_res of varlist `r(varlist)' {

    local this_prefix = subinstr("`threshold_res'", "_threshold_res", "", 1)

    * Check if this_prefix was used for this assessment-year, or has all missing obs
    count if missing(`threshold_res')
    if `r(N)'<_N {
      * Not all observations are missing

      * Concatenate list of prefixes used
      local prefixes = "`prefixes' `this_prefix'"

      * Concatenate list of results to be created, in two steps
      * 1. loop through all results used in a prefix
      levelsof `threshold_res', local(resultvars_in_prefix)
      foreach resultvar of local resultvars_in_prefix {

        * 2. Update the list of results (unique entries only)
        local resultvars : list resultvars | resultvar
      }
    }

    else {
      * All observations are missing
      * Drop the threshold triplet, for it was not used at all
      drop `this_prefix'_threshold_*
    }

  }

  * Value labels for dummy variables of Harmonized Proficiency
  label define lb_hpro 0 "Non-proficient" 1 "Proficient" .a "Missing score/level" .b "Non-harmonized grade", replace

  * Generate all result variables as dummies which start empty
  * (labeled as if this grade was not being harmonized)
  foreach resultvar of local resultvars {
    gen byte  `resultvar': lb_hpro = .b
    label var `resultvar' "Harmonized proficiency (subject-specific)"
    char `resultvar'[clo_marker] "dummy"
  }


  * Loop through all prefixes
  foreach prefix of local prefixes {

      * Retrieves list of variables used in the current prefix_threshold_var
      levelsof `prefix'_threshold_var, local(originalvars_used_in_prefix)

      * Loop through all variables used in the current prefix,
      * and performs the calculation based on it
      foreach originalvar of local originalvars_used_in_prefix {
        foreach resultvar of local resultvars {

          * Calculate the harmonized proficiency dummy, for example:
          * resultvar is hpro_read and originalvar is level_llece_read
          replace `resultvar' = (`originalvar'>=`prefix'_threshold_val) if `prefix'_threshold_res == "`resultvar'" & `prefix'_threshold_var=="`originalvar'" & !missing(`originalvar')

          * Case of missing test score or test level
          replace `resultvar' = .a if `prefix'_threshold_res == "`resultvar'" & `prefix'_threshold_var == "`originalvar'" & missing(`originalvar')
      }
    }
  }

  * When this ado is called, a GLAD.dta is open and it should already
  * have the metadata as standardized in the collection. This adds more:
  char _dta[onthefly_valuevars] "`resultvars'"
  * Unabbreviate wildcards* in the threshold triplets variables
  cap unab thresholdvars : *_threshold_var *_threshold_val *_threshold_res
  if _rc == 111 noi disp as err "No harmonized minimum proficiency thresholds defined for this learning assessment."
  else          char _dta[onthefly_traitvars] "`thresholdvars'"

end
