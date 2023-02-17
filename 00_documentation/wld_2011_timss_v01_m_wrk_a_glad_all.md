Documentation of GLAD dataset
=====================================================================


[back to list of assessments](https://github.com/worldbank/GLAD/blob/master/README.md#harmonization)

This dataset is part of the Global Learning Assessment Database (GLAD). It contains microdata from TIMSS 2011. Each observation corresponds to one learner (student or pupil), and the variables have been harmonized.

**Metadata** stored in this dataset:

~~~~
region:      WLD
year:        2011
assessment:  TIMSS
master:      v01_M
adaptation:  wrk_A_GLAD
module:      ALL
ttl_info:    Joao Pedro de Azevedo [eduanalytics@worldbank.org]
dofile_info: last modified by Ahmed Raza in January 29, 2021
lastsave:    9 Feb 2022 16:50:48 by wb549384
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
--------------------------------------------------------------------------------------------------------------------
idcntry_raw   584545     69  1228.231         31      9134  Country ID, as coded in rawdata
idschool      584545   1599  285.8582          1      4254  School ID
idgrade       584545      5  6.095748          4         9  Grade ID
idclass       584545   6592  28588.67        101    425402  Class ID
idlearner     584545 178008   2858882      10101  4.25e+07  Learner ID
surveyid      584545      1         .          .         .  Survey ID (Region_Year_Assessment)
countrycode   584545     63         .          .         .  WB country code (3 letters)
national_l~l  584545      2   .901224          0         1  Idcntry_raw is a national level
score_t~h_01  584545 542209  469.1605          5  965.6872  Plausible value 01: TIMSS score for math
score_t~e_01  584545 541157   472.179          5  905.7887  Plausible value 01: TIMSS score for science
score_t~h_02  584545 542017   469.227          5  931.2971  Plausible value 02: TIMSS score for math
score_t~e_02  584545 541503   471.082          5   917.052  Plausible value 02: TIMSS score for science
score_t~h_03  584545 541667  469.4287          5  925.0883  Plausible value 03: TIMSS score for math
score_t~e_03  584545 541568  471.9806          5  863.2424  Plausible value 03: TIMSS score for science
score_t~h_04  584545 542008  468.8999          5  939.4118  Plausible value 04: TIMSS score for math
score_t~e_04  584545 541298  470.7925          5  873.1356  Plausible value 04: TIMSS score for science
score_t~h_05  584545 541860  469.0873          5  958.9602  Plausible value 05: TIMSS score for math
score_t~e_05  584545 541422  472.3404          5  851.9157  Plausible value 05: TIMSS score for science
level_t~h_01  584545      5  2.562164          1         5  Plausible value 01: TIMSS level for math
level_t~e_01  584545      5  2.637222          1         5  Plausible value 01: TIMSS level for science
level_t~h_02  584545      5   2.56604          1         5  Plausible value 02: TIMSS level for math
level_t~e_02  584545      5   2.62732          1         5  Plausible value 02: TIMSS level for science
level_t~h_03  584545      5  2.566244          1         5  Plausible value 03: TIMSS level for math
level_t~e_03  584545      5  2.634565          1         5  Plausible value 03: TIMSS level for science
level_t~h_04  584545      5  2.562037          1         5  Plausible value 04: TIMSS level for math
level_t~e_04  584545      5  2.625028          1         5  Plausible value 04: TIMSS level for science
level_t~h_05  584545      5    2.5635          1         5  Plausible value 05: TIMSS level for math
level_t~e_05  584545      5  2.639024          1         5  Plausible value 05: TIMSS level for science
age           583180     14  11.86868          6        19  Learner age at time of assessment
urban         550334      2  .8736476          0         1  School is located in urban/rural area
urban_o1      564581      7         .          .         .  Original variable of urban: population size of the sc...
urban_o2      560889      6         .          .         .  Original variable of urban: school is located in urba...
male          584545      2  .5034582          0         1  Learner gender is male/female
escs          476439  96403  .0167529  -3.453706  1.879487  
qescs         476439      5  3.054731          1         5  Quintiles of Socio-Economic Status
has_qescs     584545      2  .8150596          0         1  Dummy variable for observations with a valid QESCS
learner_we~t  584545  19278  64.83228   .3408881  3467.077  Total learner weight
jkzone        584545     75  35.55715          1        75  Jackknife zone
jkrep         584545      2   .498675          0         1  Jackknife replicate code
--------------------------------------------------------------------------------------------------------------------


Plus the variables merged-on-the-fly, which are:

traitvars:  lp01_threshold_var lp02_threshold_var lp03_threshold_var lp04_threshold_var lp05_threshold_var lp06_threshold_var lp07_threshold_var lp08_threshold_var lp09_threshold_var lp10_threshold_var lp01_threshold_val lp02_threshold_val lp03_threshold_val lp04_threshold_val lp05_threshold_val lp06_threshold_val lp07_threshold_val lp08_threshold_val lp09_threshold_val lp10_threshold_val lp01_threshold_res lp02_threshold_res lp03_threshold_res lp04_threshold_res lp05_threshold_res lp06_threshold_res lp07_threshold_res lp08_threshold_res lp09_threshold_res lp10_threshold_res
valuevars:  sdg411_scie_01 bmp_scie_01 fgt1_scie_01 fgt2_scie_01 sdg411_scie_02 bmp_scie_02 fgt1_scie_02 fgt2_scie_02 sdg411_scie_03 bmp_scie_03 fgt1_scie_03 fgt2_scie_03 sdg411_scie_04 bmp_scie_04 fgt1_scie_04 fgt2_scie_04 sdg411_scie_05 bmp_scie_05 fgt1_scie_05 fgt2_scie_05 sdg411_math_01 bmp_math_01 fgt1_math_01 fgt2_math_01 sdg411_math_02 bmp_math_02 fgt1_math_02 fgt2_math_02 sdg411_math_03 bmp_math_03 fgt1_math_03 fgt2_math_03 sdg411_math_04 bmp_math_04 fgt1_math_04 fgt2_math_04 sdg411_math_05 bmp_math_05 fgt1_math_05 fgt2_math_05
~~~~

About the **584,545 observations** in this dataset:

~~~~
. tab countrycode idgrade if national_level==1

WB country |
   code (3 |                        Grade ID
  letters) |         4          5          6          8          9 |     Total
-----------+-------------------------------------------------------+----------
       ARE |    14,720          0          0     14,089          0 |    28,809 
       ARM |     5,146          0          0          0      5,846 |    10,992 
       AUS |     6,146          0          0      7,556          0 |    13,702 
       AUT |     4,668          0          0          0          0 |     4,668 
       AZE |     4,882          0          0          0          0 |     4,882 
       BEL |     4,849          0          0          0          0 |     4,849 
       BHR |     4,083          0          0      4,640          0 |     8,723 
       BWA |         0          0      4,198          0      5,400 |     9,598 
       CHL |     5,585          0          0      5,835          0 |    11,420 
       CZE |     4,578          0          0          0          0 |     4,578 
       DEU |     3,995          0          0          0          0 |     3,995 
       DNK |     3,987          0          0          0          0 |     3,987 
       ESP |     4,183          0          0          0          0 |     4,183 
       FIN |     4,638          0          0      4,266          0 |     8,904 
       GBR |     3,571      3,397          0          0      3,842 |    10,810 
       GEO |     4,799          0          0      4,563          0 |     9,362 
       GHA |         0          0          0      7,323          0 |     7,323 
       HKG |     3,957          0          0      4,015          0 |     7,972 
       HND |         0          0      3,919          0      4,418 |     8,337 
       HRV |     4,584          0          0          0          0 |     4,584 
       HUN |     5,204          0          0      5,178          0 |    10,382 
       IDN |         0          0          0      5,795          0 |     5,795 
       IRL |     4,560          0          0          0          0 |     4,560 
       IRN |     5,760          0          0      6,029          0 |    11,789 
       ISR |         0          0          0      4,699          0 |     4,699 
       ITA |     4,200          0          0      3,979          0 |     8,179 
       JOR |         0          0          0      7,694          0 |     7,694 
       JPN |     4,411          0          0      4,414          0 |     8,825 
       KAZ |     4,382          0          0      4,390          0 |     8,772 
       KOR |     4,334          0          0      5,166          0 |     9,500 
       KWT |     4,142          0          0          0          0 |     4,142 
       LBN |         0          0          0      3,974          0 |     3,974 
       LTU |     4,688          0          0      4,747          0 |     9,435 
       MAR |     7,841          0          0      8,986          0 |    16,827 
       MKD |         0          0          0      4,062          0 |     4,062 
       MLT |         0      3,607          0          0          0 |     3,607 
       MYS |         0          0          0      5,733          0 |     5,733 
       NLD |     3,229          0          0          0          0 |     3,229 
       NOR |     3,121          0          0      3,862          0 |     6,983 
       NZL |         0      5,572          0          0      5,336 |    10,908 
       OMN |    10,411          0          0      9,542          0 |    19,953 
       POL |     5,027          0          0          0          0 |     5,027 
       PRT |     4,042          0          0          0          0 |     4,042 
       PSE |         0          0          0      7,812          0 |     7,812 
       QAT |     4,117          0          0      4,422          0 |     8,539 
       ROU |     4,673          0          0      5,523          0 |    10,196 
       RUS |     4,467          0          0      4,893          0 |     9,360 
       SAU |     4,515          0          0      4,344          0 |     8,859 
       SGP |     6,368          0          0      5,927          0 |    12,295 
       SRB |     4,379          0          0          0          0 |     4,379 
       SVK |     5,616          0          0          0          0 |     5,616 
       SVN |     4,492          0          0      4,415          0 |     8,907 
       SWE |     4,663          0          0      5,573          0 |    10,236 
       SYR |         0          0          0      4,413          0 |     4,413 
       THA |     4,448          0          0      6,124          0 |    10,572 
       TUN |     4,912          0          0      5,128          0 |    10,040 
       TUR |     7,479          0          0      6,928          0 |    14,407 
       UKR |         0          0          0      3,378          0 |     3,378 
       USA |    12,569          0          0     10,477          0 |    23,046 
       YEM |     8,058          0      4,929          0          0 |    12,987 
       ZAF |         0          0          0          0     11,969 |    11,969 
-----------+-------------------------------------------------------+----------
     Total |   244,479     12,576     13,046    219,894     36,811 |   526,806 

. 
. tab countrycode idgrade if national_level==0

WB country |
   code (3 |       Grade ID
  letters) |         4          8 |     Total
-----------+----------------------+----------
       ARE |    10,315      9,944 |    20,259 
       CAN |    12,450     15,704 |    28,154 
       TWN |     4,284      5,042 |     9,326 
-----------+----------------------+----------
     Total |    27,049     30,690 |    57,739 

~~~~

**Harmonization** of proficiency (done on-the-fly):

~~~~

      sdg411_scie_01 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
      Non-proficient |    207,258       35.46       35.46
          Proficient |    377,287       64.54      100.00
---------------------+-----------------------------------
               Total |    584,545      100.00

         bmp_scie_01 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
          Proficient |    377,287       64.54       64.54
      Non-proficient |    207,258       35.46      100.00
---------------------+-----------------------------------
               Total |    584,545      100.00

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
fgt1_scie_01 |    207,258    .2215698    .1834384   1.52e-06   .9894737

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
fgt2_scie_01 |    207,258    .0827427    .1303197   2.30e-12   .9790582

      sdg411_scie_02 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
      Non-proficient |    208,733       35.71       35.71
          Proficient |    375,812       64.29      100.00
---------------------+-----------------------------------
               Total |    584,545      100.00

         bmp_scie_02 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
          Proficient |    375,812       64.29       64.29
      Non-proficient |    208,733       35.71      100.00
---------------------+-----------------------------------
               Total |    584,545      100.00

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
fgt1_scie_02 |    208,733    .2228072    .1852539   3.79e-07   .9894737

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
fgt2_scie_02 |    208,733    .0839619    .1328595   1.44e-13   .9790582

      sdg411_scie_03 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
      Non-proficient |    207,353       35.47       35.47
          Proficient |    377,192       64.53      100.00
---------------------+-----------------------------------
               Total |    584,545      100.00

         bmp_scie_03 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
          Proficient |    377,192       64.53       64.53
      Non-proficient |    207,353       35.47      100.00
---------------------+-----------------------------------
               Total |    584,545      100.00

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
fgt1_scie_03 |    207,353    .2208352    .1837876   1.26e-07   .9894737

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
fgt2_scie_03 |    207,353    .0825459    .1307622   1.60e-14   .9790582

      sdg411_scie_04 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
      Non-proficient |    209,081       35.77       35.77
          Proficient |    375,464       64.23      100.00
---------------------+-----------------------------------
               Total |    584,545      100.00

         bmp_scie_04 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
          Proficient |    375,464       64.23       64.23
      Non-proficient |    209,081       35.77      100.00
---------------------+-----------------------------------
               Total |    584,545      100.00

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
fgt1_scie_04 |    209,081    .2238698     .186057   3.35e-06   .9894737

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
fgt2_scie_04 |    209,081    .0847347     .133985   1.12e-11   .9790582

      sdg411_scie_05 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
      Non-proficient |    206,707       35.36       35.36
          Proficient |    377,838       64.64      100.00
---------------------+-----------------------------------
               Total |    584,545      100.00

         bmp_scie_05 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
          Proficient |    377,838       64.64       64.64
      Non-proficient |    206,707       35.36      100.00
---------------------+-----------------------------------
               Total |    584,545      100.00

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
fgt1_scie_05 |    206,707     .221509    .1832123   3.25e-07   .9894737

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
fgt2_scie_05 |    206,707    .0826328    .1297045   1.06e-13   .9790582

      sdg411_math_01 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
      Non-proficient |    223,164       38.18       38.18
          Proficient |    361,381       61.82      100.00
---------------------+-----------------------------------
               Total |    584,545      100.00

         bmp_math_01 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
          Proficient |    361,381       61.82       61.82
      Non-proficient |    223,164       38.18      100.00
---------------------+-----------------------------------
               Total |    584,545      100.00

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
fgt1_math_01 |    223,164    .2056361    .1565859   1.31e-06      .9875

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
fgt2_math_01 |    223,164    .0668052      .09547   1.70e-12   .9751562

      sdg411_math_02 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
      Non-proficient |    222,856       38.12       38.12
          Proficient |    361,689       61.88      100.00
---------------------+-----------------------------------
               Total |    584,545      100.00

         bmp_math_02 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
          Proficient |    361,689       61.88       61.88
      Non-proficient |    222,856       38.12      100.00
---------------------+-----------------------------------
               Total |    584,545      100.00

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
fgt1_math_02 |    222,856    .2071323    .1573466   3.16e-07   .9894737

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
fgt2_math_02 |    222,856    .0676616    .0960663   9.97e-14   .9790582

      sdg411_math_03 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
      Non-proficient |    221,823       37.95       37.95
          Proficient |    362,722       62.05      100.00
---------------------+-----------------------------------
               Total |    584,545      100.00

         bmp_math_03 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
          Proficient |    362,722       62.05       62.05
      Non-proficient |    221,823       37.95      100.00
---------------------+-----------------------------------
               Total |    584,545      100.00

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
fgt1_math_03 |    221,823     .206846     .157036   1.05e-06   .9894737

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
fgt2_math_03 |    221,823    .0674455    .0952634   1.11e-12   .9790582

      sdg411_math_04 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
      Non-proficient |    223,381       38.21       38.21
          Proficient |    361,164       61.79      100.00
---------------------+-----------------------------------
               Total |    584,545      100.00

         bmp_math_04 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
          Proficient |    361,164       61.79       61.79
      Non-proficient |    223,381       38.21      100.00
---------------------+-----------------------------------
               Total |    584,545      100.00

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
fgt1_math_04 |    223,381    .2076019    .1578754   1.07e-06   .9894737

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
fgt2_math_04 |    223,381    .0680231    .0964792   1.15e-12   .9790582

      sdg411_math_05 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
      Non-proficient |    222,941       38.14       38.14
          Proficient |    361,604       61.86      100.00
---------------------+-----------------------------------
               Total |    584,545      100.00

         bmp_math_05 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
          Proficient |    361,604       61.86       61.86
      Non-proficient |    222,941       38.14      100.00
---------------------+-----------------------------------
               Total |    584,545      100.00

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
fgt1_math_05 |    222,941    .2071964    .1574196   1.68e-07   .9894737

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
fgt2_math_05 |    222,941    .0677112    .0959571   2.84e-14   .9790582



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
 21. |       6     lp01   scie_01 = (score_timss_scie_01 >= 400) |
 22. |       6     lp02   scie_02 = (score_timss_scie_02 >= 400) |
 23. |       6     lp03   scie_03 = (score_timss_scie_03 >= 400) |
 24. |       6     lp04   scie_04 = (score_timss_scie_04 >= 400) |
 25. |       6     lp05   scie_05 = (score_timss_scie_05 >= 400) |
     |-----------------------------------------------------------|
 26. |       6     lp06   math_01 = (score_timss_math_01 >= 400) |
 27. |       6     lp07   math_02 = (score_timss_math_02 >= 400) |
 28. |       6     lp08   math_03 = (score_timss_math_03 >= 400) |
 29. |       6     lp09   math_04 = (score_timss_math_04 >= 400) |
 30. |       6     lp10   math_05 = (score_timss_math_05 >= 400) |
     |-----------------------------------------------------------|
 31. |       8     lp01   scie_01 = (score_timss_scie_01 >= 475) |
 32. |       8     lp02   scie_02 = (score_timss_scie_02 >= 475) |
 33. |       8     lp03   scie_03 = (score_timss_scie_03 >= 475) |
 34. |       8     lp04   scie_04 = (score_timss_scie_04 >= 475) |
 35. |       8     lp05   scie_05 = (score_timss_scie_05 >= 475) |
     |-----------------------------------------------------------|
 36. |       8     lp06   math_01 = (score_timss_math_01 >= 475) |
 37. |       8     lp07   math_02 = (score_timss_math_02 >= 475) |
 38. |       8     lp08   math_03 = (score_timss_math_03 >= 475) |
 39. |       8     lp09   math_04 = (score_timss_math_04 >= 475) |
 40. |       8     lp10   math_05 = (score_timss_math_05 >= 475) |
     |-----------------------------------------------------------|
 41. |       9     lp01   scie_01 = (score_timss_scie_01 >= 475) |
 42. |       9     lp02   scie_02 = (score_timss_scie_02 >= 475) |
 43. |       9     lp03   scie_03 = (score_timss_scie_03 >= 475) |
 44. |       9     lp04   scie_04 = (score_timss_scie_04 >= 475) |
 45. |       9     lp05   scie_05 = (score_timss_scie_05 >= 475) |
     |-----------------------------------------------------------|
 46. |       9     lp06   math_01 = (score_timss_math_01 >= 475) |
 47. |       9     lp07   math_02 = (score_timss_math_02 >= 475) |
 48. |       9     lp08   math_03 = (score_timss_math_03 >= 475) |
 49. |       9     lp09   math_04 = (score_timss_math_04 >= 475) |
 50. |       9     lp10   math_05 = (score_timss_math_05 >= 475) |
     +-----------------------------------------------------------+

~~~~
