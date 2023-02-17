Documentation of GLAD dataset
=====================================================================


[back to list of assessments](https://github.com/worldbank/GLAD/blob/master/README.md#harmonization)

This dataset is part of the Global Learning Assessment Database (GLAD). It contains microdata from PASEC 2011. Each observation corresponds to one learner (student or pupil), and the variables have been harmonized.

**Metadata** stored in this dataset:

~~~~
region:      MLI
year:        2011
assessment:  PASEC
master:      v01_M
adaptation:  wrk_A_GLAD
module:      ALL
ttl_info:    Joao Pedro de Azevedo [eduanalytics@worldbank.org]
dofile_info: last modified by Diana Goldemberg in January 23, 2020
lastsave:    10 Feb 2020 10:24:56 by wb552057
~~~~


About the **29 variables** in this dataset:

~~~~
The variables belong to the following variable classifications:
    idvars keyvars valuevars traitvars samplevars

idvars:     idschool idgrade idlearner
keyvars:    surveyid countrycode national_level
valuevars:  score_pasec_read_ini score_pasec_math_ini score_pasec_read_fin score_pasec_math_fin level_pasec_read_ini level_pasec_math_ini level_pasec_read_fin level_pasec_math_fin
traitvars:  age urban urban_o male escs
samplevars: learner_weight strata


Variable       Obs Unique      Mean       Min       Max  Label
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
idschool      4094    151  89.82511         1       199  School ID
idgrade       4094      2  3.510992         2         5  Grade ID
idlearner     4094     15  7.883732         1        15  Learner ID
surveyid      4094      1         .         .         .  Survey ID (Region_Year_Assessment)
countrycode   4094      1         .         .         .  WB country code (3 letters)
national_l~l  4094      1         1         1         1  
score_~d_ini  4080    153   486.035  149.8749  921.3028  Pasec score for read (initial)
score_~h_ini  4080    157  484.3874  49.99066  858.2126  Pasec score for math (initial)
score_~d_fin  4094    184  524.6394  158.9372   967.936  Pasec score for read (final)
score_~h_fin  4094    165  523.2435  111.0236  873.8654  Pasec score for math (final)
level_~d_ini  4080      4   2.17549         1         4  Pasec level for read (initial)
level_~h_ini  4080      3  1.583824         1         3  Pasec level for math (initial)
level_~d_fin  4094      4  2.565706         1         4  Pasec level for read (final)
level_~h_fin  4094      3  1.870054         1         3  Pasec level for math (final)
age           4094     12  9.283586         5        16  Learner age at time of assessment
urban         4094      2  .4516365         0         1  School is located in urban/rural area
urban_o       4094      4         .         .         .  Original variable of urban: school is located in urban/rural area
male          4081      2  .5133546         0         1  Learner gender is male/female
escs             0      0         .         .         .  
learner_we~t  4020    228  136.3808  29.26523   835.525  Learner weight
strata        4094      6  3.183683         1         6  Strata
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


Plus the variables merged-on-the-fly, which are:

traitvars:  lp01_threshold_var lp02_threshold_var lp01_threshold_val lp02_threshold_val lp01_threshold_res lp02_threshold_res
valuevars:  hpro_read_ini hpro_read_fin
~~~~

About the **4,094   observations** in this dataset:

~~~~
. tab countrycode idgrade if national_level==1

WB country |
   code (3 |       Grade ID
  letters) |         2          5 |     Total
-----------+----------------------+----------
       MLI |     2,032      2,062 |     4,094 
-----------+----------------------+----------
     Total |     2,032      2,062 |     4,094 

. 
. tab countrycode idgrade if national_level==0
no observations

~~~~

**Harmonization** of proficiency (done on-the-fly):

~~~~

       hpro_read_ini |      Freq.     Percent        Cum.
---------------------+-----------------------------------
      Non-proficient |      1,885       46.04       46.04
          Proficient |        164        4.01       50.05
 Missing score/level |         13        0.32       50.37
Non-harmonized grade |      2,032       49.63      100.00
---------------------+-----------------------------------
               Total |      4,094      100.00

       hpro_read_fin |      Freq.     Percent        Cum.
---------------------+-----------------------------------
      Non-proficient |      1,786       43.62       43.62
          Proficient |        276        6.74       50.37
Non-harmonized grade |      2,032       49.63      100.00
---------------------+-----------------------------------
               Total |      4,094      100.00



     +----------------------------------------------------------------+
     | idgrade   prefix                       harmonization_condition |
     |----------------------------------------------------------------|
  1. |       2     lp01                              no harmonization |
  2. |       2     lp02                              no harmonization |
  3. |       5     lp01   hpro_read_ini = (level_pasec_read_ini >= 4) |
  4. |       5     lp02   hpro_read_fin = (level_pasec_read_fin >= 4) |
     +----------------------------------------------------------------+

~~~~
