Documentation of GLAD dataset
=====================================================================


[back to list of assessments](https://github.com/worldbank/GLAD/blob/master/README.md#harmonization)

This dataset is part of the Global Learning Assessment Database (GLAD). It contains microdata from PISA 2009. Each observation corresponds to one learner (student or pupil), and the variables have been harmonized.'

**Metadata** stored in this dataset:

~~~~
region:      WLD
year:        2009
assessment:  PISA
master:      v01_M
adaptation:  wrk_A_GLAD
module:      ALL
ttl_info:    Joao Pedro de Azevedo [eduanalytics@worldbank.org]
dofile_info: created by Aishwarya, last modified by Joao Pedro Azevedo on February 5, 2022
lastsave:    6 Feb 2022 11:15:02 by wb255520
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


Variable         Obs Unique      Mean      Min      Max  Label
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
idcntry_raw   515053     74         .        .        .  Country ID, as coded in rawdata
idschool      515053   1535  230.7966        1     1535  School ID
idlearner     515053  38249  6214.377        1    38250  Learner ID
surveyid      515053      1         .        .        .  Survey ID (Region_Year_Assessment)
countrycode   515053     73         .        .        .  WB country code (3 letters)
national_l~l  515053      2  .9750666        0        1  Idcntry_raw is a national level
score_p~d_01  515053  13991  460.6743      .77   871.12  Plausible value 1: PISA score for read
score_p~h_01  515053   7166  461.8117    14.65  1022.21  Plausible value 1: PISA score for math
score_p~e_01  515053   4888  466.2561      .78   883.76  Plausible value 1: PISA score for science
score_p~d_02  515053  14043  460.7288     2.36   857.93  Plausible value 2: PISA score for read
score_p~h_02  515053   7183  461.8578    16.75   998.06  Plausible value 2: PISA score for math
score_p~e_02  515053   4916  466.3256     4.42   898.49  Plausible value 2: PISA score for science
score_p~d_03  515053  14031   460.664      .45   844.75  Plausible value 3: PISA score for read
score_p~h_03  515053   7198  461.8309     3.12  1064.27  Plausible value 3: PISA score for math
score_p~e_03  515053   4915  466.3111     1.62   918.26  Plausible value 3: PISA score for science
score_p~d_04  515053  14012  460.6974     2.86   877.24  Plausible value 4: PISA score for read
score_p~h_04  515053   7209  461.8142     3.67  1021.43  Plausible value 4: PISA score for math
score_p~e_04  515053   4929  466.2998     2.09    890.1  Plausible value 4: PISA score for science
score_p~d_05  515053  14016  460.6793      .05    904.5  Plausible value 5: PISA score for read
score_p~h_05  515053   7161  461.8007     4.99   980.92  Plausible value 5: PISA score for math
score_p~e_05  515053   4915  466.2805     1.62    905.2  Plausible value 5: PISA score for science
level_p~d_01  515053      8  2.240232       -1        6  Plausible value 1: PISA level for read
level_p~h_01  515053      7  2.233267        0        6  Plausible value 1: PISA level for math
level_p~e_01  515053      8  2.261589       -1        6  Plausible value 1: PISA level for science
level_p~d_02  515053      8  2.240581       -1        6  Plausible value 2: PISA level for read
level_p~h_02  515053      7  2.233786        0        6  Plausible value 2: PISA level for math
level_p~e_02  515053      8  2.263464       -1        6  Plausible value 2: PISA level for science
level_p~d_03  515053      8  2.240329       -1        6  Plausible value 3: PISA level for read
level_p~h_03  515053      7  2.233605        0        6  Plausible value 3: PISA level for math
level_p~e_03  515053      8  2.262717       -1        6  Plausible value 3: PISA level for science
level_p~d_04  515053      8  2.240185       -1        6  Plausible value 4: PISA level for read
level_p~h_04  515053      7  2.232858        0        6  Plausible value 4: PISA level for math
level_p~e_04  515053      8   2.26282       -1        6  Plausible value 4: PISA level for science
level_p~d_05  515053      8  2.240523       -1        6  Plausible value 5: PISA level for read
level_p~h_05  515053      7  2.233234        0        6  Plausible value 5: PISA level for math
level_p~e_05  515053      8  2.262592       -1        6  Plausible value 5: PISA level for science
idgrade       515053      7  9.602313        7       13  Grade ID
age           515053     16  15.77781    15.17    16.42  Learner age at time of assessment
urban         504561      2  .8955508        0        1  School is located in urban/rural area
urban_o       515053      8         .        .        .  Original variable of urban: population size of the school area
male          515051      2  .4938695        0        1  Learner gender is male/female
escs          515053  49255  118.8127  -6.6195     9999  Index of economic, social and cultural status (WLE)
escs_quint~e  515053      5   3.02172        1        5  Income quintile
qescs         515011      5  3.006712        1        5  Quintiles of Socio-Economic Status
has_qescs     515053      2  .9999185        0        1  Dummy variable for observations with a valid QESCS
city          504561      3  1.721631        1        3  School is located in city (1), town (2), village (3)
native        502836      3  1.145135        1        3  Learner is native (1), second-generation (2), first-generation (3)
language      495291      2  1.128373        1        2  Language of test (1), other language (2)
ece           501450      3   2.50817        1        3  Attended early childhood education
school_type   491642      3  2.762626        1        3  Type of ownership and decision-making power of schools
school_typ~o  504050      2  1.186779        1        2  Type of school - Public or Private
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


Plus the variables merged-on-the-fly, which are:

traitvars:  lp01_threshold_var lp02_threshold_var lp03_threshold_var lp04_threshold_var lp05_threshold_var lp01_threshold_val lp02_threshold_val lp03_threshold_val lp04_threshold_val lp05_threshold_val lp01_threshold_res lp02_threshold_res lp03_threshold_res lp04_threshold_res lp05_threshold_res
valuevars:  sdg411_read_01 bmp_read_01 fgt1_read_01 fgt2_read_01 sdg411_read_02 bmp_read_02 fgt1_read_02 fgt2_read_02 sdg411_read_03 bmp_read_03 fgt1_read_03 fgt2_read_03 sdg411_read_04 bmp_read_04 fgt1_read_04 fgt2_read_04 sdg411_read_05 bmp_read_05 fgt1_read_05 fgt2_read_05
~~~~

About the **515,053 observations** in this dataset:

~~~~
. tab countrycode idgrade if national_level==1

WB country |
   code (3 |                                   Grade ID
  letters) |         7          8          9         10         11         12         13 |     Total
-----------+-----------------------------------------------------------------------------+----------
       ALB |        19         92      2,080      2,398          7          0          0 |     4,596 
       ARE |       180        461      1,683      6,440      1,991        112          0 |    10,867 
       ARG |       189        555        943      2,819        214          0          0 |     4,720 
       AUS |         1         14      1,602     10,163      2,461         10          0 |    14,251 
       AUT |        33        290      2,910      3,355          2          0          0 |     6,590 
       AZE |        29        242      2,169      2,232         19          0          0 |     4,691 
       BEL |        28        422      2,527      5,241         98          3          0 |     8,319 
       BGR |        74        313      3,945        175          0          0          0 |     4,507 
       BRA |     1,319      3,582      8,013      6,602        611          0          0 |    20,127 
       CAN |         6        160      2,950     19,781        306          4          0 |    23,207 
       CHE |        61      1,836      8,840      1,037         37          1          0 |    11,812 
       CHL |        37        152      1,113      4,065        301          1          0 |     5,669 
       COL |       325        781      1,652      3,544      1,619          0          0 |     7,921 
       CRI |       355        746      1,617      1,842         17          1          0 |     4,578 
       CZE |        27        224      3,026      2,787          0          0          0 |     6,064 
       DEU |        61        547      2,608      1,565         20          1          0 |     4,802 
       DNK |        22        904      4,915         83          0          0          0 |     5,924 
       ESP |        37      2,236      5,936     17,666         12          0          0 |    25,887 
       EST |        62      1,079      3,514         71          1          0          0 |     4,727 
       FIN |        21        672      5,099          0         18          0          0 |     5,810 
       FRA |        60        129      1,461      2,473        171          4          0 |     4,298 
       GBR |         0          0          0        448     11,473        258          0 |    12,179 
       GEO |         9         52      1,255      3,271         59          0          0 |     4,646 
       GRC |        12         37        132      4,788          0          0          0 |     4,969 
       HKG |        85        353      1,210      3,185          4          0          0 |     4,837 
       HRV |         0          2      3,892      1,100          0          0          0 |     4,994 
       HUN |        55        160      3,289      1,096          4          1          0 |     4,605 
       IDN |        71        299      2,316      2,197        232         21          0 |     5,136 
       IRL |         2         91      2,371        924        549          0          0 |     3,937 
       ISL |         0          0          1      3,586         59          0          0 |     3,646 
       ISR |         0         16        965      4,756         23          1          0 |     5,761 
       ITA |         9        116      5,142     24,947        691          0          0 |    30,905 
       JOR |         8         70        390      6,018          0          0          0 |     6,486 
       JPN |         0          0          0      6,088          0          0          0 |     6,088 
       KAZ |        25        342      4,028      1,011          6          0          0 |     5,412 
       KGZ |         9        394      3,532      1,012         39          0          0 |     4,986 
       KOR |         0          2        315      4,637         35          0          0 |     4,989 
       LIE |         3         60        233         33          0          0          0 |       329 
       LTU |        21        441      3,696        368          1          0          0 |     4,527 
       LUX |        30        289      2,519      1,772         12          0          0 |     4,622 
       LVA |        89        612      3,651        132          6          1          0 |     4,491 
       MAC |       398      1,139      2,076      2,308         31          0          0 |     5,952 
       MDA |        18        609      4,315        252          0          0          0 |     5,194 
       MEX |       409      1,738      8,321     27,494        250          1          0 |    38,213 
       MLT |         0          1          3        463      2,986          0          0 |     3,453 
       MNE |         0         22      4,076        727          0          0          0 |     4,825 
       MUS |         7         47        352      1,986      2,258          4          0 |     4,654 
       MYS |         0          7      1,399      3,593          0          0          0 |     4,999 
       NLD |         4        113      2,257      2,360         26          0          0 |     4,760 
       NOR |         0          0         20      4,633          7          0          0 |     4,660 
       NZL |         0          0          1        263      4,124        254          1 |     4,643 
       PAN |        92        386      1,486      1,757        248          0          0 |     3,969 
       PER |       208        486      1,008      2,726      1,557          0          0 |     5,985 
       POL |        35        162      4,701         19          0          0          0 |     4,917 
       PRT |       134        517      1,560      3,619         25          0          0 |     5,855 
       QAT |       149        317      1,213      5,754      1,617         28          0 |     9,078 
       ROU |         0        145      4,419        212          0          0          0 |     4,776 
       RUS |        46        531      3,065      1,621         45          0          0 |     5,308 
       SGP |        53        148      1,830      3,251          0          1          0 |     5,283 
       SRB |         6         59      5,351        107          0          0          0 |     5,523 
       SVK |        41        102      1,660      2,587        164          1          0 |     4,555 
       SVN |         0          1         45      5,799        310          0          0 |     6,155 
       SWE |         4        142      4,357         64          0          0          0 |     4,567 
       THA |         4         40      1,524      4,465        192          0          0 |     6,225 
       TTO |       157        450      1,119      2,687        365          0          0 |     4,778 
       TUN |       340        715      1,319      2,327        254          0          0 |     4,955 
       TUR |        24        113      1,258      3,393        196         12          0 |     4,996 
       TWN |         0          7      1,870      3,953          1          0          0 |     5,831 
       URY |       371        660      1,300      3,351        275          0          0 |     5,957 
       USA |         0          4        565      3,619      1,040          5          0 |     5,233 
-----------+-----------------------------------------------------------------------------+----------
     Total |     5,874     27,434    170,010    261,098     37,069        725          1 |   502,211 

. 
. tab countrycode idgrade if national_level==0

WB country |
   code (3 |                             Grade ID
  letters) |         7          8          9         10         11         12 |     Total
-----------+------------------------------------------------------------------+----------
       CHN |        52        208      1,924      2,908         22          1 |     5,115 
       IND |         3         51        307      1,276      2,519        670 |     4,826 
       VEN |        53        179      1,367      1,241         59          2 |     2,901 
-----------+------------------------------------------------------------------+----------
     Total |       108        438      3,598      5,425      2,600        673 |    12,842 

~~~~

**Harmonization** of proficiency (done on-the-fly):

~~~~

      sdg411_read_01 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
      Non-proficient |    154,790       30.05       30.05
          Proficient |    360,263       69.95      100.00
---------------------+-----------------------------------
               Total |    515,053      100.00

         bmp_read_01 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
          Proficient |    360,263       69.95       69.95
      Non-proficient |    154,790       30.05      100.00
---------------------+-----------------------------------
               Total |    515,053      100.00

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
fgt1_read_01 |    154,790    .1725748    .1409285   .0000245   .9981103

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
fgt2_read_01 |    154,790    .0496428    .0782907   6.02e-10   .9962242

      sdg411_read_02 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
      Non-proficient |    154,968       30.09       30.09
          Proficient |    360,085       69.91      100.00
---------------------+-----------------------------------
               Total |    515,053      100.00

         bmp_read_02 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
          Proficient |    360,085       69.91       69.91
      Non-proficient |    154,968       30.09      100.00
---------------------+-----------------------------------
               Total |    515,053      100.00

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
fgt1_read_02 |    154,968    .1725513    .1410167   .0000245   .9942082

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
fgt2_read_02 |    154,968    .0496595      .07814   6.02e-10   .9884499

      sdg411_read_03 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
      Non-proficient |    154,970       30.09       30.09
          Proficient |    360,083       69.91      100.00
---------------------+-----------------------------------
               Total |    515,053      100.00

         bmp_read_03 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
          Proficient |    360,083       69.91       69.91
      Non-proficient |    154,970       30.09      100.00
---------------------+-----------------------------------
               Total |    515,053      100.00

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
fgt1_read_03 |    154,970     .172548    .1411925   .0000245   .9988956

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
fgt2_read_03 |    154,970     .049708    .0787862   6.02e-10   .9977925

      sdg411_read_04 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
      Non-proficient |    154,861       30.07       30.07
          Proficient |    360,192       69.93      100.00
---------------------+-----------------------------------
               Total |    515,053      100.00

         bmp_read_04 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
          Proficient |    360,192       69.93       69.93
      Non-proficient |    154,861       30.07      100.00
---------------------+-----------------------------------
               Total |    515,053      100.00

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
fgt1_read_04 |    154,861    .1729399    .1410988   .0000245   .9929811

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
fgt2_read_04 |    154,861    .0498169    .0785799   6.02e-10   .9860114

      sdg411_read_05 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
      Non-proficient |    154,736       30.04       30.04
          Proficient |    360,317       69.96      100.00
---------------------+-----------------------------------
               Total |    515,053      100.00

         bmp_read_05 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
          Proficient |    360,317       69.96       69.96
      Non-proficient |    154,736       30.04      100.00
---------------------+-----------------------------------
               Total |    515,053      100.00

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
fgt1_read_05 |    154,736    .1726128    .1407595   .0000245   .9998773

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
fgt2_read_05 |    154,736    .0496083    .0780637   6.02e-10   .9997545



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
