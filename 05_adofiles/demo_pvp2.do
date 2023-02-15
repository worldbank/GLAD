********************************************************************************
* JP Azevedo
* Benchmark computational time using different options of estimations
********************************************************************************

* NOTE TO JP: the datalibweb.ado uses the global name root.
* and that messes up a do-file if it makes use of the same global.
* This is why I'm changing it to mypath.

* create root folder for JP
if inlist("`c(username)'","wb255520","WB255520") {
  global mypath "C:/Users/`c(username)'/GitHub/myados/pvp2/01_data"
}

* create root folder for Diana
else if inlist("`c(username)'","wb552057","WB552057","diana") {
  global mypath "C:/Users/`c(username)'/Desktop"
}

********************************************************************************
* pull TIMMS data using datalibweb

cap confirm file "${mypath}/pvp_test.dta"
if _rc {
  datalibweb, country(PRT) year(2015) type(GLAD) surveyid(PRT_2015_TIMSS_v01_M_v01_A_GLAD) mod(ALL)
  save "${mypath}/pvp_test.dta", replace
}

********************************************************************************
* set parameters

set seed 121
set rmsg on 

use "${mypath}/pvp_test.dta", clear

qui foreach factor_var of varlist level* {
	
  * Each factorvar become several dummies, corresponding to the marginal share of students in each level
  tab `factor_var', generate(`factor_var'd)
  
  * Tab, gen adds the number at the end of the varname,
  * but we would like it to be at the beginning
  rename `factor_var'd*  d*`factor_var'
}

local pv_vars ""
local pv_trait_vars ""
foreach subject in math science {
	local pv_vars "`pv_vars' score_timss_`subject'_*"
	foreach trait in all male0 male1 urban0 urban1 {
    local pv_trait_vars "`pv_trait_vars' score_timss_`subject'_*_`trait'"
  }
  forvalues i=1/5 {
    local pv_vars "`pv_vars' d`i'level_timss_`subject'_*"
    foreach trait in all male0 male1 urban0 urban1 {
      local pv_trait_vars "`pv_trait_vars' d`i'level_timss_`subject'_*_`trait'"
    }
  }
}

* NOTE TO JP: this is what you asked: 12 sets of 5 PVs for TIMSS.
* Actually, there are 8 more sets (hpro, fgt0 fgt1 fgt2 * 2 subjects)
* but i'm not going to add them now

noi disp as txt _n "{phang}All pv_trait_vars to calculate: `pv_trait_vars'{p_end}"


* Create the separated trait vars
unab all_vars : `pv_vars'
qui foreach var in `all_vars' {
	foreach trait in male urban {
    separate `var', by(`trait') gen(`var'_`trait')
  }
  rename `var' `var'_all
}





* PV single value using MEAN
pv, pv(score_timss_math_*_all)  jkzone(jkzone) jkrep(jkrep) weight(learner_weight) jrr timss  : mean @pv  [aw=@w]
return list

* PV single value using REG
pv, pv(score_timss_math_*_all)  jkzone(jkzone) jkrep(jkrep) weight(learner_weight) jrr timss  : reg @pv   [aw=@w]
return list


* DIFFERENT (WRONG) RESULTS, do not use
* PV two variables at a time using MEAN without the MDD option
//pv, pv(score_timss_math*) pv1(score_timss_science*) jkzone(jkzone) jkrep(jkrep) weight(learner_weight) jrr timss  : mean @pv @1pv [aw=@w]
//return list

* PV two variables at a time using MEAN with the MDD option
pv, pv(score_timss_math_*_all) pv1(score_timss_science_*_all) jkzone(jkzone) jkrep(jkrep) weight(learner_weight) jrr timss mdd : mean @pv @1pv [aw=@w]
return list

* PV multiple variables at a time using MEANPV with the MDD option
pv, pv(score_timss_math_*_all) pv1(score_timss_science_*_all) jkzone(jkzone) jkrep(jkrep) weight(learner_weight) jrr timss  mdd : meanpv, var1(@pv) var2(@1pv) wtg(aw=@w)
return list

* Failed attempt to use the Parallel ADO
*pvp, pv(score_timss_math* ) pv1(score_timss_science*) jkzone(jkzone) jkrep(jkrep) weight(learner_weight) jrr timss mdd parallel : mean @pv @1pv [aw=@w]
