Documentation of GLAD dataset
=====================================================================


[back to list of assessments](https://github.com/worldbank/GLAD/blob/master/README.md#harmonization)

This dataset is part of the Global Learning Assessment Database (GLAD). It contains microdata from LLECE 2013. Each observation corresponds to one learner (student or pupil), and the variables have been harmonized.

**Metadata** stored in this dataset:

~~~~
region:      LAC
year:        2013
assessment:  LLECE
master:      v01_M
adaptation:  wrk_A_GLAD
module:      ALL
ttl_info:    Joao Pedro de Azevedo [eduanalytics@worldbank.org]
dofile_info: last modified by Joao Pedro Azevedo in Feb 05, 2022
lastsave:    6 Feb 2022 10:18:33 by wb255520
~~~~


About the **33 variables** in this dataset:

~~~~
The variables belong to the following variable classifications:
    idvars keyvars valuevars traitvars samplevars

idvars:     idcntry_raw idschool idgrade idclass idlearner
keyvars:    surveyid countrycode national_level
valuevars:  score_llece_read score_llece_math score_llece_sci level_llece_read level_llece_math level_llece_sci
traitvars:  age urban male escs qescs has_qescs
samplevars: strata learner_weight_quest learner_weight_read learner_weight_math learner_weight_sci learner_weight


Variable         Obs Unique      Mean        Min       Max  Label
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
idcntry_raw   128517     16   645.991         32      4841  Country ID, as coded in rawdata
idschool      128517    964  4381.033       1001      6288  School ID
idgrade       128517      2  4.500549          3         6  Grade ID
idclass       128517   1848  408411.1        -99    628806  Class ID
idlearner     128517  53921  4.38e+07   1.00e+07  6.29e+07  Learner ID
surveyid      128517      1         .          .         .  Survey ID (Region_Year_Assessment)
countrycode   128517     15         .          .         .  WB country code (3 letters)
national_l~l  128517      2  .9334718          0         1  Idcntry_raw is a national level
score_llec~d   88013    364  514.8436   204.5189  805.1129  Llece score for read
score_llec~h   92911    520  527.0033   175.1842  843.2206  Llece score for math
score_llec~i   45994    310  508.9877   156.3523  841.9585  Llece score for science
level_llec~d   88013      5  2.328508          0         4  Llece level for read
level_llec~h   92911      5  2.343296          0         4  Llece level for math
level_llec~i   45994      5  1.809193          0         4  Llece level for science
age           128517      9  10.88575          7        15  Learner age at time of assessment
urban         128517      2  .6508867          0         1  School is located in urban/rural area
male          122721      2  .5036139          0         1  Learner gender is male/female
escs          128517  99650   .143125  -3.001002  4.217305  
qescs          88013      5  3.141831          1         5  Quintiles of Socio-Economic Status
has_qescs     128517      2  .6848355          0         1  Dummy variable for observations with a valid QESCS
strata        128517     15  6.585993          1        15  Strata
learner_w~st  128517   5299  137.4505   1.304581  5418.438  Learner weight for questionnaire
learner_we~d   88013   5537   200.713   1.952027  5418.438  Learner weight for read
learner_we~h   92911   5554  190.2552   1.672201  8390.523  Learner weight for math
learner_we~i   45994   2747  193.5117    2.30923  3826.694  Learner weight for science
learner_w~ht   88013   5537   200.713   1.952027  5418.438  Learner weight for read
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


Plus the variables merged-on-the-fly, which are:

traitvars:  lp01_threshold_var lp01_threshold_val lp01_threshold_res
valuevars:  sdg411_read bmp_read fgt1_read fgt2_read
~~~~

About the **128,517 observations** in this dataset:

~~~~
. tab countrycode idgrade if national_level==1

WB country |
   code (3 |       Grade ID
  letters) |         3          6 |     Total
-----------+----------------------+----------
       ARG |     4,031      4,041 |     8,072 
       BRA |     3,911      3,592 |     7,503 
       CHL |     4,878      5,211 |    10,089 
       COL |     4,102      4,426 |     8,528 
       CRI |     3,498      3,557 |     7,055 
       DOM |     3,864      3,697 |     7,561 
       ECU |     4,714      4,887 |     9,601 
       GTM |     4,371      4,136 |     8,507 
       HND |     3,944      3,939 |     7,883 
       MEX |     3,657      3,711 |     7,368 
       NIC |     3,963      3,842 |     7,805 
       PAN |     3,631      3,775 |     7,406 
       PER |     5,117      4,839 |     9,956 
       PRY |     3,485      3,384 |     6,869 
       URY |     2,825      2,939 |     5,764 
-----------+----------------------+----------
     Total |    59,991     59,976 |   119,967 

. 
. tab countrycode idgrade if national_level==0

WB country |
   code (3 |       Grade ID
  letters) |         3          6 |     Total
-----------+----------------------+----------
       MEX |     4,244      4,306 |     8,550 
-----------+----------------------+----------
     Total |     4,244      4,306 |     8,550 

~~~~

**Harmonization** of proficiency (done on-the-fly):

~~~~

         sdg411_read |      Freq.     Percent        Cum.
---------------------+-----------------------------------
      Non-proficient |     23,256       18.10       18.10
          Proficient |     21,970       17.10       35.19
 Missing score/level |     19,056       14.83       50.02
Non-harmonized grade |     64,235       49.98      100.00
---------------------+-----------------------------------
               Total |    128,517      100.00

            bmp_read |      Freq.     Percent        Cum.
---------------------+-----------------------------------
          Proficient |     21,970       17.10       17.10
      Non-proficient |     23,256       18.10       35.19
Non-harmonized grade |     83,291       64.81      100.00
---------------------+-----------------------------------
               Total |    128,517      100.00

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
   fgt1_read |     23,256    .1321201    .0951075   .0016299   .6018398

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
   fgt2_read |     23,256    .0265008    .0355052   2.66e-06   .3622112



     +--------------------------------------------------------+
     | idgrade   prefix               harmonization_condition |
     |--------------------------------------------------------|
  1. |       3     lp01                      no harmonization |
  2. |       6     lp01   read = (score_llece_read >= 513.66) |
     +--------------------------------------------------------+

~~~~
