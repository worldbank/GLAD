*=========================================================================*
* GLOBAL LEARNING ASSESSMENT DATABASE (GLAD)
* Project information at: https://github.com/worldbank/GLAD
*
* Metadata to be stored as 'char' in the resulting dataset (do NOT use ";" here)
local region      = "LAC"
local year        = "2006"
local assessment  = "LLECE"
local master      = "v01_M"
local adaptation  = "wrk_A_GLAD"
local module      = "ALL"
local ttl_info    = "Joao Pedro de Azevedo [eduanalytics@worldbank.org]"
local dofile_info = "last modified by Joao Pedro Azevedo in Feb 05, 2022"  /* change date*/
*
* Steps:
* 0) Program setup (identical for all assessments)
* 1) Open all rawdata, lower case vars, save in temp_dir
* 2) Combine all rawdata into a single file (merge and append)
* 3) Standardize variable names across all assessments
* 4) Calculate harmonized Socio Economic Status variables
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
  local shortcut = " "		// PLACEHOLDER!!! revert to global after dlw issue solved
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
    foreach prefix in l3 m3 Cuestionario_QA3 Cuestionario_QF3 l6 m6 c6 Cuestionario_QA6 Cuestionario_QF6 {
      if `from_datalibweb'==1 {
        noi edukit_datalibweb, d(country(`region') year(`year') type(EDURAW) surveyid(`surveyid') filename(`prefix'.dta) `shortcut')
      }
      else {
        use "`input_dir'/`prefix'.dta", clear
      }
      rename *, lower
      compress
      save "`temp_dir'/`prefix'.dta", replace
    }

    noi disp as res "{phang}Step 1 completed (`output_file'){p_end}"


    *---------------------------------------------------------------------------
    * 2) Combine all rawdata into a single file (merge and append)
    *---------------------------------------------------------------------------

    // Though we avoid renaming variables, in this assessment all subjects used
    // the same varnames for score and level, so we must rename before merging
    foreach subject in read math sci {
      if "`subject'"=="read" {
        local prefix = "l"
      }
      if "`subject'"=="math"	{
        local prefix = "m"
      }
      if "`subject'"=="sci" {
        local prefix = "c"
      }
      foreach grade in 3 6 {
        if (`grade'==6 | "`subject'"!="sci") {
          // Opens file for that grade (prefix) and subject
          use "`temp_dir'/`prefix'`grade'.dta", clear
          foreach var of varlist   puntaje_estandar_final	 nivel	peso_estudiante {
            rename `var'	`var'_`subject'
          }
          save "`temp_dir'/`prefix'`grade'.dta", replace
        }
      }
    }

    // Grade 3
    use "`temp_dir'/l3.dta", clear
    merge 1:1 pais id_alumno using "`temp_dir'/m3.dta", keep(master match using) nogen
    merge 1:1 pais id_alumno using "`temp_dir'/Cuestionario_QA3.dta", keep(master match using) nogen
    merge 1:1 pais id_alumno using "`temp_dir'/Cuestionario_QF3.dta", keep(master match using) nogen
    save "`temp_dir'/P_3.dta", replace

    // Grade 6
    use "`temp_dir'/l6.dta", clear
    merge 1:1 pais id_alumno using "`temp_dir'/m6.dta", keep(master match using) nogen
    merge 1:1 pais id_alumno using "`temp_dir'/c6.dta", keep(master match using) nogen
    merge 1:1 pais id_alumno using "`temp_dir'/Cuestionario_QA6.dta", keep(master match using) nogen
    merge 1:1 pais id_alumno using "`temp_dir'/Cuestionario_QF6.dta", keep(master match using) nogen
    save "`temp_dir'/P_6.dta", replace

    // Append both grades
    use "`temp_dir'/P_3.dta", clear
    append using "`temp_dir'/P_6.dta"

    noi disp as res "{phang}Step 2 completed (`output_file'){p_end}"


    *---------------------------------------------------------------------------
    * 3) Standardize variable names across all assessments
    *---------------------------------------------------------------------------
    // For each variable class, we create a local with the variables in that class
    // so that the final step of saving the GLAD dta  knows which vars to save

    // ID Vars:
    local idvars "idcntry_raw idschool idgrade idlearner"  // idclass does not exist

    *<_idcntry_raw_>
    clonevar idcntry_raw = pais_num
    label var idcntry_raw "Country ID, as coded in rawdata"
    *</_idcntry_raw_>

    *<_idschool_>
    clonevar idschool = centro_educativo
    destring idschool, replace
    label var idschool "School ID"
    *</_idschool_>

    *<_idgrade_>
    clonevar idgrade = grado
    destring idgrade, replace
    label var idgrade "Grade ID"
    *</_idgrade_>

    *<_idclass_>
    gen int idclass = -99		// PLACEHOLDER: double check documentation to make sure it doesnt exist
    label var idclass "Class ID"
    *</_idclass_>

    *<_idlearner_>
    clonevar idlearner = id_alumno
    destring idlearner, replace
    label var idlearner "Learner ID"
    *</_idlearner_>

    // Drop any value labels of idvars, to be okay to append multiple surveys
    foreach var of local idvars {
      label values `var' .
    }


    // VALUE Vars:
    local valuevars	"score_llece* level_llece*"

    *<_score_assessment_subject_pv_>
    foreach subject in read math science {
	  if ("`subject'" == "science") {
		local subject2 "sci"
	  }
	  else {
		local subject2 "`subject'"
	  } 
      clonevar  score_llece_`subject2' = puntaje_estandar_final_`subject2'
      label var score_llece_`subject2' "Llece score for `subject'"
      char      score_llece_`subject2'[clo_marker] "number"
    }
    *</_score_assessment_subject_pv_>

    *<_level_assessment_subject_pv_>
    * Lowest scores are level A, best scores are level E
    * Recodes to be consistent with LLECE 2013, which uses number levels
    label define level_serce 4 "E" 3 "D" 2 "C" 1 "B" 0 "A"
    foreach subject in read math science {
	  if ("`subject'" == "science") {
		local subject2 "sci"
	  }
	  else {
		local subject2 "`subject'"
	  }      
	  encode nivel_`subject2', gen(level_llece_`subject2') label(level_serce)
      label var level_llece_`subject2' "Llece level for `subject'"
      char      level_llece_`subject2'[clo_marker] "factor"
    }
    *</_level_assessment_subject_pv_>


    // TRAIT Vars:
    local traitvars	"age urban* male qescs has_qescs"

    *<_age_>
    clonevar  age = qa3_item_1		if  idgrade==3
    replace   age = qa6_item_1		if  idgrade==6
    destring  age, replace
    replace   age = .a if inlist(age,98,99)
    label var age "Learner age at time of assessment"
    *</_age_>

    *<_urban_>
    gen byte  urban = (inlist(admrur,1,2))	if !missing(admrur)
    label var urban "School is located in urban/rural area"
    *</_urban_>

    *<_male_>
    gen byte male = .
    replace  male = 0 if (qa3_item_2 == "Femenino"  & idgrade==3)
    replace  male = 1 if (qa3_item_2 == "Masculino" & idgrade==3)
    replace  male = 0 if (qa6_item_2 == "Femenino"  & idgrade==6)
    replace  male = 1 if (qa6_item_2 == "Masculino" & idgrade==6)
    label var male "Learner gender is male/female"
    *</_male_>


    // SAMPLE Vars:
    local samplevars "psu strata learner_weight*"

    *<_psu_>
    * Since idschool is not unique by cntry, combine with it in a single variable
    egen psu = group(idcntry_raw idschool)
    label var psu "Primary Sampling Unit (PSU)"
    *</_psu_>


    *<_strata_>
    * Since strata is not unique by cntry, combine with it in a single variable
    egen strata = group(idcntry_raw estrato), label
    label var strata "Strata"
    *</_strata_>

    *<_learner_weight*_>
    foreach subject in read math science {
      if ("`subject'" == "science") {
		local subject2 "sci"
	  }
	  else {
		local subject2 "`subject'"
	  } 
	  clonevar  learner_weight_`subject2' = peso_estudiante_`subject2'
      label var learner_weight_`subject2' "Learner weight for `subject'"
    }
    clonevar  learner_weight_quest = peso_estudiante
    label var learner_weight_quest "Learner weight for questionnaire"
    * In case a single weight must be used, defaults to questionnaire,
    * because it has less missing values
    clonevar  learner_weight = learner_weight_quest
    *</_learner_weight*_>

    * Survey setup, considering two-stage sampling (students in schools)
    svyset psu [pw = learner_weight], strata(strata) || _n


    noi disp as res "{phang}Step 3 completed (`output_file'){p_end}"


    *---------------------------------------------------------------------------
    * 4) Calculate harmonized Socio Economic Status variables
    *---------------------------------------------------------------------------

    *<_paredu_>
    * Parent's Education variables
    * ¿Cuál es el nivel educativo más alto que las siguientes personas han completado?
    * qf_item_2_i_j with i = [1,7] levels, j = {a, b} = {el padre, la madre}
    gen int fatheredu = .
    gen int motheredu = .
    forvalues i = 1/7 {
      replace fatheredu = `i' if qf_item_2_`i'_a == "1"
      replace motheredu = `i' if qf_item_2_`i'_b == "1"
    }
    label define edu 1 "No education" 2 "Incomplete primary" 3 "Complete primary" 4 "Incomplete secondary" 5 "Complete secondary" 6 "Incomplete university" 7 "Complete university"
    egen int hiedu = rowmax(fatheredu motheredu)
    label values (fatheredu motheredu hiedu) edu
    label var hiedu "Parents' highest educational attainment"
    * Consolidate some categories that are reversing the threshold in the IRT
    // HIEDU IS FOR THE ORIGINAL ESCS
    clonevar paredu = hiedu
    recode paredu (1 = 1) (2 = 2) (3 4 = 3) (5 6 = 4) (7 = 5)
    label define paredu 1 "No education" 2 "Incomplete primary" 3 "Complete primary" 4 "Complete secondary" 5 "Complete university"
    label values paredu paredu
    *</_paredu_>

    *<_roomspc>
    *¿Cuántas personas viven en el hogar incluyendo al estudiante?
    * En mi casa viven… personas de 18 años o más
    gen int persons_adults   = real(qf_item_6_1) if !inlist(qf_item_6_1, "98", "99")
    * En mi casa viven… personas de menos de 18 años
    gen int persons_children = real(qf_item_6_2) if !inlist(qf_item_6_2, "98", "99")
    gen int persons = persons_adults + persons_children
    replace persons = . if inlist(persons, 0, 1)
    label var persons "Number of inhabitants in the household (incl. learner)"
    *¿Cuántas habitaciones tiene la vivienda en la que vive sin contar la cocina y el baño?
    gen int rooms = real(qf_item_7) if !inlist(qf_item_7, "98", "99")
    label var rooms "Rooms in the dwelling (except kitchen/bathroom)"
    gen roomspc_aux = rooms/persons
    egen roomspc = cut(roomspc_aux), at(0, 0.25, 0.5, 1, 100) label
    drop roomspc_aux
    label var roomspc "Rooms per household inhabitant"
    *</_roomspc>

    *<_floor_>
    * ¿De qué material son los pisos de la vivienda en su mayor parte?
    gen int floor = real(qf_item_8) if !inlist(qf_item_8, "X", "Y", "Z")
    label define floor 1 "Land" 2 "Cement" 3 "Tiles, ceramics or similar" 4 "Wooden boards or carpeted floor"
    recode floor (4 = 1) (3 = 2) (2 = 3) (1 5 = 4)
    * 1 (Parquet, madera pulida o piso alfombrado) was merged with 5 (Tablas de madera sin pulir)
    * because the threshold parameters in the IRT between the two implied a reversal of expected order
    * and category 5 had the least number of observations (3.5%)
    label values floor floor
    label var floor "Floor material"
    *</_floor_>

    *<_homeutilities_>
    * ¿Con cuáles de los siguientes servicios cuenta la vivienda?
    gen byte electricity  = (qf_item_9_1 == "1") if inlist(qf_item_9_1, "1", "2")
    gen byte water        = (qf_item_9_2 == "1") if inlist(qf_item_9_2, "1", "2")
    gen byte sewage       = (qf_item_9_3 == "1") if inlist(qf_item_9_3, "1", "2")
    gen byte phone        = (qf_item_9_4 == "1") if inlist(qf_item_9_4, "1", "2")
    gen byte cabletv      = (qf_item_9_5 == "1") if inlist(qf_item_9_5, "1", "2")
    gen byte internet     = (qf_item_9_6 == "1") if inlist(qf_item_9_6, "1", "2")
    label var electricity  "Home has electricity"
    label var water        "Home is connected to public piped water"
    label var sewage       "Home is connected to sewage system"
    label var phone        "Telephone availability at home"
    label var cabletv      "Cable / Satellite TV service at home"
    label var internet     "Internet access at home"
    *</_homeutilities_>

    *<_homeassets_>
    * ¿Cuáles de los siguientes bienes están presentes en el hogar?
    gen byte tv           = (qf_item_10_1  == "1") if inlist(qf_item_10_1,  "1", "2")
    gen byte radio        = (qf_item_10_2  == "1") if inlist(qf_item_10_2,  "1", "2")
    gen byte soundsystem  = (qf_item_10_3  == "1") if inlist(qf_item_10_3,  "1", "2")
    gen byte videorec     = (qf_item_10_4  == "1") if inlist(qf_item_10_4,  "1", "2")
    gen byte dvdorvhs     = (qf_item_10_5  == "1") if inlist(qf_item_10_5,  "1", "2")
    gen byte computer     = (qf_item_10_6  == "1") if inlist(qf_item_10_6,  "1", "2")
    gen byte cellphone    = (qf_item_10_7  == "1") if inlist(qf_item_10_7,  "1", "2")
    gen byte refrigerator = (qf_item_10_8  == "1") if inlist(qf_item_10_8,  "1", "2")
    gen byte stove        = (qf_item_10_9  == "1") if inlist(qf_item_10_9,  "1", "2")
    gen byte microwave    = (qf_item_10_10 == "1") if inlist(qf_item_10_10, "1", "2")
    gen byte washer       = (qf_item_10_11 == "1") if inlist(qf_item_10_11, "1", "2")
    gen byte dryer        = (qf_item_10_12 == "1") if inlist(qf_item_10_12, "1", "2")
    gen byte dishwasher   = (qf_item_10_13 == "1") if inlist(qf_item_10_13, "1", "2")
    gen byte auto         = (qf_item_10_14 == "1") if inlist(qf_item_10_14, "1", "2")
    gen byte moto         = (qf_item_10_15 == "1") if inlist(qf_item_10_15, "1", "2")
    label var tv           "Has a color TV at home"
    label var radio        "Has a radio at home"
    label var soundsystem  "Has a sound system at home"
    label var videorec     "Has a video recorder at home"
    label var dvdorvhs     "Has a DVD or VHS at home"
    label var computer     "Has a computer at home"
    label var cellphone    "Has a cellphone at home"
    label var refrigerator "Has a refrigerator at home"
    label var stove        "Has a gas/electric stove at home"
    label var microwave    "Has a microwave at home"
    label var washer       "Has a washer machine at home"
    label var dryer        "Has a dryer machine at home"
    label var dishwasher   "Has a dishwasher at home"
    label var auto         "Has an auto at home"
    label var moto         "Has a moto at home"
    *</_homeassets_>

    *<_nbook_>
    * ¿Cuántos libros hay en el hogar? Incluya todos los tipos de libro: de poesía, novelas, diccionarios, para estudiar, etc
    gen int nbooks = real(qf_item_11) if !inlist(qf_item_11, "X", "Y", "Z")
    label define nbooks 1 "No books" 2 "Less than 10 books" 3 "Between 10 and 50 books" 4 "More than 50 books"
    label values nbooks nbooks
    label var nbooks "Number of books at home"
    clonevar nbook = nbooks // FOR THE ORIGINAL ESCS
    *<_/nbook_>

    ****************************************************************
    ********************** ORIGINAL ESCS ***************************
    ****************************************************************

    **Replacing missing values of HIEDU:
    bysort pais centro_educativo: egen hiedu_mode = mode(hiedu), maxmode
    bysort pais: egen hiedu_mode_cnt = mode(hiedu), maxmode
    replace hiedu = hiedu_mode if missing(hiedu)
    replace hiedu = hiedu_mode_cnt if missing(hiedu)

    gen floor_material = qf_item_8 if !inlist(qf_item_8,"","X","Y","Z")
    destring floor_material, replace
    *Coding to be consistent with LLECE 2013:
    recode floor_material (4 = 1 "Land") (3 = 2 "Cement") (5 = 3 "Unpolished wooden boards") (2 = 4 "Tiles, ceramics or similar") ( 1 = 5 "Polished wood or carpeted floor"), gen(floor_material_r)
    drop floor_material
    ren floor_material_r floor_material

    foreach var of varlist qf_item_9* qf_item_10* {
      replace `var' = "" if inlist(`var',"X","Y","Z")
      destring `var', replace
      replace `var' = 0 if `var' == 2
    }

    *Generating variable for HOMEPOSS:
    foreach var of varlist floor_material qf_item_9* qf_item_10* nbook {
      bysort pais centro_educativo: egen `var'_mean = mean(`var')
      bysort pais: egen `var'_mean_cnt = mean(`var')
      replace `var' = `var'_mean if missing(`var')
      replace `var' = `var'_mean_cnt if missing(`var')
      egen `var'_std = std(`var')
    }

    noi disp as text _n "{phang2}HOMEPOS_O Cronbach's alpha{p_end}"
    noi alphawgt floor_material_std qf_item_9*_std qf_item_10*_std nbook_std [weight = peso_estudiante], std item label
    pca floor_material_std qf_item_9*_std qf_item_10*_std nbook_std [weight = peso_estudiante]
    predict homepos
    noi disp as text _n "{phang2}HOMEPOS_O PCA KMO{p_end}"
    noi estat kmo

    *Occupation of parents not available
    noi disp as text _n "{phang2}ESCS POLYCHORICPCA{p_end}"
    noi polychoricpca hiedu homepos [weight = peso_estudiante], score(escs) nscore(1)
    ren escs1 escs

    * Addendum
    rename homepos homepos_o
    xtile qescs = escs [aw = learner_weight], n(5)
    label var escs  "ESCS (original in GLAD v01)"
    label var qescs "Quintiles of ESCS"


    ****************************************************************
    ********************** NEW ESCS / SES **************************
    ****************************************************************

    * Organizing the SES harmonized variables into varclasses so they are saved in the end
    local homeutilities "electricity water sewage phone cabletv internet"
    local homeassets    "tv radio soundsystem videorec dvdorvhs computer cellphone refrigerator stove microwave washer dryer dishwasher moto auto"
    local homefactors   "paredu roomspc floor nbooks"
    local sescalculated "ses qses escs qescs nescs qnescs nnescs qnnescs escs_compute homepos_std homepos paredu_std hiedu homepos_o"
    * The vars in local -sesvars- are saved and presernted in this order (after traitvars)
    local sesvars       "`sescalculated' `homefactors' `homeutilities' `homeassets'"

    ************************************************
    * Compute a single-step SES indicator with IRT *
    ************************************************

    * We will use a hybrid IRT model: 2pl for binary and gpcm for ordinal components
    local ses_2pl   "`homeutilities' `homeassets'"
    local ses_gpcm  "`homefactors'"

    * Auxiliary vars to keep track of when the IRT has all component vars missing
    egen int ses_vars_miss = rowmiss(`ses_2pl' `ses_gpcm')
    gen byte ses_vars_miss_all = (ses_vars_miss == wordcount("`ses_2pl' `ses_gpcm'"))

    * Compute the Cronbach's Alpha of the scale formed by home variables
    * The option -item- also calculates the alpha's for dropping one item at a time
    noi disp as text "{phang2}SES Cronbach's alpha{p_end}"
    noi alphawgt `ses_2pl' `ses_gpcm' [aw = learner_weight], item
    local ses_alpha = `r(alpha)'

    * Fit the IRT model and predict the latent variable
    noi disp as txt _newline "{phang2}SES IRT model fit{p_end}"
    irt hybrid (2pl `ses_2pl') (gpcm `ses_gpcm') [pw = learner_weight], iterate(5)
    noi estat report, byparm
    predict ses, latent

    * When all components are missing the IRT estimate is zero, replace it to missing
    replace ses = . if ses_vars_miss_all
    label var ses "SES (single-step IRT)"
    note ses : "Component vars: `ses_2pl' `ses_gpcm'"
    note ses : "Cronbach's Alpha = `: di %3.2f `ses_alpha''"

    * Divide into quintiles (all countries pooled)
    xtile qses = ses [aw = learner_weight], n(5)
    label var qses "Quintiles of SES"


    *******************************************************
    * Compute two-step ESCS indicator (IRT+PCA) like PISA *
    *******************************************************

    *** FIRST STEP ***
    * Similarly to PISA, first calculate HOMEPOS (home possessions) through IRT
    * This is very similar to the single-step IRT above, but with less variables
    local homepos_2pl   "`homeutilities' `homeassets'"
    local homepos_gpcm  "floor nbooks"

    * Auxiliary vars to keep track of when the IRT has all component vars missing
    egen int homepos_vars_miss = rowmiss(`homepos_2pl' `homepos_gpcm')
    gen byte homepos_vars_miss_all = (homepos_vars_miss == wordcount("`homepos_2pl' `homepos_gpcm'"))

    * Compute the Cronbach's Alpha of the scale formed by homepos variables
    * The option -item- also calculates the alpha's for dropping one item at a time
    noi disp as text "{phang2}HOMEPOS Cronbach's alpha{p_end}"
    noi alphawgt `homepos_2pl' `homepos_gpcm' [aw = learner_weight], item
    local homepos_alpha = `r(alpha)'

    * Fit the IRT model and predict the latent variable
    noi disp as txt _newline "{phang2}HOMEPOS IRT model fit{p_end}"
    irt hybrid (2pl `homepos_2pl') (gpcm `homepos_gpcm') [pw = learner_weight], iterate(5)
    noi estat report, byparm
    predict homepos, latent

    * When all components are missing the IRT estimate is zero, replace it to missing
    replace homepos = . if homepos_vars_miss_all
    label var homepos "Home possessions composite indicator"
    note homepos : "Component vars: `homepos_2pl' `homepos_gpcm'"
    note homepos : "Cronbach's Alpha = `: di %3.2f `homepos_alpha''"

    *** SECOND STEP ***
    /* In PISA, the ECONOMIC, SOCIAL AND CULTURAL STATUS (ESCS) is the first
    factor of a PCA that takes 3 composite indicators: HOMEPOS (1st step above),
    highest parental occupation (HISEI) and parental education (PARED or HIEDU).
    But prior to the PCA, they perform an imputation based on a regression of
    the other two components, with a random error, if any 1 component is missing.
    However, if two components are missing, ESCS is not calculated.
    In LLECE, we don't have HISEI, so we lower the bar and calculate ESCS whenever
    one of the two other components is present */

    * Impute missings of HIEDU based on HOMEPOS and vice-versa
    mi set wide
    mi register imputed paredu homepos
    mi impute ologit  paredu  homepos if !missing(homepos) [pw = learner_weight], add(1)  force
    mi impute regress homepos paredu  if !missing(paredu)  [pw = learner_weight], replace force
    mi unset
    * Flag whether escs should be calculated or not
    label define escs_compute 0 "Not computed" 1 "Computed with imputed components" 2 "Computed without imputed components"
    gen byte escs_compute = 0 if  missing(paredu_1_) |  missing(homepos_1_)
    replace  escs_compute = 1 if !missing(paredu_1_) & !missing(homepos_1_) & mi_miss
    replace  escs_compute = 2 if !mi_miss
    label values escs_compute escs_compute
    label var escs_compute "Computation of ESCS"

    * PISA stardardizes the three imputed components to mean 0 and sd 1 before the PCA
    foreach var of varlist paredu homepos {
      sum `var'_1_ [weight = learner_weight] // imputed values
      gen `var'_std = (`var'_1_ - `r(mean)') / `r(sd)'
      label var `var'_std "`: variable label `var'' (imp.std.)"
    }

    /* Finally, the PCA calculation of ESCS.
    Given that at this point the variables are standardized, I see no point in
    using polychoricpca (and no mention to it in OECD documentation) */
    pca paredu_std homepos_std if escs_compute [aw = learner_weight], components(1)
    predict nescs
    noi disp as txt _newline "{phang2}ESCS PCA KMO{p_end}"
    noi estat kmo
    note nescs : "Kaiser-Meyer-Olkin = `: di %3.2f `r(kmo)''"
    label var nescs "New ESCS (IRT + PCA)"

    * PISA presents the loadings and alpha of fits by country, besides the pooled
    noi disp as txt _newline "{phang2}ESCS PCA loadings{p_end}"
    noi estat loadings
    noi disp as txt _newline "{phang2}ESCS Cronbach's alpha{p_end}"
    noi alphawgt paredu_std homepos_std [aw = learner_weight]
    noi disp as txt _newline ""

    * Divide into quintiles (all countries pooled)
    xtile qnescs = nescs [aw = learner_weight], n(5)
    label var qnescs "Quintiles of New ESCS"


    * But could also do it using polychoricpca of not std
    * and the variable without the recoding (hiedu not paredu)
    polychoricpca hiedu homepos [w = learner_weight], score(escs) nscore(1)
    rename escs1 nnescs
    label var nnescs "NN ESCS (IRT + polychoricPCA)"
    xtile qnnescs = nnescs [aw = learner_weight], n(5)
    label var qnnescs "Quintiles of NN ESCS"

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

    // This function compresses the dataset, adds metadata passed in the arguments as chars, save GLAD_BASE.dta
    // which contains all variables, then keep only specified vars and saves GLAD.dta, and delete files in temp_dir
    edukit_save, filename("`output_file'") path("`output_dir'") dir2delete("`temp_dir'") idvars("`idvars'")      ///
                 varc("key `keyvars'; value `valuevars'; trait `traitvars'; ses `sesvars'; sample `samplevars'") ///
                 metadata("`metadata'") collection("GLAD")

    noi disp as res "Creation of `output_file'.dta completed"

  }

  else {
    noi disp as txt "Skipped creation of `output_file'.dta (already found in clone)"
    // Still loads it, to generate documentation
    use "`output_dir'/`output_file'.dta", clear
  }
}
