Documentation of CLO dataset
=====================================================================


[back to list of assessments](https://github.com/worldbank/GLAD/blob/master/README.md#indicators)

This dataset contains harmonized aggregated data from TIMSS 2015 and is part of the Country Level Outcomes (CLO)

**Metadata** stored in this dataset:

~~~~
region:      WLD
year:        2015
assessment:  TIMSS
master:      v01_M
adaptation:  wrk_A_GLAD
module:      CLO
ttl_info:    Joao Pedro de Azevedo [eduanalytics@worldbank.org]
dofile_info: last modified by Ahmed Raza in Feburary 2, 2022
lastsave:    12 Feb 2022 15:51:25 by wb549384
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
assessment    867      1         .         .         .  Assessment
year          867      1      2015      2015      2015  Year of assessment
countrycode   867     55         .         .         .  WB country code (3 letters)
idgrade       867      4  6.131488         4         9  Grade ID
subgroup      867     12         .         .         .  Subgroups of countrycode idgrade
n_score_ti~h  867    701  3170.931        48     21177  Number of observations used to calculate m_score_timss_math
m_score_ti~h  867    779   488.501  328.9302  663.9952  Mean of score_timss_math
se_score_t~h  867    779  3.909695  .9858812  24.64586  Standard error of m_score_timss_math
n_score_ti~e  848    686   3002.46        48     21177  Number of observations used to calculate m_score_timss_scie
m_score_ti~e  848    762  491.8424  310.9902  645.4814  Mean of score_timss_scie
se_score_t~e  848    762  4.106619  1.654246   19.2154  Standard error of m_score_timss_scie
n_fgt1_scie   842    571  908.8112         4     10963  Number of observations used to calculate m_fgt1_scie
m_fgt1_scie   842    756  .1416673  .0453513    .35941  Mean of fgt1_scie
se_fgt1_scie  842    756  .0109563  .0033692  .1129274  Standard error of m_fgt1_scie
n_fgt1_math   860    610   1082.79         2     11309  Number of observations used to calculate m_fgt1_math
m_fgt1_math   860    771  .1348381  .0298228   .308764  Mean of fgt1_math
se_fgt1_math  860    771  .0097407  .0027594  .0862924  Standard error of m_fgt1_math
n_fgt2_scie   842    571  908.8112         4     10963  Number of observations used to calculate m_fgt2_scie
m_fgt2_scie   842    756  .0377505  .0032002  .1785395  Mean of fgt2_scie
se_fgt2_scie  842    756  .0043077  .0011885  .0245154  Standard error of m_fgt2_scie
n_fgt2_math   860    610   1082.79         2     11309  Number of observations used to calculate m_fgt2_math
m_fgt2_math   860    771  .0328544  .0017091  .1179329  Mean of fgt2_math
se_fgt2_math  860    771  .0034828   .001059  .0311268  Standard error of m_fgt2_math
n_sdg411_s~e  848    686   3002.46        48     21177  Number of observations used to calculate m_sdg411_scie
m_sdg411_s~e  848    762   .704229  .0241974  .9995892  Mean of sdg411_scie
se_sdg411_~e  848    762  .0157042  .0005458  .1132083  Standard error of m_sdg411_scie
n_sdg411_m~h  867    701  3170.931        48     21177  Number of observations used to calculate m_sdg411_math
m_sdg411_m~h  867    779   .677677   .028234         1  Mean of sdg411_math
se_sdg411_~h  867    779  .0152987         0  .0714896  Standard error of m_sdg411_math
n_bmp_scie    848    686   3002.46        48     21177  Number of observations used to calculate m_bmp_scie
m_bmp_scie    848    762   .295771  .0004108  .9758026  Mean of bmp_scie
se_bmp_scie   848    762  .0157042  .0005458  .1132083  Standard error of m_bmp_scie
n_bmp_math    867    701  3170.931        48     21177  Number of observations used to calculate m_bmp_math
m_bmp_math    867    779   .322323         0  .9717659  Mean of bmp_math
se_bmp_math   867    779  .0152987         0  .0714896  Standard error of m_bmp_math
m_d1level_~h  867    779  .2001168         0  .8243806  Mean of d1level_timss_math
se_d1level~h  867    779  .0136779         0  .0462161  Standard error of m_d1level_timss_math
m_d2level_~h  867    779  .2228243  .0048458  .4181248  Mean of d2level_timss_math
se_d2level~h  867    779  .0150373  .0020409  .0524859  Standard error of m_d2level_timss_math
m_d3level_~h  867    779  .2840433  .0263738  .4990333  Mean of d3level_timss_math
se_d3level~h  867    779  .0162365  .0048062  .1240082  Standard error of m_d3level_timss_math
m_d4level_~h  867    779  .2069324  .0018603  .5174269  Mean of d4level_timss_math
se_d4level~h  867    779  .0141271  .0008094  .1074588  Standard error of m_d4level_timss_math
m_d5level_~h  867    767  .0860832         0  .7749705  Mean of d5level_timss_math
se_d5level~h  867    767  .0091954         0  .1460237  Standard error of m_d5level_timss_math
m_d1level_~e  848    762   .180033  .0004108  .8504952  Mean of d1level_timss_scie
se_d1level~e  848    762  .0136227  .0005458  .0477691  Standard error of m_d1level_timss_scie
m_d2level_~e  848    762   .207358  .0138941  .3850068  Mean of d2level_timss_scie
se_d2level~e  848    762  .0151841  .0039646  .1231322  Standard error of m_d2level_timss_scie
m_d3level_~e  848    762  .3034449  .0224005  .5027351  Mean of d3level_timss_scie
se_d3level~e  848    762   .017021  .0038599  .0997563  Standard error of m_d3level_timss_scie
m_d4level_~e  848    762  .2315853  .0017601  .4925752  Mean of d4level_timss_scie
se_d4level~e  848    762  .0151809  .0008095   .128936  Standard error of m_d4level_timss_scie
m_d5level_~e  848    761  .0775788         0  .6807094  Mean of d5level_timss_scie
se_d5level~e  848    761  .0091703         0  .0663702  Standard error of m_d5level_timss_scie
n_total       867     89  6262.872      3600     21177  # learners, by countrycode idgrade
n_male        867     89  3152.824      1761     10860  # male learners, by countrycode idgrade
n_urban       867     89  4169.528       997     13585  # urban learners, by countrycode idgrade
n_has_qescs   867     89  6147.262         0     21177  # has_qescs learners, by countrycode idgrade
n_qescs       867     89   16325.7         0     51970  # qescs learners, by countrycode idgrade
--------------------------------------------------------------------------------------------------------------------

~~~~

About the **867     observations** in this dataset:

~~~~
. tab countrycode idgrade

WB country |
   code (3 |                  Grade ID
  letters) |         4          5          8          9 |     Total
-----------+--------------------------------------------+----------
       ARE |         8          0         11          0 |        19 
       ARM |         9          0          0         11 |        20 
       AUS |         8          0         11          0 |        19 
       BEL |         9          0          0          0 |         9 
       BGR |        10          0          0          0 |        10 
       BHR |         8          0         11          0 |        19 
       BWA |         0          0          0         11 |        11 
       CAN |         8          0         11          0 |        19 
       CHL |         9          0         11          0 |        20 
       CYP |         9          0          0          0 |         9 
       CZE |         8          0          0          0 |         8 
       DEU |         9          0          0          0 |         9 
       DNK |         8          0          0          0 |         8 
       EGY |         0          0         11          0 |        11 
       ESP |        10          0          0          0 |        10 
       FIN |         9          0          0          0 |         9 
       FRA |         9          0          0          0 |         9 
       GBR |        10          0         11          0 |        21 
       GEO |         8          0         11          0 |        19 
       HKG |         9          0         11          0 |        20 
       HRV |         8          0          0          0 |         8 
       HUN |         9          0         11          0 |        20 
       IDN |        10          0          0          0 |        10 
       IRL |         9          0         11          0 |        20 
       IRN |        11          0         11          0 |        22 
       ISR |         0          0         11          0 |        11 
       ITA |        10          0         11          0 |        21 
       JOR |         9          0         11          0 |        20 
       JPN |         9          0         11          0 |        20 
       KAZ |         9          0         11          0 |        20 
       KOR |         9          0         11          0 |        20 
       KWT |         8          0         11          0 |        19 
       LBN |         0          0         11          0 |        11 
       LTU |         8          0         11          0 |        19 
       MAR |         9          0         11          0 |        20 
       MLT |         0          0          0         11 |        11 
       MYS |         0          0         11          0 |        11 
       NLD |         8          0          0          0 |         8 
       NOR |         8          8         11         11 |        38 
       NZL |         0          8          0         11 |        19 
       OMN |        10          0         11          0 |        21 
       POL |         9          0          0          0 |         9 
       PRT |         9          0          0          0 |         9 
       QAT |         8          0         11          0 |        19 
       RUS |         8          0         11          0 |        19 
       SAU |         9          0         11          0 |        20 
       SGP |         8          0         10          0 |        18 
       SRB |         9          0          0          0 |         9 
       SVK |         8          0          0          0 |         8 
       SVN |         8          0         11          0 |        19 
       SWE |         9          0         11          0 |        20 
       THA |         0          0         11          0 |        11 
       TUR |         9          0         11          0 |        20 
       USA |         6          0         11          0 |        17 
       ZAF |         0         10          0         11 |        21 
-----------+--------------------------------------------+----------
     Total |       402         26        373         66 |       867 

. 
. tab subgroup

  Subgroups |
         of |
countrycode |
    idgrade |      Freq.     Percent        Cum.
------------+-----------------------------------
        all |         89       10.27       10.27
has_qescs=0 |          2        0.23       10.50
has_qescs=1 |         88       10.15       20.65
     male=0 |         89       10.27       30.91
     male=1 |         89       10.27       41.18
    qescs=1 |         88       10.15       51.33
    qescs=2 |         68        7.84       59.17
    qescs=3 |         72        8.30       67.47
    qescs=4 |         59        6.81       74.28
    qescs=5 |         47        5.42       79.70
    urban=0 |         87       10.03       89.73
    urban=1 |         89       10.27      100.00
------------+-----------------------------------
      Total |        867      100.00

~~~~
