*=========================================================================*
* GLOBAL LEARNING ASSESSMENT DATABASE (GLAD)
* Project information at: https://github.com/worldbank/GLAD
*
* Metadata to be stored as 'char' in the resulting dataset (do NOT use ";" here)
local region      = "XXX"   /* LAC, SSA, WLD or CNT such as KHM RWA */
local year        = "yyyy"  /* 2015 */
local assessment  = "PIRLS" /* PIRLS, PISA, EGRA, etc */
local master      = "v01_M" /* usually v01_M, unless the master (eduraw) was updated*/
local adaptation  = "wrk_A_GLAD" /* no need to change here */
local module      = "ALL"  /* for now, we are only generating ALL and ALL-BASE in GLAD */
local ttl_info    = "Joao Pedro de Azevedo [eduanalytics@worldbank.org]" /* no need to change here */
local dofile_info = "last modified by John Doe in Month day, 2019"  /* change date*/
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

    /* NOTE: Some assessments will loop over `prefix'`cnt' (such as PIRLS, TIMSS),
       then create a temp file with all prefixs of a cnt merged.
       but other asssessments only need to loop over prefix (such as LLECE).
       See the two examples below and change according to your needs */


    /***** BEGIN PIRLS 2011 EXAMPLE *****

    foreach cnt in AAD ADU ARE AUS AUT AZE BFR BGR BWA CAB CAN COL COT CQU CZE DEU DNK EAN ENG ESP FIN FRA GEO HKG HND HUN HRV HUN IDN IRL IRN ISR ITA KWT LTU MA6 MAR MLN MLT MLT NIR  NLD NOR NZL OMN POL PRT QAT ROM RUS SAU SGP SVK SVN SWE TTO TWN USA ZAF {
       // Temporary copies of the 4 rawdatasets needed for each country (new section)
       foreach prefix in ASA ASG ASH ACG {
         if `from_datalibweb'==1 {
           noi edukit_datalibweb, d(country(`region') year(`year') type(EDURAW) surveyid(`surveyid') filename(`prefix'`cnt'.dta) `shortcut')
         }
         else {
           use "`input_dir'/`prefix'`cnt'.dta", clear
         }
         rename *, lower
         compress
         save "`temp_dir'/`prefix'.dta", replace
       }

       // Merge the 4 rawdatasets into a single TEMP country file
       use "`temp_dir'/ASA.dta", clear
       merge 1:1 idcntry idschool idclass idstud using "`temp_dir'/ASG.dta", keep(master match) nogen
       merge 1:1 idcntry idschool idstud using "`temp_dir'/ASH.dta", keep(master match) nogen
       merge m:1 idcntry idschool using "`temp_dir'/ACG.dta", keep(master match) nogen
       save "`temp_dir'/TEMP_`surveyid'_p_`cnt'.dta", replace
    }

    ***** END OF PIRLS 2011 EXAMPLE *****/


    /***** BEGIN LLECE 2013 EXAMPLE *****

    foreach prefix in PL3 PM3 QA3 QF3 PL6 PM6 PC6 QA6 QF6 {
      if `from_datalibweb'==1 {
        noi edukit_datalibweb, d(country(`region') year(`year') type(EDURAW) surveyid(`surveyid') filename(`prefix'.dta) `shortcut')
      }
      else {
        use "`indput_ir'/`prefix'.dta", clear
      }
      capture destring idstud idschool idclass, replace
      rename *, lower
      compress
      save "`temp_dir'/`prefix'.dta", replace
    }

    ***** END OF LLECE 2013 EXAMPLE *****/

    noi disp as res "{phang}Step 1 completed (`output_file'){p_end}"


    *---------------------------------------------------------------------------
    * 2) Combine all rawdata into a single file (merge and append)
    *---------------------------------------------------------------------------

    /* NOTE: the merge / append of all rawdata saved in temp in above step
       will vary slightly by assessment.
       See the two examples continuedw and change according to your needs */


    /***** BEGIN PIRLS 2011 EXAMPLE *****

    fs "`temp_dir'/TEMP_`surveyid'_p_*.dta"
    local firstfile: word 1 of `r(files)'
    use "`temp_dir'/`firstfile'", clear
    foreach f in `r(files)' {
      if "`f'" != "`firstfile'" append using "`temp_dir'/`f'"
    }

    ***** END OF PIRLS 2011 EXAMPLE  *****/



    /***** BEGIN LLECE 2013 EXAMPLE *****

    // Grade 3
    use "`temp_dir'/PL3.dta", clear
    merge 1:1 idcntry idstud using "`temp_dir'/PM3.dta", keep(master match using) nogen
    merge 1:1 idcntry idstud using "`temp_dir'/QA3.dta", keep(master match using) nogen
    merge 1:1 idcntry idstud using "`temp_dir'/QF3.dta", keep(master match using) nogen
    save "`temp_dir'/P_3.dta", replace

    // Grade 6
    use "`temp_dir'/PL6.dta", clear
    merge 1:1 idcntry idstud using "`temp_dir'/PM6.dta", keep(master match using) nogen
    merge 1:1 idcntry idstud using "`temp_dir'/PC6.dta", keep(master match using) nogen
    merge 1:1 idcntry idstud using "`temp_dir'/QA6.dta", keep(master match using) nogen
    merge 1:1 idcntry idstud using "`temp_dir'/QF6.dta", keep(master match using) nogen
    save "`temp_dir'/P_6.dta", replace

    // Append both grades
    use "`temp_dir'/P_3.dta", clear
    append using "`temp_dir'/P_6.dta"

    ***** END OF LLECE 2013 EXAMPLE *****/

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
    local idvars "idcntry_raw idschool idgrade idclass idlearner"

    *<_idcntry_raw_>
    *clonevar idcntry_raw = idcntry
    label var idcntry_raw "Country ID, as coded in rawdata"
    *</_idcntry_raw_>

    *<_idschool_>
    label var idschool "School ID"
    *</_idschool_>

    *<_idgrade_>
    label var idgrade "Grade ID"
    *</_idgrade_>

    *<_idclass_>
    label var idclass "Class ID"
    *</_idclass_>

    *<_idlearner_>
    *clonevar idlearner = idstud
    label var idlearner "Learner ID"
    *</_idlearner_>

    // Drop any value labels of idvars, to be okay to append multiple surveys
    foreach var of local idvars {
      label values `var' .
    }


    // VALUE Vars: 	  /* CHANGE HERE FOR YOUR ASSESSMENT!!! PIRLS EXAMPLE */
    local valuevars	"score_pirls* level_pirls*"

    *<_score_assessment_subject_pv_>
    *foreach pv in 01 02 03 04 05 {
      *clonevar score_pirls_read_`pv' = asrrea`pv'
      label var score_pirls_read_`pv' "Plausible value `pv': `assessment' score for reading"
    *}
    *</_score_assessment_subject_pv_>

    *<_level_assessment_subject_pv_>
    *foreach pv in 01 02 03 04 05 {
      *clonevar level_pirls_read_`pv' = asribm`pv'
      label var level_pirls_read_`pv' "Plausible value `pv': `assessment' level for reading"
    *}
    *</_level_assessment_subject_pv_>


    // TRAIT Vars:
	local traitvars	"age urban* male escs qescs has_qescs"


    *<_age_>
    *gen age = asdage		if  !missing(asdage)	& asdage!= 99
    label var age "Learner age at time of assessment"
    *</_age_>

    *<_urban_>
    *gen byte urban = (inlist(acbg05a, 1, 2, 3, 4, 5)) if !missing(acbg05a) & acbg05a != 9
    label var urban "School is located in urban/rural area"
    *</_urban_>

    *<_urban_o_>
    *decode acbg05a, g(urban_o)
    label var urban_o "Original variable of urban: population size of the school area"
    *</_urban_o_>

    *<_male_>
    *gen byte male = (itsex == 2)	  		& !missing(itsex)
    label var male "Learner gender is male/female"
    *</_male_>


    // SAMPLE Vars:		 	  /* CHANGE HERE FOR YOUR ASSESSMENT!!! PIRLS EXAMPLE */
    local samplevars "learner_weight jkzone jkrep"

    *<_learner_weight_>
    *clonevar learner_weight  = totwgt
    label var learner_weight "Total learner weight"
    *</_learner_weight_>

    *<_jkzone_>
    label var jkzone "Jackknife zone"
    *</_jkzone_>

    *<_jkrep_>
    label var jkrep "Jackknife replicate code"
    *</_jkrep_>


    noi disp as res "{phang}Step 3 completed (`output_file'){p_end}"


    *---------------------------------------------------------------------------
    * 4) ESCS and other calculations
    *---------------------------------------------------------------------------

    // Placeholder for other operations that we may want to include (kept in ALL-BASE)
    *<_escs_>
    * code for ESCS
    * label for ESCS
    *</_escs_>
	
	* Quintiles of ESCS // this setion of the code used to be in 0221 or 0222.
	* This is the variable used to compute results by Socio Economic Status.
	* Ensure that CNTRY Identifer is used as STRING.
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

	// Specify Survye Design for SACMEQ
	if "`assessment'" == "SACMEQ" {
        svyset idschool [pw = learner_weight], strata(strata) || _n
    }

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
