Documentation of GLAD dataset
=====================================================================


[back to list of assessments](https://github.com/worldbank/GLAD/blob/master/README.md#harmonization)

This dataset is part of the Global Learning Assessment Database (GLAD). It contains microdata from TIMSS 2019. Each observation corresponds to one learner (student or pupil), and the variables have been harmonized.

**Metadata** stored in this dataset:

~~~~
region:      WLD
year:        2019
assessment:  TIMSS
master:      v01_M
adaptation:  wrk_A_GLAD
module:      ALL
ttl_info:    Joao Pedro de Azevedo [eduanalytics@worldbank.org]
dofile_info: last modified by Ahmed Raza in January 29, 2021
lastsave:    26 Apr 2022 14:31:44 by wb255520
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


Variable         Obs Unique      Mean        Min       Max  Label
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
idcntry_raw   424004     72  37006.22          8    724005  Country ID, as coded in rawdata
idschool      424004    704  5137.933       5001      5763  School ID
idgrade       424004      4   5.95896          4         9  Grade ID
idclass       424004   3638  513796.4     500101    576302  Class ID
idlearner     424004 109113  5.14e+07   5.00e+07  5.76e+07  Learner ID
surveyid      424004      1         .          .         .  Survey ID (Region_Year_Assessment)
countrycode   424004     72         .          .         .  WB country code (3 letters)
national_l~l  424004      2  .8384025          0         1  Idcntry_raw is a national level
score_t~h_01  424004 402206  477.6237          5  905.7239  Plausible value 01: TIMSS score for math
score_t~e_01  424004 400141  472.0453          5  841.4375  Plausible value 01: TIMSS score for science
score_t~h_02  424004 402169  477.6812          5  897.7779  Plausible value 02: TIMSS score for math
score_t~e_02  424004 400238  471.2083          5  873.3997  Plausible value 02: TIMSS score for science
score_t~h_03  424004 402172  478.1434          5  896.1958  Plausible value 03: TIMSS score for math
score_t~e_03  424004 400471  472.1058          5   907.907  Plausible value 03: TIMSS score for science
score_t~h_04  424004 402049  477.1132          5  922.6983  Plausible value 04: TIMSS score for math
score_t~e_04  424004 400346  470.6216          5  851.3116  Plausible value 04: TIMSS score for science
score_t~h_05  424004 402214  477.3463          5  951.2831  Plausible value 05: TIMSS score for math
score_t~e_05  424004 400326  472.1483          5  848.5975  Plausible value 05: TIMSS score for science
level_t~h_01  424004      5  2.634437          1         5  Plausible value 01: TIMSS level for math
level_t~e_01  424004      5  2.630867          1         5  Plausible value 01: TIMSS level for science
level_t~h_02  424004      5    2.6366          1         5  Plausible value 02: TIMSS level for math
level_t~e_02  424004      5  2.621838          1         5  Plausible value 02: TIMSS level for science
level_t~h_03  424004      5  2.640824          1         5  Plausible value 03: TIMSS level for math
level_t~e_03  424004      5  2.630291          1         5  Plausible value 03: TIMSS level for science
level_t~h_04  424004      5   2.63032          1         5  Plausible value 04: TIMSS level for math
level_t~e_04  424004      5  2.617636          1         5  Plausible value 04: TIMSS level for science
level_t~h_05  424004      5  2.634303          1         5  Plausible value 05: TIMSS level for math
level_t~e_05  424004      5  2.632449          1         5  Plausible value 05: TIMSS level for science
age           423328     14  11.63139          6        19  Learner age at time of assessment
urban         397824      2  .7057845          0         1  School is located in urban/rural area
urban_o1      142921      5         .          .         .  Original variable of urban: population size of the school area
urban_o2      206811      4         .          .         .  Original variable of urban: school is located in urban/rural area
male          424004      2  .5029575          0         1  Learner gender is male/female
escs          291632  75385  .1240926  -3.593995  2.427579  
qescs         291632      5  2.531797          1         5  Quintiles of Socio-Economic Status
has_qescs     424004      2  .6878048          0         1  Dummy variable for observations with a valid QESCS
learner_we~t  424004  14392  96.05889          1  6636.406  Total learner weight
jkzone        424004     75  34.01047          1        75  Jackknife zone
jkrep         424004      2  .4985661          0         1  Jackknife replicate code
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


Plus the variables merged-on-the-fly, which are:

traitvars:  lp01_threshold_var lp02_threshold_var lp03_threshold_var lp04_threshold_var lp05_threshold_var lp06_threshold_var lp07_threshold_var lp08_threshold_var lp09_threshold_var lp10_threshold_var lp01_threshold_val lp02_threshold_val lp03_threshold_val lp04_threshold_val lp05_threshold_val lp06_threshold_val lp07_threshold_val lp08_threshold_val lp09_threshold_val lp10_threshold_val lp01_threshold_res lp02_threshold_res lp03_threshold_res lp04_threshold_res lp05_threshold_res lp06_threshold_res lp07_threshold_res lp08_threshold_res lp09_threshold_res lp10_threshold_res
valuevars:  sdg411_scie_01 bmp_scie_01 fgt1_scie_01 fgt2_scie_01 sdg411_scie_02 bmp_scie_02 fgt1_scie_02 fgt2_scie_02 sdg411_scie_03 bmp_scie_03 fgt1_scie_03 fgt2_scie_03 sdg411_scie_04 bmp_scie_04 fgt1_scie_04 fgt2_scie_04 sdg411_scie_05 bmp_scie_05 fgt1_scie_05 fgt2_scie_05 sdg411_math_01 bmp_math_01 fgt1_math_01 fgt2_math_01 sdg411_math_02 bmp_math_02 fgt1_math_02 fgt2_math_02 sdg411_math_03 bmp_math_03 fgt1_math_03 fgt2_math_03 sdg411_math_04 bmp_math_04 fgt1_math_04 fgt2_math_04 sdg411_math_05 bmp_math_05 fgt1_math_05 fgt2_math_05
~~~~

About the **424,004 observations** in this dataset:

~~~~
. tab countrycode idgrade if national_level==1

WB country |
   code (3 |                  Grade ID
  letters) |         4          5          8          9 |     Total
-----------+--------------------------------------------+----------
       ALB |     4,426          0          0          0 |     4,426 
       ARE |     2,213         30      2,052         37 |     4,332 
       ARM |     5,399          0          0          0 |     5,399 
       AUS |     5,890          0      9,060          0 |    14,950 
       AUT |     1,964          0          0          0 |     1,964 
       AZE |     5,245          0          0          0 |     5,245 
       BFL |     4,655          0          0          0 |     4,655 
       BGR |     4,268          0          0          0 |     4,268 
       BHR |     5,762          0      5,725          0 |    11,487 
       BIH |     5,617          0          0          0 |     5,617 
       CAN |     1,604          0          0          0 |     1,604 
       CHL |     1,612          0      1,526          0 |     3,138 
       CYP |     4,062          0      3,521          0 |     7,583 
       CZE |     2,030          0          0          0 |     2,030 
       DEU |     1,505          0          0          0 |     1,505 
       DNK |     1,432          0          0          0 |     1,432 
       EGY |         0          0      7,210          0 |     7,210 
       ENG |     1,242          0      1,592          0 |     2,834 
       ESP |     1,670          0          0          0 |     1,670 
       FIN |     1,983          0      4,874          0 |     6,857 
       FRA |     1,948          0      3,874          0 |     5,822 
       GEO |     1,632          0      1,314          0 |     2,946 
       HKG |     1,329          0      1,423          0 |     2,752 
       HRV |     1,472          0          0          0 |     1,472 
       HUN |     1,778          0      1,751          0 |     3,529 
       IRL |     4,582          0      4,118          0 |     8,700 
       IRN |     6,010          0      5,980          0 |    11,990 
       ISR |         0          0      1,863          0 |     1,863 
       ITA |     1,921          0      2,032          0 |     3,953 
       JOR |         0          0      7,176          0 |     7,176 
       JPN |     4,196          0      4,446          0 |     8,642 
       KAZ |     4,791          0      4,453          0 |     9,244 
       KOR |     1,541          0      1,693          0 |     3,234 
       KWT |     4,437          0      4,574          0 |     9,011 
       LBN |         0          0      4,730          0 |     4,730 
       LTU |     1,587          0      1,687          0 |     3,274 
       LVA |     4,481          0          0          0 |     4,481 
       MAR |     7,723          0      8,458          0 |    16,181 
       MKD |     3,270          0          0          0 |     3,270 
       MLT |     3,630          0          0          0 |     3,630 
       MNE |     5,076          0          0          0 |     5,076 
       MYS |         0          0      1,560          0 |     1,560 
       NIR |     3,497          0          0          0 |     3,497 
       NLD |     1,295          0          0          0 |     1,295 
       NOR |         0      1,899          0      2,018 |     3,917 
       NZL |         0      5,019          0      6,051 |    11,070 
       OMN |     6,814          0      6,751          0 |    13,565 
       PAK |     3,980          0          0          0 |     3,980 
       PHL |     5,515          0          0          0 |     5,515 
       POL |     4,882          0          0          0 |     4,882 
       PRT |     1,612          0      3,377          0 |     4,989 
       QAT |     1,486          0      1,490          0 |     2,976 
       ROM |         0          0      4,494          0 |     4,494 
       RUS |     2,128          0      2,083          0 |     4,211 
       SAU |     5,453          0      5,680          0 |    11,133 
       SGP |     1,881          0      1,871          0 |     3,752 
       SRB |     4,380          0          0          0 |     4,380 
       SVK |     1,610          0          0          0 |     1,610 
       SWE |     1,697          0      1,582          0 |     3,279 
       TUR |         0      4,028      1,819          0 |     5,847 
       USA |     1,652          0      1,484          0 |     3,136 
       XKX |     4,496          0          0          0 |     4,496 
       ZAF |         0     11,891          0     20,829 |    32,720 
-----------+--------------------------------------------+----------
     Total |   176,361     22,867    127,323     28,935 |   355,486 

. 
. tab countrycode idgrade if national_level==0

WB country |
   code (3 |                  Grade ID
  letters) |         4          5          8          9 |     Total
-----------+--------------------------------------------+----------
       AAD |     8,897        140      8,167         37 |    17,241 
       ADU |     7,265          0      5,728          0 |    12,993 
       COT |     3,830          0      3,776          0 |     7,606 
       CQU |     3,837          0      3,178          0 |     7,015 
       EMA |     3,390          0          0          0 |     3,390 
       RMO |     3,843          0      3,783          0 |     7,626 
       TWN |     1,663          0          0          0 |     1,663 
       ZGT |         0          0          0      5,633 |     5,633 
       ZWC |         0          0          0      5,351 |     5,351 
-----------+--------------------------------------------+----------
     Total |    32,725        140     24,632     11,021 |    68,518 

~~~~

**Harmonization** of proficiency (done on-the-fly):

~~~~

      sdg411_scie_01 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
      Non-proficient |    148,343       34.99       34.99
          Proficient |    275,661       65.01      100.00
---------------------+-----------------------------------
               Total |    424,004      100.00

         bmp_scie_01 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
          Proficient |    275,661       65.01       65.01
      Non-proficient |    148,343       34.99      100.00
---------------------+-----------------------------------
               Total |    424,004      100.00

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
fgt1_scie_01 |    148,343    .2208891    .1745788   5.72e-06   .9894737

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
fgt2_scie_01 |    148,343    .0792696    .1172448   3.28e-11   .9790582

      sdg411_scie_02 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
      Non-proficient |    149,225       35.19       35.19
          Proficient |    274,779       64.81      100.00
---------------------+-----------------------------------
               Total |    424,004      100.00

         bmp_scie_02 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
          Proficient |    274,779       64.81       64.81
      Non-proficient |    149,225       35.19      100.00
---------------------+-----------------------------------
               Total |    424,004      100.00

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
fgt1_scie_02 |    149,225    .2211715    .1756392   2.84e-06   .9894737

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
fgt2_scie_02 |    149,225    .0797658    .1187487   8.08e-12   .9790582

      sdg411_scie_03 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
      Non-proficient |    148,234       34.96       34.96
          Proficient |    275,770       65.04      100.00
---------------------+-----------------------------------
               Total |    424,004      100.00

         bmp_scie_03 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
          Proficient |    275,770       65.04       65.04
      Non-proficient |    148,234       34.96      100.00
---------------------+-----------------------------------
               Total |    424,004      100.00

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
fgt1_scie_03 |    148,234    .2194095    .1745872   2.50e-07      .9875

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
fgt2_scie_03 |    148,234     .078621    .1178057   6.25e-14   .9751562

      sdg411_scie_04 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
      Non-proficient |    149,918       35.36       35.36
          Proficient |    274,086       64.64      100.00
---------------------+-----------------------------------
               Total |    424,004      100.00

         bmp_scie_04 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
          Proficient |    274,086       64.64       64.64
      Non-proficient |    149,918       35.36      100.00
---------------------+-----------------------------------
               Total |    424,004      100.00

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
fgt1_scie_04 |    149,918     .223311     .177252   9.50e-07   .9894737

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
fgt2_scie_04 |    149,918    .0812859    .1212124   9.03e-13   .9790582

      sdg411_scie_05 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
      Non-proficient |    147,860       34.87       34.87
          Proficient |    276,144       65.13      100.00
---------------------+-----------------------------------
               Total |    424,004      100.00

         bmp_scie_05 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
          Proficient |    276,144       65.13       65.13
      Non-proficient |    147,860       34.87      100.00
---------------------+-----------------------------------
               Total |    424,004      100.00

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
fgt1_scie_05 |    147,860    .2215658    .1751397   5.00e-07   .9894737

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
fgt2_scie_05 |    147,860    .0797651     .118032   2.50e-13   .9790582

      sdg411_math_01 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
      Non-proficient |    150,322       35.45       35.45
          Proficient |    273,682       64.55      100.00
---------------------+-----------------------------------
               Total |    424,004      100.00

         bmp_math_01 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
          Proficient |    273,682       64.55       64.55
      Non-proficient |    150,322       35.45      100.00
---------------------+-----------------------------------
               Total |    424,004      100.00

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
fgt1_math_01 |    150,322    .1862082    .1378187   2.97e-06      .9875

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
fgt2_math_01 |    150,322    .0536674    .0754487   8.85e-12   .9751562

      sdg411_math_02 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
      Non-proficient |    150,259       35.44       35.44
          Proficient |    273,745       64.56      100.00
---------------------+-----------------------------------
               Total |    424,004      100.00

         bmp_math_02 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
          Proficient |    273,745       64.56       64.56
      Non-proficient |    150,259       35.44      100.00
---------------------+-----------------------------------
               Total |    424,004      100.00

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
fgt1_math_02 |    150,259    .1870127    .1389887   8.00e-07   .9894737

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
fgt2_math_02 |    150,259    .0542915    .0764752   6.40e-13   .9790582

      sdg411_math_03 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
      Non-proficient |    149,369       35.23       35.23
          Proficient |    274,635       64.77      100.00
---------------------+-----------------------------------
               Total |    424,004      100.00

         bmp_math_03 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
          Proficient |    274,635       64.77       64.77
      Non-proficient |    149,369       35.23      100.00
---------------------+-----------------------------------
               Total |    424,004      100.00

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
fgt1_math_03 |    149,369    .1865918    .1377729   3.79e-07   .9894737

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
fgt2_math_03 |    149,369    .0537977    .0750892   1.44e-13   .9790582

      sdg411_math_04 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
      Non-proficient |    150,901       35.59       35.59
          Proficient |    273,103       64.41      100.00
---------------------+-----------------------------------
               Total |    424,004      100.00

         bmp_math_04 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
          Proficient |    273,103       64.41       64.41
      Non-proficient |    150,901       35.59      100.00
---------------------+-----------------------------------
               Total |    424,004      100.00

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
fgt1_math_04 |    150,901    .1889137    .1393507   1.35e-06      .9875

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
fgt2_math_04 |    150,901    .0551069    .0765868   1.82e-12   .9751562

      sdg411_math_05 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
      Non-proficient |    150,439       35.48       35.48
          Proficient |    273,565       64.52      100.00
---------------------+-----------------------------------
               Total |    424,004      100.00

         bmp_math_05 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
          Proficient |    273,565       64.52       64.52
      Non-proficient |    150,439       35.48      100.00
---------------------+-----------------------------------
               Total |    424,004      100.00

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
fgt1_math_05 |    150,439    .1882513    .1392494   2.06e-06      .9875

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
fgt2_math_05 |    150,439    .0548288    .0765993   4.26e-12   .9751562



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
