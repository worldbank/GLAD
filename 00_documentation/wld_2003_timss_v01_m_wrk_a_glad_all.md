Documentation of GLAD dataset
=====================================================================


[back to list of assessments](https://github.com/worldbank/GLAD/blob/master/README.md#harmonization)

This dataset is part of the Global Learning Assessment Database (GLAD). It contains microdata from TIMSS 2003. Each observation corresponds to one learner (student or pupil), and the variables have been harmonized.

**Metadata** stored in this dataset:

~~~~
region:      WLD
year:        2003
assessment:  TIMSS
master:      v01_M
adaptation:  wrk_A_GLAD
module:      ALL
ttl_info:    Joao Pedro de Azevedo [eduanalytics@worldbank.org]
dofile_info: last modified by Diana Goldemberg in October 8, 2019
lastsave:    9 Oct 2019 20:32:16 by wb552057
~~~~


About the **76 variables** in this dataset:

~~~~
The variables belong to the following variable classifications:
    idvars keyvars valuevars traitvars samplevars

idvars:     idcntry_raw idschool idgrade idclass idlearner
keyvars:    surveyid countrycode national_level
valuevars:  score_timss_math_01 score_timss_science_01 score_timss_math_02 score_timss_science_02 score_timss_math_03 score_timss_science_03 score_timss_math_04 score_timss_science_04 score_timss_math_05 score_timss_science_05 level_timss_math_01 level_timss_science_01 level_timss_math_02 level_timss_science_02 level_timss_math_03 level_timss_science_03 level_timss_math_04 level_timss_science_04 level_timss_math_05 level_timss_science_05
traitvars:  age urban urban_o male escs
samplevars: learner_weight jkzone jkrep


Variable         Obs Unique      Mean        Min       Max  Label
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
idcntry_raw   365729     52  1078.799         36     11800  Country ID, as coded in rawdata
idschool      365729   1941  502.9742          1      9900  School ID
idgrade       365729      2  6.601194          4         8  Grade ID
idclass       365729   5542  50300.32        101    990003  Class ID
idlearner     365729 152096   5030047      10101  9.90e+07  Learner ID
surveyid      365729      1         .          .         .  Survey ID (Region_Year_Assessment)
countrycode   365729     49         .          .         .  WB country code (3 letters)
national_l~l  365729      2  .9130476          0         1  Idcntry_raw is a national level
score_t~h_01  365729 356710  474.8149          5  880.9251  Plausible value 01: TIMSS score for math
score_t~e_01  365729 353846  476.7623          5  876.2069  Plausible value 01: TIMSS score for science
score_t~h_02  365729 356692  474.7991          5  901.7025  Plausible value 02: TIMSS score for math
score_t~e_02  365729 353791  476.4301          5  846.1504  Plausible value 02: TIMSS score for science
score_t~h_03  365729 356785  474.8171          5  890.9512  Plausible value 03: TIMSS score for math
score_t~e_03  365729 353543  476.6913          5  904.9952  Plausible value 03: TIMSS score for science
score_t~h_04  365729 356702  474.7108          5    853.96  Plausible value 04: TIMSS score for math
score_t~e_04  365729 353755  476.5034          5  865.7862  Plausible value 04: TIMSS score for science
score_t~h_05  365729 356834  474.9791          5  859.6071  Plausible value 05: TIMSS score for math
score_t~e_05  365729 353529  477.2122          5  831.8071  Plausible value 05: TIMSS score for science
level_t~h_01  365729      5  2.638694          1         5  Plausible value 01: TIMSS level for math
level_t~e_01  365729      5  2.691444          1         5  Plausible value 01: TIMSS level for science
level_t~h_02  365729      5  2.641125          1         5  Plausible value 02: TIMSS level for math
level_t~e_02  365729      5  2.688764          1         5  Plausible value 02: TIMSS level for science
level_t~h_03  365729      5  2.641087          1         5  Plausible value 03: TIMSS level for math
level_t~e_03  365729      5  2.691468          1         5  Plausible value 03: TIMSS level for science
level_t~h_04  365729      5  2.640083          1         5  Plausible value 04: TIMSS level for math
level_t~e_04  365729      5  2.690107          1         5  Plausible value 04: TIMSS level for science
level_t~h_05  365729      5  2.641962          1         5  Plausible value 05: TIMSS level for math
level_t~e_05  365729      5  2.695501          1         5  Plausible value 05: TIMSS level for science
age           361303     17   12.5421          6        23  Learner age at time of assessment
urban         338552      2   .898249          0         1  School is located in urban/rural area
urban_o       346018      7         .          .         .  Original variable of urban: population size of the school area
male          365729      2  .4989049          0         1  Learner gender is male/female
escs          237833  31728  .1727529  -3.847333  2.337724  
learner_we~t  365729  12974  91.51286          1  3853.057  Total learner weight
jkzone        365729     75  34.20434          1        75  Jackknife zone
jkrep         365729      2  .5013986          0         1  Jackknife replicate code
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


Plus the variables merged-on-the-fly, which are:

traitvars:  lp01_threshold_var lp02_threshold_var lp03_threshold_var lp04_threshold_var lp05_threshold_var lp06_threshold_var lp07_threshold_var lp08_threshold_var lp09_threshold_var lp10_threshold_var lp01_threshold_val lp02_threshold_val lp03_threshold_val lp04_threshold_val lp05_threshold_val lp06_threshold_val lp07_threshold_val lp08_threshold_val lp09_threshold_val lp10_threshold_val lp01_threshold_res lp02_threshold_res lp03_threshold_res lp04_threshold_res lp05_threshold_res lp06_threshold_res lp07_threshold_res lp08_threshold_res lp09_threshold_res lp10_threshold_res
valuevars:  hpro_science_01 hpro_science_02 hpro_science_03 hpro_science_04 hpro_science_05 hpro_math_01 hpro_math_02 hpro_math_03 hpro_math_04 hpro_math_05
~~~~

About the **365,729 observations** in this dataset:

~~~~
. tab countrycode idgrade if national_level==1

WB country |
   code (3 |       Grade ID
  letters) |         4          8 |     Total
-----------+----------------------+----------
       ARM |     5,674      5,726 |    11,400 
       AUS |     4,321      4,791 |     9,112 
       BEL |     4,712      4,970 |     9,682 
       BGR |         0      4,117 |     4,117 
       BHR |         0      4,199 |     4,199 
       BWA |         0      5,150 |     5,150 
       CHL |         0      6,377 |     6,377 
       CYP |     4,328      4,002 |     8,330 
       EGY |         0      7,095 |     7,095 
       ESP |         0      2,514 |     2,514 
       EST |         0      4,040 |     4,040 
       GBR |     7,521      6,346 |    13,867 
       GHA |         0      5,100 |     5,100 
       HKG |     4,608      4,972 |     9,580 
       HUN |     3,319      3,302 |     6,621 
       IDN |         0      5,762 |     5,762 
       IRN |     4,352      4,942 |     9,294 
       ISR |         0      4,318 |     4,318 
       ITA |     4,282      4,278 |     8,560 
       JOR |         0      4,489 |     4,489 
       JPN |     4,535      4,856 |     9,391 
       KOR |         0      5,309 |     5,309 
       LBN |         0      3,814 |     3,814 
       LTU |     4,422      4,964 |     9,386 
       LVA |     3,687      3,630 |     7,317 
       MAR |     4,264      2,943 |     7,207 
       MDA |     3,981      4,033 |     8,014 
       MKD |         0      3,893 |     3,893 
       MYS |         0      5,314 |     5,314 
       NLD |     2,937      3,065 |     6,002 
       NOR |     4,342      4,133 |     8,475 
       NZL |     4,308      3,801 |     8,109 
       PHL |     4,572      6,917 |    11,489 
       PSE |         0      5,357 |     5,357 
       ROU |         0      4,104 |     4,104 
       RUS |     3,963      4,667 |     8,630 
       SAU |         0      4,295 |     4,295 
       SGP |     6,668      6,018 |    12,686 
       SRB |         0      4,296 |     4,296 
       SVK |         0      4,215 |     4,215 
       SVN |     3,126      3,578 |     6,704 
       SWE |         0      4,256 |     4,256 
       SYR |         0      4,895 |     4,895 
       TUN |     4,334      4,931 |     9,265 
       USA |     9,829      8,912 |    18,741 
       YEM |     4,205          0 |     4,205 
       ZAF |         0      8,952 |     8,952 
-----------+----------------------+----------
     Total |   112,290    221,638 |   333,928 

. 
. tab countrycode idgrade if national_level==0

WB country |
   code (3 |       Grade ID
  letters) |         4          8 |     Total
-----------+----------------------+----------
       CAN |     8,712      8,628 |    17,340 
       TWN |     4,661      5,379 |    10,040 
       USA |     2,233      2,188 |     4,421 
-----------+----------------------+----------
     Total |    15,606     16,195 |    31,801 

~~~~

**Harmonization** of proficiency (done on-the-fly):

~~~~

     hpro_science_01 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
      Non-proficient |     23,177        6.34        6.34
          Proficient |    104,719       28.63       34.97
Non-harmonized grade |    237,833       65.03      100.00
---------------------+-----------------------------------
               Total |    365,729      100.00

     hpro_science_02 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
      Non-proficient |     23,283        6.37        6.37
          Proficient |    104,613       28.60       34.97
Non-harmonized grade |    237,833       65.03      100.00
---------------------+-----------------------------------
               Total |    365,729      100.00

     hpro_science_03 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
      Non-proficient |     23,531        6.43        6.43
          Proficient |    104,365       28.54       34.97
Non-harmonized grade |    237,833       65.03      100.00
---------------------+-----------------------------------
               Total |    365,729      100.00

     hpro_science_04 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
      Non-proficient |     23,275        6.36        6.36
          Proficient |    104,621       28.61       34.97
Non-harmonized grade |    237,833       65.03      100.00
---------------------+-----------------------------------
               Total |    365,729      100.00

     hpro_science_05 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
      Non-proficient |     23,195        6.34        6.34
          Proficient |    104,701       28.63       34.97
Non-harmonized grade |    237,833       65.03      100.00
---------------------+-----------------------------------
               Total |    365,729      100.00

        hpro_math_01 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
      Non-proficient |     23,624        6.46        6.46
          Proficient |    104,272       28.51       34.97
Non-harmonized grade |    237,833       65.03      100.00
---------------------+-----------------------------------
               Total |    365,729      100.00

        hpro_math_02 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
      Non-proficient |     23,412        6.40        6.40
          Proficient |    104,484       28.57       34.97
Non-harmonized grade |    237,833       65.03      100.00
---------------------+-----------------------------------
               Total |    365,729      100.00

        hpro_math_03 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
      Non-proficient |     23,445        6.41        6.41
          Proficient |    104,451       28.56       34.97
Non-harmonized grade |    237,833       65.03      100.00
---------------------+-----------------------------------
               Total |    365,729      100.00

        hpro_math_04 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
      Non-proficient |     23,500        6.43        6.43
          Proficient |    104,396       28.54       34.97
Non-harmonized grade |    237,833       65.03      100.00
---------------------+-----------------------------------
               Total |    365,729      100.00

        hpro_math_05 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
      Non-proficient |     23,411        6.40        6.40
          Proficient |    104,485       28.57       34.97
Non-harmonized grade |    237,833       65.03      100.00
---------------------+-----------------------------------
               Total |    365,729      100.00



     +----------------------------------------------------------------------+
     | idgrade   prefix                             harmonization_condition |
     |----------------------------------------------------------------------|
  1. |       4     lp01   hpro_science_01 = (score_timss_science_01 >= 400) |
  2. |       4     lp02   hpro_science_02 = (score_timss_science_02 >= 400) |
  3. |       4     lp03   hpro_science_03 = (score_timss_science_03 >= 400) |
  4. |       4     lp04   hpro_science_04 = (score_timss_science_04 >= 400) |
  5. |       4     lp05   hpro_science_05 = (score_timss_science_05 >= 400) |
     |----------------------------------------------------------------------|
  6. |       4     lp06         hpro_math_01 = (score_timss_math_01 >= 400) |
  7. |       4     lp07         hpro_math_02 = (score_timss_math_02 >= 400) |
  8. |       4     lp08         hpro_math_03 = (score_timss_math_03 >= 400) |
  9. |       4     lp09         hpro_math_04 = (score_timss_math_04 >= 400) |
 10. |       4     lp10         hpro_math_05 = (score_timss_math_05 >= 400) |
     |----------------------------------------------------------------------|
 11. |       8     lp01                                    no harmonization |
 12. |       8     lp02                                    no harmonization |
 13. |       8     lp03                                    no harmonization |
 14. |       8     lp04                                    no harmonization |
 15. |       8     lp05                                    no harmonization |
     |----------------------------------------------------------------------|
 16. |       8     lp06                                    no harmonization |
 17. |       8     lp07                                    no harmonization |
 18. |       8     lp08                                    no harmonization |
 19. |       8     lp09                                    no harmonization |
 20. |       8     lp10                                    no harmonization |
     +----------------------------------------------------------------------+

~~~~
