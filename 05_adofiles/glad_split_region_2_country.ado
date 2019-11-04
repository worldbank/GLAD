*==============================================================================*
* PROGRAM: SPLIT REGIONS INTO COUNTRIES WHEN COPYING TO DLW ROOT
* Project information at: https://github.com/worldbank/GLAD
* Author: Kristoffer Bjarkefur
*==============================================================================*

cap program drop 	split_region_2_country
program define	split_region_2_country, rclass

  syntax , fname(string) floc(string) OVERWrite_files(numlist) regionfolder(string) masterfolder(string)

  qui {

    * Get region, year and assessment from file name
    gettoken region rest : fname , parse("_")
    local rest = substr("`rest'", 2, .)
    gettoken year rest : rest , parse("_")
    local rest = substr("`rest'", 2, .)
    gettoken assessment rest : rest , parse("_")

    * Generate the surveyname for this file
    local surveyname "`region'_`year'_`assessment'"

    * Open up the global/regional file
    use "`floc'/`fname'", clear

    cap confirm variable countrycode
    if _rc {
      noi di as error `"{phang}The file [`floc'/`fname'] does not have a variable called {inp:countrycode} which is required for all files to be split by country.{p_end}"'
      error 601
    }

    * List all the country codes in this file
    levelsof countrycode, clean local(countries)

    noi di "{phang2}Countries included: [`countries']{p_end}"

    local country_counter = 0
    local country_total : word count `countries'

    * Loop over all countries
    foreach country of local countries {

        * Increment the counter for screen output
        local ++country_counter

        * Create the country file and folder name from the region file and folder name
        local cnt_surveyname    = subinstr("`surveyname'","`region'", "`country'", 1)
        local cnt_filename      = subinstr("`fname'"  ,"`region'", "`country'", 1)
        local cnt_folder        = subinstr("`regionfolder'"  ,"`region'", "`country'", 1)
        local cnt_master_folder = subinstr("`masterfolder'"  ,"`region'", "`country'", 1)


        * Creates folder if not already exists
        edukit_rmkdir, parent(${output}) newfolders(`country'/`cnt_surveyname'/`cnt_master_folder')
        edukit_rmkdir, parent(${output}) newfolders(`country'/`cnt_surveyname'/`cnt_folder'/Data/Harmonized)
        local output_folder "`r(folder)'"

        * Confirm that the file to be split exists
        cap confirm file "`output_folder'/`cnt_filename'"
        * If the file does not exist or overwrite_files local is set to one, run the do
        if (_rc == 601) | (`overwrite_files') {

            preserve
                * Keep only observations for this country
                keep if countrycode == "`country'"

                * Save the file with obs only for this country in the country folder name
                save "`output_folder'/`cnt_filename'", replace
                noi di "{phang2}File [`cnt_filename'] saved (`surveyname' country `country_counter' of `country_total'){p_end}"
            restore
        }
        else {
            * Still show output even when file already exist
            noi di "{phang2}File [`cnt_filename'] already exists (`surveyname' country `country_counter' of `country_total'){p_end}"
        }
    }
    noi di ""
  }
end
