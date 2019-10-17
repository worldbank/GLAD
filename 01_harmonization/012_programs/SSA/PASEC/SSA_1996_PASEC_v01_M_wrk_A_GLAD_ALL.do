*=========================================================================*
* GLOBAL LEARNING ASSESSMENT DATABASE (GLAD)
* Project information at: https://github.com/worldbank/GLAD
*
* Metadata to be stored as 'char' in the resulting dataset (do NOT use ";" here)
local region      = "SSA"
local year        = "1996"
local assessment  = "PASEC"
local master      = "v01_M"
local adaptation  = "wrk_A_GLAD"
local module      = "ALL"
local ttl_info    = "Joao Pedro de Azevedo [eduanalytics@worldbank.org]"
local dofile_info = "last modified by Diana Goldemberg in October 8, 2019"
*
* Steps:
* 0) Program setup (identical for all assessments)
* 1) Open all rawdata, lower case vars, save in temp_dir
* 2) Combine all rawdata into a single file (merge and append)
* 3) Standardize variable names across all assessments
* 4) ESCS and other calculations (by Aroob, from Feb 2019)
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

    // Filter the master country list to only this assessment-year
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
    foreach prefix in back_05_2006_02_9 back_05_2006_05_9 {
      if `from_datalibweb'==1 {
        noi edukit_datalibweb, d(country(`region') year(`year') type(EDURAW) surveyid(`surveyid') filename(`prefix'.dta) `shortcut')
      }
      else {
        use "`input_dir'/`prefix'.dta", clear
      }
      // Original dataset `back_05_2006_05_9' has both the variables: INI5F_AN and ini5f_an
      cap rename INI5F_AN INI5F_AN_UPPER
      // Usual rename all to lower
      rename *, lower
      // Original dataset had Senegal written in 3 ways
      replace pays = "Senégal" if (pays=="Senegal" | pays=="Sénégal")
      compress
      save "`temp_dir'/`prefix'.dta", replace
    }


    /* TODO! find why GIN file is separate and 2004 (IT WAS LIKE THIS IN HAD, by Aroob, but is weirdly not working in DLW)
    foreach prefix in Gn_Global2 Gn_Global5 {
      if `from_datalibweb'==1 {
        noi edukit_datalibweb, d(country(GIN) year(`year') type(EDURAW) surveyid(GIN_2004_PASEC_v01_M) filename(`prefix'.dta) `shortcut')
      }
      else {
        use "${input}/GIN/GIN_2004_PASEC/GIN_2004_PASEC_v01_M/Data/Stata/`prefix'.dta", clear
      }
      rename *, lower
      // Generate variable for cnt and year to match the others
      gen pays  = "Guinea"
      gen annee = 2005			// PLACEHODER 2004 or 2005??? (was like this in HAD, by Aroob)
      // And rename vars that are slightly different
      rename (numecole numeleve numclass) (num_ecole num_eleve num_class)
      compress
      save "`temp_dir'/`prefix'.dta", replace
    }
    */

    noi disp as res "{phang}Step 1 completed (`output_file'){p_end}"


    *---------------------------------------------------------------------------
    * 2) Combine all rawdata into a single file (merge and append)
    *---------------------------------------------------------------------------

    use "`temp_dir'/back_05_2006_02_9.dta", clear
    append using "`temp_dir'/back_05_2006_05_9.dta", force
    //TODO! see above commented out section
    //append using "`temp_dir'/Gn_Global2.dta"
    //append using "`temp_dir'/Gn_Global5.dta"

    noi disp as res "{phang}Step 2 completed (`output_file'){p_end}"


    *---------------------------------------------------------------------------
    * 3) Standardize variable names across all assessments
    *---------------------------------------------------------------------------
    // For each variable class, we create a local with the variables in that class
    // so that the final step of saving the GLAD dta  knows which vars to save

    // ID Vars:
    local idvars	"year idcntry_raw idschool idgrade idlearner"  // idclass does not exist

    *<_idcntry_raw>
    clonevar idcntry_raw = pays
    label var idcntry_raw "Country ID, as coded in rawdata"
    *</_idcntry_raw_>

    *<_idschool_>
    clonevar idschool = num_ecole
    label var idschool "School ID"
    *</_idschool_>

    *<_idgrade_>
    clonevar idgrade = num_classe
    label var idgrade "Grade ID"
    // Replace missing values to avoid breaking isid check
    replace idgrade = -99 if missing(idgrade) // 3 observations in Cameroon
    *</_idgrade_>

    *<_idclass_>
    gen int idclass = -99		// PLACEHOLDER: double check documentation to make sure it doesnt exist
    label var idclass "Class ID"
    *</_idclass_>

    *<_idlearner_>
    clonevar idlearner = num_eleve
    label var idlearner "Learner ID"
    // Replace duplicate ids and missing values to avoid breaking isid check
    if inlist(idlearner,1,5) & inlist(idschool,23,67) & idcntry_raw=="Senégal" & idgrade==5  replace idlearner=.
    replace idlearner = -_n if missing(idlearner) // 476 observations in 105,523
    *</_idlearner_>

    *<_year_>
    clonevar year = annee
    label var year "Assessment Year"
    *</_year_>

    // Drop any value labels of idvars, to be okay to append multiple surveys
    foreach var of local idvars {
      cap label values `var' .
    }


    // VALUE Vars:
    local valuevars	"score_pasec* level_pasec*"

    *<_score_assessment_subject_pv_>
    * Reading
    egen 	  score_read_g2 = std(sfin2f100) if idgrade == 2
    replace score_read_g2 = score_read_g2*100 + 500
    egen 	  score_read_g5 = std(sfin5f100) if idgrade == 5
    replace score_read_g5 = score_read_g5*100 + 500
    gen 	  score_pasec_read = score_read_g2 if idgrade == 2
    replace	score_pasec_read = score_read_g5 if idgrade == 5
    * Math
    egen 	  score_math_g2 = std(sfin2m100) if idgrade == 2
    replace score_math_g2 = score_math_g2*100 + 500
    egen 	  score_math_g5 = std(sfin5m100) if idgrade == 5
    replace score_math_g5 = score_math_g5*100 + 500
    gen 	  score_pasec_math = score_math_g2 if idgrade == 2
    replace	score_pasec_math = score_math_g5 if idgrade == 5
    * Organize
    foreach subject in read math {
      label var score_pasec_`subject' "Pasec score for `subject'"
      char      score_pasec_`subject'[clo_marker] "number"
    }
    *</_score_assessment_subject_pv_>

    *<_level_assessment_subject_pv_>
    foreach subject in read math {
      generate  level_pasec_`subject' = .a	// PLACEHOLDER: they didnt provide levels, have to create one
      label var level_pasec_`subject' "Pasec level for `subject'"
      char      level_pasec_`subject'[clo_marker] "factor"
    }
    /* TODO PLACEHOLDER!!! CODE IN 'HAD' below: to double check how to use and document
    gen     low_reading_proficiency_uis = (sfin2f100 > 75)	 if idgrade == 2
    replace low_reading_proficiency_uis = (sfin5f100 > 28.5) if idgrade == 5
    gen     low_reading_proficiency_wb = (sfin2f100 > 75)	if idgrade == 2
    replace low_reading_proficiency_wb = (sfin5f100 > 41.4) if idgrade == 5  */
    *</_level_assessment_subject_pv_>


    // TRAIT Vars:
    local traitvars	"age urban* male escs"

    *<_age_>
    // TODO: GIN mess-up: there was already another variable called age (all missing), so first we need to change that one
    // rename age age_original
    // now we can create our harmonized one from the correct variable
    clonevar age = el_age
    label var age "Learner age at time of assessment"
    *</_age_>

    *<_urban_>
    gen byte urban = .a		// PLACEHOLDER: check value labels and documentation for clues
    label var urban "School is located in urban/rural area"
    *</_urban_>

    *<_male_>
    gen byte male = (el_fille==0) & !missing(el_fille)
    label var male "Learner gender is male/female"
    *</_male_>


    // SAMPLE Vars:
    local samplevars "strata* learner_weight*"

    *<_learner_weight_>
    clonevar  learner_weight = iproinclu
    label var learner_weight "Learner weight"
    *</_learner_weight_>

    *<_strata>
    clonevar  strata = strate
    label var strata "Strata"
    *</_strata_>

    noi disp as res "{phang}Step 3 completed (`output_file'){p_end}"


    *---------------------------------------------------------------------------
    * 4) ESCS and other calculations (by Aroob, from Feb 2019)
    *---------------------------------------------------------------------------

    gen escs = .
    noi disp as res "{phang}Step 4 completed (`output_file'){p_end}"

    /*** QUICK FIX ****
    // NOTE: this is the only of all the assessment files in which the
    // quick fix is commenting a whole section out, instead of renaming
    // vars to lower/upper case. This is due to the fact that vars in
    // this section are partly written in upper, partly in lower case

    *Identifying variables for ESCS:
    *el_maison el_livres el_livreslect el_livrescol el_toiletfosse el_toileteau el_ecmais el_feuxcharbon el_frigo el_magnetoscope el_dvd el_ordinateur el_puits el_robinet el_telephone el_televiseur el_hifi el_charrette el_charrue el_velo el_mobylette el_rechaugaz el_lampgaz el_lampetrol el_pirogmot el_pirogsanmot el_radio el_voiture el_lampelecnumlabel, add
    foreach var of varlist el_maison el_livres el_livreslect el_livrescol el_toiletfosse el_toileteau el_ecmais el_feuxcharbon el_frigo el_magnetoscope el_dvd el_ordinateur el_puits el_robinet el_telephone el_televiseur el_hifi el_charrette el_charrue el_velo el_mobylette el_rechaugaz el_lampgaz el_lampetrol el_pirogmot el_pirogsanmot el_radio el_voiture el_lampelec {
      tab `var'
      replace `var' = . if `var' == 999
    }
    tab el_maison, gen(dmaison)
    *The variables are cleaned:
    bysort IDCNTRY year IDGRADE: mdesc dmaison* el_livres el_livreslect el_livrescol el_toiletfosse el_toileteau el_ecmais el_feuxcharbon el_frigo el_magnetoscope el_dvd el_ordinateur el_puits el_robinet el_telephone el_televiseur el_hifi el_charrette el_charrue el_velo el_mobylette el_rechaugaz el_lampgaz el_lampetrol el_pirogmot el_pirogsanmot el_radio el_voiture el_lampelec
    *4 variables missing for grade 5:
    *Replacing missing values: One variable has 10% missing values
    foreach var of varlist dmaison* el_livres el_livreslect el_livrescol el_toiletfosse el_toileteau el_ecmais el_feuxcharbon el_frigo el_magnetoscope el_dvd el_ordinateur el_puits el_robinet el_telephone el_televiseur el_hifi el_charrette el_charrue el_velo el_mobylette el_rechaugaz el_lampgaz el_lampetrol el_pirogmot el_pirogsanmot el_radio el_voiture el_lampelec  {
      bysort IDCNTRY year num_ecole num_classe: egen `var'_mean  = mean(`var')
      bysort IDCNTRY year IDSTRATA: egen `var'_mean_str = mean(`var')
      replace `var' = `var'_mean if missing(`var')
      replace `var' = `var'_mean_str if missing(`var')
    }
    bysort IDCNTRY year IDGRADE: mdesc dmaison* el_livres el_livreslect el_livrescol el_toiletfosse el_toileteau el_ecmais el_feuxcharbon el_frigo el_magnetoscope el_dvd el_ordinateur el_puits el_robinet el_telephone el_televiseur el_hifi el_charrette el_charrue el_velo el_mobylette el_rechaugaz el_lampgaz el_lampetrol el_pirogmot el_pirogsanmot el_radio el_voiture el_lampelec

    pca dmaison? el_livres  el_toileteau el_ecmais  el_frigo  el_ordinateur el_puits el_robinet el_telephone el_televiseur  el_charrette el_charrue el_velo el_mobylette el_rechaugaz el_lampgaz el_lampetrol  el_radio el_voiture
    predict ESCSBEN
    gen ESCS = ESCSBEN

    pca dmaison?   el_toileteau el_ecmais el_frigo  el_dvd el_ordinateur el_puits el_robinet el_telephone el_televiseur  el_velo el_mobylette el_rechaugaz  el_lampetrol el_radio el_voiture el_lampelec [weight = STUDENT_WEIGHT]
    predict ESCSBFA
    replace ESCS = ESCSBFA if IDCNTRY == 854

    pca dmaison? el_livres el_toileteau el_ecmais el_feuxcharbon el_frigo  el_ordinateur el_puits el_robinet el_telephone el_televiseur  el_charrette  el_velo el_mobylette el_rechaugaz el_lampgaz el_lampetrol  el_radio el_voiture [weight = STUDENT_WEIGHT]
    predict ESCSBDI
    replace ESCS = ESCSBDI if IDCNTRY == 108

    pca dmaison? el_livres  el_toileteau el_ecmais  el_frigo  el_ordinateur el_puits el_robinet el_telephone el_televiseur  el_charrette el_charrue el_velo el_mobylette el_rechaugaz el_lampgaz el_lampetrol  el_radio el_voiture [weight = STUDENT_WEIGHT]
    predict ESCSCMR
    replace ESCS = ESCSCMR if IDCNTRY == 120

    pca dmaison? el_livres  el_toiletfosse el_toileteau el_ecmais el_frigo el_magnetoscope  el_ordinateur el_puits el_robinet el_telephone el_televiseur  el_velo el_mobylette el_rechaugaz el_lampgaz el_lampetrol el_pirogmot el_pirogsanmot el_radio el_voiture [weight = STUDENT_WEIGHT]
    predict ESCSCOM
    replace ESCS = ESCSCOM if IDCNTRY == 174

    pca dmaison?  el_toileteau el_ecmais  el_frigo el_magnetoscope  el_ordinateur el_puits el_robinet el_telephone el_televiseur  el_velo el_mobylette el_rechaugaz  el_lampetrol  el_radio el_voiture el_lampelec [weight = STUDENT_WEIGHT]
    predict ESCSCOG
    replace ESCS = ESCSCOG if IDCNTRY == 178

    pca dmaison? el_livres  el_toileteau el_ecmais  el_frigo el_magnetoscope el_dvd el_ordinateur  el_robinet  el_televiseur el_hifi  el_velo el_mobylette el_rechaugaz el_lampgaz el_lampetrol el_pirogmot el_pirogsanmot el_radio el_voiture el_lampelec [weight = STUDENT_WEIGHT]
    predict ESCSCIV
    replace ESCS = ESCSCIV if IDCNTRY ==  384

    pca dmaison? el_livres  el_toileteau el_ecmais  el_frigo el_ordinateur el_puits el_robinet el_telephone el_televiseur  el_velo el_mobylette el_rechaugaz el_lampgaz el_lampetrol  el_radio el_voiture [weight = STUDENT_WEIGHT]
    predict ESCSGAB
    replace ESCS = ESCSGAB if IDCNTRY == 266

    pca dmaison? el_livres el_livreslect el_livrescol  el_toileteau el_ecmais  el_frigo  el_ordinateur  el_robinet el_telephone el_televiseur  el_charrette el_charrue el_velo el_mobylette el_rechaugaz el_lampgaz el_lampetrol  el_radio el_voiture [weight = STUDENT_WEIGHT]
    predict ESCSMDG
    replace ESCS = ESCSMDG if IDCNTRY == 450

    pca dmaison? el_livres  el_toileteau el_ecmais  el_frigo  el_ordinateur el_puits el_robinet el_telephone el_televiseur  el_charrette el_charrue el_velo el_mobylette el_rechaugaz  el_lampetrol  el_radio el_voiture el_lampelec [weight = STUDENT_WEIGHT]
    predict ESCSMAU
    replace ESCS = ESCSMAU if IDCNTRY == 480

    pca dmaison? el_livres  el_toileteau el_ecmais  el_frigo  el_ordinateur  el_robinet el_telephone el_televiseur  el_charrette el_charrue el_velo el_mobylette el_rechaugaz el_lampgaz el_lampetrol  el_radio el_voiture [weight = STUDENT_WEIGHT]
    predict ESCSMRT
    replace ESCS = ESCSMRT if IDCNTRY == 478

    pca dmaison?  el_toileteau el_ecmais  el_frigo el_magnetoscope  el_ordinateur el_puits el_robinet el_telephone el_televiseur  el_velo el_mobylette el_rechaugaz  el_lampetrol el_pirogmot el_pirogsanmot el_radio el_voiture el_lampelec [weight = STUDENT_WEIGHT]
    predict ESCSSEN
    replace ESCS = ESCSSEN if IDCNTRY == 686

    pca dmaison? el_livres  el_toileteau el_ecmais  el_frigo  el_ordinateur  el_robinet el_telephone el_televiseur  el_charrette el_charrue el_velo el_mobylette el_rechaugaz el_lampgaz el_lampetrol  el_radio el_voiture  [weight = STUDENT_WEIGHT]
    predict ESCSTCD
    replace ESCS = ESCSTCD if IDCNTRY == 148

    bysort IDCNTRY IDSCHOOL IDGRADE: egen SCHESCS = mean(ESCS)
    bysort IDCNTRY IDGRADE: egen CNTESCS = mean(ESCS)

    svyset IDSCHOOL [weight = STUDENT_WEIGHT], strata(IDSTRATA) vce(linearized) singleunit(missing) || IDSTUD

    *** QUICK FIX ****/



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
    edukit_save, filename("`output_file'") path("`output_dir'") dir2delete("`temp_dir'")              ///
                 idvars("`idvars'") varc("key `keyvars'; value `valuevars'; trait `traitvars'; sample `samplevars'") ///
                 metadata("`metadata'") collection("GLAD")

    noi disp as res "Creation of `output_file'.dta completed"

  }

  else {
    noi disp as txt "Skipped creation of `output_file'.dta (already found in clone)"
    // Still loads it, to generate documentation
    use "`output_dir'/`output_file'.dta", clear
  }
}
