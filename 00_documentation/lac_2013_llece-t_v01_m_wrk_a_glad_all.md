Documentation of GLAD dataset
=====================================================================


[back to list of assessments](https://github.com/worldbank/GLAD/blob/master/README.md#harmonization)

This dataset is part of the Global Learning Assessment Database (GLAD). It contains microdata from LLECE-T 2013. Each observation corresponds to one learner (student or pupil), and the variables have been harmonized.

**Metadata** stored in this dataset:

~~~~
region:      LAC
year:        2013
assessment:  LLECE-T
master:      v01_M
adaptation:  wrk_A_GLAD
module:      ALL
ttl_info:    Joao Pedro de Azevedo [eduanalytics@worldbank.org]
dofile_info: last modified by Diana Goldemberg in October 8, 2019
lastsave:    9 Oct 2019 20:17:36 by wb552057
~~~~


About the **27 variables** in this dataset:

~~~~
The variables belong to the following variable classifications:
    idvars keyvars valuevars traitvars samplevars

idvars:     idcntry_raw idschool idgrade idclass idlearner
keyvars:    surveyid countrycode national_level
valuevars:  score_llece_read score_llece_math score_llece_science level_llece_read level_llece_math level_llece_science
traitvars:  age urban male escs
samplevars: strata learner_weight_read learner_weight_math learner_weight_science learner_weight


Variable         Obs Unique      Mean       Min       Max  Label
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
idcntry_raw   135451     16  640.3794        32      4841  Country ID, as coded in rawdata
idschool      135451   1008  4373.351      1001      6288  School ID
idgrade       135451      2  4.499169         3         6  Grade ID
idclass       135451   1933  437336.7    100101    628806  Class ID
idlearner     135451  56603  4.37e+07  1.00e+07  6.29e+07  Learner ID
surveyid      135451      1         .         .         .  Survey ID (Region_Year_Assessment)
countrycode   135451     15         .         .         .  WB country code (3 letters)
national_l~l  135451      2  .9368775         0         1  Idcntry_raw is a national level
score_llec~d  127469    645  710.7802       250   1146.87  Llece score for read
score_llec~h  130022    636   710.558       250      1150  Llece score for math
score_llec~e   65222    309  709.4754       250      1150  Llece score for science
level_llec~d  127469      4  2.290431         1         4  Llece level for read
level_llec~h  130022      4  1.919721         1         4  Llece level for math
level_llec~e   65222      4  1.948208         1         4  Llece level for science
age           128517      9  10.88575         7        15  Learner age at time of assessment
urban         128517      2  .6508867         0         1  School is located in urban/rural area
male          122721      2  .5036139         0         1  Learner gender is male/female
escs               0      0         .         .         .  
strata        135450     17  6.720111         1        17  Strata
learner_we~d  127469   5437  138.5517         0  5418.438  Learner weight for read
learner_we~h  130022   5415  135.8219         0  5418.438  Learner weight for math
learner_we~e   65222   2671  136.3932         0  3046.976  Learner weight for science
learner_we~t  127469   5437  138.5517         0  5418.438  Learner weight for read
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


Plus the variables merged-on-the-fly, which are:

traitvars:  lp01_threshold_var lp01_threshold_val lp01_threshold_res
valuevars:  hpro_read
~~~~

About the **135,451 observations** in this dataset:

~~~~
. tab countrycode idgrade if national_level==1

WB country |
   code (3 |       Grade ID
  letters) |         3          6 |     Total
-----------+----------------------+----------
       ARG |     4,034      4,041 |     8,075 
       BRA |     3,911      3,592 |     7,503 
       CHL |     4,878      5,211 |    10,089 
       COL |     4,102      4,426 |     8,528 
       CRI |     3,498      3,557 |     7,055 
       DOM |     3,869      3,697 |     7,566 
       ECU |     5,162      5,420 |    10,582 
       GTM |     5,862      5,387 |    11,249 
       HND |     3,945      3,939 |     7,884 
       MEX |     3,657      3,711 |     7,368 
       NIC |     3,967      3,842 |     7,809 
       PAN |     3,632      3,775 |     7,407 
       PER |     5,118      4,840 |     9,958 
       PRY |     3,726      3,604 |     7,330 
       URY |     4,158      4,340 |     8,498 
-----------+----------------------+----------
     Total |    63,519     63,382 |   126,901 

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

           hpro_read |      Freq.     Percent        Cum.
---------------------+-----------------------------------
      Non-proficient |     42,030       31.03       31.03
          Proficient |     22,137       16.34       47.37
 Missing score/level |      3,521        2.60       49.97
Non-harmonized grade |     67,763       50.03      100.00
---------------------+-----------------------------------
               Total |    135,451      100.00



     +--------------------------------------------------------+
     | idgrade   prefix               harmonization_condition |
     |--------------------------------------------------------|
  1. |       3     lp01                      no harmonization |
  2. |       6     lp01   hpro_read = (level_llece_read >= 3) |
     +--------------------------------------------------------+

~~~~
