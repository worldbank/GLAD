Documentation of GLAD dataset
=====================================================================


[back to list of assessments](https://github.com/worldbank/GLAD/blob/master/README.md#harmonization)

This dataset is part of the Global Learning Assessment Database (GLAD). It contains microdata from SACMEQ 2007. Each observation corresponds to one learner (student or pupil), and the variables have been harmonized.

**Metadata** stored in this dataset:

~~~~
region:      SSA
year:        2007
assessment:  SACMEQ
master:      v01_M
adaptation:  wrk_A_GLAD
module:      ALL
ttl_info:    Joao Pedro de Azevedo [eduanalytics@worldbank.org]
dofile_info: last modified by Joao Pedro Azevedo in Feb 05, 2022
lastsave:    6 Feb 2022 10:21:57 by wb255520
~~~~


About the **28 variables** in this dataset:

~~~~
The variables belong to the following variable classifications:
    idvars keyvars valuevars traitvars samplevars

idvars:     idcntry_raw idschool idgrade idclass idlearner
keyvars:    surveyid countrycode national_level
valuevars:  score_scmeq_read score_scmeq_math level_scmeq_read level_scmeq_math
traitvars:  age urban urban_o male escs qescs has_qescs
samplevars: strata learner_weight


Variable        Obs Unique       Mean        Min       Max  Label
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
idcntry_raw   61396     15   946.1458         72      8341  Country ID, as coded in rawdata
idschool      61396   2528          .          .         .  School ID
idgrade       61396      1          6          6         6  Grade ID
idclass       61396   5746          .          .         .  Class ID
idlearner     61396  56671   1.31e+11       1001  9.47e+11  Learner ID
surveyid      61396      1          .          .         .  Survey ID (Region_Year_Assessment)
countrycode   61396     14          .          .         .  WB country code (3 letters)
national_l~l  61396      2    .954541          0         1  Idcntry_raw is a national level
score_scme~d  61396    190   510.8306   63.04475  965.6984  Sacmeq score for read
score_scme~h  61313    121   508.0499     11.459  1090.392  Sacmeq score for math
level_scme~d  61396      8    4.35346          1         8  Sacmeq level for read
level_scme~h  61313      8   3.284263          1         8  Sacmeq level for math
age           61396    160   13.46915       9.75  26.91667  Learner age at time of assessment
urban         61368      2   .4092035          0         1  School is located in urban/rural area
urban_o       61368      4   2.597005          1         4  TBD
male          61396      2   .4905368          0         1  Learner gender is male/female
escs          61396    145  -6.78e-09  -2.964111  3.030369  
qescs         61396      5   2.926656          1         5  Quintiles of Socio-Economic Status
has_qescs     61396      1          1          1         1  Dummy variable for observations with a valid QESCS
strata        61396     94    48.8229          1        94  Strata
learner_we~t  61396   2714          1   .0446768  8.058231  Learner weight
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


Plus the variables merged-on-the-fly, which are:

traitvars:  lp01_threshold_var lp01_threshold_val lp01_threshold_res
valuevars:  sdg411_read bmp_read fgt1_read fgt2_read
~~~~

About the **61,396  observations** in this dataset:

~~~~
. tab countrycode idgrade if national_level==1

WB country |
   code (3 |  Grade ID
  letters) |         6 |     Total
-----------+-----------+----------
       BWA |     3,868 |     3,868 
       KEN |     4,436 |     4,436 
       LSO |     4,240 |     4,240 
       MOZ |     3,360 |     3,360 
       MUS |     3,524 |     3,524 
       MWI |     2,781 |     2,781 
       NAM |     6,398 |     6,398 
       SWZ |     4,030 |     4,030 
       SYC |     1,480 |     1,480 
       TZA |     4,194 |     4,194 
       UGA |     5,307 |     5,307 
       ZAF |     9,071 |     9,071 
       ZMB |     2,895 |     2,895 
       ZWE |     3,021 |     3,021 
-----------+-----------+----------
     Total |    58,605 |    58,605 

. 
. tab countrycode idgrade if national_level==0

WB country |
   code (3 |  Grade ID
  letters) |         6 |     Total
-----------+-----------+----------
       TZA |     2,791 |     2,791 
-----------+-----------+----------
     Total |     2,791 |     2,791 

~~~~

**Harmonization** of proficiency (done on-the-fly):

~~~~

         sdg411_read |      Freq.     Percent        Cum.
---------------------+-----------------------------------
      Non-proficient |     33,774       55.01       55.01
          Proficient |     27,622       44.99      100.00
---------------------+-----------------------------------
               Total |     61,396      100.00

            bmp_read |      Freq.     Percent        Cum.
---------------------+-----------------------------------
          Proficient |     27,622       44.99       44.99
      Non-proficient |     33,774       55.01      100.00
---------------------+-----------------------------------
               Total |     61,396      100.00

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
   fgt1_read |     33,774    .1455496    .0931155   .0039583   .8763828

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
   fgt2_read |     33,774    .0298549    .0372757   .0000157   .7680469



     +-----------------------------------------------------+
     | idgrade   prefix            harmonization_condition |
     |-----------------------------------------------------|
  1. |       6     lp01   read = (score_scmeq_read >= 510) |
     +-----------------------------------------------------+

~~~~
