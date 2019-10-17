Documentation of CLO dataset
=====================================================================


[back to list of assessments](https://github.com/worldbank/GLAD/blob/master/README.md#indicators)

This dataset contains harmonized aggregated data from PIRLS 2011 and is part of the Country Level Outcomes (CLO)

**Metadata** stored in this dataset:

~~~~
region:      WLD
year:        2011
assessment:  PIRLS
master:      v01_M
adaptation:  wrk_A_GLAD
module:      CLO
ttl_info:    Joao Pedro de Azevedo [eduanalytics@worldbank.org]
dofile_info: last modified by Diana Goldemberg in October 8, 2019
lastsave:    10 Oct 2019 05:40:54 by wb552057
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
countrycode   245     47         .         .         .  WB country code (3 letters)
idgrade       245      3  4.244898         4         6  Grade ID
subgroup      245      5         .         .         .  Subgroups of countrycode idgrade
n_hpro_read   243    238  3290.519        66     23206  Number of observations used to calculate m_hpro_read
m_hpro_read   243    242  .8461022  .1026929  .9966515  Mean of hpro_read
se_hpro_read  243    242  .0136261  .0018537  .0916441  Standard error of m_hpro_read
n_score_pi~d  243    238  3290.519        66     23206  Number of observations used to calculate m_score_pirls_read
m_score_pi~d  243    242  500.3464  272.0884   579.416  Mean of score_pirls_read
se_score_p~d  243    242  4.038108  1.397033  25.08432  Standard error of m_score_pirls_read
m_d1level_~d  243    242  .1538978  .0033485  .8973072  Mean of d1level_pirls_read
se_d1level~d  243    242  .0136261  .0018537  .0916441  Standard error of m_d1level_pirls_read
m_d2level_~d  243    242  .1920249  .0394064  .3909224  Mean of d2level_pirls_read
se_d2level~d  243    242  .0145409  .0045538  .0814738  Standard error of m_d2level_pirls_read
m_d3level_~d  243    242  .3173228  .0160649   .496404  Mean of d3level_pirls_read
se_d3level~d  243    242  .0169373  .0054121  .0730649  Standard error of m_d3level_pirls_read
m_d4level_~d  243    242  .2621952  .0025339  .5170618  Mean of d4level_pirls_read
se_d4level~d  243    242  .0154371  .0020704  .0723288  Standard error of m_d4level_pirls_read
m_d5level_~d  243    240  .0745592         0   .272781  Mean of d5level_pirls_read
se_d5level~d  243    240  .0085408         0  .0551045  Standard error of m_d5level_pirls_read
n_total       245     49  5566.776      3190     23206  # learners, by countrycode idgrade
n_male        245     49  2809.776      1343     11687  # male learners, by countrycode idgrade
n_urban       245     49  4419.796      2118     18572  # urban learners, by countrycode idgrade
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

~~~~

About the **245     observations** in this dataset:

~~~~
. tab countrycode idgrade

WB country |
   code (3 |             Grade ID
  letters) |         4          5          6 |     Total
-----------+---------------------------------+----------
       ARE |         5          0          0 |         5 
       AUS |         5          0          0 |         5 
       AUT |         5          0          0 |         5 
       AZE |         5          0          0 |         5 
       BEL |         5          0          0 |         5 
       BGR |         5          0          0 |         5 
       BWA |         0          0          5 |         5 
       CAN |         5          0          0 |         5 
       COL |         5          0          0 |         5 
       CZE |         5          0          0 |         5 
       DEU |         5          0          0 |         5 
       DNK |         5          0          0 |         5 
       ESP |         5          0          0 |         5 
       FIN |         5          0          0 |         5 
       FRA |         5          0          0 |         5 
       GBR |         5          5          0 |        10 
       GEO |         5          0          0 |         5 
       HKG |         5          0          0 |         5 
       HND |         0          0          5 |         5 
       HRV |         5          0          0 |         5 
       HUN |         5          0          0 |         5 
       IDN |         5          0          0 |         5 
       IRL |         5          0          0 |         5 
       IRN |         5          0          0 |         5 
       ISR |         5          0          0 |         5 
       ITA |         5          0          0 |         5 
       KWT |         0          0          5 |         5 
       LTU |         5          0          0 |         5 
       MAR |         5          0          5 |        10 
       MLT |         0          5          0 |         5 
       NLD |         5          0          0 |         5 
       NOR |         5          0          0 |         5 
       NZL |         0          5          0 |         5 
       OMN |         5          0          0 |         5 
       POL |         5          0          0 |         5 
       PRT |         5          0          0 |         5 
       QAT |         5          0          0 |         5 
       ROU |         5          0          0 |         5 
       RUS |         5          0          0 |         5 
       SAU |         5          0          0 |         5 
       SGP |         5          0          0 |         5 
       SVK |         5          0          0 |         5 
       SVN |         5          0          0 |         5 
       SWE |         5          0          0 |         5 
       TTO |         5          0          0 |         5 
       USA |         5          0          0 |         5 
       ZAF |         0          5          0 |         5 
-----------+---------------------------------+----------
     Total |       205         20         20 |       245 

. 
. tab subgroup

  Subgroups |
         of |
countrycode |
    idgrade |      Freq.     Percent        Cum.
------------+-----------------------------------
        all |         49       20.00       20.00
     male=0 |         49       20.00       40.00
     male=1 |         49       20.00       60.00
    urban=0 |         49       20.00       80.00
    urban=1 |         49       20.00      100.00
------------+-----------------------------------
      Total |        245      100.00

~~~~
