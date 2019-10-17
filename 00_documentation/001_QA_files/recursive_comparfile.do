	
	
	global QA_newpath "${output}" // Difined in run file
	
	* Change this to where you made a backup on your computer before replicating
	global QA_oldpath "C:\Users\wb462869\Documents\GitHub\013_outputs"
	
	
	*This program goes over the content of the 013_outputs and compare all .dta files
	* and recurse on all subfolders
	cap program drop   comparefile_recurse 
		program define comparefile_recurse 
	
		syntax, startfolder(string) [addfolder(string)]
		
		*The directorry for this recursive call
		local this_dir `"`startfolder'`addfolder'"'
		
		*List all the files in this_dir and loop over them
		local flist : dir `"`this_dir'"' files "*.dta"	, respectcase
		foreach file of local flist {
		
			*Skipe the BASE file as there is not always a good set of ID vars
			local fileend = substr("`file'", -8,.)
			if "`fileend'" != "BASE.dta" {
				
				noi di "FILE: `file'" 
				
				*Open new file to get the idvars from char
				use "${QA_newpath}/`addfolder'/`file'"
				local idvars : char _dta[idvars]
				
				*Compare old and new file
				comparefiles , localfile("${QA_newpath}/`addfolder'/`file'") sharedfile("${QA_oldpath}/`addfolder'/`file'") idvars(`idvars') compareall
			}
		}

		*List all the folders in this_dir and call this command on all of them (apart from TEMP and subsequently its subfolders)
		local dlist : dir `"`this_dir'"' dirs "*" 	, respectcase
		foreach dir of local dlist {
			*Recursive call on each subfolder (but skip the TEMP folder)
			if "`dir'" != "TEMP" comparefile_recurse , startfolder(`"`startfolder'"') addfolder(`"`addfolder'/`dir'"')
		}
	
	end
	
	*Call the command the first time
	comparefile_recurse, startfolder("${QA_newpath}") addfolder()
