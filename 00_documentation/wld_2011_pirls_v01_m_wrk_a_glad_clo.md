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
dofile_info: last modified by Joao Pedro Azevedo in Feburary 5, 2022
lastsave:    12 Feb 2022 15:36:16 by wb255520
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
---------------------------------------------------------------------------------------------------------------------------------------
assessment    527      1         .         .         .  Assessment
year          527      1      2011      2011      2011  Year of assessment
countrycode   527     47         .         .         .  WB country code (3 letters)
idgrade       527      3  4.240987         4         6  Grade ID
subgroup      527     12         .         .         .  Subgroups of countrycode idgrade
n_score_pi~d  527    429  2520.848        66     23206  Number of observations used to calculate m_score_pirls_read
m_score_pi~d  527    477  500.6311  272.0884  612.3714  Mean of score_pirls_read
se_score_p~d  527    477  3.975657  1.397033  25.08432  Standard error of m_score_pirls_read
n_fgt1_read   511    286  392.7221         2      6032  Number of observations used to calculate m_fgt1_read
m_fgt1_read   511    461  .1110222  .0257019  .3696758  Mean of fgt1_read
se_fgt1_read  511    461  .0146636   .003973  .0716424  Standard error of m_fgt1_read
n_fgt2_read   511    286  392.7221         2      6032  Number of observations used to calculate m_fgt2_read
m_fgt2_read   511    461  .0242702  .0011683  .1721485  Mean of fgt2_read
se_fgt2_read  511    461  .0043881  .0008451  .0326249  Standard error of m_fgt2_read
n_sdg411_r~d  527    429  2520.848        66     23206  Number of observations used to calculate m_sdg411_read
m_sdg411_r~d  527    477  .8471019  .1026929  .9995112  Mean of sdg411_read
se_sdg411_~d  527    477  .0138946  .0004921  .0916441  Standard error of m_sdg411_read
n_bmp_read    527    429  2520.848        66     23206  Number of observations used to calculate m_bmp_read
m_bmp_read    527    477  .1528981  .0004888  .8973072  Mean of bmp_read
se_bmp_read   527    477  .0138946  .0004921  .0916441  Standard error of m_bmp_read
m_d1level_~d  527    477  .1528981  .0004888  .8973072  Mean of d1level_pirls_read
se_d1level~d  527    477  .0138946  .0004921  .0916441  Standard error of m_d1level_pirls_read
m_d2level_~d  527    477  .1921967  .0167704  .4135948  Mean of d2level_pirls_read
se_d2level~d  527    477   .016048  .0045538  .0814738  Standard error of m_d2level_pirls_read
m_d3level_~d  527    477  .3176029  .0160649   .496404  Mean of d3level_pirls_read
se_d3level~d  527    477  .0188356  .0054121  .0730649  Standard error of m_d3level_pirls_read
m_d4level_~d  527    477   .262796  .0025043  .5348024  Mean of d4level_pirls_read
se_d4level~d  527    477  .0166896  .0014818  .0723288  Standard error of m_d4level_pirls_read
m_d5level_~d  527    470  .0745062         0  .4474423  Mean of d5level_pirls_read
se_d5level~d  527    470  .0092592         0  .0551045  Standard error of m_d5level_pirls_read
n_total       527     49  5516.101      3190     23206  # learners, by countrycode idgrade
n_male        527     49  2785.085      1343     11687  # male learners, by countrycode idgrade
n_urban       527     49  4370.499      2118     18572  # urban learners, by countrycode idgrade
n_has_qescs   527     48  5326.503         0     23206  # has_qescs learners, by countrycode idgrade
n_qescs       527     48  16364.34         0     67822  # qescs learners, by countrycode idgrade
---------------------------------------------------------------------------------------------------------------------------------------

~~~~

About the **527     observations** in this dataset:

~~~~
. tab countrycode idgrade

WB country |
   code (3 |             Grade ID
  letters) |         4          5          6 |     Total
-----------+---------------------------------+----------
       ARE |        11          0          0 |        11 
       AUS |        11          0          0 |        11 
       AUT |        11          0          0 |        11 
       AZE |        11          0          0 |        11 
       BEL |        11          0          0 |        11 
       BGR |        11          0          0 |        11 
       BWA |         0          0         11 |        11 
       CAN |        11          0          0 |        11 
       COL |        11          0          0 |        11 
       CZE |        11          0          0 |        11 
       DEU |        11          0          0 |        11 
       DNK |        11          0          0 |        11 
       ESP |        11          0          0 |        11 
       FIN |        11          0          0 |        11 
       FRA |        11          0          0 |        11 
       GBR |        11          6          0 |        17 
       GEO |        11          0          0 |        11 
       HKG |        10          0          0 |        10 
       HND |         0          0         11 |        11 
       HRV |        11          0          0 |        11 
       HUN |        11          0          0 |        11 
       IDN |        11          0          0 |        11 
       IRL |        11          0          0 |        11 
       IRN |        11          0          0 |        11 
       ISR |        11          0          0 |        11 
       ITA |        11          0          0 |        11 
       KWT |         0          0         11 |        11 
       LTU |        11          0          0 |        11 
       MAR |        11          0         11 |        22 
       MLT |         0         11          0 |        11 
       NLD |        11          0          0 |        11 
       NOR |        11          0          0 |        11 
       NZL |         0         11          0 |        11 
       OMN |        11          0          0 |        11 
       POL |        11          0          0 |        11 
       PRT |        11          0          0 |        11 
       QAT |        11          0          0 |        11 
       ROU |        11          0          0 |        11 
       RUS |        11          0          0 |        11 
       SAU |        11          0          0 |        11 
       SGP |        10          0          0 |        10 
       SVK |        11          0          0 |        11 
       SVN |        11          0          0 |        11 
       SWE |        11          0          0 |        11 
       TTO |        11          0          0 |        11 
       USA |         6          0          0 |         6 
       ZAF |         0         11          0 |        11 
-----------+---------------------------------+----------
     Total |       444         39         44 |       527 

. 
. tab subgroup

  Subgroups |
         of |
countrycode |
    idgrade |      Freq.     Percent        Cum.
------------+-----------------------------------
        all |         49        9.30        9.30
has_qescs=0 |          2        0.38        9.68
has_qescs=1 |         47        8.92       18.60
     male=0 |         49        9.30       27.89
     male=1 |         49        9.30       37.19
    qescs=1 |         47        8.92       46.11
    qescs=2 |         47        8.92       55.03
    qescs=3 |         47        8.92       63.95
    qescs=4 |         47        8.92       72.87
    qescs=5 |         47        8.92       81.78
    urban=0 |         47        8.92       90.70
    urban=1 |         49        9.30      100.00
------------+-----------------------------------
      Total |        527      100.00

~~~~
