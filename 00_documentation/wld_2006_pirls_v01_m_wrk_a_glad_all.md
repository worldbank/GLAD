Documentation of GLAD dataset
=====================================================================


[back to list of assessments](https://github.com/worldbank/GLAD/blob/master/README.md#harmonization)

This dataset is part of the Global Learning Assessment Database (GLAD). It contains microdata from PIRLS 2006. Each observation corresponds to one learner (student or pupil), and the variables have been harmonized.

**Metadata** stored in this dataset:

~~~~
region:      WLD
year:        2006
assessment:  PIRLS
master:      v01_M
adaptation:  wrk_A_GLAD
module:      ALL
ttl_info:    Joao Pedro de Azevedo [eduanalytics@worldbank.org]
dofile_info: last modified by Diana Goldemberg in October 8, 2019
lastsave:    9 Oct 2019 20:15:54 by wb552057
~~~~


About the **47 variables** in this dataset:

~~~~
The variables belong to the following variable classifications:
    idvars keyvars valuevars traitvars samplevars

idvars:     idcntry_raw idschool idgrade idclass idlearner
keyvars:    surveyid countrycode national_level
valuevars:  score_pirls_read_01 score_pirls_read_02 score_pirls_read_03 score_pirls_read_04 score_pirls_read_05 level_pirls_read_01 level_pirls_read_02 level_pirls_read_03 level_pirls_read_04 level_pirls_read_05
traitvars:  age urban urban_o1 urban_o2 male escs
samplevars: learner_weight jkzone jkrep


Variable         Obs Unique      Mean        Min       Max  Label
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
idcntry_raw   218324     47  1479.606         40      9578  Country ID, as coded in rawdata
idschool      218324   1164  198.9582          1      3013  School ID
idgrade       218324      2  4.133751          4         5  Grade ID
idclass       218324   2745   19897.8        101    301301  Class ID
idlearner     218324  67604   1989793      10101  3.01e+07  Learner ID
surveyid      218324      1         .          .         .  Survey ID (Region_Year_Assessment)
countrycode   218324     39         .          .         .  WB country code (3 letters)
national_l~l  218324      2  .8847859          0         1  Idcntry_raw is a national level
score_pir~01  218324 211016  498.9139          5  813.1425  Plausible value 01: PIRLS score for read
score_pir~02  218324 211182  498.4421          5  815.0239  Plausible value 02: PIRLS score for read
score_pir~03  218324 211087  498.3068          5  822.1505  Plausible value 03: PIRLS score for read
score_pir~04  218324 211162  498.1786          5   873.369  Plausible value 04: PIRLS score for read
score_pir~05  218324 211211  498.3606          5    831.95  Plausible value 05: PIRLS score for read
level_pir~01  218324      5  2.959496          1         5  Plausible value 01: PIRLS level for read
level_pir~02  218324      5   2.95607          1         5  Plausible value 02: PIRLS level for read
level_pir~03  218324      5  2.952772          1         5  Plausible value 03: PIRLS level for read
level_pir~04  218324      5  2.953436          1         5  Plausible value 04: PIRLS level for read
level_pir~05  218324      5  2.954613          1         5  Plausible value 05: PIRLS level for read
age           217911    115  10.37275       6.33     15.92  Learner age at time of assessment
urban         193549      2  .8509576          0         1  School is located in urban/rural area
urban_o1      198630      7         .          .         .  Original variable of urban: population size of the school area
urban_o2      198595      4         .          .         .  Original variable of urban: school is located in urban/rural area
male          218324      2  .5056109          0         1  Learner gender is male/female
escs          213134  81213  .3310619  -3.499355  2.140251  
learner_we~t  218324   8136  77.79622          1  3073.044  Total learner weight
jkzone        218324     75  34.77582          1        75  Jackknife zone
jkrep         218324      2  .5008611          0         1  Jackknife replicate code
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


Plus the variables merged-on-the-fly, which are:

traitvars:  lp01_threshold_var lp02_threshold_var lp03_threshold_var lp04_threshold_var lp05_threshold_var lp01_threshold_val lp02_threshold_val lp03_threshold_val lp04_threshold_val lp05_threshold_val lp01_threshold_res lp02_threshold_res lp03_threshold_res lp04_threshold_res lp05_threshold_res
valuevars:  hpro_read_01 hpro_read_02 hpro_read_03 hpro_read_04 hpro_read_05
~~~~

About the **218,324 observations** in this dataset:

~~~~
. tab countrycode idgrade if national_level==1

WB country |
   code (3 |       Grade ID
  letters) |         4          5 |     Total
-----------+----------------------+----------
       AUT |     5,067          0 |     5,067 
       BEL |     9,031          0 |     9,031 
       BGR |     3,863          0 |     3,863 
       DEU |     7,899          0 |     7,899 
       DNK |     4,001          0 |     4,001 
       ESP |     4,094          0 |     4,094 
       FRA |     4,404          0 |     4,404 
       GBR |     7,811          0 |     7,811 
       GEO |     4,402          0 |     4,402 
       HKG |     4,712          0 |     4,712 
       HUN |     4,068          0 |     4,068 
       IDN |     4,774          0 |     4,774 
       IRN |     5,411          0 |     5,411 
       ISL |     3,673      1,379 |     5,052 
       ISR |     3,908          0 |     3,908 
       ITA |     3,581          0 |     3,581 
       KWT |     3,958          0 |     3,958 
       LTU |     4,701          0 |     4,701 
       LUX |         0      5,101 |     5,101 
       LVA |     4,162          0 |     4,162 
       MAR |     3,249          0 |     3,249 
       MDA |     4,036          0 |     4,036 
       MKD |     4,002          0 |     4,002 
       NLD |     4,156          0 |     4,156 
       NOR |     3,837      1,808 |     5,645 
       NZL |         0      6,256 |     6,256 
       POL |     4,854          0 |     4,854 
       QAT |     6,680          0 |     6,680 
       ROU |     4,273          0 |     4,273 
       RUS |     4,720          0 |     4,720 
       SGP |     6,390          0 |     6,390 
       SVK |     5,380          0 |     5,380 
       SVN |     5,337          0 |     5,337 
       SWE |     4,394          0 |     4,394 
       TTO |     3,951          0 |     3,951 
       USA |     5,190          0 |     5,190 
       ZAF |         0     14,657 |    14,657 
-----------+----------------------+----------
     Total |   163,969     29,201 |   193,170 

. 
. tab countrycode idgrade if national_level==0

WB country |
   code (3 |  Grade ID
  letters) |         4 |     Total
-----------+-----------+----------
       CAN |    20,565 |    20,565 
       TWN |     4,589 |     4,589 
-----------+-----------+----------
     Total |    25,154 |    25,154 

~~~~

**Harmonization** of proficiency (done on-the-fly):

~~~~

        hpro_read_01 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
      Non-proficient |     35,955       16.47       16.47
          Proficient |    182,369       83.53      100.00
---------------------+-----------------------------------
               Total |    218,324      100.00

        hpro_read_02 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
      Non-proficient |     36,171       16.57       16.57
          Proficient |    182,153       83.43      100.00
---------------------+-----------------------------------
               Total |    218,324      100.00

        hpro_read_03 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
      Non-proficient |     36,128       16.55       16.55
          Proficient |    182,196       83.45      100.00
---------------------+-----------------------------------
               Total |    218,324      100.00

        hpro_read_04 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
      Non-proficient |     36,296       16.62       16.62
          Proficient |    182,028       83.38      100.00
---------------------+-----------------------------------
               Total |    218,324      100.00

        hpro_read_05 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
      Non-proficient |     36,124       16.55       16.55
          Proficient |    182,200       83.45      100.00
---------------------+-----------------------------------
               Total |    218,324      100.00



     +----------------------------------------------------------------+
     | idgrade   prefix                       harmonization_condition |
     |----------------------------------------------------------------|
  1. |       4     lp01   hpro_read_01 = (score_pirls_read_01 >= 400) |
  2. |       4     lp02   hpro_read_02 = (score_pirls_read_02 >= 400) |
  3. |       4     lp03   hpro_read_03 = (score_pirls_read_03 >= 400) |
  4. |       4     lp04   hpro_read_04 = (score_pirls_read_04 >= 400) |
  5. |       4     lp05   hpro_read_05 = (score_pirls_read_05 >= 400) |
     |----------------------------------------------------------------|
  6. |       5     lp01   hpro_read_01 = (score_pirls_read_01 >= 400) |
  7. |       5     lp02   hpro_read_02 = (score_pirls_read_02 >= 400) |
  8. |       5     lp03   hpro_read_03 = (score_pirls_read_03 >= 400) |
  9. |       5     lp04   hpro_read_04 = (score_pirls_read_04 >= 400) |
 10. |       5     lp05   hpro_read_05 = (score_pirls_read_05 >= 400) |
     +----------------------------------------------------------------+

~~~~
