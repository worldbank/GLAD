*==============================================================================*
* GLOBAL LEARNING ASSESSMENT DATABASE (GLAD)
* Project information at: https://github.com/worldbank/GLAD
*
* TASK 02_INDICATORS: creates the CLOs from GLADs (in datalibweb or clone)
*==============================================================================*

*-------------------------------------------------------------------------------
* Setup for this task
*-------------------------------------------------------------------------------
* Check that project profile was loaded, otherwise stops code
qui {
  cap assert ${GLAD_profile_is_loaded} == 1
  if _rc != 0 {
    noi disp as error "Please execute the profile_GLAD initialization do in the root of this project and try again."
    exit
  }
}

* Execution parameters
global master_seed  12345            // Ensures reproducibility
global from_datalibweb_GLAD_02 = 0   // If 1, uses datalibweb, if not 1, it takes GLAD .dtas in ${clone}
global adpt = "wrk" 				   // If from_datalibweb_GLAD_02 == 1, specify the vintage of the harmonization
global overwrite_files_GLAD_02 = 1   // If 1, it always creates each CLO.dta file, even if it already exists, and overwrites any old file
global shortcut_GLAD_02 = "${shortcut_GLAD}"  // NEVER COMMIT ANY CHANGES IN THIS LINE

* Global paths that may serve as input and output for this task
global input  "${clone}/01_harmonization/013_outputs"  // Where GLAD.dta files will be read from if datalibweb==0
global output "${clone}/02_indicators/023_outputs"     // Where CLO.dta files will be saved
* Locals input_dir and output_dir point to subfolders of those globals, for each region_year_assessment
*-------------------------------------------------------------------------------

*-------------------------------------------------------------------------------
* Subroutines for this task
*-------------------------------------------------------------------------------
* Create a CLO from each GLAD found in clone
* do "${clone}/02_indicators/022_programs/0221_clo_from_glad.do"

 do "${clone}/02_indicators/022_programs/0222_clo_escs_from_glad.do"  
/*This file needs to run after 0221*/
*-------------------------------------------------------------------------------
