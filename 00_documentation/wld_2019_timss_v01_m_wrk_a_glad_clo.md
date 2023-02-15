Documentation of CLO dataset
=====================================================================


[back to list of assessments](https://github.com/worldbank/GLAD/blob/master/README.md#indicators)

This dataset contains harmonized aggregated data from TIMSS 2019 and is part of the Country Level Outcomes (CLO)

**Metadata** stored in this dataset:

~~~~
region:      WLD
year:        2019
assessment:  TIMSS
master:      v01_M
adaptation:  wrk_A_GLAD
module:      CLO
ttl_info:    Joao Pedro de Azevedo [eduanalytics@worldbank.org]
dofile_info: last modified by Diana Goldemberg in March 9, 2020
lastsave:    14 Apr 2021 00:23:55 by wb255520
~~~~


About the **52 variables** in this dataset:

~~~~
The variables belong to the following variable classifications:
idvars valuevars traitvars

idvars:    assessment year countrycode idgrade subgroup
valuevars: n_score_timss_math m_score_timss_math se_score_timss_math n_score_timss_science m_score_timss_science se_score_timss_science n_fgt1_hpro_science m_fgt1_hpro_science se_fgt1_hpro_science n_fgt1_hpro_math m_fgt1_hpro_math se_fgt1_hpro_math n_fgt2_hpro_science m_fgt2_hpro_science se_fgt2_hpro_science n_fgt2_hpro_math m_fgt2_hpro_math se_fgt2_hpro_math n_hpro_science m_hpro_science se_hpro_science n_hpro_math m_hpro_math se_hpro_math m_d1level_timss_math se_d1level_timss_math m_d2level_timss_math se_d2level_timss_math m_d3level_timss_math se_d3level_timss_math m_d4level_timss_math se_d4level_timss_math m_d5level_timss_math se_d5level_timss_math m_d1level_timss_science se_d1level_timss_science m_d2level_timss_science se_d2level_timss_science m_d3level_timss_science se_d3level_timss_science m_d4level_timss_science se_d4level_timss_science m_d5level_timss_science se_d5level_timss_science
traitvars: n_total n_male n_urban

. codebook, compact

Variable       Obs Unique      Mean       Min       Max  Label
-------------------------------------------------------------------------------------------------------------------
assessment    1261      1         .         .         .  Assessment
year          1261      1      2019      2019      2019  Year of assessment
countrycode   1261     63         .         .         .  WB country code (3 letters)
idgrade       1261      4  5.701031         4         9  Grade ID
subgroup      1261     13         .         .         .  Subgroups of countrycode idgrade
n_score_ti~h   473    441  2215.757        16     20829  Number of observations used to calculate m_score_timss_...
m_score_ti~h   473    469  492.9501  279.8551  647.6614  Mean of score_timss_math
se_score_t~h   473    469  5.430023  1.335259  25.22948  Standard error of m_score_timss_math
n_score_ti~e   473    441  2215.757        16     20829  Number of observations used to calculate m_score_timss_...
m_score_ti~e   473    469  488.2908  232.5697  637.7257  Mean of score_timss_science
se_score_t~e   473    469   5.81897  1.290144  27.00246  Standard error of m_score_timss_science
n_fgt1_hpr~e   280    224  510.2143         3      8700  Number of observations used to calculate m_fgt1_hpro_sc...
m_fgt1_hpr~e   280    277  .1404442   .049504  .4787955  Mean of fgt1_hpro_science
se_fgt1_hp~e   280    277  .0155488  .0044792   .048329  Standard error of m_fgt1_hpro_science
n_fgt1_hpr~h   278    209  472.3489         2      7591  Number of observations used to calculate m_fgt1_hpro_math
m_fgt1_hpr~h   278    275  .1211166  .0431434  .3823189  Mean of fgt1_hpro_math
se_fgt1_hp~h   278    275  .0153576  .0041676  .0700201  Standard error of m_fgt1_hpro_math
n_fgt2_hpr~e   280    224  510.2143         3      8700  Number of observations used to calculate m_fgt2_hpro_sc...
m_fgt2_hpr~e   280    277  .0405182  .0040542  .2888357  Mean of fgt2_hpro_science
se_fgt2_hp~e   280    277  .0062603  .0015131  .0320761  Standard error of m_fgt2_hpro_science
n_fgt2_hpr~h   278    209  472.3489         2      7591  Number of observations used to calculate m_fgt2_hpro_math
m_fgt2_hpr~h   278    275  .0291056   .002995  .1923835  Mean of fgt2_hpro_math
se_fgt2_hp~h   278    275  .0052333  .0012198  .0178321  Standard error of m_fgt2_hpro_math
n_hpro_sci~e   281    268  2091.004        26     11891  Number of observations used to calculate m_hpro_science
m_hpro_sci~e   281    279  .8178875  .0795819         1  Mean of hpro_science
se_hpro_sc~e   281    279  .0176584         0  .1034321  Standard error of m_hpro_science
n_hpro_math    281    268  2091.004        26     11891  Number of observations used to calculate m_hpro_math
m_hpro_math    281    279  .8368361  .1462124         1  Mean of hpro_math
se_hpro_math   281    279  .0160752         0  .0950827  Standard error of m_hpro_math
m_d1level_~h   473    466  .1828531         0  .8537876  Mean of d1level_timss_math
se_d1level~h   473    466  .0178412         0  .0980599  Standard error of m_d1level_timss_math
m_d2level_~h   473    468  .2220839         0   .396572  Mean of d2level_timss_math
se_d2level~h   473    468  .0189039         0  .1392259  Standard error of m_d2level_timss_math
m_d3level_~h   473    469  .2911844  .0249078  .4816525  Mean of d3level_timss_math
se_d3level~h   473    469  .0202166  .0045522  .1072094  Standard error of m_d3level_timss_math
m_d4level_~h   473    469  .2131574  .0025505  .5809524  Mean of d4level_timss_math
se_d4level~h   473    469  .0188689  .0016454     .1125  Standard error of m_d4level_timss_math
m_d5level_~h   473    467  .0907212         0  .6615385  Mean of d5level_timss_math
se_d5level~h   473    467  .0125637         0  .0748824  Standard error of m_d5level_timss_math
m_d1level_~e   473    466  .1889331         0  .9204181  Mean of d1level_timss_science
se_d1level~e   473    466  .0187598         0  .1063986  Standard error of m_d1level_timss_science
m_d2level_~e   473    467  .2126177         0  .4008386  Mean of d2level_timss_science
se_d2level~e   473    467  .0182457         0  .0810861  Standard error of m_d2level_timss_science
m_d3level_~e   473    469   .296731  .0133347  .4600825  Mean of d3level_timss_science
se_d3level~e   473    469  .0209444  .0027673  .1064818  Standard error of m_d3level_timss_science
m_d4level_~e   473    469  .2240599  .0023637  .4532597  Mean of d4level_timss_science
se_d4level~e   473    469  .0199052  .0012673  .1419727  Standard error of m_d4level_timss_science
m_d5level_~e   473    469  .0776583         0  .5714286  Mean of d5level_timss_science
se_d5level~e   473    469  .0122872         0  .1038328  Standard error of m_d5level_timss_science
n_total       1261     96  3664.804        30     20829  # learners, by countrycode idgrade
n_male        1261     94  1846.887        16      9731  # male learners, by countrycode idgrade
n_urban       1261     95  2376.278         0     13178  # urban learners, by countrycode idgrade
-------------------------------------------------------------------------------------------------------------------

~~~~

About the **1,261   observations** in this dataset:

~~~~
. tab countrycode idgrade

WB country |
   code (3 |                  Grade ID
  letters) |         4          5          8          9 |     Total
-----------+--------------------------------------------+----------
       ALB |        13          0          0          0 |        13 
       ARE |        13         13         13         13 |        52 
       ARM |        13          0          0          0 |        13 
       AUS |        13          0         13          0 |        26 
       AUT |        13          0          0          0 |        13 
       AZE |        13          0          0          0 |        13 
       BFL |        13          0          0          0 |        13 
       BGR |        13          0          0          0 |        13 
       BHR |        13          0         13          0 |        26 
       BIH |        13          0          0          0 |        13 
       CAN |        13          0          0          0 |        13 
       CHL |        13          0         13          0 |        26 
       CYP |        13          0         13          0 |        26 
       CZE |        13          0          0          0 |        13 
       DEU |        13          0          0          0 |        13 
       DNK |        13          0          0          0 |        13 
       EGY |         0          0         13          0 |        13 
       ENG |        13          0         13          0 |        26 
       ESP |        13          0          0          0 |        13 
       FIN |        13          0         13          0 |        26 
       FRA |        13          0         13          0 |        26 
       GEO |        13          0         13          0 |        26 
       HKG |        13          0         13          0 |        26 
       HRV |        13          0          0          0 |        13 
       HUN |        13          0         13          0 |        26 
       IRL |        13          0         13          0 |        26 
       IRN |        13          0         13          0 |        26 
       ISR |         0          0         13          0 |        13 
       ITA |        13          0         13          0 |        26 
       JOR |         0          0         13          0 |        13 
       JPN |        13          0         13          0 |        26 
       KAZ |        13          0         13          0 |        26 
       KOR |        13          0         13          0 |        26 
       KWT |        13          0         13          0 |        26 
       LBN |         0          0         13          0 |        13 
       LTU |        13          0         13          0 |        26 
       LVA |        13          0          0          0 |        13 
       MAR |        13          0         13          0 |        26 
       MKD |        13          0          0          0 |        13 
       MLT |        13          0          0          0 |        13 
       MNE |        13          0          0          0 |        13 
       MYS |         0          0         13          0 |        13 
       NIR |        13          0          0          0 |        13 
       NLD |        13          0          0          0 |        13 
       NOR |         0         13          0         13 |        26 
       NZL |         0         13          0         13 |        26 
       OMN |        13          0         13          0 |        26 
       PAK |        13          0          0          0 |        13 
       PHL |        13          0          0          0 |        13 
       POL |        13          0          0          0 |        13 
       PRT |        13          0         13          0 |        26 
       QAT |        13          0         13          0 |        26 
       ROM |         0          0         13          0 |        13 
       RUS |        13          0         13          0 |        26 
       SAU |        13          0         13          0 |        26 
       SGP |        13          0         13          0 |        26 
       SRB |        13          0          0          0 |        13 
       SVK |        13          0          0          0 |        13 
       SWE |        13          0         13          0 |        26 
       TUR |         0         13         13          0 |        26 
       USA |        13          0         13          0 |        26 
       XKX |        13          0          0          0 |        13 
       ZAF |         0         13          0         13 |        26 
-----------+--------------------------------------------+----------
     Total |       689         65        455         52 |     1,261 

. 
. tab subgroup

  Subgroups |
         of |
countrycode |
    idgrade |      Freq.     Percent        Cum.
------------+-----------------------------------
        all |         97        7.69        7.69
     male=0 |         97        7.69       15.38
     male=1 |         97        7.69       23.08
     male=2 |         97        7.69       30.77
     male=3 |         97        7.69       38.46
     male=4 |         97        7.69       46.15
     male=5 |         97        7.69       53.85
    urban=0 |         97        7.69       61.54
    urban=1 |         97        7.69       69.23
    urban=2 |         97        7.69       76.92
    urban=3 |         97        7.69       84.62
    urban=4 |         97        7.69       92.31
    urban=5 |         97        7.69      100.00
------------+-----------------------------------
      Total |      1,261      100.00

~~~~
