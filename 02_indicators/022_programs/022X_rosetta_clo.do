*! CLO for LLECE and PASEC using Rosetta thresholds from Patel & Sandefur
*  https://www.cgdev.org/blog/rosetta-stone-comparing-test-scores-around-world-and-across-global-income-distribution
*  Diana G., Oct 2020

whereis github
global lpclone "`r(github)'/LearningPoverty-Production/"
global clone "`r(github)'/GLAD-Production/"

do "${clone}/profile_GLAD-Production.do"

edukit_datalibweb, d(country(SSA) year(2014) type(GLAD) surveyid(PASEC) mod(ALL))

foreach pv in 01 02 03 04 05 {
	gen byte hpro_read_`pv' = (score_pasec_read_`pv' >= 476) 
}

noisily glad_microdata_to_clo, ass(PASEC) year(2014) ///
        groups(countrycode idgrade) dummy_vars(hpro_*)
          
save "${clone}/02_indicators/023_outputs/clo_pasec_2014_rosetta.dta", replace


foreach year in 2006 2013 {
  edukit_datalibweb, d(country(LAC) year(`year') type(GLAD) surveyid(LLECE) mod(ALL))

  gen byte hpro_read = (score_llece_read >= 649) 

  noisily glad_microdata_to_clo, ass(LLECE) year(`year') ///
          groups(countrycode idgrade) dummy_vars(hpro_*)
            
  save "${clone}/02_indicators/023_outputs/clo_llece_`year'_rosetta.dta", replace
}


use "${clone}/02_indicators/023_outputs/clo_pasec_2014_rosetta.dta", clear
append using "${clone}/02_indicators/023_outputs/clo_llece_2006_rosetta.dta"
append using "${clone}/02_indicators/023_outputs/clo_llece_2013_rosetta.dta"

gen bmp_rosetta = 100*(1 - m_hpro_read)
keep assessment year countrycode idgrade bmp_rosetta 
rename year year_assessment
compress

drop if idgrade == 3 & assessment == "LLECE"
drop if idgrade == 2 & assessment == "PASEC"

save "${clone}/02_indicators/023_outputs/bmp_rosetta.dta", replace

use "${lpclone}/01_data/013_outputs/rawlatest.dta", clear
rename test assessment
merge 1:1 countrycode assessment year_assessment using "${clone}/02_indicators/023_outputs/bmp_rosetta.dta", keep(master match) gen(m_rosetta)

drop *_fe *_ma
drop fgt*
drop se_*
drop preference_description

rename nonprof_all bmp
rename adj_nonprof_all lpv
rename enrollment_all enroll

gen oos = 100 - enroll
gen lpv_rosetta = oos + (bmp_rosetta*enroll/100)

order countrycode lpv* bmp* oos enroll

format %3.1fc lpv-enroll

list countrycode-oos if inlist(assessment, "LLECE", "PASEC")