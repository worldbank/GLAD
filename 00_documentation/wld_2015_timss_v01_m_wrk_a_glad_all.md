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
dofile_info: last modified by Ahmed Raza in January 29, 2021
lastsave:    26 Apr 2022 14:15:54 by wb255520
~~~~


About the **109 variables** in this dataset:

~~~~
The variables belong to the following variable classifications:
    idvars keyvars valuevars traitvars samplevars

idvars:     idcntry_raw idschool idgrade idclass idlearner
keyvars:    surveyid countrycode national_level
valuevars:  score_timss_math_01 score_timss_scie_01 score_timss_math_02 score_timss_scie_02 score_timss_math_03 score_timss_scie_03 score_timss_math_04 score_timss_scie_04 score_timss_math_05 score_timss_scie_05 level_timss_math_01 level_timss_scie_01 level_timss_math_02 level_timss_scie_02 level_timss_math_03 level_timss_scie_03 level_timss_math_04 level_timss_scie_04 level_timss_math_05 level_timss_scie_05
traitvars:  age urban urban_o1 urban_o2 male escs qescs has_qescs
samplevars: learner_weight jkzone jkrep


Variable         Obs Unique      Mean       Min       Max  Label
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
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
qescs         601359      5  2.575773         1         5  Quintiles of Socio-Economic Status
has_qescs     615394      2  .9771935         0         1  Dummy variable for observations with a valid QESCS
learner_we~t  615394  20032   73.4775         1  5599.053  Total learner weight
jkzone        615394     75  37.45687         1        75  Jackknife zone
jkrep         615394      2  .4996864         0         1  Jackknife replicate code
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


Plus the variables merged-on-the-fly, which are:

traitvars:  lp01_threshold_var lp02_threshold_var lp03_threshold_var lp04_threshold_var lp05_threshold_var lp06_threshold_var lp07_threshold_var lp08_threshold_var lp09_threshold_var lp10_threshold_var lp01_threshold_val lp02_threshold_val lp03_threshold_val lp04_threshold_val lp05_threshold_val lp06_threshold_val lp07_threshold_val lp08_threshold_val lp09_threshold_val lp10_threshold_val lp01_threshold_res lp02_threshold_res lp03_threshold_res lp04_threshold_res lp05_threshold_res lp06_threshold_res lp07_threshold_res lp08_threshold_res lp09_threshold_res lp10_threshold_res
valuevars:  sdg411_scie_01 bmp_scie_01 fgt1_scie_01 fgt2_scie_01 sdg411_scie_02 bmp_scie_02 fgt1_scie_02 fgt2_scie_02 sdg411_scie_03 bmp_scie_03 fgt1_scie_03 fgt2_scie_03 sdg411_scie_04 bmp_scie_04 fgt1_scie_04 fgt2_scie_04 sdg411_scie_05 bmp_scie_05 fgt1_scie_05 fgt2_scie_05 sdg411_math_01 bmp_math_01 fgt1_math_01 fgt2_math_01 sdg411_math_02 bmp_math_02 fgt1_math_02 fgt2_math_02 sdg411_math_03 bmp_math_03 fgt1_math_03 fgt2_math_03 sdg411_math_04 bmp_math_04 fgt1_math_04 fgt2_math_04 sdg411_math_05 bmp_math_05 fgt1_math_05 fgt2_math_05
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

      sdg411_scie_01 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
      Non-proficient |    169,666       27.57       27.57
          Proficient |    401,713       65.28       92.85
 Missing score/level |     44,015        7.15      100.00
---------------------+-----------------------------------
               Total |    615,394      100.00

         bmp_scie_01 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
          Proficient |    401,713       65.28       65.28
      Non-proficient |    169,666       27.57       92.85
Non-harmonized grade |     44,015        7.15      100.00
---------------------+-----------------------------------
               Total |    615,394      100.00

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
fgt1_scie_01 |    169,666    .1961009    .1558577   3.73e-06   .9894737

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
fgt2_scie_01 |    169,666    .0627471    .0923531   1.39e-11   .9790582

      sdg411_scie_02 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
      Non-proficient |    170,734       27.74       27.74
          Proficient |    400,645       65.10       92.85
 Missing score/level |     44,015        7.15      100.00
---------------------+-----------------------------------
               Total |    615,394      100.00

         bmp_scie_02 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
          Proficient |    400,645       65.10       65.10
      Non-proficient |    170,734       27.74       92.85
Non-harmonized grade |     44,015        7.15      100.00
---------------------+-----------------------------------
               Total |    615,394      100.00

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
fgt1_scie_02 |    170,734    .1957155    .1555589   6.74e-07   .9894737

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
fgt2_scie_02 |    170,734     .062503    .0925653   4.54e-13   .9790582

      sdg411_scie_03 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
      Non-proficient |    169,720       27.58       27.58
          Proficient |    401,659       65.27       92.85
 Missing score/level |     44,015        7.15      100.00
---------------------+-----------------------------------
               Total |    615,394      100.00

         bmp_scie_03 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
          Proficient |    401,659       65.27       65.27
      Non-proficient |    169,720       27.58       92.85
Non-harmonized grade |     44,015        7.15      100.00
---------------------+-----------------------------------
               Total |    615,394      100.00

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
fgt1_scie_03 |    169,720    .1937953    .1549078   9.89e-07   .9894737

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
fgt2_scie_03 |    169,720    .0615529    .0915939   9.79e-13   .9790582

      sdg411_scie_04 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
      Non-proficient |    172,146       27.97       27.97
          Proficient |    399,233       64.87       92.85
 Missing score/level |     44,015        7.15      100.00
---------------------+-----------------------------------
               Total |    615,394      100.00

         bmp_scie_04 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
          Proficient |    399,233       64.87       64.87
      Non-proficient |    172,146       27.97       92.85
Non-harmonized grade |     44,015        7.15      100.00
---------------------+-----------------------------------
               Total |    615,394      100.00

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
fgt1_scie_04 |    172,146    .1973508    .1576327   3.00e-06   .9894737

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
fgt2_scie_04 |    172,146    .0637953    .0948253   9.00e-12   .9790582

      sdg411_scie_05 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
      Non-proficient |    169,455       27.54       27.54
          Proficient |    401,924       65.31       92.85
 Missing score/level |     44,015        7.15      100.00
---------------------+-----------------------------------
               Total |    615,394      100.00

         bmp_scie_05 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
          Proficient |    401,924       65.31       65.31
      Non-proficient |    169,455       27.54       92.85
Non-harmonized grade |     44,015        7.15      100.00
---------------------+-----------------------------------
               Total |    615,394      100.00

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
fgt1_scie_05 |    169,455    .1951409    .1557371   6.74e-07   .9894737

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
fgt2_scie_05 |    169,455    .0623339    .0923529   4.54e-13   .9790582

      sdg411_math_01 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
      Non-proficient |    204,209       33.18       33.18
          Proficient |    411,185       66.82      100.00
---------------------+-----------------------------------
               Total |    615,394      100.00

         bmp_math_01 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
          Proficient |    411,185       66.82       66.82
      Non-proficient |    204,209       33.18      100.00
---------------------+-----------------------------------
               Total |    615,394      100.00

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
fgt1_math_01 |    204,209    .1845075    .1386695   1.81e-06      .9875

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
fgt2_math_01 |    204,209    .0532721    .0735799   3.28e-12   .9751562

      sdg411_math_02 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
      Non-proficient |    203,608       33.09       33.09
          Proficient |    411,786       66.91      100.00
---------------------+-----------------------------------
               Total |    615,394      100.00

         bmp_math_02 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
          Proficient |    411,786       66.91       66.91
      Non-proficient |    203,608       33.09      100.00
---------------------+-----------------------------------
               Total |    615,394      100.00

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
fgt1_math_02 |    203,608    .1860864    .1396709   6.00e-07      .9875

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
fgt2_math_02 |    203,608     .054136    .0746864   3.60e-13   .9751562

      sdg411_math_03 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
      Non-proficient |    203,012       32.99       32.99
          Proficient |    412,382       67.01      100.00
---------------------+-----------------------------------
               Total |    615,394      100.00

         bmp_math_03 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
          Proficient |    412,382       67.01       67.01
      Non-proficient |    203,012       32.99      100.00
---------------------+-----------------------------------
               Total |    615,394      100.00

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
fgt1_math_03 |    203,012    .1854179    .1394196   9.75e-07   .9894737

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
fgt2_math_03 |    203,012    .0538175    .0741885   9.51e-13   .9790582

      sdg411_math_04 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
      Non-proficient |    204,843       33.29       33.29
          Proficient |    410,551       66.71      100.00
---------------------+-----------------------------------
               Total |    615,394      100.00

         bmp_math_04 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
          Proficient |    410,551       66.71       66.71
      Non-proficient |    204,843       33.29      100.00
---------------------+-----------------------------------
               Total |    615,394      100.00

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
fgt1_math_04 |    204,843    .1874023    .1406745   1.94e-06      .9875

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
fgt2_math_04 |    204,843    .0549088    .0755686   3.75e-12   .9751562

      sdg411_math_05 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
      Non-proficient |    203,951       33.14       33.14
          Proficient |    411,443       66.86      100.00
---------------------+-----------------------------------
               Total |    615,394      100.00

         bmp_math_05 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
          Proficient |    411,443       66.86       66.86
      Non-proficient |    203,951       33.14      100.00
---------------------+-----------------------------------
               Total |    615,394      100.00

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
fgt1_math_05 |    203,951    .1862674    .1398009   4.84e-07   .9806873

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
fgt2_math_05 |    203,951    .0542397     .074583   2.34e-13   .9617476



     +-----------------------------------------------------------+
     | idgrade   prefix                  harmonization_condition |
     |-----------------------------------------------------------|
  1. |       4     lp01   scie_01 = (score_timss_scie_01 >= 400) |
  2. |       4     lp02   scie_02 = (score_timss_scie_02 >= 400) |
  3. |       4     lp03   scie_03 = (score_timss_scie_03 >= 400) |
  4. |       4     lp04   scie_04 = (score_timss_scie_04 >= 400) |
  5. |       4     lp05   scie_05 = (score_timss_scie_05 >= 400) |
     |-----------------------------------------------------------|
  6. |       4     lp06   math_01 = (score_timss_math_01 >= 400) |
  7. |       4     lp07   math_02 = (score_timss_math_02 >= 400) |
  8. |       4     lp08   math_03 = (score_timss_math_03 >= 400) |
  9. |       4     lp09   math_04 = (score_timss_math_04 >= 400) |
 10. |       4     lp10   math_05 = (score_timss_math_05 >= 400) |
     |-----------------------------------------------------------|
 11. |       5     lp01   scie_01 = (score_timss_scie_01 >= 400) |
 12. |       5     lp02   scie_02 = (score_timss_scie_02 >= 400) |
 13. |       5     lp03   scie_03 = (score_timss_scie_03 >= 400) |
 14. |       5     lp04   scie_04 = (score_timss_scie_04 >= 400) |
 15. |       5     lp05   scie_05 = (score_timss_scie_05 >= 400) |
     |-----------------------------------------------------------|
 16. |       5     lp06   math_01 = (score_timss_math_01 >= 400) |
 17. |       5     lp07   math_02 = (score_timss_math_02 >= 400) |
 18. |       5     lp08   math_03 = (score_timss_math_03 >= 400) |
 19. |       5     lp09   math_04 = (score_timss_math_04 >= 400) |
 20. |       5     lp10   math_05 = (score_timss_math_05 >= 400) |
     |-----------------------------------------------------------|
 21. |       8     lp01   scie_01 = (score_timss_scie_01 >= 475) |
 22. |       8     lp02   scie_02 = (score_timss_scie_02 >= 475) |
 23. |       8     lp03   scie_03 = (score_timss_scie_03 >= 475) |
 24. |       8     lp04   scie_04 = (score_timss_scie_04 >= 475) |
 25. |       8     lp05   scie_05 = (score_timss_scie_05 >= 475) |
     |-----------------------------------------------------------|
 26. |       8     lp06   math_01 = (score_timss_math_01 >= 475) |
 27. |       8     lp07   math_02 = (score_timss_math_02 >= 475) |
 28. |       8     lp08   math_03 = (score_timss_math_03 >= 475) |
 29. |       8     lp09   math_04 = (score_timss_math_04 >= 475) |
 30. |       8     lp10   math_05 = (score_timss_math_05 >= 475) |
     |-----------------------------------------------------------|
 31. |       9     lp01   scie_01 = (score_timss_scie_01 >= 475) |
 32. |       9     lp02   scie_02 = (score_timss_scie_02 >= 475) |
 33. |       9     lp03   scie_03 = (score_timss_scie_03 >= 475) |
 34. |       9     lp04   scie_04 = (score_timss_scie_04 >= 475) |
 35. |       9     lp05   scie_05 = (score_timss_scie_05 >= 475) |
     |-----------------------------------------------------------|
 36. |       9     lp06   math_01 = (score_timss_math_01 >= 475) |
 37. |       9     lp07   math_02 = (score_timss_math_02 >= 475) |
 38. |       9     lp08   math_03 = (score_timss_math_03 >= 475) |
 39. |       9     lp09   math_04 = (score_timss_math_04 >= 475) |
 40. |       9     lp10   math_05 = (score_timss_math_05 >= 475) |
     +-----------------------------------------------------------+

~~~~
