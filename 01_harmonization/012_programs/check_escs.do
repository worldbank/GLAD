
global clone "C:\Users\wb255520\GitHub\mytasks\GLAD-Production\"

global output "${clone}\01_harmonization\013_outputs"



log using "${output}\check_escs.txt", replace text


use "${output}\WLD\WLD_2018_PISA\WLD_2018_PISA_v01_M_wrk_A_GLAD_ALL.dta"
tab countrycode qescs [aw= learner_weight ], nof row


use "${output}\EAP\EAP_2019_SEA-PLM\EAP_2019_SEA-PLM_v01_M_wrk_A_GLAD_ALL.dta" 
tab countrycode qescs [aw= learner_weight ], nof row


use "${output}\SSA\SSA_2019_PASEC\SSA_2019_PASEC_v01_M_wrk_A_GLAD_ALL.dta"
tab countrycode qescs [aw= learner_weight ], nof row


use "${output}\SSA\SSA_2021_AMPLB\SSA_2021_AMPLB_v01_M_wrk_A_GLAD_ALL.dta"
tab countrycode qescs [aw= learner_weight ], nof row


use "${output}\SSA\SSA_2019_AMPLB\SSA_2019_AMPLB_v01_M_wrk_A_GLAD_ALL.dta"
tab countrycode qescs [aw= learner_weight ], nof row

use "${output}\WLD\WLD_2015_TIMSS\WLD_2015_TIMSS_v01_M_wrk_A_GLAD_ALL.dta"
tab countrycode qescs [aw= learner_weight ], nof row

use "${output}\WLD\WLD_2019_TIMSS\WLD_2019_TIMSS_v01_M_wrk_A_GLAD_ALL.dta"
tab countrycode qescs [aw= learner_weight ], nof row
tab qescs [aw= learner_weight ]
 
log close