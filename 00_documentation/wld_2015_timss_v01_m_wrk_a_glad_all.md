Documentation of GLAD dataset
=====================================================================


[back to list of assessments](https://github.com/worldbank/GLAD/blob/master/README.md#harmonization)

This dataset is part of the Global Learning Assessment Database (GLAD). It contains microdata from TIMSS 2015. Each observation corresponds to one learner (student or pupil), and the variables have been harmonized.

**Metadata** stored in this dataset:

~~~~
region:      WLD
year:        2015
assessment:  TIMSS
master:      v01_M
adaptation:  wrk_A_GLAD
module:      ALL
ttl_info:    Joao Pedro de Azevedo [eduanalytics@worldbank.org]
dofile_info: last modified by Diana Goldemberg in October 8, 2019
lastsave:    9 Oct 2019 20:56:42 by wb552057
~~~~


About the **77 variables** in this dataset:

~~~~
The variables belong to the following variable classifications:
    idvars keyvars valuevars traitvars samplevars

idvars:     idcntry_raw idschool idgrade idclass idlearner
keyvars:    surveyid countrycode national_level
valuevars:  score_timss_math_01 score_timss_science_01 score_timss_math_02 score_timss_science_02 score_timss_math_03 score_timss_science_03 score_timss_math_04 score_timss_science_04 score_timss_math_05 score_timss_science_05 level_timss_math_01 level_timss_science_01 level_timss_math_02 level_timss_science_02 level_timss_math_03 level_timss_science_03 level_timss_math_04 level_timss_science_04 level_timss_math_05 level_timss_science_05
traitvars:  age urban urban_o1 urban_o2 male escs
samplevars: learner_weight jkzone jkrep


Variable         Obs Unique      Mean       Min       Max  Label
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
idcntry_raw   615394     64  1562.698        36     32001  Country ID, as coded in rawdata
idschool      615394    558  112.0927         1       558  School ID
idgrade       615394      4  5.954093         4         9  Grade ID
idclass       615394   3377  11211.94       101     55801  Class ID
idlearner     615394 107440   1121208     10101   5580114  Learner ID
surveyid      615394      1         .         .         .  Survey ID (Region_Year_Assessment)
countrycode   615394     57         .         .         .  WB country code (3 letters)
national_l~l  615394      2  .9041703         0         1  Idcntry_raw is a national level
score_t~h_01  615394 551394  483.0818         5  902.4458  Plausible value 01: TIMSS score for math
score_t~e_01  571379 509021   491.364         5  882.0935  Plausible value 01: TIMSS score for science
score_t~h_02  615394 551360  483.2389         5  903.4639  Plausible value 02: TIMSS score for math
score_t~e_02  571379 508929  490.4986         5   859.881  Plausible value 02: TIMSS score for science
score_t~h_03  615394 551347  483.4383         5  901.5072  Plausible value 03: TIMSS score for math
score_t~e_03  571379 509326  491.2944         5  853.4077  Plausible value 03: TIMSS score for science
score_t~h_04  615394 551629  482.7106         5   928.057  Plausible value 04: TIMSS score for math
score_t~e_04  571379 509347  490.0252         5  906.6905  Plausible value 04: TIMSS score for science
score_t~h_05  615394 551384  482.9537   7.72506  903.5178  Plausible value 05: TIMSS score for math
score_t~e_05  571379 508923  491.5828         5  879.4115  Plausible value 05: TIMSS score for science
level_t~h_01  615394      5  2.698024         1         5  Plausible value 01: TIMSS level for math
level_t~e_01  571379      5  2.817939         1         5  Plausible value 01: TIMSS level for science
level_t~h_02  615394      5  2.701785         1         5  Plausible value 02: TIMSS level for math
level_t~e_02  571379      5  2.807728         1         5  Plausible value 02: TIMSS level for science
level_t~h_03  615394      5  2.702212         1         5  Plausible value 03: TIMSS level for math
level_t~e_03  571379      5  2.815865         1         5  Plausible value 03: TIMSS level for science
level_t~h_04  615394      5   2.69617         1         5  Plausible value 04: TIMSS level for math
level_t~e_04  571379      5  2.803684         1         5  Plausible value 04: TIMSS level for science
level_t~h_05  615394      5  2.698754         1         5  Plausible value 05: TIMSS level for math
level_t~e_05  571379      5  2.820396         1         5  Plausible value 05: TIMSS level for science
age           614819     14  11.59065         6        19  Learner age at time of assessment
urban         590940      2  .7010559         0         1  School is located in urban/rural area
urban_o1      590940      8         .         .         .  Original variable of urban: population size of the school area
urban_o2      590952      8         .         .         .  Original variable of urban: school is located in urban/rural area
male          615394      2  .5045434         0         1  Learner gender is male/female
escs          601359 104237  .4346882  -3.71852  2.391304  
learner_we~t  615394  20032   73.4775         1  5599.053  Total learner weight
jkzone        615394     75  37.45687         1        75  Jackknife zone
jkrep         615394      2  .4996864         0         1  Jackknife replicate code
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


Plus the variables merged-on-the-fly, which are:

traitvars:  lp01_threshold_var lp02_threshold_var lp03_threshold_var lp04_threshold_var lp05_threshold_var lp06_threshold_var lp07_threshold_var lp08_threshold_var lp09_threshold_var lp10_threshold_var lp01_threshold_val lp02_threshold_val lp03_threshold_val lp04_threshold_val lp05_threshold_val lp06_threshold_val lp07_threshold_val lp08_threshold_val lp09_threshold_val lp10_threshold_val lp01_threshold_res lp02_threshold_res lp03_threshold_res lp04_threshold_res lp05_threshold_res lp06_threshold_res lp07_threshold_res lp08_threshold_res lp09_threshold_res lp10_threshold_res
valuevars:  hpro_science_01 hpro_science_02 hpro_science_03 hpro_science_04 hpro_science_05 hpro_math_01 hpro_math_02 hpro_math_03 hpro_math_04 hpro_math_05
~~~~

About the **615,394 observations** in this dataset:

~~~~
. tab countrycode idgrade if national_level==1

WB country |
   code (3 |                  Grade ID
  letters) |         4          5          8          9 |     Total
-----------+--------------------------------------------+----------
       ARE |    21,177          0     18,012          0 |    39,189 
       ARM |     5,384          0          0      5,060 |    10,444 
       AUS |     6,057          0     10,338          0 |    16,395 
       BEL |     5,404          0          0          0 |     5,404 
       BGR |     4,228          0          0          0 |     4,228 
       BHR |     8,575          0      4,918          0 |    13,493 
       BWA |         0          0          0      5,964 |     5,964 
       CAN |    12,283          0      8,757          0 |    21,040 
       CHL |     4,756          0      4,849          0 |     9,605 
       CYP |     4,125          0          0          0 |     4,125 
       CZE |     5,202          0          0          0 |     5,202 
       DEU |     3,948          0          0          0 |     3,948 
       DNK |     3,710          0          0          0 |     3,710 
       EGY |         0          0      7,822          0 |     7,822 
       ESP |     7,764          0          0          0 |     7,764 
       FIN |     5,015          0          0          0 |     5,015 
       FRA |     4,873          0          0          0 |     4,873 
       GBR |     7,122          0      4,814          0 |    11,936 
       GEO |     3,919          0      4,035          0 |     7,954 
       HKG |     3,600          0      4,155          0 |     7,755 
       HRV |     3,985          0          0          0 |     3,985 
       HUN |     5,036          0      4,893          0 |     9,929 
       IDN |     8,319          0          0          0 |     8,319 
       IRL |     4,344          0      4,704          0 |     9,048 
       IRN |     7,928          0      6,130          0 |    14,058 
       ISR |         0          0      5,512          0 |     5,512 
       ITA |     4,373          0      4,481          0 |     8,854 
       JOR |     7,861          0      7,865          0 |    15,726 
       JPN |     4,383          0      4,745          0 |     9,128 
       KAZ |     4,702          0      4,887          0 |     9,589 
       KOR |     4,669          0      5,309          0 |     9,978 
       KWT |     7,296          0      4,503          0 |    11,799 
       LBN |         0          0      3,873          0 |     3,873 
       LTU |     4,529          0      4,347          0 |     8,876 
       MAR |    10,428          0     13,035          0 |    23,463 
       MLT |         0          0          0      3,817 |     3,817 
       MYS |         0          0      9,726          0 |     9,726 
       NLD |     4,515          0          0          0 |     4,515 
       NOR |     4,164      4,329      4,795      4,697 |    17,985 
       NZL |         0      6,322          0      8,142 |    14,464 
       OMN |     9,105          0      8,883          0 |    17,988 
       POL |     4,747          0          0          0 |     4,747 
       PRT |     4,693          0          0          0 |     4,693 
       QAT |     5,194          0      5,403          0 |    10,597 
       RUS |     4,921          0      4,780          0 |     9,701 
       SAU |     4,337          0      3,759          0 |     8,096 
       SGP |     6,517          0      6,116          0 |    12,633 
       SRB |     4,036          0          0          0 |     4,036 
       SVK |     5,773          0          0          0 |     5,773 
       SVN |     4,445          0      4,257          0 |     8,702 
       SWE |     4,142          0      4,090          0 |     8,232 
       THA |         0          0      6,482          0 |     6,482 
       TUR |     6,456          0      6,079          0 |    12,535 
       USA |    10,029          0     10,221          0 |    20,250 
       ZAF |         0     10,932          0     12,514 |    23,446 
-----------+--------------------------------------------+----------
     Total |   278,069     21,583    216,575     40,194 |   556,421 

. 
. tab countrycode idgrade if national_level==0

WB country |
   code (3 |       Grade ID
  letters) |         4          8 |     Total
-----------+----------------------+----------
       ARE |    12,454     10,987 |    23,441 
       ARG |     6,435      3,253 |     9,688 
       CAN |     7,372      8,470 |    15,842 
       TWN |     4,291      5,711 |    10,002 
-----------+----------------------+----------
     Total |    30,552     28,421 |    58,973 

~~~~

**Harmonization** of proficiency (done on-the-fly):

~~~~

     hpro_science_01 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
      Non-proficient |     43,764        7.11        7.11
          Proficient |    242,425       39.39       46.51
 Missing score/level |     44,015        7.15       53.66
Non-harmonized grade |    285,190       46.34      100.00
---------------------+-----------------------------------
               Total |    615,394      100.00

     hpro_science_02 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
      Non-proficient |     44,716        7.27        7.27
          Proficient |    241,473       39.24       46.51
 Missing score/level |     44,015        7.15       53.66
Non-harmonized grade |    285,190       46.34      100.00
---------------------+-----------------------------------
               Total |    615,394      100.00

     hpro_science_03 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
      Non-proficient |     44,660        7.26        7.26
          Proficient |    241,529       39.25       46.51
 Missing score/level |     44,015        7.15       53.66
Non-harmonized grade |    285,190       46.34      100.00
---------------------+-----------------------------------
               Total |    615,394      100.00

     hpro_science_04 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
      Non-proficient |     45,483        7.39        7.39
          Proficient |    240,706       39.11       46.51
 Missing score/level |     44,015        7.15       53.66
Non-harmonized grade |    285,190       46.34      100.00
---------------------+-----------------------------------
               Total |    615,394      100.00

     hpro_science_05 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
      Non-proficient |     43,904        7.13        7.13
          Proficient |    242,285       39.37       46.51
 Missing score/level |     44,015        7.15       53.66
Non-harmonized grade |    285,190       46.34      100.00
---------------------+-----------------------------------
               Total |    615,394      100.00

        hpro_math_01 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
      Non-proficient |     65,749       10.68       10.68
          Proficient |    264,455       42.97       53.66
Non-harmonized grade |    285,190       46.34      100.00
---------------------+-----------------------------------
               Total |    615,394      100.00

        hpro_math_02 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
      Non-proficient |     65,966       10.72       10.72
          Proficient |    264,238       42.94       53.66
Non-harmonized grade |    285,190       46.34      100.00
---------------------+-----------------------------------
               Total |    615,394      100.00

        hpro_math_03 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
      Non-proficient |     65,088       10.58       10.58
          Proficient |    265,116       43.08       53.66
Non-harmonized grade |    285,190       46.34      100.00
---------------------+-----------------------------------
               Total |    615,394      100.00

        hpro_math_04 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
      Non-proficient |     66,133       10.75       10.75
          Proficient |    264,071       42.91       53.66
Non-harmonized grade |    285,190       46.34      100.00
---------------------+-----------------------------------
               Total |    615,394      100.00

        hpro_math_05 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
      Non-proficient |     66,096       10.74       10.74
          Proficient |    264,108       42.92       53.66
Non-harmonized grade |    285,190       46.34      100.00
---------------------+-----------------------------------
               Total |    615,394      100.00



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
 11. |       5     lp01   hpro_science_01 = (score_timss_science_01 >= 400) |
 12. |       5     lp02   hpro_science_02 = (score_timss_science_02 >= 400) |
 13. |       5     lp03   hpro_science_03 = (score_timss_science_03 >= 400) |
 14. |       5     lp04   hpro_science_04 = (score_timss_science_04 >= 400) |
 15. |       5     lp05   hpro_science_05 = (score_timss_science_05 >= 400) |
     |----------------------------------------------------------------------|
 16. |       5     lp06         hpro_math_01 = (score_timss_math_01 >= 400) |
 17. |       5     lp07         hpro_math_02 = (score_timss_math_02 >= 400) |
 18. |       5     lp08         hpro_math_03 = (score_timss_math_03 >= 400) |
 19. |       5     lp09         hpro_math_04 = (score_timss_math_04 >= 400) |
 20. |       5     lp10         hpro_math_05 = (score_timss_math_05 >= 400) |
     |----------------------------------------------------------------------|
 21. |       8     lp01                                    no harmonization |
 22. |       8     lp02                                    no harmonization |
 23. |       8     lp03                                    no harmonization |
 24. |       8     lp04                                    no harmonization |
 25. |       8     lp05                                    no harmonization |
     |----------------------------------------------------------------------|
 26. |       8     lp06                                    no harmonization |
 27. |       8     lp07                                    no harmonization |
 28. |       8     lp08                                    no harmonization |
 29. |       8     lp09                                    no harmonization |
 30. |       8     lp10                                    no harmonization |
     |----------------------------------------------------------------------|
 31. |       9     lp01                                    no harmonization |
 32. |       9     lp02                                    no harmonization |
 33. |       9     lp03                                    no harmonization |
 34. |       9     lp04                                    no harmonization |
 35. |       9     lp05                                    no harmonization |
     |----------------------------------------------------------------------|
 36. |       9     lp06                                    no harmonization |
 37. |       9     lp07                                    no harmonization |
 38. |       9     lp08                                    no harmonization |
 39. |       9     lp09                                    no harmonization |
 40. |       9     lp10                                    no harmonization |
     +----------------------------------------------------------------------+

~~~~
