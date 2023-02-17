Documentation of GLAD dataset
=====================================================================


[back to list of assessments](https://github.com/worldbank/GLAD/blob/master/README.md#harmonization)

This dataset is part of the Global Learning Assessment Database (GLAD). It contains microdata from PISA 2003. Each observation corresponds to one learner (student or pupil), and the variables have been harmonized.'

**Metadata** stored in this dataset:

~~~~
region:      WLD
year:        2003
assessment:  PISA
master:      v01_M
adaptation:  wrk_A_GLAD
module:      ALL
ttl_info:    Joao Pedro de Azevedo [eduanalytics@worldbank.org]
dofile_info: created by Aishwarya, last modified by Joao Pedro Azevedo on February 5, 2022
lastsave:    6 Feb 2022 10:23:32 by wb255520
~~~~


About the **167 variables** in this dataset:

~~~~
The variables belong to the following variable classifications:
    idvars keyvars valuevars traitvars pisavars samplevars

idvars:     idcntry_raw idschool idlearner
keyvars:    surveyid countrycode national_level
valuevars:  score_pisa_read_01 score_pisa_math_01 score_pisa_science_01 score_pisa_read_02 score_pisa_math_02 score_pisa_science_02 score_pisa_read_03 score_pisa_math_03 score_pisa_science_03 score_pisa_read_04 score_pisa_math_04 score_pisa_science_04 score_pisa_read_05 score_pisa_math_05 score_pisa_science_05 level_pisa_read_01 level_pisa_math_01 level_pisa_science_01 level_pisa_read_02 level_pisa_math_02 level_pisa_science_02 level_pisa_read_03 level_pisa_math_03 level_pisa_science_03 level_pisa_read_04 level_pisa_math_04 level_pisa_science_04 level_pisa_read_05 level_pisa_math_05 level_pisa_science_05
traitvars:  idgrade age urban urban_o male escs escs_quintile qescs has_qescs
pisavars: city native language ece school_type school_type_o


Variable         Obs Unique      Mean        Min       Max  Label
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
idcntry_raw   274606     41         .          .         .  Country ID, as coded in rawdata
idschool      274606   1122   210.261          1      1124  School ID
idlearner     274606  29947  5681.219          1     29983  Learner ID
surveyid      274606      1         .          .         .  Survey ID (Region_Year_Assessment)
countrycode   274606     41         .          .         .  WB country code (3 letters)
national_l~l  274606      1         1          1         1  Idcntry_raw is a national level
score_p~d_01  274606   8975  479.9718   -79.0449  889.5332  Plausible value 1: PISA score for read
score_p~h_01  274606   6139  482.3385    30.2539  881.0874  Plausible value 1: PISA score for math
score_p~e_01  274606   4349  485.7709  -169.9305   940.313  Plausible value 1: PISA score for science
score_p~d_02  274606   9008  479.8541   -90.8238  914.0024  Plausible value 2: PISA score for read
score_p~h_02  274606   6129  482.2938    45.0537  870.9612  Plausible value 2: PISA score for math
score_p~e_02  274606   4321  485.7039  -195.3489  947.5755  Plausible value 2: PISA score for science
score_p~d_03  274606   9051    479.95   -51.6134  918.1335  Plausible value 3: PISA score for read
score_p~h_03  274606   6167  482.3525   -22.0907  877.1927  Plausible value 3: PISA score for math
score_p~e_03  274606   4355  485.8843  -186.2709  945.7598  Plausible value 3: PISA score for science
score_p~d_04  274606   9043  480.0355  -136.9021  943.5561  Plausible value 4: PISA score for read
score_p~h_04  274606   6150  482.3428    26.2814  878.7506  Plausible value 4: PISA score for math
score_p~e_04  274606   4321  485.7799  -238.9235  950.2989  Plausible value 4: PISA score for science
score_p~d_05  274606   9027  479.8197   -93.4826  914.0024  Plausible value 5: PISA score for read
score_p~h_05  274606   6131  482.3072    49.9611  893.7841  Plausible value 5: PISA score for math
score_p~e_05  274606   4338  485.7749  -125.4481  930.3272  Plausible value 5: PISA score for science
level_p~d_01  274606      8  2.503933         -1         6  Plausible value 1: PISA level for read
level_p~h_01  274606      7  2.543604          0         6  Plausible value 1: PISA level for math
level_p~e_01  274606      8  2.521733         -1         6  Plausible value 1: PISA level for science
level_p~d_02  274606      8  2.501402         -1         6  Plausible value 2: PISA level for read
level_p~h_02  274606      7  2.543765          0         6  Plausible value 2: PISA level for math
level_p~e_02  274606      8  2.521467         -1         6  Plausible value 2: PISA level for science
level_p~d_03  274606      8  2.503033         -1         6  Plausible value 3: PISA level for read
level_p~h_03  274606      7  2.544362          0         6  Plausible value 3: PISA level for math
level_p~e_03  274606      8  2.523131         -1         6  Plausible value 3: PISA level for science
level_p~d_04  274606      8  2.504024         -1         6  Plausible value 4: PISA level for read
level_p~h_04  274606      7  2.545811          0         6  Plausible value 4: PISA level for math
level_p~e_04  274606      8  2.521908         -1         6  Plausible value 4: PISA level for science
level_p~d_05  274606      8   2.50169         -1         6  Plausible value 5: PISA level for read
level_p~h_05  274606      7  2.543124          0         6  Plausible value 5: PISA level for math
level_p~e_05  274606      8  2.522232         -1         6  Plausible value 5: PISA level for science
idgrade       274606      6  9.603374          7        12  Grade ID
age           274571     16  15.79676      15.17     16.42  Learner age at time of assessment
urban         257874      2  .8789797          0         1  School is located in urban/rural area
urban_o       274606      8         .          .         .  Original variable of urban: population size of the school area
male          274550      2  .4957458          0         1  Learner gender is male/female
escs          274606  34307  11.69158   -4.61459       999  Index of Socio-Economic and Cultural Status
escs_quint~e  274606      5  3.008685          1         5  Income quintile
qescs         274579      5  3.001887          1         5  Quintiles of Socio-Economic Status
has_qescs     274606      2  .9999017          0         1  Dummy variable for observations with a valid QESCS
city          257874      3  1.785667          1         3  School is located in city (1), town (2), village (3)
native        267851      3  1.119929          1         3  Learner is native (1), second-generation (2), first-generation (3)
language      264896      2  1.129424          1         2  Language of test (1), other language (2)
ece           268400      3  2.518603          1         3  Attended early childhood education
school_type   235938      3  2.773059          1         3  Type of ownership and decision-making power of schools
school_typ~o  247115      2   1.17468          1         2  Type of school - Public or Private
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


Plus the variables merged-on-the-fly, which are:

traitvars:  lp01_threshold_var lp02_threshold_var lp03_threshold_var lp04_threshold_var lp05_threshold_var lp01_threshold_val lp02_threshold_val lp03_threshold_val lp04_threshold_val lp05_threshold_val lp01_threshold_res lp02_threshold_res lp03_threshold_res lp04_threshold_res lp05_threshold_res
valuevars:  sdg411_read_01 bmp_read_01 fgt1_read_01 fgt2_read_01 sdg411_read_02 bmp_read_02 fgt1_read_02 fgt2_read_02 sdg411_read_03 bmp_read_03 fgt1_read_03 fgt2_read_03 sdg411_read_04 bmp_read_04 fgt1_read_04 fgt2_read_04 sdg411_read_05 bmp_read_05 fgt1_read_05 fgt2_read_05
~~~~

About the **274,606 observations** in this dataset:

~~~~
. tab countrycode idgrade if national_level==1

WB country |
   code (3 |                             Grade ID
  letters) |         7          8          9         10         11         12 |     Total
-----------+------------------------------------------------------------------+----------
       AUS |         1         16      1,064      8,982      2,480          8 |    12,551 
       AUT |         8        166      2,034      2,383          0          0 |     4,591 
       BEL |        24        333      2,548      5,797         66          0 |     8,768 
       BRA |       527        973      2,062        867         23          0 |     4,452 
       CAN |        62        397      4,343     22,080        330          2 |    27,214 
       CHE |        59      1,359      5,910      1,067         12          0 |     8,407 
       CZE |         7        122      2,785      3,406          0          0 |     6,320 
       DEU |        73        647      2,706      1,088          6          0 |     4,520 
       DNK |         3        377      3,731        103          2          0 |     4,216 
       ESP |         4        259      2,576      7,951          1          0 |    10,791 
       FIN |        14        715      5,067          0          0          0 |     5,796 
       FRA |         7        213      1,392      2,586        100          2 |     4,300 
       GBR |         0          0          1      1,495      6,384      1,655 |     9,535 
       GRC |        12        121        342      3,460        692          0 |     4,627 
       HKG |       211        439      1,132      2,692          4          0 |     4,478 
       HUN |        64        330      3,022      1,348          1          0 |     4,765 
       IDN |       248      1,188      4,948      4,124        238         15 |    10,761 
       IRL |         1        109      2,362        654        754          0 |     3,880 
       ISL |         0          0          0      3,350          0          0 |     3,350 
       ITA |        11         63      1,775      9,562        228          0 |    11,639 
       JPN |         0          0          0      4,707          0          0 |     4,707 
       KOR |         0          0         73      5,366          5          0 |     5,444 
       LIE |         2         67        237         26          0          0 |       332 
       LUX |         0        583      2,195      1,141          4          0 |     3,923 
       LVA |        55        723      3,459        297          5          0 |     4,539 
       MAC |       191        355        426        275          3          0 |     1,250 
       MEX |       466      1,350      4,833     22,696        104          2 |    29,451 
       NLD |         4        176      1,762      2,029         19          1 |     3,991 
       NOR |         0          0         25      4,026         13          0 |     4,064 
       NZL |         0          2        300      4,019        181          1 |     4,503 
       POL |        31        135      4,196         21          0          0 |     4,383 
       PRT |       208        508        963      2,900         29          0 |     4,608 
       RUS |        17        129      1,657      4,101         70          0 |     5,974 
       SRB |         0          0      4,301        104          0          0 |     4,405 
       SVK |        31         75      2,672      4,530         38          0 |     7,346 
       SWE |         2        114      4,420         88          0          0 |     4,624 
       THA |         4         44      2,222      2,864        102          0 |     5,236 
       TUN |       721      1,033      1,181      1,645        141          0 |     4,721 
       TUR |        27         92        191      2,863      1,670         12 |     4,855 
       URY |       517        667      1,294      3,035        322          0 |     5,835 
       USA |         8         95      1,667      3,339        345          0 |     5,454 
-----------+------------------------------------------------------------------+----------
     Total |     3,620     13,975     87,874    153,067     14,372      1,698 |   274,606 

. 
. tab countrycode idgrade if national_level==0
no observations

~~~~

**Harmonization** of proficiency (done on-the-fly):

~~~~

      sdg411_read_01 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
      Non-proficient |     65,688       23.92       23.92
          Proficient |    208,918       76.08      100.00
---------------------+-----------------------------------
               Total |    274,606      100.00

         bmp_read_01 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
          Proficient |    208,918       76.08       76.08
      Non-proficient |     65,688       23.92      100.00
---------------------+-----------------------------------
               Total |    274,606      100.00

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
fgt1_read_01 |     65,688    .1627644    .1362655   .0000292    1.19399

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
fgt2_read_01 |     65,688    .0450603     .074341   8.53e-10   1.425611

      sdg411_read_02 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
      Non-proficient |     65,690       23.92       23.92
          Proficient |    208,916       76.08      100.00
---------------------+-----------------------------------
               Total |    274,606      100.00

         bmp_read_02 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
          Proficient |    208,916       76.08       76.08
      Non-proficient |     65,690       23.92      100.00
---------------------+-----------------------------------
               Total |    274,606      100.00

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
fgt1_read_02 |     65,690     .162469    .1365043   .0000292   1.222897

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
fgt2_read_02 |     65,690    .0450293    .0751781   8.53e-10   1.495477

      sdg411_read_03 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
      Non-proficient |     65,650       23.91       23.91
          Proficient |    208,956       76.09      100.00
---------------------+-----------------------------------
               Total |    274,606      100.00

         bmp_read_03 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
          Proficient |    208,956       76.09       76.09
      Non-proficient |     65,650       23.91      100.00
---------------------+-----------------------------------
               Total |    274,606      100.00

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
fgt1_read_03 |     65,650    .1635329    .1365515   .0000292   1.126668

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
fgt2_read_03 |     65,650     .045389    .0745766   8.53e-10   1.269381

      sdg411_read_04 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
      Non-proficient |     65,524       23.86       23.86
          Proficient |    209,082       76.14      100.00
---------------------+-----------------------------------
               Total |    274,606      100.00

         bmp_read_04 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
          Proficient |    209,082       76.14       76.14
      Non-proficient |     65,524       23.86      100.00
---------------------+-----------------------------------
               Total |    274,606      100.00

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
fgt1_read_04 |     65,524    .1631908    .1368643   .0000292   1.335981

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
fgt2_read_04 |     65,524    .0453628    .0754674   8.53e-10   1.784845

      sdg411_read_05 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
      Non-proficient |     65,492       23.85       23.85
          Proficient |    209,114       76.15      100.00
---------------------+-----------------------------------
               Total |    274,606      100.00

         bmp_read_05 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
          Proficient |    209,114       76.15       76.15
      Non-proficient |     65,492       23.85      100.00
---------------------+-----------------------------------
               Total |    274,606      100.00

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
fgt1_read_05 |     65,492    .1638781    .1372685   .0000292   1.229422

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
fgt2_read_05 |     65,492    .0456984    .0759179   8.53e-10   1.511479



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
     +-------------------------------------------------------------+

~~~~
