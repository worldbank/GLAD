*==============================================================================*
* GLOBAL LEARNING ASSESSMENT DATABASE (GLAD)
* Project information at: https://github.com/worldbank/GLAD
*
* TASK 01_HARMONIZATION: creates GLAD from EDURAW (in datalibweb or input path)
*==============================================================================*

*-------------------------------------------------------------------------------
* Setup for this task
*-------------------------------------------------------------------------------
* Check that project profile was loaded, otherwise stops code
cap assert ${GLAD_profile_is_loaded} == 1
if _rc != 0 {
  noi disp as error "Please execute the profile_GLAD initialization do in the root of this project and try again."
  exit
}

* Execution parameters
global master_seed  12345    // Ensures reproducibility
global from_datalibweb = 1   // If 1, uses datalibweb, if not 1, it takes raw .dtas in $network_HLO_DB
global overwrite_files = 0   // If 1, it always creates each GLAD.dta file, even if it already exists, and overwrites any old file
global shortcut = "${shortcut_GLAD}"  // NEVER COMMIT ANY CHANGES IN THIS LINE

* Global paths that may serve as input and output for this task
global input  "${network}/GDB/HLO_Database" // Where EDURAW files will be read from if datalibweb==0
global output "${clone}/01_harmonization/013_outputs"  // Where CLO.dta files will be saved
* Locals input_dir and output_dir point to subfolders of those globals, for each region_year_assessment
*-------------------------------------------------------------------------------

*-------------------------------------------------------------------------------
* Subroutines for this task
*-------------------------------------------------------------------------------
* Load CSVs with master country list and proficiency thresholds into DTAs
do "${clone}/01_harmonization/012_programs/0121_prepare_inputs.do"

* Create all GLAD dtas by looping over all GLAD dos and creating documentation
do "${clone}/01_harmonization/012_programs/0122_create_GLADs.do"
*-------------------------------------------------------------------------------
