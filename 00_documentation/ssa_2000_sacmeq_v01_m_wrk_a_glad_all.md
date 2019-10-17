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
dofile_info: last modified by Diana Goldemberg in October 8, 2019
lastsave:    9 Oct 2019 20:19:55 by wb552057
~~~~


About the **23 variables** in this dataset:

~~~~
The variables belong to the following variable classifications:
    idvars keyvars valuevars traitvars samplevars

idvars:     idcntry_raw idschool idgrade idclass idlearner
keyvars:    surveyid countrycode national_level
valuevars:  score_sacmeq_read score_sacmeq_math level_sacmeq_read level_sacmeq_math
traitvars:  age urban urban_o male escs
samplevars: strata learner_weight


Variable        Obs Unique      Mean        Min       Max  Label
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
idcntry_raw   41686     14  1032.061         72      8341  Country ID, as coded in rawdata
idschool      41686   1911  1.34e+08          1  1.11e+09  School ID
idgrade       41686      1         6          6         6  Grade ID
idclass       41686   4975         .          .         .  Class ID
idlearner     41686    155  11.61882        -99       155  Learner ID
surveyid      41686      1         .          .         .  Survey ID (Region_Year_Assessment)
countrycode   41686     13         .          .         .  WB country code (3 letters)
national_l~l  41686      2   .939692          0         1  Idcntry_raw is a national level
score_sacm~d  41686     79  496.8631   5.722815  1061.839  Sacmeq score for read
score_sacm~h  41352     60  496.7615   .4322608  1200.434  Sacmeq score for math
level_sacm~d  41686      8  4.047906          1         8  Sacmeq level for read
level_sacm~h  41352      8  3.053444          1         8  Sacmeq level for math
age           41686    172  13.80747   9.583333     26.25  Learner age at time of assessment
urban         41437      2   .429978          0         1  School is located in urban/rural area
urban_o       41437      4   2.59973          1         4  TBD
male          41686      2  .5070527          0         1  Learner gender is male/female
escs          41686    104  7.09e-10  -3.161989  3.495843  
strata        41686     93  47.05944          1        93  Strata
learner_we~t  41686   2247         1    .028276  9.093843  Learner weight
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


Plus the variables merged-on-the-fly, which are:

traitvars:  lp01_threshold_var lp01_threshold_val lp01_threshold_res
valuevars:  hpro_read
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

           hpro_read |      Freq.     Percent        Cum.
---------------------+-----------------------------------
      Non-proficient |     25,650       61.53       61.53
          Proficient |     16,036       38.47      100.00
---------------------+-----------------------------------
               Total |     41,686      100.00



     +---------------------------------------------------------+
     | idgrade   prefix                harmonization_condition |
     |---------------------------------------------------------|
  1. |       6     lp01   hpro_read = (level_sacmeq_read >= 5) |
     +---------------------------------------------------------+

~~~~
