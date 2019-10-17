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
dofile_info: last modified by Diana Goldemberg in October 8, 2019
lastsave:    10 Oct 2019 00:01:29 by wb552057
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
countrycode   175     34         .         .         .  WB country code (3 letters)
idgrade       175      3  3.971429         3         5  Grade ID
subgroup      175      5         .         .         .  Subgroups of countrycode idgrade
n_hpro_read   169    166  2465.379        25      8253  Number of observations used to calculate m_hpro_read
m_hpro_read   169    168  .8431749   .217554  .9956234  Mean of hpro_read
se_hpro_read  169    168  .0169027  .0022858  .1559761  Standard error of m_hpro_read
n_score_pi~d  169    166  2465.379        25      8253  Number of observations used to calculate m_score_pirls_read
m_score_pi~d  169    168  498.7231  314.5581  572.2704  Mean of score_pirls_read
se_score_p~d  169    168  5.480772  1.199003  56.61574  Standard error of m_score_pirls_read
m_d1level_~d  169    168  .1568251  .0043766   .782446  Mean of d1level_pirls_read
se_d1level~d  169    168  .0169027  .0022858  .1559761  Standard error of m_d1level_pirls_read
m_d2level_~d  169    168  .1900655  .0563007  .3664504  Mean of d2level_pirls_read
se_d2level~d  169    168  .0189586  .0068064  .1104154  Standard error of m_d2level_pirls_read
m_d3level_~d  169    168  .3205446  .0575949  .4606888  Mean of d3level_pirls_read
se_d3level~d  169    168  .0219781  .0084353  .1083833  Standard error of m_d3level_pirls_read
m_d4level_~d  169    168  .2629895  .0060796  .4655567  Mean of d4level_pirls_read
se_d4level~d  169    168  .0203885  .0044612  .1464718  Standard error of m_d4level_pirls_read
m_d5level_~d  169    167  .0695752         0  .2322257  Mean of d5level_pirls_read
se_d5level~d  169    167  .0111996         0  .1140319  Standard error of m_d5level_pirls_read
n_total       175     35  4336.029      2488      8253  # learners, by countrycode idgrade
n_male        175     35  2162.771      1232      4131  # male learners, by countrycode idgrade
n_urban       175     35  2978.371         0      7002  # urban learners, by countrycode idgrade
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

~~~~

About the **175     observations** in this dataset:

~~~~
. tab countrycode idgrade

WB country |
   code (3 |             Grade ID
  letters) |         3          4          5 |     Total
-----------+---------------------------------+----------
       ARG |         0          5          0 |         5 
       BGR |         0          5          0 |         5 
       BLZ |         0          5          0 |         5 
       CAN |         0          5          0 |         5 
       COL |         0          5          0 |         5 
       CYP |         0          5          0 |         5 
       CZE |         0          5          0 |         5 
       DEU |         0          5          0 |         5 
       FRA |         0          5          0 |         5 
       GBR |         0          0          5 |         5 
       GRC |         0          5          0 |         5 
       HKG |         0          5          0 |         5 
       HUN |         0          5          0 |         5 
       IRN |         0          5          0 |         5 
       ISL |         0          5          0 |         5 
       ISR |         0          5          0 |         5 
       ITA |         0          5          0 |         5 
       KWT |         0          5          0 |         5 
       LTU |         0          5          0 |         5 
       LVA |         0          5          0 |         5 
       MAR |         0          5          0 |         5 
       MDA |         0          5          0 |         5 
       MKD |         0          5          0 |         5 
       NLD |         0          5          0 |         5 
       NOR |         0          5          0 |         5 
       NZL |         0          5          0 |         5 
       ROU |         0          5          0 |         5 
       RUS |         0          5          0 |         5 
       SGP |         0          5          0 |         5 
       SVK |         0          5          0 |         5 
       SVN |         5          0          0 |         5 
       SWE |         5          5          0 |        10 
       TUR |         0          5          0 |         5 
       USA |         0          5          0 |         5 
-----------+---------------------------------+----------
     Total |        10        160          5 |       175 

. 
. tab subgroup

  Subgroups |
         of |
countrycode |
    idgrade |      Freq.     Percent        Cum.
------------+-----------------------------------
        all |         35       20.00       20.00
     male=0 |         35       20.00       40.00
     male=1 |         35       20.00       60.00
    urban=0 |         35       20.00       80.00
    urban=1 |         35       20.00      100.00
------------+-----------------------------------
      Total |        175      100.00

~~~~
