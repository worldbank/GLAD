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
dofile_info: last modified by Diana Goldemberg in March 9, 2020
lastsave:    14 Jun 2021 22:39:21 by wb255520
~~~~


About the **44 variables** in this dataset:

~~~~
The variables belong to the following variable classifications:
idvars valuevars traitvars

idvars:    assessment year countrycode idgrade subgroup
valuevars: n_score_pasec_read m_score_pasec_read se_score_pasec_read n_score_pasec_math m_score_pasec_math se_score_pasec_math n_fgt1_read m_fgt1_read se_fgt1_read n_fgt2_read m_fgt2_read se_fgt2_read n_sdg411_read m_sdg411_read se_sdg411_read n_bmp_read m_bmp_read se_bmp_read m_d1level_pasec_read se_d1level_pasec_read m_d2level_pasec_read se_d2level_pasec_read m_d3level_pasec_read se_d3level_pasec_read m_d4level_pasec_read se_d4level_pasec_read m_d5level_pasec_read se_d5level_pasec_read m_d1level_pasec_math se_d1level_pasec_math m_d2level_pasec_math se_d2level_pasec_math m_d3level_pasec_math se_d3level_pasec_math m_d4level_pasec_math se_d4level_pasec_math
traitvars: n_total n_male n_urban

. codebook, compact

Variable      Obs Unique      Mean       Min       Max  Label
---------------------------------------------------------------------------------------------------------------------------------------
assessment    364      1         .         .         .  Assessment
year          364      1      2019      2019      2019  Year of assessment
countrycode   364     14         .         .         .  WB country code (3 letters)
idgrade       364      2         4         2         6  Grade ID
subgroup      364     13         .         .         .  Subgroups of countrycode idgrade
n_score_pa~d  140    138   1803.05       199      6499  Number of observations used to calculate m_score_pasec_read
m_score_pa~d  140    140  529.6597  425.7974  663.0529  Mean of score_pasec_read
se_score_p~d  140    140  8.123971  1.999109   23.6634  Standard error of m_score_pasec_read
n_score_pa~h  140    138   1803.05       199      6499  Number of observations used to calculate m_score_pasec_math
m_score_pa~h  140    140  522.3576  421.7968  624.5462  Mean of score_pasec_math
se_score_p~h  140    140  6.815302  2.370557  17.64849  Standard error of m_score_pasec_math
n_fgt1_read    70     67  2063.857       125      5082  Number of observations used to calculate m_fgt1_read
m_fgt1_read    70     70  .1980038  .0828117  .3016796  Mean of fgt1_read
se_fgt1_read   70     70  .0074962  .0028621  .0183407  Standard error of m_fgt1_read
n_fgt2_read    70     67  2063.857       125      5082  Number of observations used to calculate m_fgt2_read
m_fgt2_read    70     70    .05536  .0115295  .1076376  Mean of fgt2_read
se_fgt2_read   70     70  .0038196  .0010635  .0104169  Standard error of m_fgt2_read
n_sdg411_r~d   70     70  2678.043       329      6499  Number of observations used to calculate m_sdg411_read
m_sdg411_r~d   70     70  .2652898  .0122195  .7883767  Mean of sdg411_read
se_sdg411_~d   70     70  .0214822  .0035501  .0780573  Standard error of m_sdg411_read
n_bmp_read     70     70  2678.043       329      6499  Number of observations used to calculate m_bmp_read
m_bmp_read     70     70  .7347102  .2116233  .9877805  Mean of bmp_read
se_bmp_read    70     70  .0214822  .0035501  .0780573  Standard error of m_bmp_read
m_d1level_~d  140    140  .0708123         0  .3551251  Mean of d1level_pasec_read
se_d1level~d  140    140  .0142275         0  .0592449  Standard error of m_d1level_pasec_read
m_d2level_~d  140    140   .193555  .0072368  .4748784  Mean of d2level_pasec_read
se_d2level~d  140    140  .0212941  .0028743  .0586882  Standard error of m_d2level_pasec_read
m_d3level_~d  140    140  .2688788  .0407436  .5433363  Mean of d3level_pasec_read
se_d3level~d  140    140  .0246906  .0068643  .0881745  Standard error of m_d3level_pasec_read
m_d4level_~d  140    140  .2161532  .0803289  .3861249  Mean of d4level_pasec_read
se_d4level~d  140    140  .0224922  .0100616  .0662606  Standard error of m_d4level_pasec_read
m_d5level_~d  140    140  .2506008  .0122195  .7883767  Mean of d5level_pasec_read
se_d5level~d  140    140  .0279637  .0035501  .0868066  Standard error of m_d5level_pasec_read
m_d1level_~h  140    136  .1643939         0  .6060726  Mean of d1level_pasec_math
se_d1level~h  140    136  .0181203         0  .0524332  Standard error of m_d1level_pasec_math
m_d2level_~h  140    140  .2854877  .0124545  .4602627  Mean of d2level_pasec_math
se_d2level~h  140    140  .0231346  .0041281  .0569983  Standard error of m_d2level_pasec_math
m_d3level_~h  140    140  .2977328  .0714258  .4860656  Mean of d3level_pasec_math
se_d3level~h  140    140  .0239394  .0106154   .064791  Standard error of m_d3level_pasec_math
m_d4level_~h  140    140  .2523856  .0118902  .8516302  Mean of d4level_pasec_math
se_d4level~h  140    140  .0259727  .0043991  .0860958  Standard error of m_d4level_pasec_math
n_total       364     28  3030.964      1050      6499  # learners, by countrycode idgrade
n_male        364     28  1551.179       544      3100  # male learners, by countrycode idgrade
n_urban       364     27  1190.321       321      2700  # urban learners, by countrycode idgrade
---------------------------------------------------------------------------------------------------------------------------------------

~~~~

About the **364     observations** in this dataset:

~~~~
. tab countrycode idgrade

WB country |
   code (3 |       Grade ID
  letters) |         2          6 |     Total
-----------+----------------------+----------
       BDI |        13         13 |        26 
       BEN |        13         13 |        26 
       BFA |        13         13 |        26 
       CIV |        13         13 |        26 
       CMR |        13         13 |        26 
       COD |        13         13 |        26 
       COG |        13         13 |        26 
       GAB |        13         13 |        26 
       GIN |        13         13 |        26 
       MDG |        13         13 |        26 
       NER |        13         13 |        26 
       SEN |        13         13 |        26 
       TCD |        13         13 |        26 
       TGO |        13         13 |        26 
-----------+----------------------+----------
     Total |       182        182 |       364 

. 
. tab subgroup

  Subgroups |
         of |
countrycode |
    idgrade |      Freq.     Percent        Cum.
------------+-----------------------------------
        all |         28        7.69        7.69
     male=0 |         28        7.69       15.38
     male=1 |         28        7.69       23.08
     male=2 |         28        7.69       30.77
     male=3 |         28        7.69       38.46
     male=4 |         28        7.69       46.15
     male=5 |         28        7.69       53.85
    urban=0 |         28        7.69       61.54
    urban=1 |         28        7.69       69.23
    urban=2 |         28        7.69       76.92
    urban=3 |         28        7.69       84.62
    urban=4 |         28        7.69       92.31
    urban=5 |         28        7.69      100.00
------------+-----------------------------------
      Total |        364      100.00

~~~~
