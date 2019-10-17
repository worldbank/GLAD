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
dofile_info: last modified by Diana Goldemberg in October 8, 2019
lastsave:    10 Oct 2019 11:08:03 by wb552057
~~~~


About the **22 variables** in this dataset:

~~~~
The variables belong to the following variable classifications:
idvars valuevars traitvars

idvars:    countrycode idgrade subgroup
valuevars: n_hpro_read m_hpro_read se_hpro_read n_score_pirls_read m_score_pirls_read se_score_pirls_read m_d1level_pirls_read se_d1level_pirls_read m_d2level_pirls_read se_d2level_pirls_read m_d3level_pirls_read se_d3level_pirls_read m_d4level_pirls_read se_d4level_pirls_read m_d5level_pirls_read se_d5level_pirls_read
traitvars: n_total n_male n_urban

. codebook, compact

Variable      Obs Unique      Mean       Min       Max  Label
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
countrycode   250     47         .         .         .  WB country code (3 letters)
idgrade       250      3      4.06         3         5  Grade ID
subgroup      250      5         .         .         .  Subgroups of countrycode idgrade
n_hpro_read   249    244  3652.992        13     18245  Number of observations used to calculate m_hpro_read
m_hpro_read   249    249  .8486476  .1612411         1  Mean of hpro_read
se_hpro_read  249    249  .0116192         0  .0720434  Standard error of m_hpro_read
n_score_pi~d  249    244  3652.992        13     18245  Number of observations used to calculate m_score_pirls_read
m_score_pi~d  249    249  504.6318  294.6077  588.1525  Mean of score_pirls_read
se_score_p~d  249    249  3.911415    1.0609  22.57915  Standard error of m_score_pirls_read
m_d1level_~d  249    249  .1513524         0  .8387589  Mean of d1level_pirls_read
se_d1level~d  249    249  .0116192         0  .0720434  Standard error of m_d1level_pirls_read
m_d2level_~d  249    249  .1708539  .0445616  .3247907  Mean of d2level_pirls_read
se_d2level~d  249    249  .0140126  .0056106  .1285767  Standard error of m_d2level_pirls_read
m_d3level_~d  249    249  .3042533  .0298326     .4825  Mean of d3level_pirls_read
se_d3level~d  249    249  .0169771  .0073319  .1680173  Standard error of m_d3level_pirls_read
m_d4level_~d  249    249  .2826672  .0043113  .4864944  Mean of d4level_pirls_read
se_d4level~d  249    249  .0162146  .0021805  .1501387  Standard error of m_d4level_pirls_read
m_d5level_~d  249    249  .0908733   .000198  .3217893  Mean of d5level_pirls_read
se_d5level~d  249    249  .0106117  .0003103  .1243352  Standard error of m_d5level_pirls_read
n_total       250     50   6127.92      3349     18245  # learners, by countrycode idgrade
n_male        250     50   3095.52      1703      9136  # male learners, by countrycode idgrade
n_urban       250     50   5089.86      2749     14755  # urban learners, by countrycode idgrade
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

~~~~

About the **250     observations** in this dataset:

~~~~
. tab countrycode idgrade

WB country |
   code (3 |             Grade ID
  letters) |         3          4          5 |     Total
-----------+---------------------------------+----------
       ARE |         0          5          0 |         5 
       AUS |         0          5          0 |         5 
       AUT |         0          5          0 |         5 
       AZE |         0          5          0 |         5 
       BEL |         0          5          0 |         5 
       BGR |         0          5          0 |         5 
       BHR |         0          5          0 |         5 
       CAN |         0          5          0 |         5 
       CHL |         0          5          0 |         5 
       CZE |         0          5          0 |         5 
       DEU |         0          5          0 |         5 
       DNK |         5          5          0 |        10 
       EGY |         0          5          0 |         5 
       ESP |         0          5          0 |         5 
       FIN |         0          5          0 |         5 
       FRA |         0          5          0 |         5 
       GBR |         0          5          0 |         5 
       GEO |         0          5          0 |         5 
       HKG |         0          5          0 |         5 
       HUN |         0          5          0 |         5 
       IRL |         0          5          0 |         5 
       IRN |         0          5          0 |         5 
       ISR |         0          5          0 |         5 
       ITA |         0          5          0 |         5 
       KAZ |         0          5          0 |         5 
       KWT |         0          5          0 |         5 
       LTU |         0          5          0 |         5 
       LVA |         0          5          0 |         5 
       MAC |         0          5          0 |         5 
       MAR |         0          5          0 |         5 
       MLT |         0          0          5 |         5 
       NLD |         0          5          0 |         5 
       NOR |         0          5          5 |        10 
       NZL |         0          0          5 |         5 
       OMN |         0          5          0 |         5 
       POL |         0          5          0 |         5 
       PRT |         0          5          0 |         5 
       QAT |         0          5          0 |         5 
       RUS |         0          5          0 |         5 
       SAU |         0          5          0 |         5 
       SGP |         0          5          0 |         5 
       SVK |         0          5          0 |         5 
       SVN |         0          5          0 |         5 
       SWE |         0          5          0 |         5 
       TTO |         0          5          0 |         5 
       USA |         0          5          0 |         5 
       ZAF |         0          5          5 |        10 
-----------+---------------------------------+----------
     Total |         5        225         20 |       250 

. 
. tab subgroup

  Subgroups |
         of |
countrycode |
    idgrade |      Freq.     Percent        Cum.
------------+-----------------------------------
        all |         50       20.00       20.00
     male=0 |         50       20.00       40.00
     male=1 |         50       20.00       60.00
    urban=0 |         50       20.00       80.00
    urban=1 |         50       20.00      100.00
------------+-----------------------------------
      Total |        250      100.00

~~~~
