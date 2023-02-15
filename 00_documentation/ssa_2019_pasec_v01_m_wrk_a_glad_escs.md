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
module:      ESCS
ttl_info:    Joao Pedro de Azevedo [eduanalytics@worldbank.org]
dofile_info: last modified by Diana Goldemberg in April 15, 2020
lastsave:    15 Jun 2021 07:53:15 by wb255520
~~~~


About the **46 variables** in this dataset:

~~~~
The variables belong to the following variable classifications:
idvars valuevars traitvars

idvars:    assessment year countrycode idgrade subgroup
valuevars: n_score_pasec_read m_score_pasec_read se_score_pasec_read n_score_pasec_math m_score_pasec_math se_score_pasec_math n_fgt1_read m_fgt1_read se_fgt1_read n_fgt2_read m_fgt2_read se_fgt2_read n_sdg411_read m_sdg411_read se_sdg411_read n_bmp_read m_bmp_read se_bmp_read m_d1level_pasec_read se_d1level_pasec_read m_d2level_pasec_read se_d2level_pasec_read m_d3level_pasec_read se_d3level_pasec_read m_d4level_pasec_read se_d4level_pasec_read m_d5level_pasec_read se_d5level_pasec_read m_d1level_pasec_math se_d1level_pasec_math m_d2level_pasec_math se_d2level_pasec_math m_d3level_pasec_math se_d3level_pasec_math m_d4level_pasec_math se_d4level_pasec_math
traitvars: n_total n_male n_urban n_has_qescs n_qescs

. codebook, compact

Variable      Obs Unique      Mean       Min       Max  Label
-----------------------------------------------------------------------------------------------------
assessment    700      1         .         .         .  Assessment
year          700      1      2019      2019      2019  Year of assessment
countrycode   700     14         .         .         .  WB country code (3 letters)
idgrade       700      2         4         2         6  Grade ID
subgroup      700     25         .         .         .  Subgroups of countrycode idgrade
n_score_pa~d  238    204   1681.63       199      6499  Number of observations used to calculate m...
m_score_pa~d  238    210  527.0106  425.7974  663.0529  Mean of score_pasec_read
se_score_p~d  238    210  7.700197  1.999109   23.6634  Standard error of m_score_pasec_read
n_score_pa~h  238    204   1681.63       199      6499  Number of observations used to calculate m...
m_score_pa~h  238    210  515.5183  421.7968  624.5462  Mean of score_pasec_math
se_score_p~h  238    210  6.588924  2.370557  18.27863  Standard error of m_score_pasec_math
n_fgt1_read   154    131  1567.519        89      5082  Number of observations used to calculate m...
m_fgt1_read   154    140  .1973915  .0718065  .3016796  Mean of fgt1_read
se_fgt1_read  154    140  .0083265  .0028621   .025352  Standard error of m_fgt1_read
n_fgt2_read   154    131  1567.519        89      5082  Number of observations used to calculate m...
m_fgt2_read   154    140  .0551654  .0090141  .1076376  Mean of fgt2_read
se_fgt2_read  154    140   .004187  .0010635  .0121043  Standard error of m_fgt2_read
n_sdg411_r~d  154    139  2034.617       329      6499  Number of observations used to calculate m...
m_sdg411_r~d  154    140  .2654368  .0086474  .8175315  Mean of sdg411_read
se_sdg411_~d  154    140  .0232265  .0035501    .08367  Standard error of m_sdg411_read
n_bmp_read    154    139  2034.617       329      6499  Number of observations used to calculate m...
m_bmp_read    154    140  .7345632  .1824685  .9913526  Mean of bmp_read
se_bmp_read   154    140  .0232265  .0035501    .08367  Standard error of m_bmp_read
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
n_total       700     28  3030.964      1050      6499  # learners, by countrycode idgrade
n_male        700     28  1551.179       544      3100  # male learners, by countrycode idgrade
n_urban       700     27  1190.321       321      2700  # urban learners, by countrycode idgrade
n_has_qescs   700     15  2247.643         0      6499  # has_qescs learners, by countrycode idgrade
n_qescs       700     15  6368.429         0     17662  # qescs learners, by countrycode idgrade
-----------------------------------------------------------------------------------------------------

~~~~

About the **700     observations** in this dataset:

~~~~
. tab countrycode idgrade

WB country |
   code (3 |       Grade ID
  letters) |         2          6 |     Total
-----------+----------------------+----------
       BDI |        25         25 |        50 
       BEN |        25         25 |        50 
       BFA |        25         25 |        50 
       CIV |        25         25 |        50 
       CMR |        25         25 |        50 
       COD |        25         25 |        50 
       COG |        25         25 |        50 
       GAB |        25         25 |        50 
       GIN |        25         25 |        50 
       MDG |        25         25 |        50 
       NER |        25         25 |        50 
       SEN |        25         25 |        50 
       TCD |        25         25 |        50 
       TGO |        25         25 |        50 
-----------+----------------------+----------
     Total |       350        350 |       700 

. 
. tab subgroup

  Subgroups |
         of |
countrycode |
    idgrade |      Freq.     Percent        Cum.
------------+-----------------------------------
        all |         28        4.00        4.00
has_qescs=0 |         28        4.00        8.00
has_qescs=1 |         28        4.00       12.00
has_qescs=2 |         28        4.00       16.00
has_qescs=3 |         28        4.00       20.00
has_qescs=4 |         28        4.00       24.00
has_qescs=5 |         28        4.00       28.00
     male=0 |         28        4.00       32.00
     male=1 |         28        4.00       36.00
     male=2 |         28        4.00       40.00
     male=3 |         28        4.00       44.00
     male=4 |         28        4.00       48.00
     male=5 |         28        4.00       52.00
    qescs=0 |         28        4.00       56.00
    qescs=1 |         28        4.00       60.00
    qescs=2 |         28        4.00       64.00
    qescs=3 |         28        4.00       68.00
    qescs=4 |         28        4.00       72.00
    qescs=5 |         28        4.00       76.00
    urban=0 |         28        4.00       80.00
    urban=1 |         28        4.00       84.00
    urban=2 |         28        4.00       88.00
    urban=3 |         28        4.00       92.00
    urban=4 |         28        4.00       96.00
    urban=5 |         28        4.00      100.00
------------+-----------------------------------
      Total |        700      100.00

~~~~
