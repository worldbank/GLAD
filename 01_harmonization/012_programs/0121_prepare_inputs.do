*==============================================================================*
* SUBTASK 0121: PREPARE INPUTS FOR GLADS (MASTER CNTRY LIST & THRESHOLDS)
* Project information at: https://github.com/worldbank/GLAD
* Author: Diana Goldemberg
*==============================================================================*

qui {

* Both CSVs handled in this do are master files that will be filtered within
* each GLAD.do for only the specific assesment-year being manipulated

*-------------------------------------------------------------------------------
* Master country list by assessment-year
*-------------------------------------------------------------------------------
* Reads .csv which has one observation for each idcntryraw-assessment-year (tracked in Github)
import delimited using "${clone}/01_harmonization/011_rawdata/master_countrycode_list.csv", varnames(1) encoding("utf-8") clear

* Label all variables
label var countrycode    "WB country code (3 letters)"
label var national_level "Idcntry_raw is a national level"
* Most assessments use a numeric idcntry_raw but a few (ie: PASEC 1996) have instead idcntry_raw_str
label var use_idcntry_raw_str "Indicator for idcntry_raw is saved as string"

* Double checks that each assessment-year is consistently filled in this information,
* that is, all values are always 1 or always 0 for a given assessment-year
bysort region year assessment use_idcntry_raw_str: egen mean_dummy = mean(use_idcntry_raw_str)
by     region year assessment use_idcntry_raw_str: egen sd_dummy   = sd(use_idcntry_raw_str)
assert (mean_dummy==0 | mean_dummy==1) & (sd_dummy == 0 | missing(sd_dummy))
drop   *_dummy

* Saves master .dta (not tracked in GitHub)
compress
save "${clone}/01_harmonization/011_rawdata/master_countrycode_list.dta", replace
*-------------------------------------------------------------------------------


*-------------------------------------------------------------------------------
* Harmonized proficiency thresholds by assessments TODO: MOVE TO DATALIBWEB
*-------------------------------------------------------------------------------
* Reads .csv which has thresholds for each assessment-year-grade (tracked in Github)
import delimited using "${clone}/01_harmonization/011_rawdata/lp_thresholds_as_cpi.csv", varnames(1) encoding("utf-8") clear

* This file has triplets of *_threshold_var, *_threshold_val, *_threshold_res

* Loop through all the threshold triplets, labeling them
ds   *_threshold_var
foreach threshold of varlist `r(varlist)' {
  * Extracts the prefix in the variable and store in a local
  local prefix = subinstr("`threshold'", "_threshold_var", "", 1)
  * Label the threshold_var variable into the dta
  label var `prefix'_threshold_var "Threshold variable for harmonized proficiency (`prefix')"
  * Label the corresponding threshold_val variable, which also ensures it does exist
  label var `prefix'_threshold_val "Threshold value for harmonized proficiency (`prefix')"
  // Label the corresponding threshold_val variable, which also ensures it does exist
  label var `prefix'_threshold_res "Threshold resulting variable for harmonized proficiency (`prefix')"
}

* Also label the id variables
label var surveyid "Survey ID (Region_Year_Assessment)"
label var idgrade  "Grade ID"

* Save master .dta which will sit in DLW and be merged on the fly when querying a GLAD file
compress
save "${clone}/01_harmonization/011_rawdata/lp_thresholds_as_cpi.dta", replace
* TODO: THIS FILE NEED TO BE COPIED TO DLW ROOT LATER!
*-------------------------------------------------------------------------------

}
