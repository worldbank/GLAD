*==============================================================================*
* PROGRAM: SETUP LOCAL FOLDER STRUCTURE WHEN CREATING NEW GLAD MODULE
* Project information at: https://github.com/worldbank/GLAD
* Author: Kristoffer Bjarkefur
*==============================================================================*

cap program drop glad_local_folder_setup
program  define  glad_local_folder_setup, rclass

  * Names:
  syntax , Region(string) Year(string) ASsessment(string) MAster(string) ADaptation(string)

  local topfolder			"`region'_`year'_`assessment'"
  local surveyid      	"`topfolder'_`master'"

  return local surveyid `surveyid'

  * Paths:
  makefolder,  parent("${output}") newfolder("`region'")
  makefolder,  parent("`r(folder)'") newfolder("`topfolder'")

  return local output_dir "`r(folder)'"

  local tempfolder    "TEMP_`topfolder'"

  makefolder,  parent("${output}") newfolder("TEMP")
  makefolder,  parent("`r(folder)'") newfolder("`tempfolder'")

  return local temp_dir "`r(folder)'"
end


cap program drop makefolder
program  define  makefolder, rclass

  syntax, parent(string) newfolder(string)

  * Test that parent folder exists
  mata : st_numscalar("r(dirExist)", direxists("`parent'"))
  if `r(dirExist)' == 0 {
    noi di as error `"{phang}Internal error glad_local_folder_setup.ado, folder [`parent'] does not exist{p_end}"'
    error 601
  }

  * Test if new folder exists, if not create it
  mata : st_numscalar("r(dirExist)", direxists("`parent'/`newfolder'"))
  if `r(dirExist)' == 0 {
    mkdir "`parent'/`newfolder'"
  }

  return local folder "`parent'/`newfolder'"

end
