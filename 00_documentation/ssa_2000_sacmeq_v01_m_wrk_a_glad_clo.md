Documentation of CLO dataset
=====================================================================


[back to list of assessments](https://github.com/worldbank/GLAD/blob/master/README.md#indicators)

This dataset contains harmonized aggregated data from SACMEQ 2000 and is part of the Country Level Outcomes (CLO)

**Metadata** stored in this dataset:

~~~~
region:      SSA
year:        2000
assessment:  SACMEQ
master:      v01_M
adaptation:  wrk_A_GLAD
module:      CLO
ttl_info:    Joao Pedro de Azevedo [eduanalytics@worldbank.org]
dofile_info: last modified by Diana Goldemberg in October 8, 2019
lastsave:    9 Oct 2019 21:01:34 by wb552057
~~~~


About the **47 variables** in this dataset:

~~~~
The variables belong to the following variable classifications:
idvars valuevars traitvars

idvars:    countrycode idgrade subgroup
valuevars: n_hpro_read m_hpro_read se_hpro_read n_score_sacmeq_read m_score_sacmeq_read se_score_sacmeq_read n_score_sacmeq_math m_score_sacmeq_math se_score_sacmeq_math m_d1level_sacmeq_read se_d1level_sacmeq_read m_d2level_sacmeq_read se_d2level_sacmeq_read m_d3level_sacmeq_read se_d3level_sacmeq_read m_d4level_sacmeq_read se_d4level_sacmeq_read m_d5level_sacmeq_read se_d5level_sacmeq_read m_d6level_sacmeq_read se_d6level_sacmeq_read m_d7level_sacmeq_read se_d7level_sacmeq_read m_d8level_sacmeq_read se_d8level_sacmeq_read m_d1level_sacmeq_math se_d1level_sacmeq_math m_d2level_sacmeq_math se_d2level_sacmeq_math m_d3level_sacmeq_math se_d3level_sacmeq_math m_d4level_sacmeq_math se_d4level_sacmeq_math m_d5level_sacmeq_math se_d5level_sacmeq_math m_d6level_sacmeq_math se_d6level_sacmeq_math m_d7level_sacmeq_math se_d7level_sacmeq_math m_d8level_sacmeq_math se_d8level_sacmeq_math
traitvars: n_total n_male n_urban

. codebook, compact

Variable      Obs Unique      Mean       Min       Max  Label
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
countrycode    65     13         .         .         .  WB country code (3 letters)
idgrade        65      1         6         6         6  Grade ID
subgroup       65      5         .         .         .  Subgroups of countrycode idgrade
n_hpro_read    65     63  1804.108       244      5048  Number of observations used to calculate m_hpro_read
m_hpro_read    65     65  .4099636  .0344869  .8678353  Mean of hpro_read
se_hpro_read   65     65  .0109769    .00344  .0297021  Standard error of m_hpro_read
n_score_sa~d   65     63  1804.108       244      5048  Number of observations used to calculate m_score_sacmeq_read
m_score_sa~d   65     65  503.0659  410.5696  614.2132  Mean of score_sacmeq_read
se_score_s~d   65     65  2.231401  .8830173  7.694844  Standard error of m_score_sacmeq_read
n_score_sa~h   65     62  1791.292       244      4990  Number of observations used to calculate m_score_sacmeq_math
m_score_sa~h   65     65  502.8015  404.6862   591.299  Mean of score_sacmeq_math
se_score_s~h   65     65  2.211922  1.013007  6.871566  Standard error of m_score_sacmeq_math
m_d1level_~d   65     65  .0671134         0   .269041  Mean of d1level_sacmeq_read
se_d1level~d   65     65  .0055916         0  .0127415  Standard error of m_d1level_sacmeq_read
m_d2level_~d   65     65  .1483316  .0096179  .3757374  Mean of d2level_sacmeq_read
se_d2level~d   65     65  .0080735  .0023145  .0172565  Standard error of m_d2level_sacmeq_read
m_d3level_~d   65     65  .1792652   .020165  .3594898  Mean of d3level_sacmeq_read
se_d3level~d   65     65  .0092591  .0053975  .0177359  Standard error of m_d3level_sacmeq_read
m_d4level_~d   65     65  .1953262  .0974855  .3623223  Mean of d4level_sacmeq_read
se_d4level~d   65     65  .0098868   .004934  .0204202  Standard error of m_d4level_sacmeq_read
m_d5level_~d   65     65  .1657839   .027479   .332299  Mean of d5level_sacmeq_read
se_d5level~d   65     65  .0089915  .0030648   .022479  Standard error of m_d5level_sacmeq_read
m_d6level_~d   65     65  .1104287  .0054425  .2793967  Mean of d6level_sacmeq_read
se_d6level~d   65     65  .0075459  .0014707  .0246867  Standard error of m_d6level_sacmeq_read
m_d7level_~d   65     65  .0926687  .0006194  .3140986  Mean of d7level_sacmeq_read
se_d7level~d   65     65  .0067022  .0006249  .0279381  Standard error of m_d7level_sacmeq_read
m_d8level_~d   65     59  .0410822         0  .2192565  Mean of d8level_sacmeq_read
se_d8level~d   65     59   .004217         0  .0200922  Standard error of m_d8level_sacmeq_read
m_d1level_~h   65     65  .0628584  .0012415  .2463032  Mean of d1level_sacmeq_math
se_d1level~h   65     65  .0052204  .0008563  .0112231  Standard error of m_d1level_sacmeq_math
m_d2level_~h   65     65  .3349099  .0731239  .6544887  Mean of d2level_sacmeq_math
se_d2level~h   65     65    .01102  .0052531  .0257061  Standard error of m_d2level_sacmeq_math
m_d3level_~h   65     65  .2893629  .1022169  .4685386  Mean of d3level_sacmeq_math
se_d3level~h   65     65  .0114495  .0050369  .0283527  Standard error of m_d3level_sacmeq_math
m_d4level_~h   65     65  .1508238  .0073327   .334583  Mean of d4level_sacmeq_math
se_d4level~h   65     65  .0085937  .0016075  .0273654  Standard error of m_d4level_sacmeq_math
m_d5level_~h   65     65  .0785926  .0013103  .2229102  Mean of d5level_sacmeq_math
se_d5level~h   65     65  .0062567  .0006816  .0187045  Standard error of m_d5level_sacmeq_math
m_d6level_~h   65     60   .049277         0  .1676855  Mean of d6level_sacmeq_math
se_d6level~h   65     60  .0048269         0  .0200919  Standard error of m_d6level_sacmeq_math
m_d7level_~h   65     57  .0240947         0  .1113928  Mean of d7level_sacmeq_math
se_d7level~h   65     57  .0031293         0  .0126688  Standard error of m_d7level_sacmeq_math
m_d8level_~h   65     46  .0100808         0  .0893973  Mean of d8level_sacmeq_math
se_d8level~h   65     46  .0018095         0  .0098949  Standard error of m_d8level_sacmeq_math
n_total        65     13  3013.231      1484      5048  # learners, by countrycode idgrade
n_male         65     12  1530.769       742      2462  # male learners, by countrycode idgrade
n_urban        65     13  1318.615       675      2202  # urban learners, by countrycode idgrade
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

~~~~

About the **65      observations** in this dataset:

~~~~
. tab countrycode idgrade

WB country |
   code (3 |  Grade ID
  letters) |         6 |     Total
-----------+-----------+----------
       BWA |         5 |         5 
       KEN |         5 |         5 
       LSO |         5 |         5 
       MOZ |         5 |         5 
       MUS |         5 |         5 
       MWI |         5 |         5 
       NAM |         5 |         5 
       SWZ |         5 |         5 
       SYC |         5 |         5 
       TZA |         5 |         5 
       UGA |         5 |         5 
       ZAF |         5 |         5 
       ZMB |         5 |         5 
-----------+-----------+----------
     Total |        65 |        65 

. 
. tab subgroup

  Subgroups |
         of |
countrycode |
    idgrade |      Freq.     Percent        Cum.
------------+-----------------------------------
        all |         13       20.00       20.00
     male=0 |         13       20.00       40.00
     male=1 |         13       20.00       60.00
    urban=0 |         13       20.00       80.00
    urban=1 |         13       20.00      100.00
------------+-----------------------------------
      Total |         65      100.00

~~~~
