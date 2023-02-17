Documentation of CLO dataset
=====================================================================


[back to list of assessments](https://github.com/worldbank/GLAD/blob/master/README.md#indicators)

This dataset contains harmonized aggregated data from TIMSS 2007 and is part of the Country Level Outcomes (CLO)

**Metadata** stored in this dataset:

~~~~
region:      WLD
year:        2007
assessment:  TIMSS
master:      v01_M
adaptation:  wrk_A_GLAD
module:      CLO
ttl_info:    Joao Pedro de Azevedo [eduanalytics@worldbank.org]
dofile_info: last modified by Ahmed Raza in Feburary 2, 2022
lastsave:    11 Feb 2022 23:35:00 by wb549384
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
assessment    726      1         .         .         .  Assessment
year          726      1      2007      2007      2007  Year of assessment
countrycode   726     57         .         .         .  WB country code (3 letters)
idgrade       726      3  6.874656         4         9  Grade ID
subgroup      726     12         .         .         .  Subgroups of countrycode idgrade
n_score_ti~h  726    565   2376.19        34      8245  Number of observations used to calculate m_score_timss_math
m_score_ti~h  726    643  449.9463   214.126  654.7388  Mean of score_timss_math
se_score_t~h  726    643  4.588834  1.043207  37.60693  Standard error of m_score_timss_math
n_score_ti~e  726    566  2369.738        34      8245  Number of observations used to calculate m_score_timss_scie
m_score_ti~e  726    643  462.9809  188.2397  644.9483  Mean of score_timss_scie
se_score_t~e  726    643   4.72049  1.359126  34.67554  Standard error of m_score_timss_scie
n_fgt1_scie   725    541  982.8924         8      6353  Number of observations used to calculate m_fgt1_scie
m_fgt1_scie   725    642   .167386  .0465681  .5797679  Mean of fgt1_scie
se_fgt1_scie  725    642  .0098755  .0027587  .0795774  Standard error of m_fgt1_scie
n_fgt1_math   725    550  1105.432         2      6907  Number of observations used to calculate m_fgt1_math
m_fgt1_math   725    642  .1758823  .0439539  .5011516  Mean of fgt1_math
se_fgt1_math  725    642  .0091501  .0022097   .052995  Standard error of m_fgt1_math
n_fgt2_scie   725    541  982.8924         8      6353  Number of observations used to calculate m_fgt2_scie
m_fgt2_scie   725    642  .0511762  .0050326  .4102417  Mean of fgt2_scie
se_fgt2_scie  725    642  .0047061  .0009419   .036738  Standard error of m_fgt2_scie
n_fgt2_math   725    550  1105.432         2      6907  Number of observations used to calculate m_fgt2_math
m_fgt2_math   725    642  .0527699  .0031037  .3093487  Mean of fgt2_math
se_fgt2_math  725    642  .0043566  .0008098  .0312842  Standard error of m_fgt2_math
n_sdg411_s~e  726    566  2369.738        34      8245  Number of observations used to calculate m_sdg411_scie
m_sdg411_s~e  726    642   .547903  .0291926  .9943913  Mean of sdg411_scie
se_sdg411_~e  726    643   .019561  .0025909   .183317  Standard error of m_sdg411_scie
n_sdg411_m~h  726    565   2376.19        34      8245  Number of observations used to calculate m_sdg411_math
m_sdg411_m~h  726    643  .4920394  .0069504  .9987154  Mean of sdg411_math
se_sdg411_~h  726    643  .0181778   .001142  .2137075  Standard error of m_sdg411_math
n_bmp_scie    726    566  2369.738        34      8245  Number of observations used to calculate m_bmp_scie
m_bmp_scie    726    643   .452097  .0056087  .9708074  Mean of bmp_scie
se_bmp_scie   726    643   .019561  .0025909   .183317  Standard error of m_bmp_scie
n_bmp_math    726    565   2376.19        34      8245  Number of observations used to calculate m_bmp_math
m_bmp_math    726    643  .5079606  .0012846  .9930496  Mean of bmp_math
se_bmp_math   726    643  .0181778   .001142  .2137075  Standard error of m_bmp_math
m_d1level_~h  726    643  .3235442  .0012846  .9498566  Mean of d1level_timss_math
se_d1level~h  726    643  .0182829   .001142  .1341612  Standard error of m_d1level_timss_math
m_d2level_~h  726    643  .2423763  .0172202  .4347067  Mean of d2level_timss_math
se_d2level~h  726    643  .0181451  .0038334  .1221164  Standard error of m_d2level_timss_math
m_d3level_~h  726    643  .2397145  .0068023  .4806029  Mean of d3level_timss_math
se_d3level~h  726    643  .0165221  .0016718   .106373  Standard error of m_d3level_timss_math
m_d4level_~h  726    636  .1397146         0  .4234448  Mean of d4level_timss_math
se_d4level~h  726    636  .0123217         0  .1527748  Standard error of m_d4level_timss_math
m_d5level_~h  726    561  .0546504         0  .7081649  Mean of d5level_timss_math
se_d5level~h  726    561  .0070558         0  .1401536  Standard error of m_d5level_timss_math
m_d1level_~e  726    643  .2607888  .0048799   .933187  Mean of d1level_timss_scie
se_d1level~e  726    643  .0181312  .0025909   .154094  Standard error of m_d1level_timss_scie
m_d2level_~e  726    643   .247057  .0241522  .5013358  Mean of d2level_timss_scie
se_d2level~e  726    643  .0182893   .004936  .1280914  Standard error of m_d2level_timss_scie
m_d3level_~e  726    643  .2708992  .0156188  .4906965  Mean of d3level_timss_scie
se_d3level~e  726    643  .0185323  .0031712  .1461301  Standard error of m_d3level_timss_scie
m_d4level_~e  726    643  .1679997         0  .4384217  Mean of d4level_timss_scie
se_d4level~e  726    643    .01415         0  .1411929  Standard error of m_d4level_timss_scie
m_d5level_~e  726    617  .0532554         0  .6617359  Mean of d5level_timss_scie
se_d5level~e  726    617   .007772         0   .154168  Standard error of m_d5level_timss_scie
n_total       726     81   4588.32      3060      8245  # learners, by countrycode idgrade
n_male        726     79  2291.899      1450      4113  # male learners, by countrycode idgrade
n_urban       726     81  3891.744      2536      7026  # urban learners, by countrycode idgrade
n_has_qescs   726     48  3206.591         0      7377  # has_qescs learners, by countrycode idgrade
n_qescs       726     48   9843.43         0     22234  # qescs learners, by countrycode idgrade
--------------------------------------------------------------------------------------------------------------------

~~~~

About the **726     observations** in this dataset:

~~~~
. tab countrycode idgrade

WB country |
   code (3 |             Grade ID
  letters) |         4          8          9 |     Total
-----------+---------------------------------+----------
       ARM |         6         11          0 |        17 
       AUS |         6         11          0 |        17 
       AUT |         6          0          0 |         6 
       BGR |         0         11          0 |        11 
       BHR |         0         11          0 |        11 
       BIH |         0         11          0 |        11 
       BWA |         0         11          0 |        11 
       COL |         6         11          0 |        17 
       CYP |         0         11          0 |        11 
       CZE |         6         11          0 |        17 
       DEU |         6          0          0 |         6 
       DNK |         6          0          0 |         6 
       DZA |         6         11          0 |        17 
       EGY |         0         11          0 |        11 
       GBR |         6          6          0 |        12 
       GEO |         6         11          0 |        17 
       GHA |         0         11          0 |        11 
       HKG |         5         10          0 |        15 
       HUN |         6         11          0 |        17 
       IDN |         0         11          0 |        11 
       IRN |         6         11          0 |        17 
       ISR |         0         11          0 |        11 
       ITA |         6         11          0 |        17 
       JOR |         0         11          0 |        11 
       JPN |         5         10          0 |        15 
       KAZ |         6          0          0 |         6 
       KOR |         0         10          0 |        10 
       KWT |         6         11          0 |        17 
       LBN |         0         11          0 |        11 
       LTU |         6         11          0 |        17 
       LVA |         6          0          0 |         6 
       MAR |         6         11          0 |        17 
       MLT |         0          0         11 |        11 
       MNG |         6         11          0 |        17 
       MYS |         0         11          0 |        11 
       NLD |         6          0          0 |         6 
       NOR |         6         11          0 |        17 
       NZL |         6          0          0 |         6 
       OMN |         0         11          0 |        11 
       PSE |         0         11          0 |        11 
       QAT |         6         11          0 |        17 
       ROU |         0         11          0 |        11 
       RUS |         6         11          0 |        17 
       SAU |         0         11          0 |        11 
       SGP |         5         10          0 |        15 
       SLV |         6         11          0 |        17 
       SRB |         0         11          0 |        11 
       SVK |         6          0          0 |         6 
       SVN |         6         11          0 |        17 
       SWE |         6         11          0 |        17 
       SYR |         0         11          0 |        11 
       THA |         0         11          0 |        11 
       TUN |         6         11          0 |        17 
       TUR |         0         11          0 |        11 
       UKR |         6         11          0 |        17 
       USA |         6         11          0 |        17 
       YEM |         6          0          0 |         6 
-----------+---------------------------------+----------
     Total |       207        508         11 |       726 

. 
. tab subgroup

  Subgroups |
         of |
countrycode |
    idgrade |      Freq.     Percent        Cum.
------------+-----------------------------------
        all |         83       11.43       11.43
has_qescs=0 |         36        4.96       16.39
has_qescs=1 |         47        6.47       22.87
     male=0 |         83       11.43       34.30
     male=1 |         83       11.43       45.73
    qescs=1 |         47        6.47       52.20
    qescs=2 |         47        6.47       58.68
    qescs=3 |         47        6.47       65.15
    qescs=4 |         47        6.47       71.63
    qescs=5 |         47        6.47       78.10
    urban=0 |         76       10.47       88.57
    urban=1 |         83       11.43      100.00
------------+-----------------------------------
      Total |        726      100.00

~~~~
