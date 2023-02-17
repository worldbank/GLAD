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
dofile_info: last modified by Ahmed Raza in Feburary 2, 2022
lastsave:    11 Feb 2022 14:07:44 by wb549384
~~~~


About the **60 variables** in this dataset:

~~~~
The variables belong to the following variable classifications:
idvars valuevars traitvars

idvars:    assessment year countrycode idgrade subgroup
valuevars: n_score_timss_math m_score_timss_math se_score_timss_math n_score_timss_scie m_score_timss_scie se_score_timss_scie n_fgt1_scie m_fgt1_scie se_fgt1_scie n_fgt1_math m_fgt1_math se_fgt1_math n_fgt2_scie m_fgt2_scie se_fgt2_scie n_fgt2_math m_fgt2_math se_fgt2_math n_sdg411_scie m_sdg411_scie se_sdg411_scie n_sdg411_math m_sdg411_math se_sdg411_math n_bmp_scie m_bmp_scie se_bmp_scie n_bmp_math m_bmp_math se_bmp_math m_d1level_timss_math se_d1level_timss_math m_d2level_timss_math se_d2level_timss_math m_d3level_timss_math se_d3level_timss_math m_d4level_timss_math se_d4level_timss_math m_d5level_timss_math se_d5level_timss_math m_d1level_timss_scie se_d1level_timss_scie m_d2level_timss_scie se_d2level_timss_scie m_d3level_timss_scie se_d3level_timss_scie m_d4level_timss_scie se_d4level_timss_scie m_d5level_timss_scie se_d5level_timss_scie
traitvars: n_total n_male n_urban n_has_qescs n_qescs

. codebook, compact

Variable      Obs Unique      Mean       Min       Max  Label
--------------------------------------------------------------------------------------------------------------------
assessment    779      1         .         .         .  Assessment
year          779      1      2019      2019      2019  Year of assessment
countrycode   779     63         .         .         .  WB country code (3 letters)
idgrade       779      4  5.921694         4         9  Grade ID
subgroup      779     12         .         .         .  Subgroups of countrycode idgrade
n_score_ti~h  779    610  2102.194         7     20829  Number of observations used to calculate m_score_timss_math
m_score_ti~h  779    678  492.5093  279.8551  670.9191  Mean of score_timss_math
se_score_t~h  779    678  5.355908  1.335259  32.55168  Standard error of m_score_timss_math
n_score_ti~e  779    610  2102.194         7     20829  Number of observations used to calculate m_score_timss_scie
m_score_ti~e  779    678  488.4862  232.5697  671.6163  Mean of score_timss_scie
se_score_t~e  779    678  5.716202  1.290144  45.13284  Standard error of m_score_timss_scie
n_fgt1_scie   767    482  770.5463         2     16934  Number of observations used to calculate m_fgt1_scie
m_fgt1_scie   767    667  .1481857   .049504  .4787955  Mean of fgt1_scie
se_fgt1_scie  767    667  .0133991  .0038554  .0915591  Standard error of m_fgt1_scie
n_fgt1_math   763    478  792.6173         2     17502  Number of observations used to calculate m_fgt1_math
m_fgt1_math   763    663   .133296  .0410471  .3823189  Mean of fgt1_math
se_fgt1_math  763    663  .0129127  .0029294  .0829811  Standard error of m_fgt1_math
n_fgt2_scie   767    482  770.5463         2     16934  Number of observations used to calculate m_fgt2_scie
m_fgt2_scie   767    667  .0414171  .0040388  .2888357  Mean of fgt2_scie
se_fgt2_scie  767    667  .0055686  .0013185  .0449497  Standard error of m_fgt2_scie
n_fgt2_math   763    478  792.6173         2     17502  Number of observations used to calculate m_fgt2_math
m_fgt2_math   763    663  .0321528  .0028855  .1923835  Mean of fgt2_math
se_fgt2_math  763    663  .0046274  .0009857  .0314225  Standard error of m_fgt2_math
n_sdg411_s~e  779    610  2102.194         7     20829  Number of observations used to calculate m_sdg411_scie
m_sdg411_s~e  779    670  .7090622   .047012         1  Mean of sdg411_scie
se_sdg411_~e  779    670  .0210624         0  .1235662  Standard error of m_sdg411_scie
n_sdg411_m~h  779    610  2102.194         7     20829  Number of observations used to calculate m_sdg411_math
m_sdg411_m~h  779    673  .7030116  .0432016         1  Mean of sdg411_math
se_sdg411_~h  779    673  .0202475         0  .1349297  Standard error of m_sdg411_math
n_bmp_scie    779    610  2102.194         7     20829  Number of observations used to calculate m_bmp_scie
m_bmp_scie    779    670  .2909378         0   .952988  Mean of bmp_scie
se_bmp_scie   779    670  .0210624         0  .1235662  Standard error of m_bmp_scie
n_bmp_math    779    610  2102.194         7     20829  Number of observations used to calculate m_bmp_math
m_bmp_math    779    673  .2969884         0  .9567984  Mean of bmp_math
se_bmp_math   779    673  .0202475         0  .1349297  Standard error of m_bmp_math
m_d1level_~h  779    668  .1872885         0  .8537876  Mean of d1level_timss_math
se_d1level~h  779    668  .0177797         0  .1216107  Standard error of m_d1level_timss_math
m_d2level_~h  779    673  .2225399         0  .4428052  Mean of d2level_timss_math
se_d2level~h  779    673   .019447         0  .1392259  Standard error of m_d2level_timss_math
m_d3level_~h  779    677  .2862541  .0249078  .5028629  Mean of d3level_timss_math
se_d3level~h  779    678  .0214179  .0045522   .203101  Standard error of m_d3level_timss_math
m_d4level_~h  779    678  .2103236  .0024168  .7714286  Mean of d4level_timss_math
se_d4level~h  779    677  .0197576  .0012231  .2633913  Standard error of m_d4level_timss_math
m_d5level_~h  779    670   .093594         0  .8156976  Mean of d5level_timss_math
se_d5level~h  779    670   .013278         0  .1452112  Standard error of m_d5level_timss_math
m_d1level_~e  779    669   .191115         0  .9204181  Mean of d1level_timss_scie
se_d1level~e  779    669  .0185396         0  .1235662  Standard error of m_d1level_timss_scie
m_d2level_~e  779    671  .2122362         0  .4008386  Mean of d2level_timss_scie
se_d2level~e  779    671  .0187673         0  .0810861  Standard error of m_d2level_timss_scie
m_d3level_~e  779    678  .2929195         0  .4600825  Mean of d3level_timss_scie
se_d3level~e  779    678  .0215728         0  .1106567  Standard error of m_d3level_timss_scie
m_d4level_~e  779    677  .2222646  .0023637      .575  Mean of d4level_timss_scie
se_d4level~e  779    678  .0206125  .0011074  .2842821  Standard error of m_d4level_timss_scie
m_d5level_~e  779    676  .0814647         0  .8571429  Mean of d5level_timss_scie
se_d5level~e  779    676  .0128656         0  .1784285  Standard error of m_d5level_timss_scie
n_total       779     95  3896.829        37     20829  # learners, by countrycode idgrade
n_male        779     93  1962.126        21      9731  # male learners, by countrycode idgrade
n_urban       779     94  2543.954         0     13178  # urban learners, by countrycode idgrade
n_has_qescs   779     57  2969.144         0     20829  # has_qescs learners, by countrycode idgrade
n_qescs       779     58  7887.032         0     63437  # qescs learners, by countrycode idgrade
--------------------------------------------------------------------------------------------------------------------

~~~~

About the **779     observations** in this dataset:

~~~~
. tab countrycode idgrade

WB country |
   code (3 |                  Grade ID
  letters) |         4          5          8          9 |     Total
-----------+--------------------------------------------+----------
       ALB |         6          0          0          0 |         6 
       ARE |         7          0         11         10 |        28 
       ARM |         6          0          0          0 |         6 
       AUS |         6          0          6          0 |        12 
       AUT |         4          0          0          0 |         4 
       AZE |         9          0          0          0 |         9 
       BFL |         6          0          0          0 |         6 
       BGR |         6          0          0          0 |         6 
       BHR |         9          0         11          0 |        20 
       BIH |         8          0          0          0 |         8 
       CAN |         8          0          0          0 |         8 
       CHL |         9          0         11          0 |        20 
       CYP |         9          0         11          0 |        20 
       CZE |         6          0          0          0 |         6 
       DEU |         9          0          0          0 |         9 
       DNK |         6          0          0          0 |         6 
       EGY |         0          0         11          0 |        11 
       ENG |         6          0          6          0 |        12 
       ESP |         6          0          0          0 |         6 
       FIN |         8          0         11          0 |        19 
       FRA |         9          0          6          0 |        15 
       GEO |         6          0          6          0 |        12 
       HKG |         8          0         10          0 |        18 
       HRV |         6          0          0          0 |         6 
       HUN |         8          0         11          0 |        19 
       IRL |         8          0         11          0 |        19 
       IRN |         9          0         11          0 |        20 
       ISR |         0          0          6          0 |         6 
       ITA |         8          0         11          0 |        19 
       JOR |         0          0         11          0 |        11 
       JPN |         9          0         11          0 |        20 
       KAZ |         9          0         11          0 |        20 
       KOR |         5          0          6          0 |        11 
       KWT |         6          0          6          0 |        12 
       LBN |         0          0          6          0 |         6 
       LTU |         6          0          6          0 |        12 
       LVA |         6          0          0          0 |         6 
       MAR |         9          0         11          0 |        20 
       MKD |         9          0          0          0 |         9 
       MLT |         6          0          0          0 |         6 
       MNE |         9          0          0          0 |         9 
       MYS |         0          0          6          0 |         6 
       NIR |         9          0          0          0 |         9 
       NLD |         6          0          0          0 |         6 
       NOR |         0          6          0          6 |        12 
       NZL |         0          8          0         11 |        19 
       OMN |         9          0         11          0 |        20 
       PAK |        10          0          0          0 |        10 
       PHL |         6          0          0          0 |         6 
       POL |         6          0          0          0 |         6 
       PRT |         8          0         11          0 |        19 
       QAT |         8          0         11          0 |        19 
       ROM |         0          0         11          0 |        11 
       RUS |         8          0         11          0 |        19 
       SAU |         6          0          6          0 |        12 
       SGP |         7          0         10          0 |        17 
       SRB |         8          0          0          0 |         8 
       SVK |         9          0          0          0 |         9 
       SWE |         6          0          6          0 |        12 
       TUR |         0         11         11          0 |        22 
       USA |         6          0          6          0 |        12 
       XKX |         6          0          0          0 |         6 
       ZAF |         0         10          0         11 |        21 
-----------+--------------------------------------------+----------
     Total |       388         35        318         38 |       779 

. 
. tab subgroup

  Subgroups |
         of |
countrycode |
    idgrade |      Freq.     Percent        Cum.
------------+-----------------------------------
        all |         96       12.32       12.32
has_qescs=0 |         39        5.01       17.33
has_qescs=1 |         57        7.32       24.65
     male=0 |         96       12.32       36.97
     male=1 |         96       12.32       49.29
    qescs=1 |         57        7.32       56.61
    qescs=2 |         39        5.01       61.62
    qescs=3 |         45        5.78       67.39
    qescs=4 |         40        5.13       72.53
    qescs=5 |         29        3.72       76.25
    urban=0 |         90       11.55       87.80
    urban=1 |         95       12.20      100.00
------------+-----------------------------------
      Total |        779      100.00

~~~~
