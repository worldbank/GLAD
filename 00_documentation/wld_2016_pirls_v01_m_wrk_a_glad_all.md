Documentation of GLAD dataset
=====================================================================


[back to list of assessments](https://github.com/worldbank/GLAD/blob/master/README.md#harmonization)

This dataset is part of the Global Learning Assessment Database (GLAD). It contains microdata from PIRLS 2016. Each observation corresponds to one learner (student or pupil), and the variables have been harmonized.

**Metadata** stored in this dataset:

~~~~
region:      WLD
year:        2016
assessment:  PIRLS
master:      v01_M
adaptation:  wrk_A_GLAD
module:      ALL
ttl_info:    Joao Pedro de Azevedo [eduanalytics@worldbank.org]
dofile_info: last modified by Diana Goldemberg in October 8, 2019
lastsave:    9 Oct 2019 20:47:03 by wb552057
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
idcntry_raw   346852     61  20376.42         31    724005  Country ID, as coded in rawdata
idschool      346852    926   149.157          1       926  School ID
idgrade       346852      3  4.043843          3         5  Grade ID
idclass       346852   2864   14917.9        101     92604  Class ID
idlearner     346852  78656   1491803      10101   9260427  Learner ID
surveyid      346852      1         .          .         .  Survey ID (Region_Year_Assessment)
countrycode   346852     49         .          .         .  WB country code (3 letters)
national_l~l  346852      2  .8833624          0         1  Idcntry_raw is a national level
score_pir~01  346852 305992  499.8148          5  829.3417  Plausible value 01: PIRLS score for read
score_pir~02  346852 305899  498.9991          5  836.1615  Plausible value 02: PIRLS score for read
score_pir~03  346852 305869  498.3702          5  859.8704  Plausible value 03: PIRLS score for read
score_pir~04  346852 306117  498.5835          5  844.9731  Plausible value 04: PIRLS score for read
score_pir~05  346852 305772  498.8344          5  830.5896  Plausible value 05: PIRLS score for read
level_pir~01  346852      5   2.94519          1         5  Plausible value 01: PIRLS level for read
level_pir~02  346852      5  2.937132          1         5  Plausible value 02: PIRLS level for read
level_pir~03  346852      5  2.929679          1         5  Plausible value 03: PIRLS level for read
level_pir~04  346852      5  2.932556          1         5  Plausible value 04: PIRLS level for read
level_pir~05  346852      5  2.935281          1         5  Plausible value 05: PIRLS level for read
age           346488    119  10.14627          6     15.92  Learner age at time of assessment
urban         336241      2  .8680797          0         1  School is located in urban/rural area
urban_o1      336241      8         .          .         .  Original variable of urban: population size of the school area
urban_o2      336241      6         .          .         .  Original variable of urban: school is located in urban/rural area
male          346852      2  .5054202          0         1  Learner gender is male/female
escs          337332 216719  .3141503  -3.534295  1.962638  
learner_we~t  346852  11698  55.20492    .923076  2948.056  Total learner weight
jkzone        346852     75  37.92561          1        75  Jackknife zone
jkrep         346852      2  .4994522          0         1  Jackknife replicate code
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


Plus the variables merged-on-the-fly, which are:

traitvars:  lp01_threshold_var lp02_threshold_var lp03_threshold_var lp04_threshold_var lp05_threshold_var lp01_threshold_val lp02_threshold_val lp03_threshold_val lp04_threshold_val lp05_threshold_val lp01_threshold_res lp02_threshold_res lp03_threshold_res lp04_threshold_res lp05_threshold_res
valuevars:  hpro_read_01 hpro_read_02 hpro_read_03 hpro_read_04 hpro_read_05
~~~~

About the **346,852 observations** in this dataset:

~~~~
. tab countrycode idgrade if national_level==1

WB country |
   code (3 |             Grade ID
  letters) |         3          4          5 |     Total
-----------+---------------------------------+----------
       ARE |         0     16,471          0 |    16,471 
       AUS |         0      6,341          0 |     6,341 
       AUT |         0      4,360          0 |     4,360 
       AZE |         0      5,994          0 |     5,994 
       BEL |         0      9,821          0 |     9,821 
       BGR |         0      4,281          0 |     4,281 
       BHR |         0      5,480          0 |     5,480 
       CAN |         0     18,245          0 |    18,245 
       CHL |         0      4,294          0 |     4,294 
       CZE |         0      5,537          0 |     5,537 
       DEU |         0      3,959          0 |     3,959 
       DNK |     3,600      3,508          0 |     7,108 
       EGY |         0      6,957          0 |     6,957 
       ESP |         0     14,595          0 |    14,595 
       FIN |         0      4,896          0 |     4,896 
       FRA |         0      4,767          0 |     4,767 
       GBR |         0      8,788          0 |     8,788 
       GEO |         0      5,741          0 |     5,741 
       HKG |         0      3,349          0 |     3,349 
       HUN |         0      4,623          0 |     4,623 
       IRL |         0      4,607          0 |     4,607 
       IRN |         0      8,766          0 |     8,766 
       ISR |         0      4,041          0 |     4,041 
       ITA |         0      3,940          0 |     3,940 
       KAZ |         0      4,925          0 |     4,925 
       KWT |         0      4,609          0 |     4,609 
       LTU |         0      4,317          0 |     4,317 
       LVA |         0      4,157          0 |     4,157 
       MAC |         0      4,059          0 |     4,059 
       MAR |         0     10,942          0 |    10,942 
       MLT |         0          0      3,647 |     3,647 
       NLD |         0      4,206          0 |     4,206 
       NOR |         0      4,354      4,232 |     8,586 
       NZL |         0          0      5,646 |     5,646 
       OMN |         0      9,234          0 |     9,234 
       POL |         0      4,413          0 |     4,413 
       PRT |         0      4,642          0 |     4,642 
       QAT |         0      9,077          0 |     9,077 
       RUS |         0      4,577          0 |     4,577 
       SAU |         0      4,741          0 |     4,741 
       SGP |         0      6,488          0 |     6,488 
       SVK |         0      5,451          0 |     5,451 
       SVN |         0      4,499          0 |     4,499 
       SWE |         0      4,525          0 |     4,525 
       TTO |         0      4,177          0 |     4,177 
       USA |         0      4,425          0 |     4,425 
       ZAF |         0     12,810      5,282 |    18,092 
-----------+---------------------------------+----------
     Total |     3,600    283,989     18,807 |   306,396 

. 
. tab countrycode idgrade if national_level==0

WB country |
   code (3 |  Grade ID
  letters) |         4 |     Total
-----------+-----------+----------
       ARE |    12,047 |    12,047 
       ARG |     4,382 |     4,382 
       CAN |     7,449 |     7,449 
       ESP |     7,963 |     7,963 
       RUS |     4,289 |     4,289 
       TWN |     4,326 |     4,326 
-----------+-----------+----------
     Total |    40,456 |    40,456 

~~~~

**Harmonization** of proficiency (done on-the-fly):

~~~~

        hpro_read_01 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
      Non-proficient |     59,618       17.19       17.19
          Proficient |    287,234       82.81      100.00
---------------------+-----------------------------------
               Total |    346,852      100.00

        hpro_read_02 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
      Non-proficient |     60,701       17.50       17.50
          Proficient |    286,151       82.50      100.00
---------------------+-----------------------------------
               Total |    346,852      100.00

        hpro_read_03 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
      Non-proficient |     61,128       17.62       17.62
          Proficient |    285,724       82.38      100.00
---------------------+-----------------------------------
               Total |    346,852      100.00

        hpro_read_04 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
      Non-proficient |     60,903       17.56       17.56
          Proficient |    285,949       82.44      100.00
---------------------+-----------------------------------
               Total |    346,852      100.00

        hpro_read_05 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
      Non-proficient |     60,502       17.44       17.44
          Proficient |    286,350       82.56      100.00
---------------------+-----------------------------------
               Total |    346,852      100.00



     +----------------------------------------------------------------+
     | idgrade   prefix                       harmonization_condition |
     |----------------------------------------------------------------|
  1. |       3     lp01   hpro_read_01 = (score_pirls_read_01 >= 400) |
  2. |       3     lp02   hpro_read_02 = (score_pirls_read_02 >= 400) |
  3. |       3     lp03   hpro_read_03 = (score_pirls_read_03 >= 400) |
  4. |       3     lp04   hpro_read_04 = (score_pirls_read_04 >= 400) |
  5. |       3     lp05   hpro_read_05 = (score_pirls_read_05 >= 400) |
     |----------------------------------------------------------------|
  6. |       4     lp01   hpro_read_01 = (score_pirls_read_01 >= 400) |
  7. |       4     lp02   hpro_read_02 = (score_pirls_read_02 >= 400) |
  8. |       4     lp03   hpro_read_03 = (score_pirls_read_03 >= 400) |
  9. |       4     lp04   hpro_read_04 = (score_pirls_read_04 >= 400) |
 10. |       4     lp05   hpro_read_05 = (score_pirls_read_05 >= 400) |
     |----------------------------------------------------------------|
 11. |       5     lp01   hpro_read_01 = (score_pirls_read_01 >= 400) |
 12. |       5     lp02   hpro_read_02 = (score_pirls_read_02 >= 400) |
 13. |       5     lp03   hpro_read_03 = (score_pirls_read_03 >= 400) |
 14. |       5     lp04   hpro_read_04 = (score_pirls_read_04 >= 400) |
 15. |       5     lp05   hpro_read_05 = (score_pirls_read_05 >= 400) |
     +----------------------------------------------------------------+

~~~~
