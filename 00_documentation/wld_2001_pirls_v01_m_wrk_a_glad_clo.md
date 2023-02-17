Documentation of CLO dataset
=====================================================================


[back to list of assessments](https://github.com/worldbank/GLAD/blob/master/README.md#indicators)

This dataset contains harmonized aggregated data from PIRLS 2001 and is part of the Country Level Outcomes (CLO)

**Metadata** stored in this dataset:

~~~~
region:      WLD
year:        2001
assessment:  PIRLS
master:      v01_M
adaptation:  wrk_A_GLAD
module:      CLO
ttl_info:    Joao Pedro de Azevedo [eduanalytics@worldbank.org]
dofile_info: last modified by Joao Pedro Azevedo in Feburary 5, 2022
lastsave:    12 Feb 2022 23:03:38 by wb255520
~~~~


About the **35 variables** in this dataset:

~~~~
The variables belong to the following variable classifications:
idvars valuevars traitvars

idvars:    assessment year countrycode idgrade subgroup
valuevars: n_score_pirls_read m_score_pirls_read se_score_pirls_read n_fgt1_read m_fgt1_read se_fgt1_read n_fgt2_read m_fgt2_read se_fgt2_read n_sdg411_read m_sdg411_read se_sdg411_read n_bmp_read m_bmp_read se_bmp_read m_d1level_pirls_read se_d1level_pirls_read m_d2level_pirls_read se_d2level_pirls_read m_d3level_pirls_read se_d3level_pirls_read m_d4level_pirls_read se_d4level_pirls_read m_d5level_pirls_read se_d5level_pirls_read
traitvars: n_total n_male n_urban n_has_qescs n_qescs

. codebook, compact

Variable      Obs Unique      Mean       Min       Max  Label
------------------------------------------------------------------------------------------------------------
assessment    364      1         .         .         .  Assessment
year          364      1      2001      2001      2001  Year of assessment
countrycode   364     34         .         .         .  WB country code (3 letters)
idgrade       364      3   3.96978         3         5  Grade ID
subgroup      364     12         .         .         .  Subgroups of countrycode idgrade
n_score_pi~d  364    311  1939.915        25      8253  Number of observations used to calculate m_score_...
m_score_pi~d  364    328  502.1689   283.755  595.9119  Mean of score_pirls_read
se_score_p~d  364    328  4.920415  1.199003  56.61574  Standard error of m_score_pirls_read
n_fgt1_read   361    207  273.6288         1      3488  Number of observations used to calculate m_fgt1_read
m_fgt1_read   361    325  .1167947  .0279977  .3427879  Mean of fgt1_read
se_fgt1_read  361    325  .0177632  .0039191  .1332851  Standard error of m_fgt1_read
n_fgt2_read   361    207  273.6288         1      3488  Number of observations used to calculate m_fgt2_read
m_fgt2_read   361    325  .0261889  .0014294   .153588  Mean of fgt2_read
se_fgt2_read  361    325  .0058512   .001067   .045477  Standard error of m_fgt2_read
n_sdg411_r~d  364    311  1939.915        25      8253  Number of observations used to calculate m_sdg411...
m_sdg411_r~d  364    328  .8548608  .1123956  .9966488  Mean of sdg411_read
se_sdg411_~d  364    328  .0156746  .0020001  .1559761  Standard error of m_sdg411_read
n_bmp_read    364    311  1939.915        25      8253  Number of observations used to calculate m_bmp_read
m_bmp_read    364    328  .1451392  .0033512  .8876044  Mean of bmp_read
se_bmp_read   364    328  .0156746  .0020001  .1559761  Standard error of m_bmp_read
m_d1level_~d  364    328  .1451392  .0033512  .8876044  Mean of d1level_pirls_read
se_d1level~d  364    328  .0156746  .0020001  .1559761  Standard error of m_d1level_pirls_read
m_d2level_~d  364    328  .1880123  .0296504  .3711316  Mean of d2level_pirls_read
se_d2level~d  364    328  .0187205  .0068064  .1104154  Standard error of m_d2level_pirls_read
m_d3level_~d  364    328  .3261493  .0201531  .4965755  Mean of d3level_pirls_read
se_d3level~d  364    328   .022663  .0084353  .1083833  Standard error of m_d3level_pirls_read
m_d4level_~d  364    328  .2693774  .0037364  .5242894  Mean of d4level_pirls_read
se_d4level~d  364    328  .0206282  .0044612  .1464718  Standard error of m_d4level_pirls_read
m_d5level_~d  364    326  .0713217         0  .3299537  Mean of d5level_pirls_read
se_d5level~d  364    326  .0114077         0  .1140319  Standard error of m_d5level_pirls_read
n_total       364     35  4304.464      2488      8253  # learners, by countrycode idgrade
n_male        364     35  2152.799      1232      4131  # male learners, by countrycode idgrade
n_urban       364     35  2993.393         0      7002  # urban learners, by countrycode idgrade
n_has_qescs   364     33  4073.003         0      8253  # has_qescs learners, by countrycode idgrade
n_qescs       364     33  12498.57         0     25784  # qescs learners, by countrycode idgrade
------------------------------------------------------------------------------------------------------------

~~~~

About the **364     observations** in this dataset:

~~~~
. tab countrycode idgrade

WB country |
   code (3 |             Grade ID
  letters) |         3          4          5 |     Total
-----------+---------------------------------+----------
       ARG |         0         11          0 |        11 
       BGR |         0         11          0 |        11 
       BLZ |         0         11          0 |        11 
       CAN |         0         11          0 |        11 
       COL |         0         11          0 |        11 
       CYP |         0         11          0 |        11 
       CZE |         0         11          0 |        11 
       DEU |         0         11          0 |        11 
       FRA |         0         11          0 |        11 
       GBR |         0          0         11 |        11 
       GRC |         0         11          0 |        11 
       HKG |         0          9          0 |         9 
       HUN |         0         11          0 |        11 
       IRN |         0         10          0 |        10 
       ISL |         0         11          0 |        11 
       ISR |         0         11          0 |        11 
       ITA |         0         11          0 |        11 
       KWT |         0          6          0 |         6 
       LTU |         0         11          0 |        11 
       LVA |         0         11          0 |        11 
       MAR |         0          6          0 |         6 
       MDA |         0         11          0 |        11 
       MKD |         0         10          0 |        10 
       NLD |         0         11          0 |        11 
       NOR |         0         11          0 |        11 
       NZL |         0         11          0 |        11 
       ROU |         0         11          0 |        11 
       RUS |         0         10          0 |        10 
       SGP |         0         10          0 |        10 
       SVK |         0         11          0 |        11 
       SVN |        11          0          0 |        11 
       SWE |        11         11          0 |        22 
       TUR |         0         11          0 |        11 
       USA |         0          6          0 |         6 
-----------+---------------------------------+----------
     Total |        22        331         11 |       364 

. 
. tab subgroup

  Subgroups |
         of |
countrycode |
    idgrade |      Freq.     Percent        Cum.
------------+-----------------------------------
        all |         35        9.62        9.62
has_qescs=0 |          3        0.82       10.44
has_qescs=1 |         32        8.79       19.23
     male=0 |         35        9.62       28.85
     male=1 |         35        9.62       38.46
    qescs=1 |         32        8.79       47.25
    qescs=2 |         32        8.79       56.04
    qescs=3 |         32        8.79       64.84
    qescs=4 |         32        8.79       73.63
    qescs=5 |         32        8.79       82.42
    urban=0 |         30        8.24       90.66
    urban=1 |         34        9.34      100.00
------------+-----------------------------------
      Total |        364      100.00

~~~~
