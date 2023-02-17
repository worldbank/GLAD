Documentation of GLAD dataset
=====================================================================


[back to list of assessments](https://github.com/worldbank/GLAD/blob/master/README.md#harmonization)

This dataset is part of the Global Learning Assessment Database (GLAD). It contains microdata from PISA 2006. Each observation corresponds to one learner (student or pupil), and the variables have been harmonized.'

**Metadata** stored in this dataset:

~~~~
region:      WLD
year:        2006
assessment:  PISA
master:      v01_M
adaptation:  wrk_A_GLAD
module:      ALL
ttl_info:    Joao Pedro de Azevedo [eduanalytics@worldbank.org]
dofile_info: created by Aishwarya, last modified by Joao Pedro Azevedo on February 5, 2022
lastsave:    6 Feb 2022 10:43:07 by wb255520
~~~~


About the **166 variables** in this dataset:

~~~~
The variables belong to the following variable classifications:
    idvars keyvars valuevars traitvars pisavars samplevars

idvars:     idcntry_raw idschool idlearner
keyvars:    surveyid countrycode national_level
valuevars:  score_pisa_read_01 score_pisa_math_01 score_pisa_science_01 score_pisa_read_02 score_pisa_math_02 score_pisa_science_02 score_pisa_read_03 score_pisa_math_03 score_pisa_science_03 score_pisa_read_04 score_pisa_math_04 score_pisa_science_04 score_pisa_read_05 score_pisa_math_05 score_pisa_science_05 level_pisa_read_01 level_pisa_math_01 level_pisa_science_01 level_pisa_read_02 level_pisa_math_02 level_pisa_science_02 level_pisa_read_03 level_pisa_math_03 level_pisa_science_03 level_pisa_read_04 level_pisa_math_04 level_pisa_science_04 level_pisa_read_05 level_pisa_math_05 level_pisa_science_05
traitvars:  idgrade age urban urban_o male escs escs_quintile qescs has_qescs
pisavars: city native language school_type school_type_o


Variable         Obs Unique      Mean      Min       Max  Label
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
idcntry_raw   397901     57         .        .         .  Country ID, as coded in rawdata
idschool      397901   1638  252.4811        1      1648  School ID
idlearner     397901  30910  5344.129        1     30971  Learner ID
surveyid      397901      1         .        .         .  Survey ID (Region_Year_Assessment)
countrycode   397901     57         .        .         .  WB country code (3 letters)
national_l~l  397901      1         1        1         1  Idcntry_raw is a national level
score_p~d_01  392292   8153  463.4251    .1215  1083.506  Plausible value 1: PISA score for read
score_p~h_01  397901   4379  471.7014    .6154  921.0079  Plausible value 1: PISA score for math
score_p~e_01  397901   6500  475.8257   6.0053  920.4824  Plausible value 1: PISA score for science
score_p~d_02  392292   8150  463.3956   1.7256  1144.371  Plausible value 2: PISA score for read
score_p~h_02  397901   4398  471.8129   5.8342  888.3705  Plausible value 2: PISA score for math
score_p~e_02  397901   6544  475.9603  23.4426  924.2123  Plausible value 2: PISA score for science
score_p~d_03  392292   8133  463.3874   2.2069  1002.878  Plausible value 3: PISA score for read
score_p~h_03  397901   4387   471.781  18.9204  945.2329  Plausible value 3: PISA score for math
score_p~e_03  397901   6563  475.8352  14.1178  897.9165  Plausible value 3: PISA score for science
score_p~d_04  392292   8121  463.3288    .1215  1097.896  Plausible value 4: PISA score for read
score_p~h_04  397901   4388  471.7215   3.4974   919.528  Plausible value 4: PISA score for math
score_p~e_04  397901   6544  475.7984  21.3911  883.1834  Plausible value 4: PISA score for science
score_p~d_05  392292   8116  463.3285    .9235   1065.79  Plausible value 5: PISA score for read
score_p~h_05  397901   4405  471.7138     8.95  907.2986  Plausible value 5: PISA score for math
score_p~e_05  397901   6550  475.8493    9.269  952.1865  Plausible value 5: PISA score for science
level_p~d_01  397901      8   2.33639       -1         6  Plausible value 1: PISA level for read
level_p~h_01  397901      7  2.392944        0         6  Plausible value 1: PISA level for math
level_p~e_01  397901      8  2.387999       -1         6  Plausible value 1: PISA level for science
level_p~d_02  397901      8  2.335639       -1         6  Plausible value 2: PISA level for read
level_p~h_02  397901      7  2.394953        0         6  Plausible value 2: PISA level for math
level_p~e_02  397901      8  2.389811       -1         6  Plausible value 2: PISA level for science
level_p~d_03  397901      8  2.335357       -1         6  Plausible value 3: PISA level for read
level_p~h_03  397901      7  2.394608        0         6  Plausible value 3: PISA level for math
level_p~e_03  397901      8  2.388589       -1         6  Plausible value 3: PISA level for science
level_p~d_04  397901      8  2.334606       -1         6  Plausible value 4: PISA level for read
level_p~h_04  397901      7  2.393957        0         6  Plausible value 4: PISA level for math
level_p~e_04  397901      8  2.387375       -1         6  Plausible value 4: PISA level for science
level_p~d_05  397901      8  2.335506       -1         6  Plausible value 5: PISA level for read
level_p~h_05  397901      7  2.393166        0         6  Plausible value 5: PISA level for math
level_p~e_05  397901      8  2.388954       -1         6  Plausible value 5: PISA level for science
idgrade       397901      7  9.598805        7        13  Grade ID
age           397885     15  15.77915    15.17     16.33  Learner age at time of assessment
urban         381911      2  .8986177        0         1  School is located in urban/rural area
urban_o       397901      8         .        .         .  Original variable of urban: population size of the school area
male          397897      2  .4946129        0         1  Learner gender is male/female
escs          397901  44450  9.563895  -5.6696       999  Index of economic, social and cultural status PISA 2006
escs_quint~e  397901      5  3.042988        1         5  Income quintile
qescs         397870      5  3.022158        1         5  Quintiles of Socio-Economic Status
has_qescs     397901      2  .9999221        0         1  Dummy variable for observations with a valid QESCS
city          381911      3  1.741819        1         3  School is located in city (1), town (2), village (3)
native        387656      3  1.129617        1         3  Learner is native (1), second-generation (2), first-generation (3)
language      383676      2  1.122541        1         2  Language of test (1), other language (2)
school_type   363473      3  2.770431        1         3  Type of ownership and decision-making power of schools
school_typ~o  369001      2  1.180151        1         2  Type of school - Public or Private
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


Plus the variables merged-on-the-fly, which are:

traitvars:  lp01_threshold_var lp02_threshold_var lp03_threshold_var lp04_threshold_var lp05_threshold_var lp01_threshold_val lp02_threshold_val lp03_threshold_val lp04_threshold_val lp05_threshold_val lp01_threshold_res lp02_threshold_res lp03_threshold_res lp04_threshold_res lp05_threshold_res
valuevars:  sdg411_read_01 bmp_read_01 fgt1_read_01 fgt2_read_01 sdg411_read_02 bmp_read_02 fgt1_read_02 fgt2_read_02 sdg411_read_03 bmp_read_03 fgt1_read_03 fgt2_read_03 sdg411_read_04 bmp_read_04 fgt1_read_04 fgt2_read_04 sdg411_read_05 bmp_read_05 fgt1_read_05 fgt2_read_05
~~~~

About the **397,901 observations** in this dataset:

~~~~
. tab countrycode idgrade if national_level==1

WB country |
   code (3 |                                   Grade ID
  letters) |         7          8          9         10         11         12         13 |     Total
-----------+-----------------------------------------------------------------------------+----------
       ARG |       112        419        683      2,899        141         36          0 |     4,290 
       AUS |         0         14      1,328     10,153      2,663         12          0 |    14,170 
       AUT |         6        205      2,152      2,562          2          0          0 |     4,927 
       AZE |        21        280      2,715      2,057         28         15         68 |     5,184 
       BEL |        31        361      2,581      5,796         87          0          0 |     8,856 
       BGR |        10        192      3,453        841          2          0          0 |     4,498 
       BRA |     1,328      2,444      3,799      1,650         74          0          0 |     9,295 
       CAN |         8        238      3,457     18,635        304          4          0 |    22,646 
       CHE |        88      1,816      9,033      1,224         29          2          0 |    12,192 
       CHL |        31        118        993      3,764        327          0          0 |     5,233 
       COL |       253        499        994      1,798        934          0          0 |     4,478 
       CZE |        30        158      2,759      2,985          0          0          0 |     5,932 
       DEU |        69        581      2,701      1,397         14          0          0 |     4,762 
       DNK |         9        508      3,923         62         30          0          0 |     4,532 
       ESP |         8      1,072      5,009     13,508          7          0          0 |    19,604 
       EST |       127      1,198      3,445         95          0          0          0 |     4,865 
       FIN |         7        513      4,193          1          0          0          0 |     4,714 
       FRA |         1        227      1,671      2,699        117          1          0 |     4,716 
       GBR |         0          0          1        452     12,501        198          0 |    13,152 
       GRC |        16         65        144      3,999        648          0          0 |     4,872 
       HKG |       107        421      1,134      2,978          5          0          0 |     4,645 
       HRV |         0          4      4,045      1,164          0          0          0 |     5,213 
       HUN |        50        134      3,047      1,257          2          0          0 |     4,490 
       IDN |         5      1,204      5,047      3,894        497          0          0 |    10,647 
       IRL |         2        118      2,722        969        774          0          0 |     4,585 
       ISL |         0          0          7      3,762         20          0          0 |     3,789 
       ISR |         1         12        634      3,919         18          0          0 |     4,584 
       ITA |        23        153      3,698     17,505        394          0          0 |    21,773 
       JOR |         8         76        464      5,961          0          0          0 |     6,509 
       JPN |         0          0          0      5,952          0          0          0 |     5,952 
       KGZ |        11        416      4,020      1,432         25          0          0 |     5,904 
       KOR |         0          0         56      5,083         37          0          0 |     5,176 
       LIE |         0         57        244         37          1          0          0 |       339 
       LTU |        42        514      3,828        332          1          0          0 |     4,717 
       LUX |        10        539      2,430      1,583          5          0          0 |     4,567 
       LVA |        93        719      3,720        158          2          0          0 |     4,692 
       MAC |       391      1,008      1,591      1,738         32          0          0 |     4,760 
       MEX |       482      1,273      4,607     20,789      2,354        949          0 |    30,454 
       MNE |         0          9      3,845        601          0          0          0 |     4,455 
       NLD |         4        157      2,212      2,476         21          1          0 |     4,871 
       NOR |         0          0         25      4,655         12          0          0 |     4,692 
       NZL |         0          0          2        284      4,323        213          1 |     4,823 
       POL |        24        166      5,233        124          0          0          0 |     5,547 
       PRT |       286        585      1,405      2,725         12          0          0 |     5,013 
       QAT |       143        341        931      3,949        891         10          0 |     6,265 
       ROU |         9        256      4,688        165          0          0          0 |     5,118 
       RUS |        25        343      1,577      3,780         74          0          0 |     5,799 
       SRB |         2         44      4,675         77          0          0          0 |     4,798 
       SVK |        28         86      1,747      2,870          0          0          0 |     4,731 
       SVN |         0          3         44      6,224        324          0          0 |     6,595 
       SWE |         0         85      4,264         94          0          0          0 |     4,443 
       THA |         1         72      1,962      3,954        203          0          0 |     6,192 
       TUN |       537        789      1,037      2,067        210          0          0 |     4,640 
       TUR |        23         93      2,007      2,671        148          0          0 |     4,942 
       TWN |         0          2      2,709      6,097          7          0          0 |     8,815 
       URY |       284        400        762      3,011        382          0          0 |     4,839 
       USA |        12         20        616      4,018        936          7          0 |     5,609 
-----------+-----------------------------------------------------------------------------+----------
     Total |     4,758     21,007    136,069    204,932     29,618      1,448         69 |   397,901 

. 
. tab countrycode idgrade if national_level==0
no observations

~~~~

**Harmonization** of proficiency (done on-the-fly):

~~~~

      sdg411_read_01 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
      Non-proficient |    115,520       29.03       29.03
          Proficient |    276,772       69.56       98.59
 Missing score/level |      5,609        1.41      100.00
---------------------+-----------------------------------
               Total |    397,901      100.00

         bmp_read_01 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
          Proficient |    276,772       69.56       69.56
      Non-proficient |    115,520       29.03       98.59
Non-harmonized grade |      5,609        1.41      100.00
---------------------+-----------------------------------
               Total |    397,901      100.00

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
fgt1_read_01 |    115,520    .1892325    .1568313   .0000292   .9997018

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
fgt2_read_01 |    115,520    .0604048     .097444   8.53e-10   .9994037

      sdg411_read_02 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
      Non-proficient |    115,639       29.06       29.06
          Proficient |    276,653       69.53       98.59
 Missing score/level |      5,609        1.41      100.00
---------------------+-----------------------------------
               Total |    397,901      100.00

         bmp_read_02 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
          Proficient |    276,653       69.53       69.53
      Non-proficient |    115,639       29.06       98.59
Non-harmonized grade |      5,609        1.41      100.00
---------------------+-----------------------------------
               Total |    397,901      100.00

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
fgt1_read_02 |    115,639    .1891447    .1564992   .0000292   .9957651

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
fgt2_read_02 |    115,639    .0602675    .0971869   8.53e-10   .9915481

      sdg411_read_03 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
      Non-proficient |    115,551       29.04       29.04
          Proficient |    276,741       69.55       98.59
 Missing score/level |      5,609        1.41      100.00
---------------------+-----------------------------------
               Total |    397,901      100.00

         bmp_read_03 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
          Proficient |    276,741       69.55       69.55
      Non-proficient |    115,551       29.04       98.59
Non-harmonized grade |      5,609        1.41      100.00
---------------------+-----------------------------------
               Total |    397,901      100.00

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
fgt1_read_03 |    115,551    .1891802    .1566135   .0000292   .9945839

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
fgt2_read_03 |    115,551    .0603167    .0971043   8.53e-10   .9891971

      sdg411_read_04 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
      Non-proficient |    115,877       29.12       29.12
          Proficient |    276,415       69.47       98.59
 Missing score/level |      5,609        1.41      100.00
---------------------+-----------------------------------
               Total |    397,901      100.00

         bmp_read_04 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
          Proficient |    276,415       69.47       69.47
      Non-proficient |    115,877       29.12       98.59
Non-harmonized grade |      5,609        1.41      100.00
---------------------+-----------------------------------
               Total |    397,901      100.00

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
fgt1_read_04 |    115,877    .1889997    .1565486   .0000292   .9997018

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
fgt2_read_04 |    115,877    .0602281    .0972456   8.53e-10   .9994037

      sdg411_read_05 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
      Non-proficient |    115,857       29.12       29.12
          Proficient |    276,435       69.47       98.59
 Missing score/level |      5,609        1.41      100.00
---------------------+-----------------------------------
               Total |    397,901      100.00

         bmp_read_05 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
          Proficient |    276,435       69.47       69.47
      Non-proficient |    115,857       29.12       98.59
Non-harmonized grade |      5,609        1.41      100.00
---------------------+-----------------------------------
               Total |    397,901      100.00

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
fgt1_read_05 |    115,857    .1891892    .1561173   .0000292   .9977336

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
fgt2_read_05 |    115,857     .060165    .0966695   8.53e-10   .9954723



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
