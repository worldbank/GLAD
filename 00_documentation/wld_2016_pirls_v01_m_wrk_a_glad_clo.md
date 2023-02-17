Documentation of CLO dataset
=====================================================================


[back to list of assessments](https://github.com/worldbank/GLAD/blob/master/README.md#indicators)

This dataset contains harmonized aggregated data from PIRLS 2016 and is part of the Country Level Outcomes (CLO)

**Metadata** stored in this dataset:

~~~~
region:      WLD
year:        2016
assessment:  PIRLS
master:      v01_M
adaptation:  wrk_A_GLAD
module:      CLO
ttl_info:    Joao Pedro de Azevedo [eduanalytics@worldbank.org]
dofile_info: last modified by Joao Pedro Azevedo in Feburary 5, 2022
lastsave:    13 Feb 2022 07:35:37 by wb255520
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
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
assessment    545      1         .         .         .  Assessment
year          545      1      2016      2016      2016  Year of assessment
countrycode   545     47         .         .         .  WB country code (3 letters)
idgrade       545      3   4.06055         3         5  Grade ID
subgroup      545     12         .         .         .  Subgroups of countrycode idgrade
n_score_pi~d  545    463  2775.903        13     18245  Number of observations used to calculate m_score_pirls_read
m_score_pi~d  545    496  505.4055  265.4483  620.8828  Mean of score_pirls_read
se_score_p~d  545    496  3.797442    1.0609  22.57915  Standard error of m_score_pirls_read
n_fgt1_read   533    300  522.5028         1     10274  Number of observations used to calculate m_fgt1_read
m_fgt1_read   533    483  .1253423  .0368632  .4243548  Mean of fgt1_read
se_fgt1_read  533    483  .0167659  .0039212  .0977762  Standard error of m_fgt1_read
n_fgt2_read   533    300  522.5028         1     10274  Number of observations used to calculate m_fgt2_read
m_fgt2_read   533    483  .0317676  .0019844  .2375394  Mean of fgt2_read
se_fgt2_read  533    483  .0055534  .0013643  .0311737  Standard error of m_fgt2_read
n_sdg411_r~d  545    463  2775.903        13     18245  Number of observations used to calculate m_sdg411_read
m_sdg411_r~d  545    495  .8497154  .1024853         1  Mean of sdg411_read
se_sdg411_~d  545    495  .0115874         0  .0720434  Standard error of m_sdg411_read
n_bmp_read    545    463  2775.903        13     18245  Number of observations used to calculate m_bmp_read
m_bmp_read    545    495  .1502846         0  .8975146  Mean of bmp_read
se_bmp_read   545    495  .0115874         0  .0720434  Standard error of m_bmp_read
m_d1level_~d  545    495  .1502846         0  .8975146  Mean of d1level_pirls_read
se_d1level~d  545    495  .0115874         0  .0720434  Standard error of m_d1level_pirls_read
m_d2level_~d  545    496  .1693706  .0118412  .3445089  Mean of d2level_pirls_read
se_d2level~d  545    496  .0147178  .0042183  .1285767  Standard error of m_d2level_pirls_read
m_d3level_~d  545    496  .3031961  .0110977     .4825  Mean of d3level_pirls_read
se_d3level~d  545    496  .0182444  .0029579  .1680173  Standard error of m_d3level_pirls_read
m_d4level_~d  545    496  .2847122  .0005322  .5278496  Mean of d4level_pirls_read
se_d4level~d  545    496  .0172928  .0010936  .1501387  Standard error of m_d4level_pirls_read
m_d5level_~d  545    494  .0924366         0  .4921204  Mean of d5level_pirls_read
se_d5level~d  545    494  .0109238         0  .1243352  Standard error of m_d5level_pirls_read
n_total       545     50  6147.763      3349     18245  # learners, by countrycode idgrade
n_male        545     50  3105.736      1703      9136  # male learners, by countrycode idgrade
n_urban       545     50  5101.398      2749     14755  # urban learners, by countrycode idgrade
n_has_qescs   545     50  5986.864         0     18245  # has_qescs learners, by countrycode idgrade
n_qescs       545     50  18378.94         0     54697  # qescs learners, by countrycode idgrade
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

~~~~

About the **545     observations** in this dataset:

~~~~
. tab countrycode idgrade

WB country |
   code (3 |             Grade ID
  letters) |         3          4          5 |     Total
-----------+---------------------------------+----------
       ARE |         0         11          0 |        11 
       AUS |         0         11          0 |        11 
       AUT |         0         11          0 |        11 
       AZE |         0         11          0 |        11 
       BEL |         0         11          0 |        11 
       BGR |         0         11          0 |        11 
       BHR |         0         11          0 |        11 
       CAN |         0         11          0 |        11 
       CHL |         0         11          0 |        11 
       CZE |         0         11          0 |        11 
       DEU |         0         11          0 |        11 
       DNK |        11         11          0 |        22 
       EGY |         0         11          0 |        11 
       ESP |         0         11          0 |        11 
       FIN |         0         11          0 |        11 
       FRA |         0         11          0 |        11 
       GBR |         0         12          0 |        12 
       GEO |         0         11          0 |        11 
       HKG |         0         11          0 |        11 
       HUN |         0         11          0 |        11 
       IRL |         0         11          0 |        11 
       IRN |         0         11          0 |        11 
       ISR |         0         11          0 |        11 
       ITA |         0         11          0 |        11 
       KAZ |         0         11          0 |        11 
       KWT |         0         11          0 |        11 
       LTU |         0         11          0 |        11 
       LVA |         0         11          0 |        11 
       MAC |         0         11          0 |        11 
       MAR |         0         11          0 |        11 
       MLT |         0          0         11 |        11 
       NLD |         0         11          0 |        11 
       NOR |         0         11         11 |        22 
       NZL |         0          0         11 |        11 
       OMN |         0         11          0 |        11 
       POL |         0         11          0 |        11 
       PRT |         0         11          0 |        11 
       QAT |         0         11          0 |        11 
       RUS |         0         11          0 |        11 
       SAU |         0         11          0 |        11 
       SGP |         0         10          0 |        10 
       SVK |         0         11          0 |        11 
       SVN |         0         11          0 |        11 
       SWE |         0         11          0 |        11 
       TTO |         0         11          0 |        11 
       USA |         0          6          0 |         6 
       ZAF |         0         11         11 |        22 
-----------+---------------------------------+----------
     Total |        11        490         44 |       545 

. 
. tab subgroup

  Subgroups |
         of |
countrycode |
    idgrade |      Freq.     Percent        Cum.
------------+-----------------------------------
        all |         50        9.17        9.17
has_qescs=0 |          2        0.37        9.54
has_qescs=1 |         49        8.99       18.53
     male=0 |         50        9.17       27.71
     male=1 |         50        9.17       36.88
    qescs=1 |         49        8.99       45.87
    qescs=2 |         49        8.99       54.86
    qescs=3 |         49        8.99       63.85
    qescs=4 |         49        8.99       72.84
    qescs=5 |         49        8.99       81.83
    urban=0 |         49        8.99       90.83
    urban=1 |         50        9.17      100.00
------------+-----------------------------------
      Total |        545      100.00

~~~~
