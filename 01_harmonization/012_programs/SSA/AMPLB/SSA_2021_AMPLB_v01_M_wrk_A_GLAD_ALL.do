*=========================================================================*
* GLOBAL LEARNING ASSESSMENT DATABASE (GLAD)
* Project information at: https://github.com/worldbank/GLAD
*
* Metadata to be stored as 'char' in the resulting dataset (do NOT use ";" here)
local region      = "SSA"   /* LAC, SSA, WLD or CNT such as KHM RWA */
local year        = "2021"  /* 2015 */
local assessment  = "AMPLB" /* PIRLS, PISA, EGRA, etc */
local master      = "v01_M" /* usually v01_M, unless the master (eduraw) was updated*/
local adaptation  = "wrk_A_GLAD" /* no need to change here */
local module      = "ALL"  /* for now, we are only generating ALL and ALL-BASE in GLAD */
local ttl_info    = "Joao Pedro de Azevedo [eduanalytics@worldbank.org]" /* no need to change here */
local dofile_info = "last modified by Yi Ning Wong in 2/24, 2022"  /* change date*/
*
* Steps:
* 0) Program setup (identical for all assessments)
* 1) Open all rawdata, lower case vars, save in temp_dir
* 2) Combine all rawdata into a single file (merge and append)
* 3) Standardize variable names across all assessments
* 4) ESCS and other calculations
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
 //   local input_dir	= "${input}/`region'/`region'_`year'_`assessment'/`surveyid'/Data/Stata" // undo when file is in dlw
 local input_dir = "${network}/GDB/Sandbox/`region'_`year'_`assessment'/`surveyid'/Data/Stata"
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
		

    foreach file in milo_int_student_final_db_(2022.01.18) milo_int_scq_final_db_(2022.01.18) {
         if `from_datalibweb'==1 {
           noi edukit_datalibweb, d(country(`region') year(`year') type(EDURAW) surveyid(`surveyid') filename(`file'.dta) `shortcut')
         }
         else {
           use "`input_dir'/`file'.dta", clear
         }
         rename *, lower
         compress
         save "`temp_dir'/`file'.dta", replace
       }



    noi disp as res "{phang}Step 1 completed (`output_file'){p_end}"


    *---------------------------------------------------------------------------
    * 2) Combine all rawdata into a single file (merge and append)
    *---------------------------------------------------------------------------

       // Merge the 4 rawdatasets into a single TEMP country file
       use "`temp_dir'/milo_int_scq_final_db_(2022.01.18).dta", clear
       merge 1:m cnt_num milo_schid using "`temp_dir'/milo_int_student_final_db_(2022.01.18).dta", keep(master match) nogen
			 
			 
       save "`temp_dir'/TEMP_`surveyid'_p.dta", replace
    


    noi disp as res "{phang}Step 2 completed (`output_file'){p_end}"


    *---------------------------------------------------------------------------
    * 3) Standardize variable names across all assessments
    *---------------------------------------------------------------------------
    // For each variable class, we create a local with the variables in that class
    //     so that the final step of saving the GLAD dta  knows which vars to save

    // Every manipulation of variable must be enclosed by the ddi tags
    // Use clonevar instead of rename (preferable over generate)
    // The labels should be the same.
    // The generation of variables was commented out and should be replaced as needed
		
	** Destring some variables
	qui destring *, replace
		
    // ID Vars:
    local idvars "idcntry_raw idschool idgrade idlearner" //  idclass 

    *<_idcntry_raw_>
    clonevar idcntry_raw = cnt
    label var idcntry_raw "Country ID, as coded in rawdata"
    *</_idcntry_raw_>

    *<_idschool_>
	clonevar idschool = milo_schid
    label var idschool "School ID"
    *</_idschool_>

    *<_idgrade_>
	clonevar idgrade = testgrade
    label var idgrade "Grade ID"
    *</_idgrade_>

    *<_idclass_>
   // label var idclass "Class ID"
    *</_idclass_>

    *<_idlearner_>
    clonevar idlearner = milo_stdid
    label var idlearner "Learner ID"
    *</_idlearner_>

    // VALUE Vars: 	  
    local valuevars	"score_amplb*"

    *<_score_assessment_subject_pv_>
    foreach pv in 1 2 3 4 5 {
      clonevar score_amplb_read_0`pv' = pl_pv`pv'_milo_r
      clonevar score_amplb_math_0`pv' = pl_pv`pv'_milo_m
	  
      label var score_amplb_read_0`pv' "Plausible value `pv': `assessment' score for reading"
      label var score_amplb_math_0`pv' "Plausible value `pv': `assessment' score for math"

    }
		
    *</_score_assessment_subject_pv_>

    *<_level_assessment_subject_pv_>
    *</_level_assessment_subject_pv_>


    // TRAIT Vars:
    local traitvars	"age male escs has_qescs qescs urban"

    *<_age_>
    gen age = s_age if  !missing(s_age)	& s_age!= 9999
    label var age "Learner age at time of assessment"
    *</_age_>

    *<_urban_>
	gen urban = 0 if (sc04 == 1 | sc04 == 2 | sc04 == 3)
	replace urban = 1 if (sc04 == 4 | sc04 == 5)
    *</_urban_>

    *<_male_>
    gen byte male = (s_gender == 2)	  & !missing(s_gender)
    label var male "Learner gender is male/female"
    *</_male_>

		// SAMPLE Vars:
		local samplevars "strata learner_weight weight_replicate*"
	
		*<_learner_weight_>
		clonevar learner_weight = fwgt
		label var learner_weight "Learner weight"
		*</_learner_weight_>

		*<_strata_>
		clonevar  strata = stidstrt
		destring strata, replace
		label var strata "Strata"
		*</_strata_>


		*<_weight_replicateN_>
		forvalues i=1(1)95 {
		  clonevar  weight_replicate`i' = rwgt`i'
			label var weight_replicate`i' "Replicate weight `i'"
		}
		*</_weight_replicateN_>


    noi disp as res "{phang}Step 3 completed (`output_file'){p_end}"


    *---------------------------------------------------------------------------
    * 4) ESCS and other calculations
    *---------------------------------------------------------------------------

    // Placeholder for other operations that we may want to include (kept in ALL-BASE)
	
    *<_escs_>
	*Generating variable for number of books:
	gen NBOOKS = st07

	*Generating variable for Socio-Economic Status:

	** Q12: Which of the following do you have in your home?
		foreach var of varlist st12* {
			replace `var' = 0 if `var' == 2
		} 
		
		** Kenya's additional wealth item, pit latrine was reverse coded, so students with a pit latrine at home would indicate a lower level of wealth
		foreach var in m n o {
			replace st12`var' = 2 if st12`var' == 0 & cnt == "KEN"
			replace st12`var' = 0 if st12`var' == 1 & cnt == "KEN"
			replace st12`var' = 1 if st12`var' == 2 & cnt == "KEN"
		}
		
		** Q13. What are the outside walls of your home mostly made of?
		gen hh_walls = 0 if (st13 == 1 | st13 == 2 | st13 == 3)
		replace hh_walls = 1 if (st13 == 4 | st13 == 5)
		
		** Q14. In your home, what is the main source of lighting?
		gen hh_lighting = 0 if (st14 <= 4 | st14 == 6) 
		replace hh_lighting = 1 if (st14 == 5)

		gen hhsize = 1
    
		// Minimun number of members in the house: 
		foreach var of varlist st03a-st03d {
			replace hhsize = hhsize +1 if `var'==1
			replace hhsize = hhsize +2 if `var'==2
			replace hhsize = hhsize +3 if `var'==3
			replace hhsize = 6 if `var'==6
			replace hhsize = 9 if `var'==9
			}
			
		** Highest Education of Parents
		replace st08 = . if st08 > 900
		replace st10 = . if st10 > 900
		gen hedu = st08 
		replace hedu = st10 if st10 > st08
    
		*wall related variable structure changed in 2019.

		*Using principal component analysis:
		egen escs = std(s_wealth)
		*Replacing missing values:
		bysort cnt idschool idgrade : egen escs_mean = mean(escs)
		bysort cnt idgrade: egen escs_mean_cnt = mean(escs)
		replace escs = escs_mean if missing(escs)
		replace escs = escs_mean_cnt if missing(escs)

		*The data contain assets and housing conditions
		bysort idcntry_raw idschool idgrade: egen schescs = mean(escs)
		bysort idcntry_raw idgrade: egen cntescs = mean(escs)
		
		lab var escs "Socioeconomic Status"
    * label for ESCS
    *</_escs_>
	
	*<_qescs_>
		tempvar cntrycode
		cap: confirm numeric variable idcntry_raw
		if (_rc == 0) {
			tostring idcntry_raw, gen(`cntrycode')
		}
		else {
			clonevar `cntrycode' = idcntry_raw
		}
		cap: sum qescs
		if (_rc!=0) {
			gen byte qescs = .
			levelsof idgrade, local(grades)
			levelsof `cntrycode', local(countries)
			foreach country of local countries {
				foreach grade of local grades {
					capture drop qaux
					capture xtile qaux = escs if `cntrycode' == "`country'" & idgrade == `grade' [aw = learner_weight] , nq(5)
					if _rc == 0 replace qescs = qaux if `cntrycode' == "`country'" & idgrade == `grade'
				}
			}
		}
		label var qescs "Quintiles of Socio-Economic Status"
		*</_qescs_>

		 *<_has_qescs_>
		gen byte has_qescs = (qescs != .)
		label var has_qescs "Dummy variable for observations with a valid QESCS"
		*</_has_qescs_>

    noi disp as res "{phang}Step 4 completed (`output_file'){p_end}"
	

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

    // Harmonization of proficiency on-the-fly, based on thresholds as CPI
    glad_hpro_as_cpi
    local thresholdvars "`r(thresholdvars)'"
    local resultvars    "`r(resultvars)'"

    // Update valuevars to include newly created harmonized vars (from the ado)
    local valuevars : list valuevars | resultvars

    // This function compresses the dataset, adds metadata passed in the arguments as chars, save GLAD_BASE.dta
    // which contains all variables, then keep only specified vars and saves GLAD.dta, and delete files in temp_dir
    edukit_save,  filename("`output_file'") path("`output_dir'") dir2delete("`temp_dir'")              ///
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
