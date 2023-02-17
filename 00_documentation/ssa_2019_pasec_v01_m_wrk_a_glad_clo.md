Documentation of CLO dataset
=====================================================================


[back to list of assessments](https://github.com/worldbank/GLAD/blob/master/README.md#indicators)

This dataset contains harmonized aggregated data from PASEC 2019 and is part of the Country Level Outcomes (CLO)

**Metadata** stored in this dataset:

~~~~
region:      SSA
year:        2019
assessment:  PASEC
master:      v01_M
adaptation:  wrk_A_GLAD
module:      CLO
ttl_info:    Joao Pedro de Azevedo [eduanalytics@worldbank.org]
dofile_info: last modified by Ahmed Raza in Feburary 2, 2022
lastsave:    7 Feb 2022 12:28:30 by wb549384
~~~~


About the **58 variables** in this dataset:

~~~~
The variables belong to the following variable classifications:
idvars valuevars traitvars

idvars:    assessment year countrycode idgrade subgroup
valuevars: n_score_pasec_read m_score_pasec_read se_score_pasec_read n_score_pasec_math m_score_pasec_math se_score_pasec_math n_fgt1_read m_fgt1_read se_fgt1_read n_fgt1_math m_fgt1_math se_fgt1_math n_fgt2_read m_fgt2_read se_fgt2_read n_fgt2_math m_fgt2_math se_fgt2_math n_sdg411_read m_sdg411_read se_sdg411_read n_sdg411_math m_sdg411_math se_sdg411_math n_bmp_read m_bmp_read se_bmp_read n_bmp_math m_bmp_math se_bmp_math m_d1level_pasec_read se_d1level_pasec_read m_d2level_pasec_read se_d2level_pasec_read m_d3level_pasec_read se_d3level_pasec_read m_d4level_pasec_read se_d4level_pasec_read m_d5level_pasec_read se_d5level_pasec_read m_d1level_pasec_math se_d1level_pasec_math m_d2level_pasec_math se_d2level_pasec_math m_d3level_pasec_math se_d3level_pasec_math m_d4level_pasec_math se_d4level_pasec_math
traitvars: n_total n_male n_urban n_has_qescs n_qescs

. codebook, compact

Variable      Obs Unique      Mean       Min       Max  Label
--------------------------------------------------------------------------------------------------------------------
assessment    238      1         .         .         .  Assessment
year          238      1      2019      2019      2019  Year of assessment
countrycode   238     14         .         .         .  WB country code (3 letters)
idgrade       238      2  4.588235         2         6  Grade ID
subgroup      238     12         .         .         .  Subgroups of countrycode idgrade
n_score_pa~d  238    204   1681.63       199      6499  Number of observations used to calculate m_score_pasec_read
m_score_pa~d  238    210  527.0106  425.7974  663.0529  Mean of score_pasec_read
se_score_p~d  238    210  7.700197  1.999109   23.6634  Standard error of m_score_pasec_read
n_score_pa~h  238    204   1681.63       199      6499  Number of observations used to calculate m_score_pasec_math
m_score_pa~h  238    210  515.5183  421.7968  624.5462  Mean of score_pasec_math
se_score_p~h  238    210  6.588924  2.370557  18.27863  Standard error of m_score_pasec_math
n_fgt1_read   238    192  1220.609        46      5082  Number of observations used to calculate m_fgt1_read
m_fgt1_read   238    210  .1773035  .0672181  .3016796  Mean of fgt1_read
se_fgt1_read  238    210  .0091456  .0028621  .0336185  Standard error of m_fgt1_read
n_fgt1_math   238    206  1271.483         5      5265  Number of observations used to calculate m_fgt1_math
m_fgt1_math   238    210  .1788266  .0305081   .312445  Mean of fgt1_math
se_fgt1_math  238    210  .0085005  .0031147  .0412563  Standard error of m_fgt1_math
n_fgt2_read   238    192  1220.609        46      5082  Number of observations used to calculate m_fgt2_read
m_fgt2_read   238    210  .0473298  .0071566  .1076376  Mean of fgt2_read
se_fgt2_read  238    210  .0045138  .0008455  .0307037  Standard error of m_fgt2_read
n_fgt2_math   238    206  1271.483         5      5265  Number of observations used to calculate m_fgt2_math
m_fgt2_math   238    210  .0473103  .0014862   .109529  Mean of fgt2_math
se_fgt2_math  238    210   .003842  .0007705  .0333536  Standard error of m_fgt2_math
n_sdg411_r~d  238    204   1681.63       199      6499  Number of observations used to calculate m_sdg411_read
m_sdg411_r~d  238    210  .3297024  .0086474  .8683842  Mean of sdg411_read
se_sdg411_~d  238    210   .029246  .0035501  .1109006  Standard error of m_sdg411_read
n_sdg411_m~h  238    204   1681.63       199      6499  Number of observations used to calculate m_sdg411_math
m_sdg411_m~h  238    210  .3353461  .0085111  .9875455  Mean of sdg411_math
se_sdg411_~h  238    210  .0223487  .0041281  .0760451  Standard error of m_sdg411_math
n_bmp_read    238    204   1681.63       199      6499  Number of observations used to calculate m_bmp_read
m_bmp_read    238    210  .6702976  .1316158  .9913526  Mean of bmp_read
se_bmp_read   238    210   .029246  .0035501  .1109006  Standard error of m_bmp_read
n_bmp_math    238    204   1681.63       199      6499  Number of observations used to calculate m_bmp_math
m_bmp_math    238    210  .6646539  .0124545  .9914889  Mean of bmp_math
se_bmp_math   238    210  .0223487  .0041281  .0760451  Standard error of m_bmp_math
m_d1level_~d  238    206  .0672319         0  .3551251  Mean of d1level_pasec_read
se_d1level~d  238    206  .0136327         0  .0592449  Standard error of m_d1level_pasec_read
m_d2level_~d  238    210  .1983682  .0031851  .5421599  Mean of d2level_pasec_read
se_d2level~d  238    210  .0212826  .0028743  .0586882  Standard error of m_d2level_pasec_read
m_d3level_~d  238    210   .262946  .0258493  .5558231  Mean of d3level_pasec_read
se_d3level~d  238    210  .0237466  .0068643  .0881745  Standard error of m_d3level_pasec_read
m_d4level_~d  238    210  .2165163   .058921  .3861249  Mean of d4level_pasec_read
se_d4level~d  238    210  .0222668  .0100616  .0662606  Standard error of m_d4level_pasec_read
m_d5level_~d  238    210  .2549376  .0086474  .8175315  Mean of d5level_pasec_read
se_d5level~d  238    210  .0267644  .0035501  .0868066  Standard error of m_d5level_pasec_read
m_d1level_~h  238    206  .1924776         0  .6060726  Mean of d1level_pasec_math
se_d1level~h  238    206  .0205157         0  .0524332  Standard error of m_d1level_pasec_math
m_d2level_~h  238    210  .3062367  .0124545  .4746719  Mean of d2level_pasec_math
se_d2level~h  238    210   .024456  .0041281  .0633825  Standard error of m_d2level_pasec_math
m_d3level_~h  238    210   .285654  .0651856  .4860656  Mean of d3level_pasec_math
se_d3level~h  238    210  .0238504  .0106154   .064791  Standard error of m_d3level_pasec_math
m_d4level_~h  238    210  .2156317  .0085111  .8516302  Mean of d4level_pasec_math
se_d4level~h  238    210    .02376  .0043991  .0860958  Standard error of m_d4level_pasec_math
n_total       238     28  3461.647      1050      6499  # learners, by countrycode idgrade
n_male        238     28  1767.429       544      3100  # male learners, by countrycode idgrade
n_urban       238     27  1365.668       321      2700  # urban learners, by countrycode idgrade
n_has_qescs   238     15  2908.714         0      6499  # has_qescs learners, by countrycode idgrade
n_qescs       238     15  8241.496         0     17662  # qescs learners, by countrycode idgrade
--------------------------------------------------------------------------------------------------------------------

~~~~

About the **238     observations** in this dataset:

~~~~
. tab countrycode idgrade

WB country |
   code (3 |       Grade ID
  letters) |         2          6 |     Total
-----------+----------------------+----------
       BDI |         6         11 |        17 
       BEN |         6         11 |        17 
       BFA |         6         11 |        17 
       CIV |         6         11 |        17 
       CMR |         6         11 |        17 
       COD |         6         11 |        17 
       COG |         6         11 |        17 
       GAB |         6         11 |        17 
       GIN |         6         11 |        17 
       MDG |         6         11 |        17 
       NER |         6         11 |        17 
       SEN |         6         11 |        17 
       TCD |         6         11 |        17 
       TGO |         6         11 |        17 
-----------+----------------------+----------
     Total |        84        154 |       238 

. 
. tab subgroup

  Subgroups |
         of |
countrycode |
    idgrade |      Freq.     Percent        Cum.
------------+-----------------------------------
        all |         28       11.76       11.76
has_qescs=0 |         14        5.88       17.65
has_qescs=1 |         14        5.88       23.53
     male=0 |         28       11.76       35.29
     male=1 |         28       11.76       47.06
    qescs=1 |         14        5.88       52.94
    qescs=2 |         14        5.88       58.82
    qescs=3 |         14        5.88       64.71
    qescs=4 |         14        5.88       70.59
    qescs=5 |         14        5.88       76.47
    urban=0 |         28       11.76       88.24
    urban=1 |         28       11.76      100.00
------------+-----------------------------------
      Total |        238      100.00

~~~~
