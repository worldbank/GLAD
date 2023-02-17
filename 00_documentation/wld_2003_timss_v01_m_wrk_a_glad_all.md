Documentation of GLAD dataset
=====================================================================


[back to list of assessments](https://github.com/worldbank/GLAD/blob/master/README.md#harmonization)

This dataset is part of the Global Learning Assessment Database (GLAD). It contains microdata from TIMSS 2003. Each observation corresponds to one learner (student or pupil), and the variables have been harmonized.

**Metadata** stored in this dataset:

~~~~
region:      WLD
year:        2003
assessment:  TIMSS
master:      v01_M
adaptation:  wrk_A_GLAD
module:      ALL
ttl_info:    Joao Pedro de Azevedo [eduanalytics@worldbank.org]
dofile_info: last modified by Ahmed Raza in January 29, 2021
lastsave:    9 Feb 2022 16:39:19 by wb549384
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
------------------------------------------------------------------------------------------------------
idcntry_raw   365729     52  1078.799         36     11800  Country ID, as coded in rawdata
idschool      365729   1941  502.9742          1      9900  School ID
idgrade       365729      2  6.601194          4         8  Grade ID
idclass       365729   5542  50300.32        101    990003  Class ID
idlearner     365729 152096   5030047      10101  9.90e+07  Learner ID
surveyid      365729      1         .          .         .  Survey ID (Region_Year_Assessment)
countrycode   365729     49         .          .         .  WB country code (3 letters)
national_l~l  365729      2  .9130476          0         1  Idcntry_raw is a national level
score_t~h_01  365729 356710  474.8149          5  880.9251  Plausible value 01: TIMSS score for math
score_t~e_01  365729 353846  476.7623          5  876.2069  Plausible value 01: TIMSS score for sci...
score_t~h_02  365729 356692  474.7991          5  901.7025  Plausible value 02: TIMSS score for math
score_t~e_02  365729 353791  476.4301          5  846.1504  Plausible value 02: TIMSS score for sci...
score_t~h_03  365729 356785  474.8171          5  890.9512  Plausible value 03: TIMSS score for math
score_t~e_03  365729 353543  476.6913          5  904.9952  Plausible value 03: TIMSS score for sci...
score_t~h_04  365729 356702  474.7108          5    853.96  Plausible value 04: TIMSS score for math
score_t~e_04  365729 353755  476.5034          5  865.7862  Plausible value 04: TIMSS score for sci...
score_t~h_05  365729 356834  474.9791          5  859.6071  Plausible value 05: TIMSS score for math
score_t~e_05  365729 353529  477.2122          5  831.8071  Plausible value 05: TIMSS score for sci...
level_t~h_01  365729      5  2.638694          1         5  Plausible value 01: TIMSS level for math
level_t~e_01  365729      5  2.691444          1         5  Plausible value 01: TIMSS level for sci...
level_t~h_02  365729      5  2.641125          1         5  Plausible value 02: TIMSS level for math
level_t~e_02  365729      5  2.688764          1         5  Plausible value 02: TIMSS level for sci...
level_t~h_03  365729      5  2.641087          1         5  Plausible value 03: TIMSS level for math
level_t~e_03  365729      5  2.691468          1         5  Plausible value 03: TIMSS level for sci...
level_t~h_04  365729      5  2.640083          1         5  Plausible value 04: TIMSS level for math
level_t~e_04  365729      5  2.690107          1         5  Plausible value 04: TIMSS level for sci...
level_t~h_05  365729      5  2.641962          1         5  Plausible value 05: TIMSS level for math
level_t~e_05  365729      5  2.695501          1         5  Plausible value 05: TIMSS level for sci...
age           361303     17   12.5421          6        23  Learner age at time of assessment
urban         338552      2   .898249          0         1  School is located in urban/rural area
urban_o       346018      7         .          .         .  Original variable of urban: population ...
male          365729      2  .4989049          0         1  Learner gender is male/female
escs          237833  31728  .1727529  -3.847333  2.337724  
qescs         237833      5  3.034087          1         5  Quintiles of Socio-Economic Status
has_qescs     365729      2  .6502984          0         1  Dummy variable for observations with a ...
learner_we~t  365729  12974  91.51286          1  3853.057  Total learner weight
jkzone        365729     75  34.20434          1        75  Jackknife zone
jkrep         365729      2  .5013986          0         1  Jackknife replicate code
------------------------------------------------------------------------------------------------------


Plus the variables merged-on-the-fly, which are:

traitvars:  lp01_threshold_var lp02_threshold_var lp03_threshold_var lp04_threshold_var lp05_threshold_var lp06_threshold_var lp07_threshold_var lp08_threshold_var lp09_threshold_var lp10_threshold_var lp01_threshold_val lp02_threshold_val lp03_threshold_val lp04_threshold_val lp05_threshold_val lp06_threshold_val lp07_threshold_val lp08_threshold_val lp09_threshold_val lp10_threshold_val lp01_threshold_res lp02_threshold_res lp03_threshold_res lp04_threshold_res lp05_threshold_res lp06_threshold_res lp07_threshold_res lp08_threshold_res lp09_threshold_res lp10_threshold_res
valuevars:  sdg411_scie_01 bmp_scie_01 fgt1_scie_01 fgt2_scie_01 sdg411_scie_02 bmp_scie_02 fgt1_scie_02 fgt2_scie_02 sdg411_scie_03 bmp_scie_03 fgt1_scie_03 fgt2_scie_03 sdg411_scie_04 bmp_scie_04 fgt1_scie_04 fgt2_scie_04 sdg411_scie_05 bmp_scie_05 fgt1_scie_05 fgt2_scie_05 sdg411_math_01 bmp_math_01 fgt1_math_01 fgt2_math_01 sdg411_math_02 bmp_math_02 fgt1_math_02 fgt2_math_02 sdg411_math_03 bmp_math_03 fgt1_math_03 fgt2_math_03 sdg411_math_04 bmp_math_04 fgt1_math_04 fgt2_math_04 sdg411_math_05 bmp_math_05 fgt1_math_05 fgt2_math_05
~~~~

About the **365,729 observations** in this dataset:

~~~~
. tab countrycode idgrade if national_level==1

WB country |
   code (3 |       Grade ID
  letters) |         4          8 |     Total
-----------+----------------------+----------
       ARM |     5,674      5,726 |    11,400 
       AUS |     4,321      4,791 |     9,112 
       BEL |     4,712      4,970 |     9,682 
       BGR |         0      4,117 |     4,117 
       BHR |         0      4,199 |     4,199 
       BWA |         0      5,150 |     5,150 
       CHL |         0      6,377 |     6,377 
       CYP |     4,328      4,002 |     8,330 
       EGY |         0      7,095 |     7,095 
       ESP |         0      2,514 |     2,514 
       EST |         0      4,040 |     4,040 
       GBR |     7,521      6,346 |    13,867 
       GHA |         0      5,100 |     5,100 
       HKG |     4,608      4,972 |     9,580 
       HUN |     3,319      3,302 |     6,621 
       IDN |         0      5,762 |     5,762 
       IRN |     4,352      4,942 |     9,294 
       ISR |         0      4,318 |     4,318 
       ITA |     4,282      4,278 |     8,560 
       JOR |         0      4,489 |     4,489 
       JPN |     4,535      4,856 |     9,391 
       KOR |         0      5,309 |     5,309 
       LBN |         0      3,814 |     3,814 
       LTU |     4,422      4,964 |     9,386 
       LVA |     3,687      3,630 |     7,317 
       MAR |     4,264      2,943 |     7,207 
       MDA |     3,981      4,033 |     8,014 
       MKD |         0      3,893 |     3,893 
       MYS |         0      5,314 |     5,314 
       NLD |     2,937      3,065 |     6,002 
       NOR |     4,342      4,133 |     8,475 
       NZL |     4,308      3,801 |     8,109 
       PHL |     4,572      6,917 |    11,489 
       PSE |         0      5,357 |     5,357 
       ROU |         0      4,104 |     4,104 
       RUS |     3,963      4,667 |     8,630 
       SAU |         0      4,295 |     4,295 
       SGP |     6,668      6,018 |    12,686 
       SRB |         0      4,296 |     4,296 
       SVK |         0      4,215 |     4,215 
       SVN |     3,126      3,578 |     6,704 
       SWE |         0      4,256 |     4,256 
       SYR |         0      4,895 |     4,895 
       TUN |     4,334      4,931 |     9,265 
       USA |     9,829      8,912 |    18,741 
       YEM |     4,205          0 |     4,205 
       ZAF |         0      8,952 |     8,952 
-----------+----------------------+----------
     Total |   112,290    221,638 |   333,928 

. 
. tab countrycode idgrade if national_level==0

WB country |
   code (3 |       Grade ID
  letters) |         4          8 |     Total
-----------+----------------------+----------
       CAN |     8,712      8,628 |    17,340 
       TWN |     4,661      5,379 |    10,040 
       USA |     2,233      2,188 |     4,421 
-----------+----------------------+----------
     Total |    15,606     16,195 |    31,801 

~~~~

**Harmonization** of proficiency (done on-the-fly):

~~~~

      sdg411_scie_01 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
      Non-proficient |    133,137       36.40       36.40
          Proficient |    232,592       63.60      100.00
---------------------+-----------------------------------
               Total |    365,729      100.00

         bmp_scie_01 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
          Proficient |    232,592       63.60       63.60
      Non-proficient |    133,137       36.40      100.00
---------------------+-----------------------------------
               Total |    365,729      100.00

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
fgt1_scie_01 |    133,137    .2188095    .1972553   2.77e-06   .9894737

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
fgt2_scie_01 |    133,137     .086787    .1518117   7.67e-12   .9790582

      sdg411_scie_02 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
      Non-proficient |    133,308       36.45       36.45
          Proficient |    232,421       63.55      100.00
---------------------+-----------------------------------
               Total |    365,729      100.00

         bmp_scie_02 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
          Proficient |    232,421       63.55       63.55
      Non-proficient |    133,308       36.45      100.00
---------------------+-----------------------------------
               Total |    365,729      100.00

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
fgt1_scie_02 |    133,308    .2195395    .1980182   1.01e-06   .9894737

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
fgt2_scie_02 |    133,308    .0874085    .1529272   1.03e-12   .9790582

      sdg411_scie_03 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
      Non-proficient |    133,003       36.37       36.37
          Proficient |    232,726       63.63      100.00
---------------------+-----------------------------------
               Total |    365,729      100.00

         bmp_scie_03 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
          Proficient |    232,726       63.63       63.63
      Non-proficient |    133,003       36.37      100.00
---------------------+-----------------------------------
               Total |    365,729      100.00

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
fgt1_scie_03 |    133,003    .2185359    .1978039   9.08e-07   .9894737

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
fgt2_scie_03 |    133,003     .086884    .1530701   8.24e-13   .9790582

      sdg411_scie_04 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
      Non-proficient |    133,129       36.40       36.40
          Proficient |    232,600       63.60      100.00
---------------------+-----------------------------------
               Total |    365,729      100.00

         bmp_scie_04 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
          Proficient |    232,600       63.60       63.60
      Non-proficient |    133,129       36.40      100.00
---------------------+-----------------------------------
               Total |    365,729      100.00

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
fgt1_scie_04 |    133,129    .2199539    .1983486   9.31e-07   .9894737

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
fgt2_scie_04 |    133,129    .0877216    .1536215   8.67e-13   .9790582

      sdg411_scie_05 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
      Non-proficient |    132,713       36.29       36.29
          Proficient |    233,016       63.71      100.00
---------------------+-----------------------------------
               Total |    365,729      100.00

         bmp_scie_05 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
          Proficient |    233,016       63.71       63.71
      Non-proficient |    132,713       36.29      100.00
---------------------+-----------------------------------
               Total |    365,729      100.00

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
fgt1_scie_05 |    132,713     .217794    .1964408   1.22e-06   .9894737

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
fgt2_scie_05 |    132,713    .0860229      .15085   1.48e-12   .9790582

      sdg411_math_01 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
      Non-proficient |    144,104       39.40       39.40
          Proficient |    221,625       60.60      100.00
---------------------+-----------------------------------
               Total |    365,729      100.00

         bmp_math_01 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
          Proficient |    221,625       60.60       60.60
      Non-proficient |    144,104       39.40      100.00
---------------------+-----------------------------------
               Total |    365,729      100.00

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
fgt1_math_01 |    144,104    .2081743    .1648605   4.02e-06   .9894737

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
fgt2_math_01 |    144,104    .0705154    .1040397   1.61e-11   .9790582

      sdg411_math_02 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
      Non-proficient |    143,991       39.37       39.37
          Proficient |    221,738       60.63      100.00
---------------------+-----------------------------------
               Total |    365,729      100.00

         bmp_math_02 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
          Proficient |    221,738       60.63       60.63
      Non-proficient |    143,991       39.37      100.00
---------------------+-----------------------------------
               Total |    365,729      100.00

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
fgt1_math_02 |    143,991    .2103628    .1662377   3.28e-06   .9894737

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
fgt2_math_02 |    143,991    .0718873    .1060606   1.08e-11   .9790582

      sdg411_math_03 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
      Non-proficient |    143,956       39.36       39.36
          Proficient |    221,773       60.64      100.00
---------------------+-----------------------------------
               Total |    365,729      100.00

         bmp_math_03 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
          Proficient |    221,773       60.64       60.64
      Non-proficient |    143,956       39.36      100.00
---------------------+-----------------------------------
               Total |    365,729      100.00

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
fgt1_math_03 |    143,956    .2104858    .1664205   2.97e-06   .9894737

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
fgt2_math_03 |    143,956    .0719999     .105921   8.82e-12   .9790582

      sdg411_math_04 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
      Non-proficient |    144,369       39.47       39.47
          Proficient |    221,360       60.53      100.00
---------------------+-----------------------------------
               Total |    365,729      100.00

         bmp_math_04 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
          Proficient |    221,360       60.53       60.53
      Non-proficient |    144,369       39.47      100.00
---------------------+-----------------------------------
               Total |    365,729      100.00

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
fgt1_math_04 |    144,369    .2101426    .1660385   2.94e-07   .9894737

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
fgt2_math_04 |    144,369    .0717285    .1056068   8.63e-14   .9790582

      sdg411_math_05 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
      Non-proficient |    143,902       39.35       39.35
          Proficient |    221,827       60.65      100.00
---------------------+-----------------------------------
               Total |    365,729      100.00

         bmp_math_05 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
          Proficient |    221,827       60.65       60.65
      Non-proficient |    143,902       39.35      100.00
---------------------+-----------------------------------
               Total |    365,729      100.00

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
fgt1_math_05 |    143,902    .2091103     .165817   9.75e-07   .9894737

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
fgt2_math_05 |    143,902    .0712222    .1052686   9.50e-13   .9790582



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
     +-----------------------------------------------------------+

~~~~
