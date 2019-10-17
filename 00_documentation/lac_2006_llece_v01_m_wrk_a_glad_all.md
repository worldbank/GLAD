Documentation of GLAD dataset
=====================================================================


[back to list of assessments](https://github.com/worldbank/GLAD/blob/master/README.md#harmonization)

This dataset is part of the Global Learning Assessment Database (GLAD). It contains microdata from LLECE 2006. Each observation corresponds to one learner (student or pupil), and the variables have been harmonized.

**Metadata** stored in this dataset:

~~~~
region:      LAC
year:        2006
assessment:  LLECE
master:      v01_M
adaptation:  wrk_A_GLAD
module:      ALL
ttl_info:    Joao Pedro de Azevedo [eduanalytics@worldbank.org]
dofile_info: last modified by Diana Goldemberg in October 8, 2019
lastsave:    9 Oct 2019 20:11:50 by wb552057
~~~~


About the **27 variables** in this dataset:

~~~~
The variables belong to the following variable classifications:
    idvars keyvars valuevars traitvars samplevars

idvars:     idcntry_raw idschool idgrade idlearner
keyvars:    surveyid countrycode national_level
valuevars:  score_llece_read score_llece_math score_llece_science level_llece_read level_llece_math level_llece_science
traitvars:  age urban male escs
samplevars: strata learner_weight_read learner_weight_math learner_weight_science learner_weight_quest learner_weight


Variable         Obs Unique       Mean        Min       Max  Label
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
idcntry_raw   196040     17   11.07802          1        21  Country ID, as coded in rawdata
idschool      196040    231    90.7797          1       231  School ID
idgrade       196040      2   4.458192          3         6  Grade ID
idlearner     196040 196040   1.12e+09   1.00e+08  2.12e+09  Learner ID
surveyid      196040      1          .          .         .  Survey ID (Region_Year_Assessment)
countrycode   196040     16          .          .         .  WB country code (3 letters)
national_l~l  196040      2   .9452357          0         1  Idcntry_raw is a national level
score_llec~d  185091    329   511.3148  -48.33484  970.1854  Llece score for read
score_llec~h  187996    841   507.9794  -55.01115   1135.41  Llece score for math
score_llec~e   53979    337   508.8589  -68.76551   1188.77  Llece score for science
level_llec~d  185091      5   2.255518          0         4  Llece level for read
level_llec~h  187996      5   2.089656          0         4  Llece level for math
level_llec~e   53979      5    1.80535          0         4  Llece level for science
age           185879     44   10.57118          4        50  Learner age at time of assessment
urban         196040      2    .795251          0         1  School is located in urban/rural area
male          187018      2   .5031387          0         1  Learner gender is male/female
escs          186462 123696  -.0209971   -3.10078  2.428199  
strata        196040     60   13886.47          2   4031503  Strata
learner_we~d  185091   3800   113.3772          1  3390.208  Learner weight for read
learner_we~h  187996   3777   111.6253          1  2089.599  Learner weight for math
learner_we~e   53979   1076   53.83505          1  1192.513  Learner weight for science
learner_w~st  196040   3483    107.045          1  2089.599  Learner weight for questionnaire
learner_w~ht  185091   3800   113.3772          1  3390.208  Learner weight for read
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


Plus the variables merged-on-the-fly, which are:

traitvars:  lp01_threshold_var lp01_threshold_val lp01_threshold_res
valuevars:  hpro_read
~~~~

About the **196,040 observations** in this dataset:

~~~~
. tab countrycode idgrade if national_level==1

WB country |
   code (3 |       Grade ID
  letters) |         3          6 |     Total
-----------+----------------------+----------
       ARG |     6,663      6,595 |    13,258 
       BRA |     5,711      5,422 |    11,133 
       CHL |     6,136      6,912 |    13,048 
       COL |     5,902      6,026 |    11,928 
       CRI |     5,233      4,703 |     9,936 
       CUB |     5,293      5,902 |    11,195 
       DOM |     4,554      4,618 |     9,172 
       ECU |     5,349      5,376 |    10,725 
       GTM |     7,095      5,365 |    12,460 
       MEX |     4,753      4,825 |     9,578 
       NIC |     6,885      6,741 |    13,626 
       PAN |     6,476      5,608 |    12,084 
       PER |     4,814      4,662 |     9,476 
       PRY |     5,506      4,777 |    10,283 
       SLV |     7,474      6,342 |    13,816 
       URY |     7,209      6,377 |    13,586 
-----------+----------------------+----------
     Total |    95,053     90,251 |   185,304 

. 
. tab countrycode idgrade if national_level==0

WB country |
   code (3 |       Grade ID
  letters) |         3          6 |     Total
-----------+----------------------+----------
       MEX |     5,699      5,037 |    10,736 
-----------+----------------------+----------
     Total |     5,699      5,037 |    10,736 

~~~~

**Harmonization** of proficiency (done on-the-fly):

~~~~

           hpro_read |      Freq.     Percent        Cum.
---------------------+-----------------------------------
      Non-proficient |     48,825       24.91       24.91
          Proficient |     41,646       21.24       46.15
 Missing score/level |      4,817        2.46       48.61
Non-harmonized grade |    100,752       51.39      100.00
---------------------+-----------------------------------
               Total |    196,040      100.00



     +--------------------------------------------------------+
     | idgrade   prefix               harmonization_condition |
     |--------------------------------------------------------|
  1. |       3     lp01                      no harmonization |
  2. |       6     lp01   hpro_read = (level_llece_read >= 3) |
     +--------------------------------------------------------+

~~~~
