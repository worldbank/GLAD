*=========================================================================*
* GLOBAL LEARNING ASSESSMENT DATABASE (GLAD)
* Project information at: https://github.com/worldbank/GLAD
*
* Metadata to be stored as 'char' in the resulting dataset (do NOT use ";" here)
local region      = "SSA"   /* LAC, SSA, WLD or CNT such as KHM RWA */
local year        = "2019"  /* 2015 */
local assessment  = "AMPLB" /* PIRLS, PISA, EGRA, etc */
local master      = "v01_M" /* usually v01_M, unless the master (eduraw) was updated*/
local adaptation  = "wrk_A_GLAD" /* no need to change here */
local module      = "ALL"  /* for now, we are only generating ALL and ALL-BASE in GLAD */
local ttl_info    = "Joao Pedro de Azevedo [eduanalytics@worldbank.org]" /* no need to change here */
local dofile_info = "last modified by Yi Ning Wong in 3/29, 2022"  /* change date*/
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
 local input_dir = "${network}/GDB/Sandbox/`region'_`year'_`assessment'"
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
		

    foreach file in burkina burundi cote kenya senegal zambia {
         if `from_datalibweb'==1 {
           noi edukit_datalibweb, d(country(`region') year(`year') type(EDURAW) surveyid(`surveyid') filename(`file'_historic_ampl_pvs_(2022.02.15).dta) `shortcut')
         }
         else {
           use "`input_dir'/`file'_historic_ampl_pvs_(2022.02.15).dta", clear
         }
         rename *, lower
         compress
         save "`temp_dir'/`file'_historic_ampl_pvs_(2022.02.15).dta", replace
       }



    noi disp as res "{phang}Step 1 completed (`output_file'){p_end}"


    *---------------------------------------------------------------------------
    * 2) Combine all rawdata into a single file (merge and append)
    *---------------------------------------------------------------------------

       // Merge the 4 rawdatasets into a single TEMP country file
	   //use "`temp_dir'/zambia_historic_ampl_pvs_(2022.02.15).dta", clear
	   use "`temp_dir'/zambia_historic_ampl_pvs_(2022.02.15).dta", clear
	   gen pays = "ZMB"

	   tempfile zmb
	   save `zmb', replace
	   
	   use "`temp_dir'/kenya_historic_ampl_pvs_(2022.02.15).dta", clear
	   gen pays = "KEN"

  
	   
	   foreach cnt in burkina burundi cote senegal {
	   	append using "`temp_dir'/`cnt'_historic_ampl_pvs_(2022.02.15).dta"
	   }
	   
	   append using `zmb'
			 
			 
       save "`temp_dir'/TEMP_`surveyid'_p.dta", replace
	   
	   tempfile raw_amplb
	   save `raw_amplb', replace

		** Make the country variables consistent between one another
		replace id_pays = "1" if pays == "KEN"
		replace id_pays = "14" if pays == "ZMB"
		replace id_ecole = school if pays == "ZMB" | pays == "KEN"
		replace id_eleve = student if pays == "ZMB" | pays == "KEN"
		replace id_tot = studentid if pays == "KEN"
		replace id_tot = barcode if pays == "ZMB"
		destring strata, replace
		destring county, replace
		replace id_strate = strata - 1400  if pays == "ZMB"
		replace id_strate = county if pays == "KEN"
	


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
			
	
    // ID Vars:
    local idvars "idcntry_raw idschool idgrade idlearner" //  idclass 

    *<_idcntry_raw_>
    clonevar idcntry_raw = id_pays
    label var idcntry_raw "Country ID, as coded in rawdata"
    *</_idcntry_raw_>

    *<_idschool_>
	clonevar idschool = id_ecole
    label var idschool "School ID"
    *</_idschool_>

    *<_idgrade_>
	gen idgrade = 6
    *</_idgrade_>

    *<_idclass_>
   // label var idclass "Class ID"
    *</_idclass_>

    *<_idlearner_>
    clonevar idlearner = id_eleve
    label var idlearner "Learner ID"
    *</_idlearner_>
	
	
	*<_strata_>
	drop strata
	clonevar  strata = id_strate
	destring strata, replace
	label var strata "Strata"
	*</_strata_>
	
	destring id* strata, replace
	
	 // VALUE Vars: 	  
    local valuevars	"score_amplb*"

    *<_score_assessment_subject_pv_>
    foreach pv in 1 2 3 4 5 {
      clonevar score_amplb_read_0`pv' = pl_pvr_ampl`pv'
      clonevar score_amplb_math_0`pv' = pl_pvm_ampl`pv'
	  
      label var score_amplb_read_0`pv' "Plausible value `pv': `assessment' score for reading"
      label var score_amplb_math_0`pv' "Plausible value `pv': `assessment' score for math"

    }	
    *</_score_assessment_subject_pv_>

    *<_level_assessment_subject_pv_>
    *</_level_assessment_subject_pv_>
	
	local samplevars "weight_replicate* learner_weight strata"
	
	*<_learner_weight_>
	clonevar learner_weight = fwgt
	label var learner_weight "Learner weight"
	*</_learner_weight_>



	*<_weight_replicateN_>
	forvalues i=1(1)320 {
	clonevar  weight_replicate`i' = rwgt`i'
	label var weight_replicate`i' "Replicate weight `i'"
	}
		*</_weight_replicateN_>

	tempfile amplb_wip
	save `amplb_wip', replace

    // TRAIT Vars:
    local traitvars	"age male escs has_qescs qescs urban"

	** Merge PASEC Identifiers to create trait vars
	   datalibweb, country(SSA) year(2019) type(GLAD) vermast(01) veralt(01) survey(PASEC) module(ALL) clear
	   
	   
	   keep if code == "BDI" | code == "BFA" | code == "CIV" | code == "SEN" | code == "ZMB" | code == "KEN"

	   
	   keep idcntry_raw idschool idgrade idlearner age urban male escs strata 
	   
	   merge 1:1 idcntry_raw idschool idlearner idgrade strata using `amplb_wip', nogen keep(matched using)	   
	   

    noi disp as res "{phang}Step 3 completed (`output_file'){p_end}"


    *---------------------------------------------------------------------------
    * 4) ESCS and other calculations
    *---------------------------------------------------------------------------

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
	tostring idcntry_raw, replace
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
