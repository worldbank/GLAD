Documentation of CLO dataset
=====================================================================


[back to list of assessments](https://github.com/worldbank/GLAD/blob/master/README.md#indicators)

This dataset contains harmonized aggregated data from LLECE-T 2019 and is part of the Country Level Outcomes (CLO)

**Metadata** stored in this dataset:

~~~~
region:      LAC
year:        2019
assessment:  LLECE-T
master:      v01_M
adaptation:  wrk_A_GLAD
module:      CLO
ttl_info:    Joao Pedro de Azevedo [eduanalytics@worldbank.org]
dofile_info: last modified by Alison Gilberto in May 17, 2022
lastsave:    9 Jun 2022 07:11:33 by wb576911
~~~~


About the **56 variables** in this dataset:

~~~~
The variables belong to the following variable classifications:
idvars valuevars traitvars

idvars:    assessment year countrycode idgrade subgroup
valuevars: n_score_llece_read m_score_llece_read se_score_llece_read n_score_llece_math m_score_llece_math se_score_llece_math n_fgt1_read m_fgt1_read se_fgt1_read n_fgt1_math m_fgt1_math se_fgt1_math n_fgt2_read m_fgt2_read se_fgt2_read n_fgt2_math m_fgt2_math se_fgt2_math n_sdg411_read m_sdg411_read se_sdg411_read n_sdg411_math m_sdg411_math se_sdg411_math n_bmp_read m_bmp_read se_bmp_read n_bmp_math m_bmp_math se_bmp_math m_d1level_llece_read se_d1level_llece_read m_d2level_llece_read se_d2level_llece_read m_d3level_llece_read se_d3level_llece_read m_d4level_llece_read se_d4level_llece_read m_d1level_llece_math se_d1level_llece_math m_d2level_llece_math se_d2level_llece_math m_d3level_llece_math se_d3level_llece_math m_d4level_llece_math se_d4level_llece_math
traitvars: n_total n_male n_urban n_has_qescs n_qescs

. codebook, compact

Variable      Obs Unique      Mean       Min       Max  Label
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
assessment    368      1         .         .         .  Assessment
year          368      1      2019      2019      2019  Year of assessment
countrycode   368     16         .         .         .  WB country code (3 letters)
idgrade       368      2  4.434783         3         6  Grade ID
subgroup      368     12         .         .         .  Subgroups of countrycode idgrade
n_score_ll~d  368    331  2184.367         1      6758  Number of observations used to calculate m_score_llece_read
m_score_ll~d  368    352  693.0342  553.8798   821.538  Mean of score_llece_read
se_score_l~d  368    352  5.482003  2.897923  81.08331  Standard error of m_score_llece_read
n_score_ll~h  368    331  2184.367         1      6758  Number of observations used to calculate m_score_llece_math
m_score_ll~h  368    352  693.2016  550.3417  833.5431  Mean of score_llece_math
se_score_l~h  368    352  5.139152    2.1253  32.67412  Standard error of m_score_llece_math
n_fgt1_read   368    319   1394.13         1      4911  Number of observations used to calculate m_fgt1_read
m_fgt1_read   368    352  .1409117  .0709985  .2550548  Mean of fgt1_read
se_fgt1_read  368    352  .0060601  .0022446  .1112254  Standard error of m_fgt1_read
n_fgt1_math   368    330  1677.742         1      5473  Number of observations used to calculate m_fgt1_math
m_fgt1_math   368    352  .1420004  .0697863   .266211  Mean of fgt1_math
se_fgt1_math  368    352  .0050441  .0019447  .0435655  Standard error of m_fgt1_math
n_fgt2_read   368    319   1394.13         1      4911  Number of observations used to calculate m_fgt2_read
m_fgt2_read   368    352  .0290253  .0088569  .0757822  Mean of fgt2_read
se_fgt2_read  368    352  .0022318   .000692  .0321936  Standard error of m_fgt2_read
n_fgt2_math   368    330  1677.742         1      5473  Number of observations used to calculate m_fgt2_math
m_fgt2_math   368    352   .027911  .0076682  .0745014  Mean of fgt2_math
se_fgt2_math  368    352  .0017622  .0004603  .0149544  Standard error of m_fgt2_math
n_sdg411_r~d  368    331  2184.367         1      6758  Number of observations used to calculate m_sdg411_read
m_sdg411_r~d  368    352  .3329445         0  .8271353  Mean of sdg411_read
se_sdg411_~d  368    352  .0211841         0  .1266971  Standard error of m_sdg411_read
n_sdg411_m~h  368    331  2184.367         1      6758  Number of observations used to calculate m_sdg411_math
m_sdg411_m~h  368    351  .2167567         0   .742358  Mean of sdg411_math
se_sdg411_~h  368    351  .0185428         0  .1306369  Standard error of m_sdg411_math
n_bmp_read    368    331  2184.367         1      6758  Number of observations used to calculate m_bmp_read
m_bmp_read    368    352  .6670555  .1728647         1  Mean of bmp_read
se_bmp_read   368    352  .0211841         0  .1266971  Standard error of m_bmp_read
n_bmp_math    368    331  2184.367         1      6758  Number of observations used to calculate m_bmp_math
m_bmp_math    368    351  .7832433  .2576419         1  Mean of bmp_math
se_bmp_math   368    351  .0185428         0  .1306369  Standard error of m_bmp_math
m_d1level_~d  368    352  .3549013  .0107215  .9640141  Mean of d1level_llece_read
se_d1level~d  368    352  .0241934  .0052708  .4898979  Standard error of m_d1level_llece_read
m_d2level_~d  368    352  .3106019  .0286989  .5854048  Mean of d2level_llece_read
se_d2level~d  368    352  .0218992  .0066762  .4898979  Standard error of m_d2level_llece_read
m_d3level_~d  368    352  .1825942         0  .3434741  Mean of d3level_llece_read
se_d3level~d  368    352  .0174877         0  .1302007  Standard error of m_d3level_llece_read
m_d4level_~d  368    351  .1519025         0  .5467722  Mean of d4level_llece_read
se_d4level~d  368    351  .0146399         0  .0709602  Standard error of m_d4level_llece_read
m_d1level_~h  368    351  .5026564  .0812347         1  Mean of d1level_llece_math
se_d1level~h  368    351  .0247655         0  .1381327  Standard error of m_d1level_llece_math
m_d2level_~h  368    351  .2794377         0  .5324614  Mean of d2level_llece_math
se_d2level~h  368    351  .0209806         0  .1400269  Standard error of m_d2level_llece_math
m_d3level_~h  368    351  .1607567         0  .4233613  Mean of d3level_llece_math
se_d3level~h  368    351  .0161331         0  .1132503  Standard error of m_d3level_llece_math
m_d4level_~h  368    333  .0571492         0  .4026963  Mean of d4level_llece_math
se_d4level~h  368    333  .0094651         0  .1096026  Standard error of m_d4level_llece_math
n_total       368     32  5034.894      3593      6758  # learners, by countrycode idgrade
n_male        368     32  2536.495      1812      3358  # male learners, by countrycode idgrade
n_urban       368     31  1218.457        33      3454  # urban learners, by countrycode idgrade
n_has_qescs   368     32  4974.633      3568      6758  # has_qescs learners, by countrycode idgrade
n_qescs       368     32  15607.92     11017     20781  # qescs learners, by countrycode idgrade
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

~~~~

About the **368     observations** in this dataset:

~~~~
. tab countrycode idgrade

WB country |
   code (3 |       Grade ID
  letters) |         3          6 |     Total
-----------+----------------------+----------
       ARG |        12         11 |        23 
       BRA |        12         11 |        23 
       COL |        12         11 |        23 
       CRI |        12         11 |        23 
       CUB |        12         11 |        23 
       DOM |        12         11 |        23 
       ECU |        12         11 |        23 
       GTM |        12         11 |        23 
       HND |        12         11 |        23 
       MEX |        12         11 |        23 
       NIC |        12         11 |        23 
       PAN |        12         11 |        23 
       PER |        12         11 |        23 
       PRY |        12         11 |        23 
       SLV |        12         11 |        23 
       URY |        12         11 |        23 
-----------+----------------------+----------
     Total |       192        176 |       368 

. 
. tab subgroup

  Subgroups |
         of |
countrycode |
    idgrade |      Freq.     Percent        Cum.
------------+-----------------------------------
        all |         32        8.70        8.70
has_qescs=0 |         16        4.35       13.04
has_qescs=1 |         32        8.70       21.74
     male=0 |         32        8.70       30.43
     male=1 |         32        8.70       39.13
    qescs=1 |         32        8.70       47.83
    qescs=2 |         32        8.70       56.52
    qescs=3 |         32        8.70       65.22
    qescs=4 |         32        8.70       73.91
    qescs=5 |         32        8.70       82.61
    urban=0 |         32        8.70       91.30
    urban=1 |         32        8.70      100.00
------------+-----------------------------------
      Total |        368      100.00

~~~~
