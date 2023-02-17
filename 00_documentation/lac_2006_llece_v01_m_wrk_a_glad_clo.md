Documentation of CLO dataset
=====================================================================


[back to list of assessments](https://github.com/worldbank/GLAD/blob/master/README.md#indicators)

This dataset contains harmonized aggregated data from LLECE 2006 and is part of the Country Level Outcomes (CLO)

**Metadata** stored in this dataset:

~~~~
region:      LAC
year:        2006
assessment:  LLECE
master:      v01_M
adaptation:  wrk_A_GLAD
module:      CLO
ttl_info:    Joao Pedro de Azevedo [eduanalytics@worldbank.org]
dofile_info: last modified by Joao Pedro Azevedo in Feburary 5, 2022
lastsave:    6 Feb 2022 10:44:56 by wb255520
~~~~


About the **61 variables** in this dataset:

~~~~
The variables belong to the following variable classifications:
idvars valuevars traitvars

idvars:    assessment year countrycode idgrade subgroup
valuevars: n_score_llece_read m_score_llece_read se_score_llece_read n_score_llece_math m_score_llece_math se_score_llece_math n_score_llece_sci m_score_llece_sci se_score_llece_sci n_fgt1_read m_fgt1_read se_fgt1_read n_fgt2_read m_fgt2_read se_fgt2_read n_sdg411_read m_sdg411_read se_sdg411_read n_bmp_read m_bmp_read se_bmp_read m_d1level_llece_read se_d1level_llece_read m_d2level_llece_read se_d2level_llece_read m_d3level_llece_read se_d3level_llece_read m_d4level_llece_read se_d4level_llece_read m_d5level_llece_read se_d5level_llece_read m_d1level_llece_math se_d1level_llece_math m_d2level_llece_math se_d2level_llece_math m_d3level_llece_math se_d3level_llece_math m_d4level_llece_math se_d4level_llece_math m_d5level_llece_math se_d5level_llece_math m_d1level_llece_sci se_d1level_llece_sci m_d2level_llece_sci se_d2level_llece_sci m_d3level_llece_sci se_d3level_llece_sci m_d4level_llece_sci se_d4level_llece_sci m_d5level_llece_sci se_d5level_llece_sci
traitvars: n_total n_male n_urban n_has_qescs n_qescs

. codebook, compact

Variable      Obs Unique      Mean       Min       Max  Label
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
assessment    342      1         .         .         .  Assessment
year          342      1      2006      2006      2006  Year of assessment
countrycode   342     16         .         .         .  WB country code (3 letters)
idgrade       342      2       4.5         3         6  Grade ID
subgroup      342     12         .         .         .  Subgroups of countrycode idgrade
n_score_ll~d  342    300  2504.959        75      7302  Number of observations used to calculate m_score_llece_read
m_score_ll~d  342    310  497.2032  378.4603  647.7259  Mean of score_llece_read
se_score_l~d  342    310  5.342866   2.25211  17.36804  Standard error of m_score_llece_read
n_score_ll~h  342    299  2559.939        77      7399  Number of observations used to calculate m_score_llece_math
m_score_ll~h  342    310  496.9388  381.9052  670.5699  Mean of score_llece_math
se_score_l~h  342    310  5.513429  2.023992  18.68509  Standard error of m_score_llece_math
n_score_ll~i   99     89   2465.99       125      6281  Number of observations used to calculate m_score_llece_sci
m_score_ll~i   99     90  498.4721  412.6447  696.4739  Mean of score_llece_sci
se_score_l~i   99     90  5.573013  2.111507  17.35061  Standard error of m_score_llece_sci
n_fgt1_read   171    146  1348.713        56      4314  Number of observations used to calculate m_fgt1_read
m_fgt1_read   171    155  .1509057  .0921708  .2714506  Mean of fgt1_read
se_fgt1_read  171    155  .0062398   .002111  .0305768  Standard error of m_fgt1_read
n_fgt2_read   171    146  1348.713        56      4314  Number of observations used to calculate m_fgt2_read
m_fgt2_read   171    155  .0359453  .0158724  .1049232  Mean of fgt2_read
se_fgt2_read  171    155  .0030441  .0007413  .0234303  Standard error of m_fgt2_read
n_sdg411_r~d  171    152  2457.363        93      6616  Number of observations used to calculate m_sdg411_read
m_sdg411_r~d  171    155  .3993672  .0494487  .8743008  Mean of sdg411_read
se_sdg411_~d  171    155  .0230181  .0093239  .0692462  Standard error of m_sdg411_read
n_bmp_read    171    152  2457.363        93      6616  Number of observations used to calculate m_bmp_read
m_bmp_read    171    155  .6006328  .1256991  .9505513  Mean of bmp_read
se_bmp_read   171    155  .0230181  .0093239  .0692462  Standard error of m_bmp_read
m_d1level_~d  342    306  .0510244         0  .3963711  Mean of d1level_llece_read
se_d1level~d  342    306   .007102         0     .0424  Standard error of m_d1level_llece_read
m_d2level_~d  342    310  .2461539  .0164891  .5831729  Mean of d2level_llece_read
se_d2level~d  342    310  .0171835  .0033817  .0557371  Standard error of m_d2level_llece_read
m_d3level_~d  342    310  .3613418  .1081425  .5360596  Mean of d3level_llece_read
se_d3level~d  342    310  .0184544  .0091838  .0657574  Standard error of m_d3level_llece_read
m_d4level_~d  342    310  .2147062   .013593  .4161976  Mean of d4level_llece_read
se_d4level~d  342    310  .0151822  .0042093  .0605144  Standard error of m_d4level_llece_read
m_d5level_~d  342    310  .1267737  .0006458  .6676893  Mean of d5level_llece_read
se_d5level~d  342    310  .0132816  .0006561  .0605653  Standard error of m_d5level_llece_read
m_d1level_~h  342    305  .0720852         0  .4690337  Mean of d1level_llece_math
se_d1level~h  342    305  .0085979         0  .0493561  Standard error of m_d1level_llece_math
m_d2level_~h  342    310  .2775496  .0200083  .5830245  Mean of d2level_llece_math
se_d2level~h  342    310  .0167891  .0038734  .0619288  Standard error of m_d2level_llece_math
m_d3level_~h  342    310  .3471216  .0542285  .5920762  Mean of d3level_llece_math
se_d3level~h  342    310  .0177883  .0073336  .0776449  Standard error of m_d3level_llece_math
m_d4level_~h  342    310  .1967636  .0018655  .4712752  Mean of d4level_llece_math
se_d4level~h  342    310  .0149247  .0013462  .0802055  Standard error of m_d4level_llece_math
m_d5level_~h  342    305  .1064801         0  .6138688  Mean of d5level_llece_math
se_d5level~h  342    305  .0126552         0  .0532338  Standard error of m_d5level_llece_math
m_d1level_~i   99     90  .0556228         0  .1754853  Mean of d1level_llece_sci
se_d1level~i   99     90  .0074945         0  .0272474  Standard error of m_d1level_llece_sci
m_d2level_~i   99     90  .3880792  .0545569  .6809733  Mean of d2level_llece_sci
se_d2level~i   99     90  .0203743  .0093974  .0614367  Standard error of m_d2level_llece_sci
m_d3level_~i   99     90  .3873852  .1459305  .5374678  Mean of d3level_llece_sci
se_d3level~i   99     90  .0190181   .008724  .0651073  Standard error of m_d3level_llece_sci
m_d4level_~i   99     90  .1223536  .0009011  .3353051  Mean of d4level_llece_sci
se_d4level~i   99     90  .0124802  .0009322  .0338495  Standard error of m_d4level_llece_sci
m_d5level_~i   99     79  .0465592         0  .4311058  Mean of d5level_llece_sci
se_d5level~i   99     79  .0064182         0  .0526083  Standard error of m_d5level_llece_sci
n_total       342     31  5820.041      4554      7474  # learners, by countrycode idgrade
n_male        342     32  2787.278      2036      3745  # male learners, by countrycode idgrade
n_urban       342     32  4636.924      3170      6826  # urban learners, by countrycode idgrade
n_has_qescs   342     30  5652.006         0      7474  # has_qescs learners, by countrycode idgrade
n_qescs       342     31   18283.9         0     28482  # qescs learners, by countrycode idgrade
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

~~~~

About the **342     observations** in this dataset:

~~~~
. tab countrycode idgrade

WB country |
   code (3 |       Grade ID
  letters) |         3          6 |     Total
-----------+----------------------+----------
       ARG |        11         11 |        22 
       BRA |        11         11 |        22 
       CHL |        11         11 |        22 
       COL |        11         11 |        22 
       CRI |        11         11 |        22 
       CUB |        11         11 |        22 
       DOM |        11         11 |        22 
       ECU |        11         11 |        22 
       GTM |        11         11 |        22 
       MEX |         6          6 |        12 
       NIC |        11         11 |        22 
       PAN |        11         11 |        22 
       PER |        11         11 |        22 
       PRY |        11         11 |        22 
       SLV |        11         11 |        22 
       URY |        11         11 |        22 
-----------+----------------------+----------
     Total |       171        171 |       342 

. 
. tab subgroup

  Subgroups |
         of |
countrycode |
    idgrade |      Freq.     Percent        Cum.
------------+-----------------------------------
        all |         32        9.36        9.36
has_qescs=0 |          2        0.58        9.94
has_qescs=1 |         30        8.77       18.71
     male=0 |         32        9.36       28.07
     male=1 |         32        9.36       37.43
    qescs=1 |         30        8.77       46.20
    qescs=2 |         30        8.77       54.97
    qescs=3 |         30        8.77       63.74
    qescs=4 |         30        8.77       72.51
    qescs=5 |         30        8.77       81.29
    urban=0 |         32        9.36       90.64
    urban=1 |         32        9.36      100.00
------------+-----------------------------------
      Total |        342      100.00

~~~~
