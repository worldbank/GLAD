*=========================================================================*
* GLOBAL LEARNING ASSESSMENT DATABASE (GLAD)
* Project information at: https://github.com/worldbank/GLAD
*
* Metadata to be stored as 'char' in the resulting dataset (do NOT use ";" here)
local region      = "RWA" // Rwanda
local year        = "All"
local assessment  = "EGRA"
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

    // Filter the master country list to only this assessment-year:
    *** SEGMENT NOT NEEDED FOR EGRA, BY DEFAULT A SINGLE COUNTRY ***

    // Tokenized elements from the header to be passed as metadata
    local glad_description  "This dataset is part of the Global Learning Assessment Database (GLAD). It contains microdata from `assessment' `year'. Each observation corresponds to one learner (student or pupil), and the variables have been harmonized."
    local metadata          "region `region'; year `year'; assessment `assessment'; master `master'; adaptation `adaptation'; module `module'; ttl_info `ttl_info'; dofile_info `dofile_info'; description `glad_description'"

    *---------------------------------------------------------------------------
    * 1) Open all rawdata, lower case vars, save in temp_dir
    *---------------------------------------------------------------------------
    foreach prefix in 2011 2014 2015 2016{
      if "`year'" == "All" {
        local year_in_prefix = substr("`prefix'",1,4)
        local sub_surveyid	=  "`region'_`year_in_prefix'_`assessment'_`master'"
      }
      if `from_datalibweb'==1 {
        noi edukit_datalibweb, d(country(`region') year(`year_in_prefix') type(EDURAW) surveyid(`sub_surveyid') filename(`prefix'.dta) `shortcut')
      }
      else {		//To be romved, only use while still testing
        local indir	= "${input}/`region'/`region'_`year_in_prefix'_`assessment'/`sub_surveyid'/Data/Stata"
        use "`indir'/`prefix'.dta", clear
      }
      rename *, lower
      compress

      // Either a variable named year already exists, or it's now created
      cap gen int year = `year_in_prefix'
      assert year == `year_in_prefix'

      // Year-specific cleaning
      if `year_in_prefix'==2011 {
        * idschool was missing in 2011
        sort year strata1 district id strata3
        seq idschool, f(1) t(42) b(20)
      }
      else {
        * idschool was string, and student_id is always missing past 2011 //PLACEHOLDER!!! CHECK WHY MISSING: problem when importing?
        encode encrypted_school_code, gen(idschool)
        seq idlearner
      }

      save "`temp_dir'/TEMP_`prefix'.dta", replace
    }

    noi disp as res "{phang}Step 1 completed (`output_file'){p_end}"


    *---------------------------------------------------------------------------
    * 2) Combine all rawdata into a single file (merge and append)
    *---------------------------------------------------------------------------
    fs "`temp_dir'/TEMP_*.dta"
    local firstfile: word 1 of `r(files)'
    use "`temp_dir'/`firstfile'", clear
    foreach f in `r(files)' {
      if "`f'" != "`firstfile'" append using "`temp_dir'/`f'", force
    }

    noi disp as res "{phang}Step 2 completed (`output_file'){p_end}"


    *---------------------------------------------------------------------------
    * 3) Standardize variable names across all assessments
    *---------------------------------------------------------------------------
    // For each variable class, we create a local with the variables in that class
    //     so that the final step of saving the GLAD dta  knows which vars to save

    // ID Vars:
    local idvars	"countrycode year idschool idgrade idlearner"  // no idclass & idcntry_raw does not exist for EGRA (single country)

    *<_countrycode_>
    gen countrycode = "`region'"
    label var countrycode "WB country code (3 letters)"
    *</_countrycode_>

    *<_year_>
    label var year "Assessment Year"
    *</_year_>

    *<_idschool_>
    label var idschool "School ID"
    *</_idschool_>

    *<_idgrade_>
    clonevar idgrade = grade
    label var idgrade "Grade ID"
    *</_idgrade_>

    *<_idclass_>
    gen int idclass = -99	// PLACEHOLDER: double check documentation to make sure it doesnt exist / give more informative missing value
    label var idclass "Class ID"
    *</_idclass_>

    *<_idlearner_>
    replace  idlearner = id2 	if 	(year==2011 & missing(idlearner))
    label var idlearner "Learner ID"
    *</_idlearner_>

    // Drop any value labels of idvars, to be okay to append multiple surveys
    foreach var of local idvars {
      cap label values `var' .
    }


    // VALUE Vars:
    local valuevars	"score_egra* level_egra* hpro_read"

    *<_score_assessment_subject_pv_>
    // PLACEHOLDER!!! WHICH ONE TO USE? SCORE OR PCNT?
    clonevar  score_egra_read  = read_comp_score_pcnt
    label var score_egra_read	 "Egra score for read (pcnt)"
    *</_score_assessment_subject_pv_>

    *<_level_assessment_subject_pv_>
    gen level_egra_read = .a			// PLACEHOLDER: they didnt provide levels, have to create one
    label var level_egra_read "Egra level for read"
    *</_level_assessment_subject_pv_>

    *<_hpro_read_>
    gen hpro_read = .a		 			// PLACEHOLDER: TBD
    label var hpro_read "Student is reading proficient at end of primary school (harmonized)"
    *</_hpro_read_>


    // TRAIT Vars:
    local traitvars	"age urban* male escs"   // PLACEHOLDER: TBD

    *<_age_>
    label var age "Learner age at time of assessment"
    *</_age_>

    *<_urban_>
    clonevar urban_o = urban
    drop urban
    gen urban = (urban_o=="urban")
    label var urban "School is located in urban/rural area"
    *</_urban_>

    *<_male_>
    gen male = female==0 if !missing(female)
    label var male "Learner gender is male/female"
    *</_male_>


    // SAMPLE Vars:
    local samplevars "learner_weight"

    *<_learner_weight_>
    gen learner_weight = wt_final 			if year == 2011
    replace learner_weight = final_weight	if year != 2011
    label var learner_weight "Learner weight"
    *</_learner_weight_>

    noi disp as res "{phang}Step 3 completed (`output_file'){p_end}"

    *---------------------------------------------------------------------------
    * 4) ESCS and other calculations (by Aroob, from Feb 2019)
    *---------------------------------------------------------------------------
    // There was never a ESCS for this file, so this section is TBD
    gen escs = .a

    noi disp as res "{phang}Step 4 completed (`output_file'){p_end}"


    *---------------------------------------------------------------------------
    * 5) Bring WB countrycode and save GLAD and GLAD_BASE dta
    *---------------------------------------------------------------------------

    // Brings World Bank countrycode from ccc_list
    *** SEGMENT NOT NEEDED FOR EGRA, BY DEFAULT A SINGLE COUNTRY ***

    // Additional metadata: EGRA characteristics
    char _dta[language_test]                "English"
    char _dta[language_instruction]         "English"
    char _dta[nationally_representative]    "1"
    char _dta[regionally_representative]    "0"
    char _dta[has_learner_weights]			    "1"

    // updates the metadata local to include the above
    local egrachars  "language_test language_instruction nationally_representative regionally_representative has_learner_weights"
    local metadata   "`metadata'; egrachars `egrachars'"

    // This function compresses the dataset, adds metadata passed in the arguments as chars, save GLAD_BASE.dta
    // which contains all variables, then keep only specified vars and saves GLAD.dta, and delete files in temp_dir
    edukit_save, filename("`output_file'") path("`output_dir'") dir2delete("`temp_dir'")              ///
                 idvars("`idvars'") varc("value `valuevars'; trait `traitvars'; sample `samplevars'") ///
                 metadata("`metadata'") collection("GLAD")

    noi disp as res "Creation of `output_file'.dta completed"

  }

  else {
    noi disp as txt "Skipped creation of `output_file'.dta (already found in clone)"
    // Still loads it, to generate documentation
    use "`output_dir'/`output_file'.dta", clear
  }
}
