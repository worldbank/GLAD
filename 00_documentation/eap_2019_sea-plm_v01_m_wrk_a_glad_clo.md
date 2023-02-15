Documentation of CLO dataset
=====================================================================


[back to list of assessments](https://github.com/worldbank/GLAD/blob/master/README.md#indicators)

This dataset contains harmonized aggregated data from SEA-PLM 2019 and is part of the Country Level Outcomes (CLO)

**Metadata** stored in this dataset:

~~~~
region:      EAP
year:        2019
assessment:  SEA-PLM
master:      v01_M
adaptation:  wrk_A_GLAD
module:      CLO
ttl_info:    Joao Pedro de Azevedo [eduanalytics@worldbank.org]
dofile_info: last modified by Diana Goldemberg in March 9, 2020
lastsave:    19 Jun 2021 20:37:59 by wb576985
~~~~


About the **67 variables** in this dataset:

~~~~
The variables belong to the following variable classifications:
idvars valuevars traitvars

idvars:    assessment year countrycode idgrade subgroup
valuevars: n_score_seaplm_read m_score_seaplm_read se_score_seaplm_read n_score_seaplm_write m_score_seaplm_write se_score_seaplm_write n_score_seaplm_math m_score_seaplm_math se_score_seaplm_math n_fgt1_read m_fgt1_read se_fgt1_read n_fgt1_math m_fgt1_math se_fgt1_math n_fgt2_read m_fgt2_read se_fgt2_read n_fgt2_math m_fgt2_math se_fgt2_math n_sdg411_read m_sdg411_read se_sdg411_read n_sdg411_math m_sdg411_math se_sdg411_math n_bmp_read m_bmp_read se_bmp_read n_bmp_math m_bmp_math se_bmp_math m_d1level_seaplm_read se_d1level_seaplm_read m_d2level_seaplm_read se_d2level_seaplm_read m_d3level_seaplm_read se_d3level_seaplm_read m_d4level_seaplm_read se_d4level_seaplm_read m_d5level_seaplm_read se_d5level_seaplm_read m_d1level_seaplm_math se_d1level_seaplm_math m_d2level_seaplm_math se_d2level_seaplm_math m_d3level_seaplm_math se_d3level_seaplm_math m_d4level_seaplm_math se_d4level_seaplm_math m_d5level_seaplm_math se_d5level_seaplm_math m_d6level_seaplm_math se_d6level_seaplm_math m_d7level_seaplm_math se_d7level_seaplm_math m_d8level_seaplm_math se_d8level_seaplm_math
traitvars: n_total n_male n_urban

. codebook, compact

Variable      Obs Unique      Mean       Min       Max  Label
-----------------------------------------------------------------------------------------------------------------------------------
assessment     78      1         .         .         .  Assessment
year           78      1      2019      2019      2019  Year of assessment
countrycode    78      6         .         .         .  Country ID, as coded in rawdata
idgrade        78      1         5         5         5  Grade ID
subgroup       78     13         .         .         .  Subgroups of countrycode idgrade
n_score_se~d   30     30  3119.967      1267      6083  Number of observations used to calculate m_score_seaplm_read
m_score_se~d   30     30  300.0587  272.8762  341.0415  Mean of score_seaplm_read
se_score_s~d   30     30  .2917983  .2030114  .4833522  Standard error of m_score_seaplm_read
n_score_se~e   30     30  3119.967      1267      6083  Number of observations used to calculate m_score_seaplm_write
m_score_se~e   30     30  300.1096  278.7161   332.886  Mean of score_seaplm_write
se_score_s~e   30     30  .3461993  .2581254  .5086847  Standard error of m_score_seaplm_write
n_score_se~h   30     30  3119.967      1267      6083  Number of observations used to calculate m_score_seaplm_math
m_score_se~h   30     30    300.03  275.8601   344.782  Mean of score_seaplm_math
se_score_s~h   30     30  .2765994  .1782952  .5492976  Standard error of m_score_seaplm_math
n_fgt1_read    30     30  2250.067       276      5531  Number of observations used to calculate m_fgt1_read
m_fgt1_read    30     30  .0896713  .0369173  .1424656  Mean of fgt1_read
se_fgt1_read   30     30   .000969  .0004674  .0018838  Standard error of m_fgt1_read
n_fgt1_math    30     30  2051.667       129      5051  Number of observations used to calculate m_fgt1_math
m_fgt1_math    30     30  .0742203   .036222  .1130885  Mean of fgt1_math
se_fgt1_math   30     30  .0011842  .0004096   .003211  Standard error of m_fgt1_math
n_fgt2_read    30     30  2250.067       276      5531  Number of observations used to calculate m_fgt2_read
m_fgt2_read    30     30   .011737  .0024798  .0239029  Mean of fgt2_read
se_fgt2_read   30     30   .000204  .0001095  .0003194  Standard error of m_fgt2_read
n_fgt2_math    30     30  2051.667       129      5051  Number of observations used to calculate m_fgt2_math
m_fgt2_math    30     30  .0082417  .0023377   .016099  Mean of fgt2_math
se_fgt2_math   30     30  .0002028  .0000844  .0004049  Standard error of m_fgt2_math
n_sdg411_r~d   30     30  3119.967      1267      6083  Number of observations used to calculate m_sdg411_read
m_sdg411_r~d   30     30  .2896224   .019591  .8698202  Mean of sdg411_read
se_sdg411_~d   30     30  .0050198  .0015262   .010824  Standard error of m_sdg411_read
n_sdg411_m~h   30     30  3119.967      1267      6083  Number of observations used to calculate m_sdg411_math
m_sdg411_m~h   30     30  .3523532  .0612166  .9392825  Mean of sdg411_math
se_sdg411_~h   30     30  .0056707  .0023961  .0136926  Standard error of m_sdg411_math
n_bmp_read     30     30  3119.967      1267      6083  Number of observations used to calculate m_bmp_read
m_bmp_read     30     30  .7103776  .1301798   .980409  Mean of bmp_read
se_bmp_read    30     30  .0050198  .0015262   .010824  Standard error of m_bmp_read
n_bmp_math     30     30  3119.967      1267      6083  Number of observations used to calculate m_bmp_math
m_bmp_math     30     30  .6476468  .0607175  .9387833  Mean of bmp_math
se_bmp_math    30     30  .0056707  .0023961  .0136926  Standard error of m_bmp_math
m_d1level_~d   30     30  .2061424  .0019044  .5398861  Mean of d1level_seaplm_read
se_d1level~d   30     30  .0058494  .0008185  .0195665  Standard error of m_d1level_seaplm_read
m_d2level_~d   30     30  .1897009  .0079493  .3083667  Mean of d2level_seaplm_read
se_d2level~d   30     30  .0072154  .0015395  .0157434  Standard error of m_d2level_seaplm_read
m_d3level_~d   30     30  .1806952  .0359352  .2928436  Mean of d3level_seaplm_read
se_d3level~d   30     30  .0057595   .002473  .0104912  Standard error of m_d3level_seaplm_read
m_d4level_~d   30     30   .133839  .0519431   .202246  Mean of d4level_seaplm_read
se_d4level~d   30     30  .0060752  .0021727  .0099555  Standard error of m_d4level_seaplm_read
m_d5level_~d   30     30  .2896224   .019591  .8698202  Mean of d5level_seaplm_read
se_d5level~d   30     30  .0050198  .0015262   .010824  Standard error of m_d5level_seaplm_read
m_d1level_~h   30     30  .1372178  .0013756  .3744887  Mean of d1level_seaplm_math
se_d1level~h   30     30   .005108  .0007507  .0137206  Standard error of m_d1level_seaplm_math
m_d2level_~h   30     30  .1609428  .0043552  .2605787  Mean of d2level_seaplm_math
se_d2level~h   30     30   .005479  .0007067  .0122109  Standard error of m_d2level_seaplm_math
m_d3level_~h   30     30  .1864896  .0145897  .2995691  Mean of d3level_seaplm_math
se_d3level~h   30     30  .0068159  .0014565  .0152835  Standard error of m_d3level_seaplm_math
m_d4level_~h   30     30  .1629966   .040397  .2397997  Mean of d4level_seaplm_math
se_d4level~h   30     30  .0064617  .0030565  .0131995  Standard error of m_d4level_seaplm_math
m_d5level_~h   30     30  .1235913  .0444497  .2563181  Mean of d5level_seaplm_math
se_d5level~h   30     30  .0061526  .0019577  .0150241  Standard error of m_d5level_seaplm_math
m_d6level_~h   30     30  .0874162  .0147741  .2245923  Mean of d6level_seaplm_math
se_d6level~h   30     30  .0051135  .0009696  .0134997  Standard error of m_d6level_seaplm_math
m_d7level_~h   30     30  .0606355  .0016324  .2163968  Mean of d7level_seaplm_math
se_d7level~h   30     30  .0041669  .0005887  .0166227  Standard error of m_d7level_seaplm_math
m_d8level_~h   30     30  .0807102  .0000671  .4685578  Mean of d8level_seaplm_math
se_d8level~h   30     30  .0022137  .0001334  .0101443  Standard error of m_d8level_seaplm_math
n_total        78      6      5200      4479      6083  # learners, by countrycode idgrade
n_male         78      6  2633.167      2196      3071  # male learners, by countrycode idgrade
n_urban        78      6  2781.833      1436      3854  # urban learners, by countrycode idgrade
-----------------------------------------------------------------------------------------------------------------------------------

~~~~

About the **78      observations** in this dataset:

~~~~
. tab countrycode idgrade

   Country |
    ID, as |
  coded in |  Grade ID
   rawdata |         5 |     Total
-----------+-----------+----------
       KHM |        13 |        13 
       LAO |        13 |        13 
       MMR |        13 |        13 
       MYS |        13 |        13 
       PHL |        13 |        13 
       VNM |        13 |        13 
-----------+-----------+----------
     Total |        78 |        78 

. 
. tab subgroup

  Subgroups |
         of |
countrycode |
    idgrade |      Freq.     Percent        Cum.
------------+-----------------------------------
        all |          6        7.69        7.69
     male=0 |          6        7.69       15.38
     male=1 |          6        7.69       23.08
     male=2 |          6        7.69       30.77
     male=3 |          6        7.69       38.46
     male=4 |          6        7.69       46.15
     male=5 |          6        7.69       53.85
    urban=0 |          6        7.69       61.54
    urban=1 |          6        7.69       69.23
    urban=2 |          6        7.69       76.92
    urban=3 |          6        7.69       84.62
    urban=4 |          6        7.69       92.31
    urban=5 |          6        7.69      100.00
------------+-----------------------------------
      Total |         78      100.00

~~~~
