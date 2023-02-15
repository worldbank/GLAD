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
module:      ESCS
ttl_info:    Joao Pedro de Azevedo [eduanalytics@worldbank.org]
dofile_info: last modified by Diana Goldemberg in April 15, 2020
lastsave:    20 Jul 2021 14:01:52 by wb549384
~~~~


About the **60 variables** in this dataset:

~~~~
The variables belong to the following variable classifications:
idvars valuevars traitvars

idvars:    assessment year countrycode idgrade subgroup
valuevars: n_score_timss_math m_score_timss_math se_score_timss_math n_score_timss_sci m_score_timss_sci se_score_timss_sci n_fgt1_sci m_fgt1_sci se_fgt1_sci n_fgt1_math m_fgt1_math se_fgt1_math n_fgt2_sci m_fgt2_sci se_fgt2_sci n_fgt2_math m_fgt2_math se_fgt2_math n_sdg411_sci m_sdg411_sci se_sdg411_sci n_sdg411_math m_sdg411_math se_sdg411_math n_bmp_sci m_bmp_sci se_bmp_sci n_bmp_math m_bmp_math se_bmp_math m_d1level_timss_math se_d1level_timss_math m_d2level_timss_math se_d2level_timss_math m_d3level_timss_math se_d3level_timss_math m_d4level_timss_math se_d4level_timss_math m_d5level_timss_math se_d5level_timss_math m_d1level_timss_sci se_d1level_timss_sci m_d2level_timss_sci se_d2level_timss_sci m_d3level_timss_sci se_d3level_timss_sci m_d4level_timss_sci se_d4level_timss_sci m_d5level_timss_sci se_d5level_timss_sci
traitvars: n_total n_male n_urban n_has_qescs n_qescs

. codebook, compact

Variable       Obs Unique      Mean   Min    Max  Label
-------------------------------------------------------------------------------------------------------
assessment    2425      1         .     .      .  Assessment
year          2425      1      2019  2019   2019  Year of assessment
countrycode   2425     63         .     .      .  WB country code (3 letters)
idgrade       2425      4  5.701031     4      9  Grade ID
subgroup      2425     25         .     .      .  Subgroups of countrycode idgrade
n_score_ti~h     0      0         .     .      .  Number of observations used to calculate m_score_t...
m_score_ti~h     0      0         .     .      .  Mean of score_timss_math
se_score_t~h     0      0         .     .      .  Standard error of m_score_timss_math
n_score_ti~i     0      0         .     .      .  Number of observations used to calculate m_score_t...
m_score_ti~i     0      0         .     .      .  Mean of score_timss_sci
se_score_t~i     0      0         .     .      .  Standard error of m_score_timss_sci
n_fgt1_sci       0      0         .     .      .  Number of observations used to calculate m_fgt1_sci
m_fgt1_sci       0      0         .     .      .  Mean of fgt1_sci
se_fgt1_sci      0      0         .     .      .  Standard error of m_fgt1_sci
n_fgt1_math      0      0         .     .      .  Number of observations used to calculate m_fgt1_math
m_fgt1_math      0      0         .     .      .  Mean of fgt1_math
se_fgt1_math     0      0         .     .      .  Standard error of m_fgt1_math
n_fgt2_sci       0      0         .     .      .  Number of observations used to calculate m_fgt2_sci
m_fgt2_sci       0      0         .     .      .  Mean of fgt2_sci
se_fgt2_sci      0      0         .     .      .  Standard error of m_fgt2_sci
n_fgt2_math      0      0         .     .      .  Number of observations used to calculate m_fgt2_math
m_fgt2_math      0      0         .     .      .  Mean of fgt2_math
se_fgt2_math     0      0         .     .      .  Standard error of m_fgt2_math
n_sdg411_sci     0      0         .     .      .  Number of observations used to calculate m_sdg411_sci
m_sdg411_sci     0      0         .     .      .  Mean of sdg411_sci
se_sdg411_~i     0      0         .     .      .  Standard error of m_sdg411_sci
n_sdg411_m~h     0      0         .     .      .  Number of observations used to calculate m_sdg411_...
m_sdg411_m~h     0      0         .     .      .  Mean of sdg411_math
se_sdg411_~h     0      0         .     .      .  Standard error of m_sdg411_math
n_bmp_sci        0      0         .     .      .  Number of observations used to calculate m_bmp_sci
m_bmp_sci        0      0         .     .      .  Mean of bmp_sci
se_bmp_sci       0      0         .     .      .  Standard error of m_bmp_sci
n_bmp_math       0      0         .     .      .  Number of observations used to calculate m_bmp_math
m_bmp_math       0      0         .     .      .  Mean of bmp_math
se_bmp_math      0      0         .     .      .  Standard error of m_bmp_math
m_d1level_~h     0      0         .     .      .  Mean of d1level_timss_math
se_d1level~h     0      0         .     .      .  Standard error of m_d1level_timss_math
m_d2level_~h     0      0         .     .      .  Mean of d2level_timss_math
se_d2level~h     0      0         .     .      .  Standard error of m_d2level_timss_math
m_d3level_~h     0      0         .     .      .  Mean of d3level_timss_math
se_d3level~h     0      0         .     .      .  Standard error of m_d3level_timss_math
m_d4level_~h     0      0         .     .      .  Mean of d4level_timss_math
se_d4level~h     0      0         .     .      .  Standard error of m_d4level_timss_math
m_d5level_~h     0      0         .     .      .  Mean of d5level_timss_math
se_d5level~h     0      0         .     .      .  Standard error of m_d5level_timss_math
m_d1level_~i     0      0         .     .      .  Mean of d1level_timss_sci
se_d1level~i     0      0         .     .      .  Standard error of m_d1level_timss_sci
m_d2level_~i     0      0         .     .      .  Mean of d2level_timss_sci
se_d2level~i     0      0         .     .      .  Standard error of m_d2level_timss_sci
m_d3level_~i     0      0         .     .      .  Mean of d3level_timss_sci
se_d3level~i     0      0         .     .      .  Standard error of m_d3level_timss_sci
m_d4level_~i     0      0         .     .      .  Mean of d4level_timss_sci
se_d4level~i     0      0         .     .      .  Standard error of m_d4level_timss_sci
m_d5level_~i     0      0         .     .      .  Mean of d5level_timss_sci
se_d5level~i     0      0         .     .      .  Standard error of m_d5level_timss_sci
n_total       2425     96  3664.804    30  20829  # learners, by countrycode idgrade
n_male        2425     94  1846.887    16   9731  # male learners, by countrycode idgrade
n_urban       2425     95  2376.278     0  13178  # urban learners, by countrycode idgrade
n_has_qescs   2425     58  2413.711     0  20829  # has_qescs learners, by countrycode idgrade
n_qescs       2425     59  6284.515     0  63437  # qescs learners, by countrycode idgrade
-------------------------------------------------------------------------------------------------------

~~~~

About the **2,425   observations** in this dataset:

~~~~
. tab countrycode idgrade

WB country |
   code (3 |                  Grade ID
  letters) |         4          5          8          9 |     Total
-----------+--------------------------------------------+----------
       ALB |        25          0          0          0 |        25 
       ARE |        25         25         25         25 |       100 
       ARM |        25          0          0          0 |        25 
       AUS |        25          0         25          0 |        50 
       AUT |        25          0          0          0 |        25 
       AZE |        25          0          0          0 |        25 
       BFL |        25          0          0          0 |        25 
       BGR |        25          0          0          0 |        25 
       BHR |        25          0         25          0 |        50 
       BIH |        25          0          0          0 |        25 
       CAN |        25          0          0          0 |        25 
       CHL |        25          0         25          0 |        50 
       CYP |        25          0         25          0 |        50 
       CZE |        25          0          0          0 |        25 
       DEU |        25          0          0          0 |        25 
       DNK |        25          0          0          0 |        25 
       EGY |         0          0         25          0 |        25 
       ENG |        25          0         25          0 |        50 
       ESP |        25          0          0          0 |        25 
       FIN |        25          0         25          0 |        50 
       FRA |        25          0         25          0 |        50 
       GEO |        25          0         25          0 |        50 
       HKG |        25          0         25          0 |        50 
       HRV |        25          0          0          0 |        25 
       HUN |        25          0         25          0 |        50 
       IRL |        25          0         25          0 |        50 
       IRN |        25          0         25          0 |        50 
       ISR |         0          0         25          0 |        25 
       ITA |        25          0         25          0 |        50 
       JOR |         0          0         25          0 |        25 
       JPN |        25          0         25          0 |        50 
       KAZ |        25          0         25          0 |        50 
       KOR |        25          0         25          0 |        50 
       KWT |        25          0         25          0 |        50 
       LBN |         0          0         25          0 |        25 
       LTU |        25          0         25          0 |        50 
       LVA |        25          0          0          0 |        25 
       MAR |        25          0         25          0 |        50 
       MKD |        25          0          0          0 |        25 
       MLT |        25          0          0          0 |        25 
       MNE |        25          0          0          0 |        25 
       MYS |         0          0         25          0 |        25 
       NIR |        25          0          0          0 |        25 
       NLD |        25          0          0          0 |        25 
       NOR |         0         25          0         25 |        50 
       NZL |         0         25          0         25 |        50 
       OMN |        25          0         25          0 |        50 
       PAK |        25          0          0          0 |        25 
       PHL |        25          0          0          0 |        25 
       POL |        25          0          0          0 |        25 
       PRT |        25          0         25          0 |        50 
       QAT |        25          0         25          0 |        50 
       ROM |         0          0         25          0 |        25 
       RUS |        25          0         25          0 |        50 
       SAU |        25          0         25          0 |        50 
       SGP |        25          0         25          0 |        50 
       SRB |        25          0          0          0 |        25 
       SVK |        25          0          0          0 |        25 
       SWE |        25          0         25          0 |        50 
       TUR |         0         25         25          0 |        50 
       USA |        25          0         25          0 |        50 
       XKX |        25          0          0          0 |        25 
       ZAF |         0         25          0         25 |        50 
-----------+--------------------------------------------+----------
     Total |     1,325        125        875        100 |     2,425 

. 
. tab subgroup

  Subgroups |
         of |
countrycode |
    idgrade |      Freq.     Percent        Cum.
------------+-----------------------------------
        all |         97        4.00        4.00
has_qescs=0 |         97        4.00        8.00
has_qescs=1 |         97        4.00       12.00
has_qescs=2 |         97        4.00       16.00
has_qescs=3 |         97        4.00       20.00
has_qescs=4 |         97        4.00       24.00
has_qescs=5 |         97        4.00       28.00
     male=0 |         97        4.00       32.00
     male=1 |         97        4.00       36.00
     male=2 |         97        4.00       40.00
     male=3 |         97        4.00       44.00
     male=4 |         97        4.00       48.00
     male=5 |         97        4.00       52.00
    qescs=0 |         97        4.00       56.00
    qescs=1 |         97        4.00       60.00
    qescs=2 |         97        4.00       64.00
    qescs=3 |         97        4.00       68.00
    qescs=4 |         97        4.00       72.00
    qescs=5 |         97        4.00       76.00
    urban=0 |         97        4.00       80.00
    urban=1 |         97        4.00       84.00
    urban=2 |         97        4.00       88.00
    urban=3 |         97        4.00       92.00
    urban=4 |         97        4.00       96.00
    urban=5 |         97        4.00      100.00
------------+-----------------------------------
      Total |      2,425      100.00

~~~~
