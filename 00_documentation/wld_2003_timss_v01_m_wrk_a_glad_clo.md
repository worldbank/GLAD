Documentation of CLO dataset
=====================================================================


[back to list of assessments](https://github.com/worldbank/GLAD/blob/master/README.md#indicators)

This dataset contains harmonized aggregated data from TIMSS 2003 and is part of the Country Level Outcomes (CLO)

**Metadata** stored in this dataset:

~~~~
region:      WLD
year:        2003
assessment:  TIMSS
master:      v01_M
adaptation:  wrk_A_GLAD
module:      CLO
ttl_info:    Joao Pedro de Azevedo [eduanalytics@worldbank.org]
dofile_info: last modified by Ahmed Raza in Feburary 2, 2022
lastsave:    11 Feb 2022 17:48:03 by wb549384
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
assessment    641      1         .         .         .  Assessment
year          641      1      2003      2003      2003  Year of assessment
countrycode   641     47         .         .         .  WB country code (3 letters)
idgrade       641      2  7.120125         4         8  Grade ID
subgroup      641     12         .         .         .  Subgroups of countrycode idgrade
n_score_ti~h  641    522  2389.312        23      9829  Number of observations used to calculate m_score_timss_math
m_score_ti~h  641    571  464.5367  211.1865  651.5873  Mean of score_timss_math
se_score_t~h  641    571  4.564903   1.59806  32.85824  Standard error of m_score_timss_math
n_score_ti~e  641    522  2389.312        23      9829  Number of observations used to calculate m_score_timss_scie
m_score_ti~e  641    571  469.8379  176.3003  639.5002  Mean of score_timss_scie
se_score_t~e  641    571  4.630862  1.480496  21.58089  Standard error of m_score_timss_scie
n_fgt1_scie   639    474  958.4476         5      8459  Number of observations used to calculate m_fgt1_scie
m_fgt1_scie   639    569  .1572918  .0228083  .6307411  Mean of fgt1_scie
se_fgt1_scie  639    569  .0092664  .0023359  .0841952  Standard error of m_fgt1_scie
n_fgt1_math   638    477  1043.428         8      8528  Number of observations used to calculate m_fgt1_math
m_fgt1_math   638    568   .158951  .0422031  .5569355  Mean of fgt1_math
se_fgt1_math  638    568  .0088936   .003146  .0914954  Standard error of m_fgt1_math
n_fgt2_scie   639    474  958.4476         5      8459  Number of observations used to calculate m_fgt2_scie
m_fgt2_scie   639    569  .0491176  .0010544  .4361894  Mean of fgt2_scie
se_fgt2_scie  639    569  .0042164  .0008579  .0351111  Standard error of m_fgt2_scie
n_fgt2_math   638    477  1043.428         8      8528  Number of observations used to calculate m_fgt2_math
m_fgt2_math   638    568  .0449411  .0032286  .3332128  Mean of fgt2_math
se_fgt2_math  638    568  .0037404  .0008657  .0219585  Standard error of m_fgt2_math
n_sdg411_s~e  641    522  2389.312        23      9829  Number of observations used to calculate m_sdg411_scie
m_sdg411_s~e  641    571  .5783453  .0019269   .993272  Mean of sdg411_scie
se_sdg411_~e  641    571   .019746  .0016889  .1066848  Standard error of m_sdg411_scie
n_sdg411_m~h  641    522  2389.312        23      9829  Number of observations used to calculate m_sdg411_math
m_sdg411_m~h  641    570  .5353431  .0002205         1  Mean of sdg411_math
se_sdg411_~h  641    570  .0198104         0  .2636578  Standard error of m_sdg411_math
n_bmp_scie    641    522  2389.312        23      9829  Number of observations used to calculate m_bmp_scie
m_bmp_scie    641    571  .4216547   .006728   .998073  Mean of bmp_scie
se_bmp_scie   641    571   .019746  .0016889  .1066848  Standard error of m_bmp_scie
n_bmp_math    641    522  2389.312        23      9829  Number of observations used to calculate m_bmp_math
m_bmp_math    641    570  .4646569         0  .9997795  Mean of bmp_math
se_bmp_math   641    570  .0198104         0  .2636578  Standard error of m_bmp_math
m_d1level_~h  641    570  .2687166         0   .993952  Mean of d1level_timss_math
se_d1level~h  641    570  .0173021         0  .1071772  Standard error of m_d1level_timss_math
m_d2level_~h  641    571  .2383419  .0058274  .4523772  Mean of d2level_timss_math
se_d2level~h  641    571  .0186158  .0028978  .1658029  Standard error of m_d2level_timss_math
m_d3level_~h  641    571  .2626224  .0002205  .4752108  Mean of d3level_timss_math
se_d3level~h  641    571  .0185662  .0010862  .2119402  Standard error of m_d3level_timss_math
m_d4level_~h  641    567  .1705539         0  .5413787  Mean of d4level_timss_math
se_d4level~h  641    567  .0145161         0  .1580446  Standard error of m_d4level_timss_math
m_d5level_~h  641    516  .0597652         0   .687993  Mean of d5level_timss_math
se_d5level~h  641    516  .0079136         0  .0766548  Standard error of m_d5level_timss_math
m_d1level_~e  641    571  .2308671         0   .984775  Mean of d1level_timss_scie
se_d1level~e  641    571  .0163661         0  .0865206  Standard error of m_d1level_timss_scie
m_d2level_~e  641    571  .2324944  .0125127  .4379615  Mean of d2level_timss_scie
se_d2level~e  641    571  .0183913  .0038684   .162913  Standard error of m_d2level_timss_scie
m_d3level_~e  641    571  .2946429  .0019269  .5435143  Mean of d3level_timss_scie
se_d3level~e  641    571  .0190968  .0016069  .1149783  Standard error of m_d3level_timss_scie
m_d4level_~e  641    570  .1902102         0  .5787438  Mean of d4level_timss_scie
se_d4level~e  641    570  .0156876         0  .1525618  Standard error of m_d4level_timss_scie
m_d5level_~e  641    539  .0517854         0  .6222961  Mean of d5level_timss_scie
se_d5level~e  641    539  .0079901         0  .0648769  Standard error of m_d5level_timss_scie
n_total       641     70  4784.922      2514      9829  # learners, by countrycode idgrade
n_male        641     68  2374.755      1274      4921  # male learners, by countrycode idgrade
n_urban       641     69  3956.031      1443      7754  # urban learners, by countrycode idgrade
n_has_qescs   641     47  3758.512         0      8952  # has_qescs learners, by countrycode idgrade
n_qescs       641     46  11438.88         0     26878  # qescs learners, by countrycode idgrade
--------------------------------------------------------------------------------------------------------------------

~~~~

About the **641     observations** in this dataset:

~~~~
. tab countrycode idgrade

WB country |
   code (3 |       Grade ID
  letters) |         4          8 |     Total
-----------+----------------------+----------
       ARM |         6         11 |        17 
       AUS |         6         11 |        17 
       BEL |         6         10 |        16 
       BGR |         0         11 |        11 
       BHR |         0         11 |        11 
       BWA |         0         11 |        11 
       CHL |         0         11 |        11 
       CYP |         6         11 |        17 
       EGY |         0         11 |        11 
       ESP |         0         11 |        11 
       EST |         0         11 |        11 
       GBR |         6         11 |        17 
       GHA |         0         11 |        11 
       HKG |         5         10 |        15 
       HUN |         6         11 |        17 
       IDN |         0         11 |        11 
       IRN |         6         11 |        17 
       ISR |         0         11 |        11 
       ITA |         6         11 |        17 
       JOR |         0         11 |        11 
       JPN |         5         10 |        15 
       KOR |         0         11 |        11 
       LBN |         0         11 |        11 
       LTU |         6         11 |        17 
       LVA |         6         11 |        17 
       MAR |         6         11 |        17 
       MDA |         6         11 |        17 
       MKD |         0         11 |        11 
       MYS |         0         11 |        11 
       NLD |         6         10 |        16 
       NOR |         6         11 |        17 
       NZL |         6         11 |        17 
       PHL |         6         11 |        17 
       PSE |         0         11 |        11 
       ROU |         0         11 |        11 
       RUS |         6         11 |        17 
       SAU |         0         11 |        11 
       SGP |         5         10 |        15 
       SRB |         0         11 |        11 
       SVK |         0         11 |        11 
       SVN |         6         11 |        17 
       SWE |         0         11 |        11 
       SYR |         0         11 |        11 
       TUN |         6         10 |        16 
       USA |         6         11 |        17 
       YEM |         6          0 |         6 
       ZAF |         0         11 |        11 
-----------+----------------------+----------
     Total |       141        500 |       641 

. 
. tab subgroup

  Subgroups |
         of |
countrycode |
    idgrade |      Freq.     Percent        Cum.
------------+-----------------------------------
        all |         70       10.92       10.92
has_qescs=0 |         24        3.74       14.66
has_qescs=1 |         46        7.18       21.84
     male=0 |         70       10.92       32.76
     male=1 |         70       10.92       43.68
    qescs=1 |         46        7.18       50.86
    qescs=2 |         46        7.18       58.03
    qescs=3 |         46        7.18       65.21
    qescs=4 |         46        7.18       72.39
    qescs=5 |         46        7.18       79.56
    urban=0 |         61        9.52       89.08
    urban=1 |         70       10.92      100.00
------------+-----------------------------------
      Total |        641      100.00

~~~~
