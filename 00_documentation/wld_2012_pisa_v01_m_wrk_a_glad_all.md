Documentation of GLAD dataset
=====================================================================


[back to list of assessments](https://github.com/worldbank/GLAD/blob/master/README.md#harmonization)

This dataset is part of the Global Learning Assessment Database (GLAD). It contains microdata from PISA 2012. Each observation corresponds to one learner (student or pupil), and the variables have been harmonized.'

**Metadata** stored in this dataset:

~~~~
region:      WLD
year:        2012
assessment:  PISA
master:      v01_M
adaptation:  wrk_A_GLAD
module:      ALL
ttl_info:    Joao Pedro de Azevedo [eduanalytics@worldbank.org]
dofile_info: created by Aishwarya, last modified by Joao Pedro Azevedo on February 5, 2022
lastsave:    6 Feb 2022 10:27:47 by wb255520
~~~~


About the **177 variables** in this dataset:

~~~~
The variables belong to the following variable classifications:
    idvars keyvars valuevars traitvars pisavars samplevars

idvars:     idcntry_raw idschool idlearner
keyvars:    surveyid countrycode national_level
valuevars:  score_pisa_read_01 score_pisa_math_01 score_pisa_science_01 score_pisa_flit_01 score_pisa_read_02 score_pisa_math_02 score_pisa_science_02 score_pisa_flit_02 score_pisa_read_03 score_pisa_math_03 score_pisa_science_03 score_pisa_flit_03 score_pisa_read_04 score_pisa_math_04 score_pisa_science_04 score_pisa_flit_04 score_pisa_read_05 score_pisa_math_05 score_pisa_science_05 score_pisa_flit_05 level_pisa_read_01 level_pisa_math_01 level_pisa_science_01 level_pisa_flit_01 level_pisa_read_02 level_pisa_math_02 level_pisa_science_02 level_pisa_flit_02 level_pisa_read_03 level_pisa_math_03 level_pisa_science_03 level_pisa_flit_03 level_pisa_read_04 level_pisa_math_04 level_pisa_science_04 level_pisa_flit_04 level_pisa_read_05 level_pisa_math_05 level_pisa_science_05 level_pisa_flit_05
traitvars:  idgrade age urban urban_o male escs escs_quintile qescs has_qescs
pisavars: city native language ece school_type school_type_o


Variable         Obs Unique      Mean      Min       Max  Label
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
idcntry_raw   479301     65         .        .         .  Country ID, as coded in rawdata
idschool      479301   1471  242.7949        1      1471  School ID
idlearner     479301  33806  6198.545        1     33806  Learner ID
surveyid      479301      1         .        .         .  Survey ID (Region_Year_Assessment)
countrycode   479301     64         .        .         .  WB country code (3 letters)
national_l~l  479301      2  .9855248        0         1  Idcntry_raw is a national level
score_p~d_01  479301  11542  471.7943    .0834  904.8026  Plausible value 1: PISA score for read
score_p~h_01  479301   7056  469.5616  19.7928  962.2293  Plausible value 1: PISA score for math
score_p~e_01  479301   6151  475.6105   2.6483  903.3383  Plausible value 1: PISA score for science
score_p~t_01       0      0         .        .         .  Plausible value 1: PISA score for financial literacy
score_p~d_02  479301  11551  471.8487    .7035  881.2392  Plausible value 2: PISA score for read
score_p~h_02  479301   7026  469.5691    6.473  957.0104  Plausible value 2: PISA score for math
score_p~e_02  479301   6150  475.6291   2.8348  900.5408  Plausible value 2: PISA score for science
score_p~t_02       0      0         .        .         .  Plausible value 2: PISA score for financial literacy
score_p~d_03  479301  11523  471.7957    .7035   884.447  Plausible value 3: PISA score for read
score_p~h_03  479301   7087   469.579  42.2262  935.7454  Plausible value 3: PISA score for math
score_p~e_03  479301   6131  475.6716  11.8799  866.4118  Plausible value 3: PISA score for science
score_p~t_03       0      0         .        .         .  Plausible value 3: PISA score for financial literacy
score_p~d_04  479301  11517  471.6976   4.1344   881.159  Plausible value 4: PISA score for read
score_p~h_04  479301   7088    469.57  24.6222  943.4569  Plausible value 4: PISA score for math
score_p~e_04  479301   6163  475.5998   8.4297  926.5573  Plausible value 4: PISA score for science
score_p~t_04       0      0         .        .         .  Plausible value 4: PISA score for financial literacy
score_p~d_05  479301  11574  471.7998   2.3074  901.6086  Plausible value 5: PISA score for read
score_p~h_05  479301   7088  469.6318  37.0852  907.6258  Plausible value 5: PISA score for math
score_p~e_05  479301   6139  475.6477  17.7546  880.9586  Plausible value 5: PISA score for science
score_p~t_05       0      0         .        .         .  Plausible value 5: PISA score for financial literacy
level_p~d_01  479301      8  2.390861       -1         6  Plausible value 1: PISA level for read
level_p~h_01  479301      7  2.334149        0         6  Plausible value 1: PISA level for math
level_p~e_01  479301      8  2.386185       -1         6  Plausible value 1: PISA level for science
level_p~t_01       0      0         .        .         .  Plausible value 1: PISA level for financial literacy
level_p~d_02  479301      8  2.391958       -1         6  Plausible value 2: PISA level for read
level_p~h_02  479301      7   2.33528        0         6  Plausible value 2: PISA level for math
level_p~e_02  479301      8  2.386187       -1         6  Plausible value 2: PISA level for science
level_p~t_02       0      0         .        .         .  Plausible value 2: PISA level for financial literacy
level_p~d_03  479301      8  2.391082       -1         6  Plausible value 3: PISA level for read
level_p~h_03  479301      7   2.33412        0         6  Plausible value 3: PISA level for math
level_p~e_03  479301      8  2.385893       -1         6  Plausible value 3: PISA level for science
level_p~t_03       0      0         .        .         .  Plausible value 3: PISA level for financial literacy
level_p~d_04  479301      8  2.390091       -1         6  Plausible value 4: PISA level for read
level_p~h_04  479301      7  2.334335        0         6  Plausible value 4: PISA level for math
level_p~e_04  479301      8   2.38542       -1         6  Plausible value 4: PISA level for science
level_p~t_04       0      0         .        .         .  Plausible value 4: PISA level for financial literacy
level_p~d_05  479301      8  2.390775       -1         6  Plausible value 5: PISA level for read
level_p~h_05  479301      7  2.335155        0         6  Plausible value 5: PISA level for math
level_p~e_05  479301      8  2.386523       -1         6  Plausible value 5: PISA level for science
level_p~t_05       0      0         .        .         .  Plausible value 5: PISA level for financial literacy
idgrade       479301      7  9.653114        7        13  Grade ID
age           479186     15  15.78384    15.17     16.33  Learner age at time of assessment
urban         470488      2  .9083632        0         1  School is located in urban/rural area
urban_o       479301      8         .        .         .  Original variable of urban: population size of the school area
male          479301      2  .4949541        0         1  Learner gender is male/female
escs          479301    785   244.631    -5.95      9999  Index of economic, social and cultural status
escs_quint~e  479301      5  3.016891        1         5  Income quintile
qescs         479265      5  2.985689        1         5  Quintiles of Socio-Economic Status
has_qescs     479301      2  .9999249        0         1  Dummy variable for observations with a valid QESCS
city          470488      3  1.686241        1         3  School is located in city (1), town (2), village (3)
native        465805      3  1.169577        1         3  Learner is native (1), second-generation (2), first-generation (3)
language      459495      2  1.123268        1         2  Language of test (1), other language (2)
ece           470089      3  2.555397        1         3  Attended early childhood education
school_type   461146      3  2.744497        1         3  Type of ownership and decision-making power of schools
school_typ~o  471062      2  1.197371        1         2  Type of school - Public or Private
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


Plus the variables merged-on-the-fly, which are:

traitvars:  lp01_threshold_var lp02_threshold_var lp03_threshold_var lp04_threshold_var lp05_threshold_var lp01_threshold_val lp02_threshold_val lp03_threshold_val lp04_threshold_val lp05_threshold_val lp01_threshold_res lp02_threshold_res lp03_threshold_res lp04_threshold_res lp05_threshold_res
valuevars:  sdg411_read_01 bmp_read_01 fgt1_read_01 fgt2_read_01 sdg411_read_02 bmp_read_02 fgt1_read_02 fgt2_read_02 sdg411_read_03 bmp_read_03 fgt1_read_03 fgt2_read_03 sdg411_read_04 bmp_read_04 fgt1_read_04 fgt2_read_04 sdg411_read_05 bmp_read_05 fgt1_read_05 fgt2_read_05
~~~~

About the **479,301 observations** in this dataset:

~~~~
. tab countrycode idgrade if national_level==1

WB country |
   code (3 |                                   Grade ID
  letters) |         7          8          9         10         11         12         13 |     Total
-----------+-----------------------------------------------------------------------------+----------
       ALB |         7         91      1,717      2,911         17          0          0 |     4,743 
       ARE |       151        392      1,484      7,017      2,356        100          0 |    11,500 
       ARG |       115        616      1,153      3,765        190         69          0 |     5,908 
       AUS |         1         21      1,602     10,116      2,734          7          0 |    14,481 
       AUT |         8        139      2,112      2,493          3          0          0 |     4,755 
       BEL |        60        500      2,463      5,368         90          2          0 |     8,483 
       BGR |        35        186      4,815        245          1          0          0 |     5,282 
       BRA |         0      1,663      2,711      6,740      7,360        730          0 |    19,204 
       CAN |        11        161      2,627     18,499        241          5          0 |    21,544 
       CHE |        47      1,523      8,281      1,361         17          0          0 |    11,229 
       CHL |        42        170      1,454      4,773        417          0          0 |     6,856 
       COL |       404      1,035      1,892      3,902      1,840          0          0 |     9,073 
       CRI |       277        563      1,952      1,799         11          0          0 |     4,602 
       CZE |        17        163      2,761      2,386          0          0          0 |     5,327 
       DEU |        32        497      2,606      1,829         37          0          0 |     5,001 
       DNK |        23      1,385      6,000         73          0          0          0 |     7,481 
       ESP |        16      2,090      5,451     17,744         12          0          0 |    25,313 
       EST |        23      1,016      3,664         76          0          0          0 |     4,779 
       FIN |       122      1,437      7,260          0         10          0          0 |     8,829 
       FRA |         2         84      1,254      3,117        150          6          0 |     4,613 
       GBR |         0          0          2        166     10,330      2,160          1 |    12,659 
       GRC |        12         38        134      4,941          0          0          0 |     5,125 
       HKG |        51        300      1,205      3,088         26          0          0 |     4,670 
       HRV |         0          0      4,012        996          0          0          0 |     5,008 
       HUN |        58        195      3,463      1,094          0          0          0 |     4,810 
       IDN |       100        437      2,254      2,597        215         19          0 |     5,622 
       IRL |         3         92      3,125      1,177        619          0          0 |     5,016 
       ISL |         0          0          0      3,508          0          0          0 |     3,508 
       ISR |         2         11        830      4,180         32          0          0 |     5,055 
       ITA |        82        432      4,663     25,313        582          1          0 |    31,073 
       JOR |         6         62        364      6,606          0          0          0 |     7,038 
       JPN |         0          0          0      6,351          0          0          0 |     6,351 
       KAZ |        12        274      3,849      1,654         14          5          0 |     5,808 
       KOR |         0          0        295      4,728         10          0          0 |     5,033 
       LIE |        11         41        195         46          0          0          0 |       293 
       LTU |         7        278      3,761        525          2          0          0 |     4,573 
       LUX |        36        534      2,665      1,997         26          0          0 |     5,258 
       LVA |        59        542      3,558        134          1          0          0 |     4,294 
       MAC |       284        872      1,770      2,385         23          1          0 |     5,335 
       MEX |       239      1,295      7,230     24,091        914         37          0 |    33,806 
       MNE |         0          2      3,793        949          0          0          0 |     4,744 
       MYS |         0          3        177      5,016          1          0          0 |     5,197 
       NLD |         0        157      2,191      2,090         22          0          0 |     4,460 
       NOR |         0          0         20      4,664          2          0          0 |     4,686 
       NZL |         0          0          5        261      3,790        233          2 |     4,291 
       PER |       150        466      1,056      2,907      1,456          0          0 |     6,035 
       POL |        20        158      4,416         13          0          0          0 |     4,607 
       PRT |       136        458      1,617      2,986         12          0          0 |     5,209 
       QAT |        97        345      1,506      7,106      1,879         33          0 |    10,966 
       ROU |         8        231      4,571        264          0          0          0 |     5,074 
       RUS |        26        415      3,831        953          6          0          0 |     5,231 
       SGP |        20        117        447      4,958          4          0          0 |     5,546 
       SRB |         2         24      4,577         81          0          0          0 |     4,684 
       SVK |        73        183      1,671      2,668         83          0          0 |     4,678 
       SVN |         0          4         59      5,650        198          0          0 |     5,911 
       SWE |         1        159      4,496         80          0          0          0 |     4,736 
       THA |         6         26      1,423      4,937        214          0          0 |     6,606 
       TUN |       226        516        895      2,506        264          0          0 |     4,407 
       TUR |        21         99      1,317      3,202        194         15          0 |     4,848 
       TWN |         0          6      1,989      4,051          0          0          0 |     6,046 
       URY |       313        642      1,241      3,051         68          0          0 |     5,315 
       USA |         0          6        538      3,633        794          7          0 |     4,978 
       VNM |        18        111        356      4,285          0          0          0 |     4,770 
-----------+-----------------------------------------------------------------------------+----------
     Total |     3,472     23,263    148,826    256,102     37,267      3,430          3 |   472,363 

. 
. tab countrycode idgrade if national_level==0

WB country |
   code (3 |                             Grade ID
  letters) |         7          8          9         10         11         12 |     Total
-----------+------------------------------------------------------------------+----------
       CHN |        54        251      2,061      2,778         29          4 |     5,177 
       ESP |        10        248      1,418         84          1          0 |     1,761 
-----------+------------------------------------------------------------------+----------
     Total |        64        499      3,479      2,862         30          4 |     6,938 

~~~~

**Harmonization** of proficiency (done on-the-fly):

~~~~

      sdg411_read_01 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
      Non-proficient |    125,563       26.20       26.20
          Proficient |    353,738       73.80      100.00
---------------------+-----------------------------------
               Total |    479,301      100.00

         bmp_read_01 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
          Proficient |    353,738       73.80       73.80
      Non-proficient |    125,563       26.20      100.00
---------------------+-----------------------------------
               Total |    479,301      100.00

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
fgt1_read_01 |    125,563    .1619934    .1346218   .0000491   .9997953

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
fgt2_read_01 |    125,563    .0443648    .0728533   2.41e-09   .9995907

      sdg411_read_02 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
      Non-proficient |    125,970       26.28       26.28
          Proficient |    353,331       73.72      100.00
---------------------+-----------------------------------
               Total |    479,301      100.00

         bmp_read_02 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
          Proficient |    353,331       73.72       73.72
      Non-proficient |    125,970       26.28      100.00
---------------------+-----------------------------------
               Total |    479,301      100.00

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
fgt1_read_02 |    125,970    .1618037    .1344598   .0000491   .9982735

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
fgt2_read_02 |    125,970    .0442597    .0725451   2.41e-09     .99655

      sdg411_read_03 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
      Non-proficient |    125,758       26.24       26.24
          Proficient |    353,543       73.76      100.00
---------------------+-----------------------------------
               Total |    479,301      100.00

         bmp_read_03 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
          Proficient |    353,543       73.76       73.76
      Non-proficient |    125,758       26.24      100.00
---------------------+-----------------------------------
               Total |    479,301      100.00

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
fgt1_read_03 |    125,758    .1622231    .1347751   .0000491   .9982735

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
fgt2_read_03 |    125,758    .0444805    .0730084   2.41e-09     .99655

      sdg411_read_04 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
      Non-proficient |    126,134       26.32       26.32
          Proficient |    353,167       73.68      100.00
---------------------+-----------------------------------
               Total |    479,301      100.00

         bmp_read_04 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
          Proficient |    353,167       73.68       73.68
      Non-proficient |    126,134       26.32      100.00
---------------------+-----------------------------------
               Total |    479,301      100.00

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
fgt1_read_04 |    126,134    .1618679    .1345921   .0000491   .9898535

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
fgt2_read_04 |    126,134    .0443161     .072921   2.41e-09   .9798099

      sdg411_read_05 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
      Non-proficient |    126,015       26.29       26.29
          Proficient |    353,286       73.71      100.00
---------------------+-----------------------------------
               Total |    479,301      100.00

         bmp_read_05 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
          Proficient |    353,286       73.71       73.71
      Non-proficient |    126,015       26.29      100.00
---------------------+-----------------------------------
               Total |    479,301      100.00

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
fgt1_read_05 |    126,015    .1618821    .1346357   .0000491   .9943373

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
fgt2_read_05 |    126,015    .0443324    .0728638   2.41e-09   .9887066



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
