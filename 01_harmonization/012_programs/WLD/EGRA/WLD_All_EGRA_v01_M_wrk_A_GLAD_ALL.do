*=========================================================================*
* GLOBAL LEARNING ASSESSMENT DATABASE (GLAD)
* Project information at: https://github.com/worldbank/GLAD
*
* Metadata to be stored as 'char' in the resulting dataset (do NOT use ";" here)
local region      = "WLD"
local year        = "All"
local assessment  = "EGRA"
local master      = "v01_M"
local adaptation  = "wrk_A_GLAD"
local module      = "ALL"
local ttl_info    = "Joao Pedro de Azevedo [eduanalytics@worldbank.org]"
local dofile_info = "last modified by Diana Goldemberg in October 8, 2019"
*
* Steps:
* WARNING! This program does not follow the same structure as most GLADs.
* 0) Setup, filename and filepaths derived from above (NO NEED TO CHANGE)
* 2) Combine all rawdata into a single file (merge and append)
*=========================================================================*

quietly {

  *---------------------------------------------------------------------------
  * 0) Setup, filename and filepaths derived from above (NO NEED TO CHANGE)
  *---------------------------------------------------------------------------

  // Setup:	***NEVER COMMIT CHANGES TO THOSE LINES!***
  //  - whether takes rawdata from datalibweb (==1) or from indir (!=1), global in run_harmonization.do
  local from_datalibweb = $from_datalibweb
  //  - whether checks first if file exists and attempts to skip this do file
  local overwrite_files = $overwrite_files
  //  - optional shortcut in datalibweb
  local shortcut = "$shortcut"
  //  - setting random seed at the beginning of each do for reproducibility
  set seed $master_seed

  // Set up folders in clone and define survey specific
  // locals to be used in this do-file.
  glad_local_folder_setup , r("`region'") y("`year'") as("`assessment'") ma("`master'") ad("`adaptation'")
  local temp_dir   "`r(temp_dir)'"
  local output_dir "`r(output_dir)'"
  local surveyid 	 "`r(surveyid)'"
  local output_file  "`surveyid'_`adaptation'_`module'"

  *As of now, this do file only allows for NON-datalibweb input
  *if `from_datalibweb'==0 {
  *	local input_dir	= "${input}/`region'/`region'_`year'_`assessment'/`surveyid'/Data/Stata"
  *}

  // Confirm if the final GLAD file already exists in the local clone
  cap confirm file "`output_dir'/`output_file'.dta"
  // If the file does not exist or dont_skip_steps local is set to one, run the do
  if (_rc == 601) | (`overwrite_files') {

    // Filter the master country list to only this assessment-year:
    *** SEGMENT NOT NEEDED FOR EGRA, BY DEFAULT A SINGLE COUNTRY ***

    // Retrieve the proficiency harmonization criteria from the master list
    *** SEGMENT NOT NEEDED FOR EGRA, ONLY IN INDIVIDUAL FILES ***

    // Tokenized elements from the header to be passed as metadata
    local glad_description  "This dataset is part of the Global Learning Assessment Database (GLAD). It contains microdata from `assessment' `year'. Each observation corresponds to one learner (student or pupil), and the variables have been harmonized."
    local metadata          "region `region'; year `year'; assessment `assessment'; master `master'; adaptation `adaptation'; module `module'; ttl_info `ttl_info'; dofile_info `dofile_info'; description `glad_description'"

    *---------------------------------------------------------------------------
    * 2) Combine all rawdata into a single file (merge and append)
    *---------------------------------------------------------------------------

    // Starts empty dataset into which all EGRAs will be appended
    touch "`temp_dir'/TEMP_`year'_`assessment'_GLAD_appended.dta", replace

    // Which countries to look for EGRAs is not automatic as of now, for only those two were created
    foreach c in KHM RWA {
      noi do "${dir012}/CNT/`c'_All_EGRA_`master'_`adaptation'_`module'.do"
      append using "`temp_dir'/TEMP_`year'_`assessment'_GLAD_appended.dta"
      save "`temp_dir'/TEMP_`year'_`assessment'_GLAD_appended.dta", replace
    }
    gen byte national_level = 1

    local keyvars "countrycode national_level"
    local idvars	"year idschool idgrade idlearner"
    local valuevars	"score_egra* level_egra* hpro_read"
    local traitvars	"age urban* male escs"
    local samplevars "learner_weight"

    ****************************************************************************
    *****   CODE FROM ORIGINAL HAD DO FILES BY AROOB *****

    /* PLACEHOLDER!!! LOOK FOR THOSE FILES
    AND BRING THIS CODE BACK IN

    **** SCALE SCORES ******
    *Bringing in EGRA using reports:
    import excel using "${gsdRawData}\NPL_SSD.xlsx", clear firstrow
    *Dropping the Caribbean countries for now:
    keep if inlist(cntabb,"NPL","SSD")
    save "${gsdData}\0-RawOutput\NPL_SSD.dta", replace

    use "${path}/WLD/WLD_All_EGRA/WLD_All_EGRA_v01_M_v01_A_HAD_PRO.dta", clear
    append using "${gsdData}\0-RawOutput\NPL_SSD.dta"

    center read_comp_score_pcnt, standardize

    gen read_comp_scaled = c_read_comp_score_pcnt*100+500

    *English language instrument was conducted to only 6th graders.
    drop if country == "Rwanda" & year == 2011

    * keep grade 2/3 to maximimze coverage-comparability tradeoff
    keep if idgrade == 2 | idgrade == 3 | idgrade == 4
    */

    ****************************************************************************

    // Locals to facilitate generating CLO files
    local clovars "clonumbervars score_egra_read hpro_read; clofactorvars level_egra_read"
    // Update metadata to be stored to include clovars
    local metadata "`metadata'; `clovars'"

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
