Documentation of GLAD dataset
=====================================================================


[back to list of assessments](https://github.com/worldbank/GLAD/blob/master/README.md#harmonization)

This dataset is part of the Global Learning Assessment Database (GLAD). It contains microdata from SACMEQ 2000. Each observation corresponds to one learner (student or pupil), and the variables have been harmonized.

**Metadata** stored in this dataset:

~~~~
region:      SSA
year:        2000
assessment:  SACMEQ
master:      v01_M
adaptation:  wrk_A_GLAD
module:      ALL
ttl_info:    Joao Pedro de Azevedo [eduanalytics@worldbank.org]
dofile_info: last modified by Joao Pedro Azevedo in Feb 05, 2022
lastsave:    6 Feb 2022 10:21:28 by wb255520
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
idcntry_raw   41686     14   1032.061         72      8341  Country ID, as coded in rawdata
idschool      41686   1911   1.34e+08          1  1.11e+09  School ID
idgrade       41686      1          6          6         6  Grade ID
idclass       41686   4975          .          .         .  Class ID
idlearner     41686    155   11.61882        -99       155  Learner ID
surveyid      41686      1          .          .         .  Survey ID (Region_Year_Assessment)
countrycode   41686     13          .          .         .  WB country code (3 letters)
national_l~l  41686      2    .939692          0         1  Idcntry_raw is a national level
score_scme~d  41686     79   496.8631   5.722815  1061.839  Sacmeq score for read
score_scme~h  41352     60   496.7615   .4322608  1200.434  Sacmeq score for math
level_scme~d  41686      8   4.047906          1         8  Sacmeq level for read
level_scme~h  41352      8   3.053444          1         8  Sacmeq level for math
age           41686    172   13.80747   9.583333     26.25  Learner age at time of assessment
urban         41437      2    .429978          0         1  School is located in urban/rural area
urban_o       41437      4    2.59973          1         4  TBD
male          41686      2   .5070527          0         1  Learner gender is male/female
escs          41686    104  -4.32e-09  -3.161989  3.495844  
qescs         41686      5    2.90426          1         5  Quintiles of Socio-Economic Status
has_qescs     41686      1          1          1         1  Dummy variable for observations with a valid QESCS
strata        41686     93   47.05944          1        93  Strata
learner_we~t  41686   2247          1    .028276  9.093843  Learner weight
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


Plus the variables merged-on-the-fly, which are:

traitvars:  lp01_threshold_var lp01_threshold_val lp01_threshold_res
valuevars:  sdg411_read bmp_read fgt1_read fgt2_read
~~~~

About the **41,686  observations** in this dataset:

~~~~
. tab countrycode idgrade if national_level==1

WB country |
   code (3 |  Grade ID
  letters) |         6 |     Total
-----------+-----------+----------
       BWA |     3,322 |     3,322 
       KEN |     3,299 |     3,299 
       LSO |     3,155 |     3,155 
       MOZ |     3,177 |     3,177 
       MUS |     2,945 |     2,945 
       MWI |     2,333 |     2,333 
       NAM |     5,048 |     5,048 
       SWZ |     3,139 |     3,139 
       SYC |     1,484 |     1,484 
       TZA |     2,854 |     2,854 
       UGA |     2,642 |     2,642 
       ZAF |     3,163 |     3,163 
       ZMB |     2,611 |     2,611 
-----------+-----------+----------
     Total |    39,172 |    39,172 

. 
. tab countrycode idgrade if national_level==0

WB country |
   code (3 |  Grade ID
  letters) |         6 |     Total
-----------+-----------+----------
       TZA |     2,514 |     2,514 
-----------+-----------+----------
     Total |     2,514 |     2,514 

~~~~

**Harmonization** of proficiency (done on-the-fly):

~~~~

         sdg411_read |      Freq.     Percent        Cum.
---------------------+-----------------------------------
      Non-proficient |     25,650       61.53       61.53
          Proficient |     16,036       38.47      100.00
---------------------+-----------------------------------
               Total |     41,686      100.00

            bmp_read |      Freq.     Percent        Cum.
---------------------+-----------------------------------
          Proficient |     16,036       38.47       38.47
      Non-proficient |     25,650       61.53      100.00
---------------------+-----------------------------------
               Total |     41,686      100.00

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
   fgt1_read |     25,650    .1484034    .0942772   .0011531   .9887788

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
   fgt2_read |     25,650    .0309114    .0379373   1.33e-06   .9776835



     +-----------------------------------------------------+
     | idgrade   prefix            harmonization_condition |
     |-----------------------------------------------------|
  1. |       6     lp01   read = (score_scmeq_read >= 510) |
     +-----------------------------------------------------+

~~~~
