Documentation of GLAD dataset
=====================================================================


[back to list of assessments](https://github.com/worldbank/GLAD/blob/master/README.md#harmonization)

This dataset is part of the Global Learning Assessment Database (GLAD). It contains microdata from TIMSS 2007. Each observation corresponds to one learner (student or pupil), and the variables have been harmonized.

**Metadata** stored in this dataset:

~~~~
region:      WLD
year:        2007
assessment:  TIMSS
master:      v01_M
adaptation:  wrk_A_GLAD
module:      ALL
ttl_info:    Joao Pedro de Azevedo [eduanalytics@worldbank.org]
dofile_info: last modified by Ahmed Raza in January 29, 2021
lastsave:    9 Feb 2022 16:36:41 by wb549384
~~~~


About the **108 variables** in this dataset:

~~~~
The variables belong to the following variable classifications:
    idvars keyvars valuevars traitvars samplevars

idvars:     idcntry_raw idschool idgrade idclass idlearner
keyvars:    surveyid countrycode national_level
valuevars:  score_timss_math_01 score_timss_scie_01 score_timss_math_02 score_timss_scie_02 score_timss_math_03 score_timss_scie_03 score_timss_math_04 score_timss_scie_04 score_timss_math_05 score_timss_scie_05 level_timss_math_01 level_timss_scie_01 level_timss_math_02 level_timss_scie_02 level_timss_math_03 level_timss_scie_03 level_timss_math_04 level_timss_scie_04 level_timss_math_05 level_timss_scie_05
traitvars:  age urban urban_o male escs qescs has_qescs
samplevars: learner_weight jkzone jkrep


Variable         Obs Unique      Mean        Min       Max  Label
--------------------------------------------------------------------------------------------------------------------
idcntry_raw   433785     67  1343.876         12     12700  Country ID, as coded in rawdata
idschool      433785   1688  319.7172          1      5192  School ID
idgrade       433785      3  6.280203          4         9  Grade ID
idclass       433785   5586   31974.4        101    519202  Class ID
idlearner     433785 135175   3197455      10101  5.19e+07  Learner ID
surveyid      433785      1         .          .         .  Survey ID (Region_Year_Assessment)
countrycode   433785     61         .          .         .  WB country code (3 letters)
national_l~l  433785      2     .8819          0         1  Idcntry_raw is a national level
score_t~h_01  433785  57729  463.8155          5    898.42  Plausible value 01: TIMSS score for math
score_t~e_01  432845  57869   474.171          5     979.5  Plausible value 01: TIMSS score for science
score_t~h_02  433785  57933  463.8907          5     918.6  Plausible value 02: TIMSS score for math
score_t~e_02  432845  57977  473.4773          5       995  Plausible value 02: TIMSS score for science
score_t~h_03  433785  57976  463.9655          5    904.31  Plausible value 03: TIMSS score for math
score_t~e_03  432845  57932  473.6868          5       995  Plausible value 03: TIMSS score for science
score_t~h_04  433785  58009  463.5464          5    939.95  Plausible value 04: TIMSS score for math
score_t~e_04  432845  57940  473.1772          5    955.53  Plausible value 04: TIMSS score for science
score_t~h_05  433785  57822  464.3186          5    939.03  Plausible value 05: TIMSS score for math
score_t~e_05  432845  57725  474.5186          5    942.87  Plausible value 05: TIMSS score for science
level_t~h_01  433785      5  2.522307          1         5  Plausible value 01: TIMSS level for math
level_t~e_01  432845      5  2.651025          1         5  Plausible value 01: TIMSS level for science
level_t~h_02  433785      5  2.524218          1         5  Plausible value 02: TIMSS level for math
level_t~e_02  432845      5  2.644127          1         5  Plausible value 02: TIMSS level for science
level_t~h_03  433785      5  2.526049          1         5  Plausible value 03: TIMSS level for math
level_t~e_03  432845      5   2.64628          1         5  Plausible value 03: TIMSS level for science
level_t~h_04  433785      5   2.52151          1         5  Plausible value 04: TIMSS level for math
level_t~e_04  432845      5  2.640791          1         5  Plausible value 04: TIMSS level for science
level_t~h_05  433785      5  2.527326          1         5  Plausible value 05: TIMSS level for math
level_t~e_05  432845      5  2.654414          1         5  Plausible value 05: TIMSS level for science
age           432622     14  12.13375          6        19  Learner age at time of assessment
urban         410413      2  .8919844          0         1  School is located in urban/rural area
urban_o       421040      7         .          .         .  Original variable of urban: population size of the sc...
male          433785      2  .5009348          0         1  Learner gender is male/female
escs          235721  29210  .2021731  -3.124273  2.240808  
qescs         235721      5  3.056079          1         5  Quintiles of Socio-Economic Status
has_qescs     433785      2  .5434051          0         1  Dummy variable for observations with a valid QESCS
learner_we~t  433785  19100  82.42143          1  2077.113  Total learner weight
jkzone        433785     75  34.93851          1        75  Jackknife zone
jkrep         433785      2  .4995816          0         1  Jackknife replicate code
--------------------------------------------------------------------------------------------------------------------


Plus the variables merged-on-the-fly, which are:

traitvars:  lp01_threshold_var lp02_threshold_var lp03_threshold_var lp04_threshold_var lp05_threshold_var lp06_threshold_var lp07_threshold_var lp08_threshold_var lp09_threshold_var lp10_threshold_var lp01_threshold_val lp02_threshold_val lp03_threshold_val lp04_threshold_val lp05_threshold_val lp06_threshold_val lp07_threshold_val lp08_threshold_val lp09_threshold_val lp10_threshold_val lp01_threshold_res lp02_threshold_res lp03_threshold_res lp04_threshold_res lp05_threshold_res lp06_threshold_res lp07_threshold_res lp08_threshold_res lp09_threshold_res lp10_threshold_res
valuevars:  sdg411_scie_01 bmp_scie_01 fgt1_scie_01 fgt2_scie_01 sdg411_scie_02 bmp_scie_02 fgt1_scie_02 fgt2_scie_02 sdg411_scie_03 bmp_scie_03 fgt1_scie_03 fgt2_scie_03 sdg411_scie_04 bmp_scie_04 fgt1_scie_04 fgt2_scie_04 sdg411_scie_05 bmp_scie_05 fgt1_scie_05 fgt2_scie_05 sdg411_math_01 bmp_math_01 fgt1_math_01 fgt2_math_01 sdg411_math_02 bmp_math_02 fgt1_math_02 fgt2_math_02 sdg411_math_03 bmp_math_03 fgt1_math_03 fgt2_math_03 sdg411_math_04 bmp_math_04 fgt1_math_04 fgt2_math_04 sdg411_math_05 bmp_math_05 fgt1_math_05 fgt2_math_05
~~~~

About the **433,785 observations** in this dataset:

~~~~
. tab countrycode idgrade if national_level==1

WB country |
   code (3 |             Grade ID
  letters) |         4          8          9 |     Total
-----------+---------------------------------+----------
       ARM |     4,079      4,689          0 |     8,768 
       AUS |     4,108      4,069          0 |     8,177 
       AUT |     4,859          0          0 |     4,859 
       BGR |         0      4,019          0 |     4,019 
       BHR |         0      4,230          0 |     4,230 
       BIH |         0      4,220          0 |     4,220 
       BWA |         0      4,208          0 |     4,208 
       COL |     4,801      4,873          0 |     9,674 
       CYP |         0      4,399          0 |     4,399 
       CZE |     4,235      4,845          0 |     9,080 
       DEU |     5,200          0          0 |     5,200 
       DNK |     3,519          0          0 |     3,519 
       DZA |     4,223      5,447          0 |     9,670 
       EGY |         0      6,582          0 |     6,582 
       GBR |     8,245      8,095          0 |    16,340 
       GEO |     4,108      4,178          0 |     8,286 
       GHA |         0      5,294          0 |     5,294 
       HKG |     3,791      3,470          0 |     7,261 
       HUN |     4,048      4,111          0 |     8,159 
       IDN |         0      4,203          0 |     4,203 
       IRN |     3,833      3,981          0 |     7,814 
       ISR |         0      3,294          0 |     3,294 
       ITA |     4,470      4,408          0 |     8,878 
       JOR |         0      5,251          0 |     5,251 
       JPN |     4,487      4,312          0 |     8,799 
       KAZ |     3,990          0          0 |     3,990 
       KOR |         0      4,240          0 |     4,240 
       KWT |     3,803      4,091          0 |     7,894 
       LBN |         0      3,786          0 |     3,786 
       LTU |     3,980      3,991          0 |     7,971 
       LVA |     3,908          0          0 |     3,908 
       MAR |     3,894      3,060          0 |     6,954 
       MLT |         0          0      4,670 |     4,670 
       MNG |     4,523      4,499          0 |     9,022 
       MYS |         0      4,466          0 |     4,466 
       NLD |     3,349          0          0 |     3,349 
       NOR |     4,108      4,627          0 |     8,735 
       NZL |     4,940          0          0 |     4,940 
       OMN |         0      4,752          0 |     4,752 
       PSE |         0      4,378          0 |     4,378 
       QAT |     7,019      7,184          0 |    14,203 
       ROU |         0      4,198          0 |     4,198 
       RUS |     4,464      4,472          0 |     8,936 
       SAU |         0      4,243          0 |     4,243 
       SGP |     5,041      4,599          0 |     9,640 
       SLV |     4,166      4,063          0 |     8,229 
       SRB |         0      4,045          0 |     4,045 
       SVK |     4,963          0          0 |     4,963 
       SVN |     4,351      4,043          0 |     8,394 
       SWE |     4,676      5,215          0 |     9,891 
       SYR |         0      4,650          0 |     4,650 
       THA |         0      5,412          0 |     5,412 
       TUN |     4,134      4,080          0 |     8,214 
       TUR |         0      4,498          0 |     4,498 
       UKR |     4,292      4,424          0 |     8,716 
       USA |     7,896      7,377          0 |    15,273 
       YEM |     5,811          0          0 |     5,811 
-----------+---------------------------------+----------
     Total |   161,314    216,571      4,670 |   382,555 

. 
. tab countrycode idgrade if national_level==0

WB country |
   code (3 |       Grade ID
  letters) |         4          8 |     Total
-----------+----------------------+----------
       ARE |     3,064      3,195 |     6,259 
       CAN |    15,571     11,660 |    27,231 
       ESP |         0      2,296 |     2,296 
       TWN |     4,131      4,046 |     8,177 
       USA |     3,593      3,674 |     7,267 
-----------+----------------------+----------
     Total |    26,359     24,871 |    51,230 

~~~~

**Harmonization** of proficiency (done on-the-fly):

~~~~

      sdg411_scie_01 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
      Non-proficient |    161,229       37.17       37.17
          Proficient |    271,616       62.62       99.78
 Missing score/level |        940        0.22      100.00
---------------------+-----------------------------------
               Total |    433,785      100.00

         bmp_scie_01 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
          Proficient |    271,616       62.62       62.62
      Non-proficient |    161,229       37.17       99.78
Non-harmonized grade |        940        0.22      100.00
---------------------+-----------------------------------
               Total |    433,785      100.00

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
fgt1_scie_01 |    161,229    .2117976    .1860104   .0000211   .9894737

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
fgt2_scie_01 |    161,229    .0794579    .1399222   4.43e-10   .9790582

      sdg411_scie_02 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
      Non-proficient |    161,628       37.26       37.26
          Proficient |    271,217       62.52       99.78
 Missing score/level |        940        0.22      100.00
---------------------+-----------------------------------
               Total |    433,785      100.00

         bmp_scie_02 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
          Proficient |    271,217       62.52       62.52
      Non-proficient |    161,628       37.26       99.78
Non-harmonized grade |        940        0.22      100.00
---------------------+-----------------------------------
               Total |    433,785      100.00

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
fgt1_scie_02 |    161,628    .2122544    .1871616   .0000211   .9894737

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
fgt2_scie_02 |    161,628    .0800812    .1423297   4.43e-10   .9790582

      sdg411_scie_03 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
      Non-proficient |    161,671       37.27       37.27
          Proficient |    271,174       62.51       99.78
 Missing score/level |        940        0.22      100.00
---------------------+-----------------------------------
               Total |    433,785      100.00

         bmp_scie_03 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
          Proficient |    271,174       62.51       62.51
      Non-proficient |    161,671       37.27       99.78
Non-harmonized grade |        940        0.22      100.00
---------------------+-----------------------------------
               Total |    433,785      100.00

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
fgt1_scie_03 |    161,671    .2116482    .1868946   .0000211   .9894737

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
fgt2_scie_03 |    161,671    .0797244    .1418227   4.43e-10   .9790582

      sdg411_scie_04 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
      Non-proficient |    162,389       37.44       37.44
          Proficient |    270,456       62.35       99.78
 Missing score/level |        940        0.22      100.00
---------------------+-----------------------------------
               Total |    433,785      100.00

         bmp_scie_04 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
          Proficient |    270,456       62.35       62.35
      Non-proficient |    162,389       37.44       99.78
Non-harmonized grade |        940        0.22      100.00
---------------------+-----------------------------------
               Total |    433,785      100.00

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
fgt1_scie_04 |    162,389    .2127931    .1869565   .0000211   .9894737

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
fgt2_scie_04 |    162,389    .0802334    .1412743   4.43e-10   .9790582

      sdg411_scie_05 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
      Non-proficient |    160,679       37.04       37.04
          Proficient |    272,166       62.74       99.78
 Missing score/level |        940        0.22      100.00
---------------------+-----------------------------------
               Total |    433,785      100.00

         bmp_scie_05 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
          Proficient |    272,166       62.74       62.74
      Non-proficient |    160,679       37.04       99.78
Non-harmonized grade |        940        0.22      100.00
---------------------+-----------------------------------
               Total |    433,785      100.00

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
fgt1_scie_05 |    160,679    .2108176    .1858575   .0000211   .9894737

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
fgt2_scie_05 |    160,679    .0789868    .1400533   4.43e-10   .9790582

      sdg411_math_01 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
      Non-proficient |    180,654       41.65       41.65
          Proficient |    253,131       58.35      100.00
---------------------+-----------------------------------
               Total |    433,785      100.00

         bmp_math_01 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
          Proficient |    253,131       58.35       58.35
      Non-proficient |    180,654       41.65      100.00
---------------------+-----------------------------------
               Total |    433,785      100.00

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
fgt1_math_01 |    180,654    .2161929    .1666135   .0000211   .9894737

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
fgt2_math_01 |    180,654    .0744993    .1088059   4.43e-10   .9790582

      sdg411_math_02 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
      Non-proficient |    180,652       41.65       41.65
          Proficient |    253,133       58.35      100.00
---------------------+-----------------------------------
               Total |    433,785      100.00

         bmp_math_02 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
          Proficient |    253,133       58.35       58.35
      Non-proficient |    180,652       41.65      100.00
---------------------+-----------------------------------
               Total |    433,785      100.00

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
fgt1_math_02 |    180,652    .2171326    .1678252   .0000211   .9894737

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
fgt2_math_02 |    180,652    .0753117    .1105102   4.43e-10   .9790582

      sdg411_math_03 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
      Non-proficient |    180,024       41.50       41.50
          Proficient |    253,761       58.50      100.00
---------------------+-----------------------------------
               Total |    433,785      100.00

         bmp_math_03 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
          Proficient |    253,761       58.50       58.50
      Non-proficient |    180,024       41.50      100.00
---------------------+-----------------------------------
               Total |    433,785      100.00

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
fgt1_math_03 |    180,024    .2182352    .1673537   .0000211   .9894737

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
fgt2_math_03 |    180,024    .0756337    .1094664   4.43e-10   .9790582

      sdg411_math_04 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
      Non-proficient |    181,168       41.76       41.76
          Proficient |    252,617       58.24      100.00
---------------------+-----------------------------------
               Total |    433,785      100.00

         bmp_math_04 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
          Proficient |    252,617       58.24       58.24
      Non-proficient |    181,168       41.76      100.00
---------------------+-----------------------------------
               Total |    433,785      100.00

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
fgt1_math_04 |    181,168    .2178805    .1677217   .0000211   .9894737

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
fgt2_math_04 |    181,168    .0756023    .1097929   4.43e-10   .9790582

      sdg411_math_05 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
      Non-proficient |    179,912       41.47       41.47
          Proficient |    253,873       58.53      100.00
---------------------+-----------------------------------
               Total |    433,785      100.00

         bmp_math_05 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
          Proficient |    253,873       58.53       58.53
      Non-proficient |    179,912       41.47      100.00
---------------------+-----------------------------------
               Total |    433,785      100.00

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
fgt1_math_05 |    179,912     .216168    .1669285   .0000211   .9894737

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
fgt2_math_05 |    179,912    .0745936     .108995   4.43e-10   .9790582



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
 11. |       8     lp01   scie_01 = (score_timss_scie_01 >= 475) |
 12. |       8     lp02   scie_02 = (score_timss_scie_02 >= 475) |
 13. |       8     lp03   scie_03 = (score_timss_scie_03 >= 475) |
 14. |       8     lp04   scie_04 = (score_timss_scie_04 >= 475) |
 15. |       8     lp05   scie_05 = (score_timss_scie_05 >= 475) |
     |-----------------------------------------------------------|
 16. |       8     lp06   math_01 = (score_timss_math_01 >= 475) |
 17. |       8     lp07   math_02 = (score_timss_math_02 >= 475) |
 18. |       8     lp08   math_03 = (score_timss_math_03 >= 475) |
 19. |       8     lp09   math_04 = (score_timss_math_04 >= 475) |
 20. |       8     lp10   math_05 = (score_timss_math_05 >= 475) |
     |-----------------------------------------------------------|
 21. |       9     lp01   scie_01 = (score_timss_scie_01 >= 475) |
 22. |       9     lp02   scie_02 = (score_timss_scie_02 >= 475) |
 23. |       9     lp03   scie_03 = (score_timss_scie_03 >= 475) |
 24. |       9     lp04   scie_04 = (score_timss_scie_04 >= 475) |
 25. |       9     lp05   scie_05 = (score_timss_scie_05 >= 475) |
     |-----------------------------------------------------------|
 26. |       9     lp06   math_01 = (score_timss_math_01 >= 475) |
 27. |       9     lp07   math_02 = (score_timss_math_02 >= 475) |
 28. |       9     lp08   math_03 = (score_timss_math_03 >= 475) |
 29. |       9     lp09   math_04 = (score_timss_math_04 >= 475) |
 30. |       9     lp10   math_05 = (score_timss_math_05 >= 475) |
     +-----------------------------------------------------------+

~~~~
