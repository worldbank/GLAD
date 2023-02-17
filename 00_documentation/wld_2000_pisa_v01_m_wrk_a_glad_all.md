Documentation of GLAD dataset
=====================================================================


[back to list of assessments](https://github.com/worldbank/GLAD/blob/master/README.md#harmonization)

This dataset is part of the Global Learning Assessment Database (GLAD). It contains microdata from PISA 2000. Each observation corresponds to one learner (student or pupil), and the variables have been harmonized.'

**Metadata** stored in this dataset:

~~~~
region:      WLD
year:        2000
assessment:  PISA
master:      v01_M
adaptation:  wrk_A_GLAD
module:      ALL
ttl_info:    Joao Pedro de Azevedo [eduanalytics@worldbank.org]
dofile_info: created by Aishwarya, last modified by Joao Pedro Azevedo on February 5, 2022
lastsave:    6 Feb 2022 10:10:56 by wb255520
~~~~


About the **331 variables** in this dataset:

~~~~
The variables belong to the following variable classifications:
    idvars keyvars valuevars traitvars pisavars samplevars

idvars:     idcntry_raw idschool idlearner
keyvars:    surveyid countrycode national_level
valuevars:  score_pisa_read_01 score_pisa_math_01 score_pisa_science_01 score_pisa_read_02 score_pisa_math_02 score_pisa_science_02 score_pisa_read_03 score_pisa_math_03 score_pisa_science_03 score_pisa_read_04 score_pisa_math_04 score_pisa_science_04 score_pisa_read_05 score_pisa_math_05 score_pisa_science_05 level_pisa_read_01 level_pisa_math_01 level_pisa_science_01 level_pisa_read_02 level_pisa_math_02 level_pisa_science_02 level_pisa_read_03 level_pisa_math_03 level_pisa_science_03 level_pisa_read_04 level_pisa_math_04 level_pisa_science_04 level_pisa_read_05 level_pisa_math_05 level_pisa_science_05
traitvars:  idgrade age urban urban_o male escs escs_q_read escs_q_math escs_q_scie qescs has_qescs
pisavars: city native language school_type school_type_o


Variable         Obs Unique       Mean       Min       Max  Label
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
idcntry_raw   226089     43          .         .         .  Country ID, as coded in rawdata
idschool      226089   4922   2078.281         1      4930  School ID
idlearner     226089  15045   2674.382         1     15067  Learner ID
surveyid      226089      1          .         .         .  Survey ID (Region_Year_Assessment)
countrycode   226089     43          .         .         .  WB country code (3 letters)
national_l~l  226089      1          1         1         1  Idcntry_raw is a national level
score_p~d_01  226089   6364   479.6599     -48.8    881.38  Plausible value 1: PISA score for read
score_p~h_01  125745   4782   478.7987    -98.25    864.04  Plausible value 1: PISA score for math
score_p~e_01  125684   3987   480.9437     28.14    861.58  Plausible value 1: PISA score for science
score_p~d_02  226089   6373   479.6183    -36.81    881.96  Plausible value 2: PISA score for read
score_p~h_02  125745   4785   478.8163    -83.75    881.74  Plausible value 2: PISA score for math
score_p~e_02  125684   3982   480.5669    -26.06    895.49  Plausible value 2: PISA score for science
score_p~d_03  226089   6373   479.6337    -29.57    880.14  Plausible value 3: PISA score for read
score_p~h_03  125745   4799   478.7521    -26.18    863.19  Plausible value 3: PISA score for math
score_p~e_03  125684   3987   480.8749    -48.22    912.16  Plausible value 3: PISA score for science
score_p~d_04  226089   6392   479.6627    -73.34    872.29  Plausible value 4: PISA score for read
score_p~h_04  125745   4769   478.7102    -69.48    868.54  Plausible value 4: PISA score for math
score_p~e_04  125684   3977   480.7984      2.45    865.53  Plausible value 4: PISA score for science
score_p~d_05  226089   6371   479.6188    -53.95    881.96  Plausible value 5: PISA score for read
score_p~h_05  125745   4797   478.6569   -166.18    829.84  Plausible value 5: PISA score for math
score_p~e_05  125684   3951   480.8093    -35.01    889.61  Plausible value 5: PISA score for science
level_p~d_01  226089      8   2.498852        -1         6  Plausible value 1: PISA level for read
level_p~h_01  125745      7   2.537365         0         6  Plausible value 1: PISA level for math
level_p~e_01  125684      8   2.459287        -1         6  Plausible value 1: PISA level for science
level_p~d_02  226089      8   2.498158        -1         6  Plausible value 2: PISA level for read
level_p~h_02  125745      7   2.535417         0         6  Plausible value 2: PISA level for math
level_p~e_02  125684      8   2.454815        -1         6  Plausible value 2: PISA level for science
level_p~d_03  226089      8    2.49768        -1         6  Plausible value 3: PISA level for read
level_p~h_03  125745      7   2.536427         0         6  Plausible value 3: PISA level for math
level_p~e_03  125684      8   2.458841        -1         6  Plausible value 3: PISA level for science
level_p~d_04  226089      8   2.499029        -1         6  Plausible value 4: PISA level for read
level_p~h_04  125745      7   2.533612         0         6  Plausible value 4: PISA level for math
level_p~e_04  125684      8   2.458459        -1         6  Plausible value 4: PISA level for science
level_p~d_05  226089      8   2.497463        -1         6  Plausible value 5: PISA level for read
level_p~h_05  125745      7   2.535481         0         6  Plausible value 5: PISA level for math
level_p~e_05  125684      8   2.456319        -1         6  Plausible value 5: PISA level for science
idgrade       226089      7   9.585615         7        13  Grade ID
age           225451     25   15.69127     14.25     16.25  Learner age at time of assessment
urban         183303      2   .8973939         0         1  School is located in urban/rural area
urban_o       226089      8          .         .         .  Original variable of urban: population size of the school area
male          225673      2   .4929478         0         1  Learner gender is male/female
escs          213762  79659  -.1482405  -5.05892  4.037587  Index of economic, social and cultural status ( PISA 2009 equated)
escs_q_read   213762      5    2.98503         1         5  Income quintile
escs_q_math   118805      5    2.98378         1         5  Income quintile
escs_q_scie   118853      5   2.984796         1         5  Income quintile
qescs         213726      5   2.976807         1         5  Quintiles of Socio-Economic Status
has_qescs     226089      2    .945318         0         1  Dummy variable for observations with a valid QESCS
city          183303      3   1.738073         1         3  School is located in city (1), town (2), village (3)
native        217345      3    1.12078         1         3  Learner is native (1), second-generation (2), first-generation (3)
language      209400      2   1.106719         1         2  Language of test (1), other language (2)
school_type   178322      3   2.768985         1         3  Type of ownership and decision-making power of schools
school_typ~o  187408      2   1.172575         1         2  Type of school - Public or Private
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


Plus the variables merged-on-the-fly, which are:

traitvars:  lp01_threshold_var lp02_threshold_var lp03_threshold_var lp04_threshold_var lp05_threshold_var lp01_threshold_val lp02_threshold_val lp03_threshold_val lp04_threshold_val lp05_threshold_val lp01_threshold_res lp02_threshold_res lp03_threshold_res lp04_threshold_res lp05_threshold_res
valuevars:  sdg411_read_01 bmp_read_01 fgt1_read_01 fgt2_read_01 sdg411_read_02 bmp_read_02 fgt1_read_02 fgt2_read_02 sdg411_read_03 bmp_read_03 fgt1_read_03 fgt2_read_03 sdg411_read_04 bmp_read_04 fgt1_read_04 fgt2_read_04 sdg411_read_05 bmp_read_05 fgt1_read_05 fgt2_read_05
~~~~

About the **226,089 observations** in this dataset:

~~~~
. tab countrycode idgrade if national_level==1

WB country |
   code (3 |                                   Grade ID
  letters) |         7          8          9         10         11         12         13 |     Total
-----------+-----------------------------------------------------------------------------+----------
       ALB |         2         25      1,211      3,475        245          0          0 |     4,958 
       ARG |        47        311        705      2,883         37          0          0 |     3,983 
       AUS |         0          3        323      3,944        870          0          0 |     5,140 
       AUT |        15        217      1,921      2,408          3          0          0 |     4,564 
       BEL |        14        279      1,741      4,508         66          1          0 |     6,609 
       BGR |        18        117      3,828        672         14          0          0 |     4,649 
       BRA |     1,149      1,662      1,664        345          0          0          0 |     4,820 
       CAN |        57        506      4,757     23,339        356          6          1 |    29,022 
       CHE |        41        842      4,633        497          3          1          0 |     6,017 
       CHL |        80        338      1,357      3,098         11          0          0 |     4,884 
       CZE |        16         91      1,982      3,091          0          0          0 |     5,180 
       DEU |        58        658      3,163      1,114          3          0          0 |     4,996 
       DNK |         0        249      3,780         91          0          0          0 |     4,120 
       ESP |         1        123      1,515      4,520          1          0          0 |     6,160 
       FIN |        10        523      4,331          0          0          0          0 |     4,864 
       FRA |        16        347      1,760      2,403        122          0          0 |     4,648 
       GBR |         0          0          4      3,120      5,832        349          0 |     9,305 
       GRC |         4         35         92      3,661        794          0          0 |     4,586 
       HKG |       135        280        524      2,695        767          4          0 |     4,405 
       HUN |        49        100      2,861      1,818          0          0          0 |     4,828 
       IDN |       237        941      3,516      2,030        627         17          0 |     7,368 
       IRL |         1        126      2,359        605        737          1          0 |     3,829 
       ISL |         0          0          0      3,317          0          0          0 |     3,317 
       ISR |         0          1        399      3,899        176          1          0 |     4,476 
       ITA |        24         29        791      3,825        283          0          0 |     4,952 
       JPN |         0          0          0      5,256          0          0          0 |     5,256 
       KOR |         0          0         59      4,888         29          0          0 |     4,976 
       LIE |         3         50        244         11          0          0          0 |       308 
       LUX |        58        578      1,956        890          0          0          0 |     3,482 
       LVA |        60        270      1,359      2,129         20          0          0 |     3,838 
       MEX |       121        447      1,167      2,553          9          0          0 |     4,297 
       MKD |        13         37      3,150      1,266          0          0          0 |     4,466 
       NLD |         7        120      1,125      1,215          3          0          0 |     2,470 
       NOR |         0          2         29      4,053         15          0          0 |     4,099 
       NZL |         0          0          0        253      3,202        175          3 |     3,633 
       PER |       323        605      1,064      2,008        391          0          0 |     4,391 
       POL |         0          0      3,654          0          0          0          0 |     3,654 
       PRT |       229        535      1,141      2,543         14          0          0 |     4,462 
       ROU |        22        345      3,815        647          0          0          0 |     4,829 
       RUS |         2        118      1,670      4,858         39          0          0 |     6,687 
       SWE |         1         86      4,279         10          0          0          0 |     4,376 
       THA |        13         81      3,279      1,921         46          0          0 |     5,340 
       USA |         4         71      1,547      2,207         16          0          0 |     3,845 
-----------+-----------------------------------------------------------------------------+----------
     Total |     2,830     11,148     78,755    118,066     14,731        555          4 |   226,089 

. 
. tab countrycode idgrade if national_level==0
no observations

~~~~

**Harmonization** of proficiency (done on-the-fly):

~~~~

      sdg411_read_01 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
      Non-proficient |     56,765       25.11       25.11
          Proficient |    169,324       74.89      100.00
---------------------+-----------------------------------
               Total |    226,089      100.00

         bmp_read_01 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
          Proficient |    169,324       74.89       74.89
      Non-proficient |     56,765       25.11      100.00
---------------------+-----------------------------------
               Total |    226,089      100.00

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
fgt1_read_01 |     56,765     .174324     .139226   .0004418   1.119763

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
fgt2_read_01 |     56,765    .0497724    .0754948   1.95e-07    1.25387

      sdg411_read_02 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
      Non-proficient |     56,890       25.16       25.16
          Proficient |    169,199       74.84      100.00
---------------------+-----------------------------------
               Total |    226,089      100.00

         bmp_read_02 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
          Proficient |    169,199       74.84       74.84
      Non-proficient |     56,890       25.16      100.00
---------------------+-----------------------------------
               Total |    226,089      100.00

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
fgt1_read_02 |     56,890    .1736816    .1389932   .0008099   1.090338

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
fgt2_read_02 |     56,890    .0494841    .0752133   6.56e-07   1.188837

      sdg411_read_03 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
      Non-proficient |     56,798       25.12       25.12
          Proficient |    169,291       74.88      100.00
---------------------+-----------------------------------
               Total |    226,089      100.00

         bmp_read_03 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
          Proficient |    169,291       74.88       74.88
      Non-proficient |     56,798       25.12      100.00
---------------------+-----------------------------------
               Total |    226,089      100.00

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
fgt1_read_03 |     56,798    .1741081    .1389719   .0008099    1.07257

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
fgt2_read_03 |     56,798    .0496265    .0752795   6.56e-07   1.150406

      sdg411_read_04 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
      Non-proficient |     56,859       25.15       25.15
          Proficient |    169,230       74.85      100.00
---------------------+-----------------------------------
               Total |    226,089      100.00

         bmp_read_04 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
          Proficient |    169,230       74.85       74.85
      Non-proficient |     56,859       25.15      100.00
---------------------+-----------------------------------
               Total |    226,089      100.00

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
fgt1_read_04 |     56,859    .1738342    .1396003   .0000982   1.179989

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
fgt2_read_04 |     56,859    .0497062    .0763269   9.64e-09   1.392373

      sdg411_read_05 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
      Non-proficient |     56,972       25.20       25.20
          Proficient |    169,117       74.80      100.00
---------------------+-----------------------------------
               Total |    226,089      100.00

         bmp_read_05 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
          Proficient |    169,117       74.80       74.80
      Non-proficient |     56,972       25.20      100.00
---------------------+-----------------------------------
               Total |    226,089      100.00

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
fgt1_read_05 |     56,972    .1736277    .1388062   .0008099   1.132402

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
fgt2_read_05 |     56,972    .0494134    .0753088   6.56e-07   1.282335



     +-------------------------------------------------------------+
     | idgrade   prefix                    harmonization_condition |
     |-------------------------------------------------------------|
  1. |       7     lp01   read_01 = (score_pisa_read_01 >= 407.47) |
  2. |       7     lp02   read_02 = (score_pisa_read_02 >= 407.47) |
  3. |       7     lp03   read_03 = (score_pisa_read_03 >= 407.47) |
  4. |       7     lp04   read_04 = (score_pisa_read_04 >= 407.47) |
  5. |       7     lp05   read_05 = (score_pisa_read_05 >= 407.47) |
     |-------------------------------------------------------------|
  6. |       8     lp01   read_01 = (score_pisa_read_01 >= 407.47) |
  7. |       8     lp02   read_02 = (score_pisa_read_02 >= 407.47) |
  8. |       8     lp03   read_03 = (score_pisa_read_03 >= 407.47) |
  9. |       8     lp04   read_04 = (score_pisa_read_04 >= 407.47) |
 10. |       8     lp05   read_05 = (score_pisa_read_05 >= 407.47) |
     |-------------------------------------------------------------|
 11. |       9     lp01   read_01 = (score_pisa_read_01 >= 407.47) |
 12. |       9     lp02   read_02 = (score_pisa_read_02 >= 407.47) |
 13. |       9     lp03   read_03 = (score_pisa_read_03 >= 407.47) |
 14. |       9     lp04   read_04 = (score_pisa_read_04 >= 407.47) |
 15. |       9     lp05   read_05 = (score_pisa_read_05 >= 407.47) |
     |-------------------------------------------------------------|
 16. |      10     lp01   read_01 = (score_pisa_read_01 >= 407.47) |
 17. |      10     lp02   read_02 = (score_pisa_read_02 >= 407.47) |
 18. |      10     lp03   read_03 = (score_pisa_read_03 >= 407.47) |
 19. |      10     lp04   read_04 = (score_pisa_read_04 >= 407.47) |
 20. |      10     lp05   read_05 = (score_pisa_read_05 >= 407.47) |
     |-------------------------------------------------------------|
 21. |      11     lp01   read_01 = (score_pisa_read_01 >= 407.47) |
 22. |      11     lp02   read_02 = (score_pisa_read_02 >= 407.47) |
 23. |      11     lp03   read_03 = (score_pisa_read_03 >= 407.47) |
 24. |      11     lp04   read_04 = (score_pisa_read_04 >= 407.47) |
 25. |      11     lp05   read_05 = (score_pisa_read_05 >= 407.47) |
     |-------------------------------------------------------------|
 26. |      12     lp01   read_01 = (score_pisa_read_01 >= 407.47) |
 27. |      12     lp02   read_02 = (score_pisa_read_02 >= 407.47) |
 28. |      12     lp03   read_03 = (score_pisa_read_03 >= 407.47) |
 29. |      12     lp04   read_04 = (score_pisa_read_04 >= 407.47) |
 30. |      12     lp05   read_05 = (score_pisa_read_05 >= 407.47) |
     |-------------------------------------------------------------|
 31. |      13     lp01   read_01 = (score_pisa_read_01 >= 407.47) |
 32. |      13     lp02   read_02 = (score_pisa_read_02 >= 407.47) |
 33. |      13     lp03   read_03 = (score_pisa_read_03 >= 407.47) |
 34. |      13     lp04   read_04 = (score_pisa_read_04 >= 407.47) |
 35. |      13     lp05   read_05 = (score_pisa_read_05 >= 407.47) |
     +-------------------------------------------------------------+

~~~~
