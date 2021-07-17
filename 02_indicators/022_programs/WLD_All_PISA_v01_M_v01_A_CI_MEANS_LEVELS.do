
*==============================================================================*
*PISA Briefs 2018
*
*Steps:
*0) Creating a combined text file
*1) Bringing country list
*2) Creating binary variables for levels
*3) Separating scores and levels by subgroups of traitvars
*4) Creating txt file for each indicator
*5) Calculate statistics by subgroups of traitvars
*===============================================================================*

clear

save "$temp\WLD_All_PISA_v01_M_v01_A_CI.txt" , emptyok replace
		
file open myfile using "$temp\WLD_All_PISA_v01_M_v01_A_CI.txt", write replace

file write myfile "countrycode" _tab "year" _tab  "national_level" _tab "indicator" _tab  "value" _tab "se" _tab "n" _n /*header */
		
file close myfile

*-------------------------------------------------------------------------------
*1) Bringing country list along with comparators and setting locals for subject and plausible values
*-------------------------------------------------------------------------------
*Include 2018 years into the file
use "$input_raw/master_countrycode_list.dta", clear
*merge by region code:
keep if assessment == "PISA"
*Change code to if year == 2018
levelsof countrycode, local (cnt)
set trace on
foreach cc of local cnt {
	preserve
	levelsof year if countrycode == "`cc'", local(yr)
	
	foreach year of local yr {

		*Setting folder structure:
		*=========================================================================*
		* GLOBAL LEARNING ASSESSMENT DATABASE (GLAD)
		* Project information at: https://github.com/worldbank/GLAD
		*
		* Metadata to be stored as 'char' in the resulting dataset (do NOT use ";" here)
		local region      = "WLD"   /* LAC, SSA, WLD or CNT such as KHM RWA */
		local year        = "`year'"  /* 2015 */
		local assessment  = "PISA" /* PIRLS, PISA, EGRA, etc */
		local master      = "v01_M" /* usually v01_M, unless the master (eduraw) was updated*/
		local adaptation  = "wrk_A_GLAD" /* no need to change here */
		local module      = "ALL"  /* for now, we are only generating ALL and ALL-BASE in GLAD */
		local ttl_info    = "Joao Pedro de Azevedo [eduanalytics@worldbank.org]" /* no need to change here */
		local dofile_info = "last modified by Syedah Aroob Iqbal in October 29, 2019"  /* change date*/
		*
		* Steps:
		* 0) Program setup (identical for all assessments)
		* 1) Open all rawdata, lower case vars, save in temp_dir
		* 2) Combine all rawdata into a single file (merge and append)
		* 3) Standardize variable names across all assessments
		* 4) ESCS and other calculations
		* 5) Bring WB countrycode & harmonization thresholds, and save dtas
		*=========================================================================*

		  glad_local_folder_setup , r("`region'") y("`year'") as("`assessment'") ma("`master'") ad("`adaptation'")
		  global temp_dir     "`r(temp_dir)'"
		  global output_dir   "`r(output_dir)'"
		  global surveyid     "`r(surveyid)'"
		  global output_file  "$surveyid_`adaptation'_`module'"

		 * Save timestamps for naming the log by initial time
		local today = subinstr("$S_DATE"," ","_",.)
		local time  = subinstr("$S_TIME",":","-",.)


		use "$output_dir/WLD_`year'_PISA_v01_M_wrk_A_GLAD.dta", clear
		
		*Keeping only national level observations:
		egen national_exists = max(national_level)
		drop if national_level == 0 & national_exists == 1
		
		* Creating locals to accomodate additonal subjects added in later years - Flit currently not available for 2018
		if inlist(`year', 2000, 2003, 2006, 2009, 2018) {
		     local subject "read math scie"
		}
		else if inlist(`year', 2012, 2015) {
		     local subject "read math scie flit"
		}
		 
		  
		 *Creating local to accomodate differnetial number of plausible values:
		 if inlist(`year',2000,2003,2006,2009,2012) {
		     local pvvalues 1 2 3 4 5
		}
		else if inlist(`year',2015,2018) {
		    local pvvalues 1 2 3 4 5 6 7 8 9 10
		}
		
		local traitvars total male urban native escs* ece language school_type city school_type_o


		
		keep if countrycode == "`cc'"
		
		count
		if r(N) > 0 {
		
		
			*---------------------------------------------------------------------------------
			* 2) Creating binary variables for levels
			*---------------------------------------------------------------------------------
			foreach var of varlist level* {
				replace `var' = "" if `var' == "-99"
				replace `var' = "below1b" if `var' == "<1b"
				replace `var' = "below1" if `var' == "<1"
				replace `var' = "below1c" if `var' == "<1c"
			}

			foreach sub of local subject {
				levelsof level_pisa_`sub'_1, local(lev)
				foreach l of local lev {
					foreach i of local pvvalues {
						gen blev`l'_pisa_`sub'_`i' = (level_pisa_`sub'_`i' == "`l'") & !missing(level_pisa_`sub'_`i')
						label variable blev`l'_pisa_`sub'_`i' "PISA proficiency level `l' of `sub'_`i'"
							}
				}
			}		


			*--------------------------------------------------------------------------------
			* 3) Separating indicators by trait groups
			*--------------------------------------------------------------------------------
			
			gen total = 1
			label define total 1 "total"
			label values total total
							
			foreach sub of local subject {
				foreach indicator in score blevbelow1c blev1c blevbelow1b blev1b blev1a blevbelow1 blev1 blev2 blev3 blev4 blev5 blev6 {
					capture confirm variable `indicator'_pisa_`sub'_1
					if !_rc {

						foreach trait of local traitvars  {
						capture confirm variable `trait'
							if !_rc { 
								foreach i of local pvvalues {
									separate(`indicator'_pisa_`sub'_`i'), by(`trait') gen(`indicator'`sub'`i'`trait')
									ren `indicator'`sub'`i'`trait'* `indicator'`sub'`trait'*_`i'	
								}
								
				*-----------------------------------------------------------------------------
				*4) *Calculation of indicators by subgroups of traitvars
				*-----------------------------------------------------------------------------
								levelsof `trait', local(lev)
								foreach lv of local lev {
									local label: label (`trait') `lv'

									
									if `year' == 2000 {
									
										cap qui: pv, pv(`indicator'`sub'`trait'`lv'_*) weight(learner_weight_`sub') brr rw(weight_replicate_`sub'*) fays(0.5): mean @pv [aw=@w]
									}
									
									if `year' != 2000 {
															
										cap qui: pv, pv(`indicator'`sub'`trait'`lv'_*) weight(learner_weight) brr rw(weight_replicate*) fays(0.5): mean @pv [aw=@w]
									}


									
									* Create variables to store estimates (mean and std error of mean) and num of obs (N)
									matrix pv_mean = e(b)
									matrix pv_var  = e(V)
									local  m_`indicator'`sub'`label'  = pv_mean[1,1]
									local  se_`indicator'`sub'`label' = sqrt(pv_var[1,1])
									local  n_`indicator'`sub'`label'  = e(N)
									
									summarize national_level
									local n_res = r(mean)
									
									save "$temp_dir\WLD_`year'_PISA_v01_M_v01_A_CI_`cc'_`indicator'`sub'`label'.txt" , emptyok replace
			
									file open ccindfile using "$temp_dir\WLD_`year'_PISA_v01_M_v01_A_CI_`cc'_`indicator'`sub'`label'.txt", write replace
									
									file write ccindfile "countrycode" _tab "year" _tab  "national_level" _tab "indicator" _tab  "value" _tab "se" _tab "n" _n /*header */

									file write ccindfile "`cc'" _tab "`year'" _tab "`n_res'" _tab "`indicator'`sub'`label'" _tab "`m_`indicator'`sub'`label''" _tab "`se_`indicator'`sub'`label''" _tab  "`n_`indicator'`sub'`label''"  _n
											
									file close ccindfile
																	
									file open myfile   using	 "$temp\WLD_All_PISA_v01_M_v01_A_CI.txt", write append			

									file write myfile "`cc'" _tab "`year'" _tab "`n_res'" _tab "`indicator'`sub'`label'" _tab "`m_`indicator'`sub'`label''" _tab "`se_`indicator'`sub'`label''" _tab  "`n_`indicator'`sub'`label''"  _n

									file close myfile

								}	
							}
							
						}
					}
				}
			}
		}
	}
	restore
}
insheet using "$temp\WLD_All_PISA_v01_M_v01_A_CI.txt", clear names
gen test = "PISA"
drop if strpos(indicator,"readMq") > 1
drop if strpos(indicator,"readSq") > 1
drop if strpos(indicator,"mathRq") > 1
drop if strpos(indicator,"mathSq") > 1
drop if strpos(indicator,"scieRq") > 1
drop if strpos(indicator,"scieMq") > 1
replace indicator = subinstr(indicator,"Rq","q")
replace indicator = subinstr(indicator,"Mq","q")
replace indicator = subinstr(indicator,"Sq","q")
cf _all using "$temp\WLD_All_PISA_v01_M_v01_A_CI.dta"
save "$temp\WLD_All_PISA_v01_M_v01_A_CI.dta", replace

