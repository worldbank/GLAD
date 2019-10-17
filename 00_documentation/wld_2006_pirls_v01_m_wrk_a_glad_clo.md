Documentation of CLO dataset
=====================================================================


[back to list of assessments](https://github.com/worldbank/GLAD/blob/master/README.md#indicators)

This dataset contains harmonized aggregated data from PIRLS 2006 and is part of the Country Level Outcomes (CLO)

**Metadata** stored in this dataset:

~~~~
region:      WLD
year:        2006
assessment:  PIRLS
master:      v01_M
adaptation:  wrk_A_GLAD
module:      CLO
ttl_info:    Joao Pedro de Azevedo [eduanalytics@worldbank.org]
dofile_info: last modified by Diana Goldemberg in October 8, 2019
lastsave:    10 Oct 2019 00:34:07 by wb552057
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
countrycode   195     37         .         .         .  WB country code (3 letters)
idgrade       195      2  4.128205         4         5  Grade ID
subgroup      195      5         .         .         .  Subgroups of countrycode idgrade
n_hpro_read   190    188  2928.316        90     14657  Number of observations used to calculate m_hpro_read
m_hpro_read   190    189  .8380349  .0975556  .9959468  Mean of hpro_read
se_hpro_read  190    189  .0123022  .0015975  .0771605  Standard error of m_hpro_read
n_score_pi~d  190    188  2928.316        90     14657  Number of observations used to calculate m_score_pirls_read
m_score_pi~d  190    189  497.8187  254.2297  574.9194  Mean of score_pirls_read
se_score_p~d  190    189  4.164769  1.084006  16.98787  Standard error of m_score_pirls_read
m_d1level_~d  190    189  .1619651  .0040532  .9024444  Mean of d1level_pirls_read
se_d1level~d  190    189  .0123022  .0015975  .0771605  Standard error of m_d1level_pirls_read
m_d2level_~d  190    189  .1719908  .0493263  .3718455  Mean of d2level_pirls_read
se_d2level~d  190    189  .0144919  .0048524   .046764  Standard error of m_d2level_pirls_read
m_d3level_~d  190    189  .3196507   .018807  .4711784  Mean of d3level_pirls_read
se_d3level~d  190    189  .0171852   .004355  .0825337  Standard error of m_d3level_pirls_read
m_d4level_~d  190    189  .2740366  .0042727  .4921412  Mean of d4level_pirls_read
se_d4level~d  190    189  .0162074  .0017073  .1013359  Standard error of m_d4level_pirls_read
m_d5level_~d  190    187  .0723567         0  .2198219  Mean of d5level_pirls_read
se_d5level~d  190    187  .0102621         0   .089228  Standard error of m_d5level_pirls_read
n_total       195     39  4953.077      1379     14657  # learners, by countrycode idgrade
n_male        195     39  2503.359       703      7089  # male learners, by countrycode idgrade
n_urban       195     38  3684.256         0     11388  # urban learners, by countrycode idgrade
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

~~~~

About the **195     observations** in this dataset:

~~~~
. tab countrycode idgrade

WB country |
   code (3 |       Grade ID
  letters) |         4          5 |     Total
-----------+----------------------+----------
       AUT |         5          0 |         5 
       BEL |         5          0 |         5 
       BGR |         5          0 |         5 
       DEU |         5          0 |         5 
       DNK |         5          0 |         5 
       ESP |         5          0 |         5 
       FRA |         5          0 |         5 
       GBR |         5          0 |         5 
       GEO |         5          0 |         5 
       HKG |         5          0 |         5 
       HUN |         5          0 |         5 
       IDN |         5          0 |         5 
       IRN |         5          0 |         5 
       ISL |         5          5 |        10 
       ISR |         5          0 |         5 
       ITA |         5          0 |         5 
       KWT |         5          0 |         5 
       LTU |         5          0 |         5 
       LUX |         0          5 |         5 
       LVA |         5          0 |         5 
       MAR |         5          0 |         5 
       MDA |         5          0 |         5 
       MKD |         5          0 |         5 
       NLD |         5          0 |         5 
       NOR |         5          5 |        10 
       NZL |         0          5 |         5 
       POL |         5          0 |         5 
       QAT |         5          0 |         5 
       ROU |         5          0 |         5 
       RUS |         5          0 |         5 
       SGP |         5          0 |         5 
       SVK |         5          0 |         5 
       SVN |         5          0 |         5 
       SWE |         5          0 |         5 
       TTO |         5          0 |         5 
       USA |         5          0 |         5 
       ZAF |         0          5 |         5 
-----------+----------------------+----------
     Total |       170         25 |       195 

. 
. tab subgroup

  Subgroups |
         of |
countrycode |
    idgrade |      Freq.     Percent        Cum.
------------+-----------------------------------
        all |         39       20.00       20.00
     male=0 |         39       20.00       40.00
     male=1 |         39       20.00       60.00
    urban=0 |         39       20.00       80.00
    urban=1 |         39       20.00      100.00
------------+-----------------------------------
      Total |        195      100.00

~~~~
