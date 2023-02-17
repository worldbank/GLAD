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
dofile_info: last modified by Joao Pedro Azevedo in Feburary 5, 2022
lastsave:    13 Feb 2022 02:02:02 by wb255520
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
assessment    419      1         .         .         .  Assessment
year          419      1      2006      2006      2006  Year of assessment
countrycode   419     37         .         .         .  WB country code (3 letters)
idgrade       419      2  4.126492         4         5  Grade ID
subgroup      419     12         .         .         .  Subgroups of countrycode idgrade
n_score_pi~d  419    356  2237.542        90     14657  Number of observations used to calculate m_score_pirls_read
m_score_pi~d  419    379  498.9284  238.8987  605.7749  Mean of score_pirls_read
se_score_p~d  419    379  4.048794  1.084006  16.98787  Standard error of m_score_pirls_read
n_fgt1_read   403    234  430.5335         1     11966  Number of observations used to calculate m_fgt1_read
m_fgt1_read   403    363  .1204951  .0299773  .4407697  Mean of fgt1_read
se_fgt1_read  403    363  .0153223  .0028734  .0914851  Standard error of m_fgt1_read
n_fgt2_read   403    234  430.5335         1     11966  Number of observations used to calculate m_fgt2_read
m_fgt2_read   403    363  .0312147  .0015332  .2415215  Mean of fgt2_read
se_fgt2_read  403    363  .0049547  .0008242  .0379195  Standard error of m_fgt2_read
n_sdg411_r~d  419    356  2237.542        90     14657  Number of observations used to calculate m_sdg411_read
m_sdg411_r~d  419    379  .8403918  .0700373  .9994597  Mean of sdg411_read
se_sdg411_~d  419    379  .0123766  .0006114  .0771605  Standard error of m_sdg411_read
n_bmp_read    419    356  2237.542        90     14657  Number of observations used to calculate m_bmp_read
m_bmp_read    419    379  .1596082  .0005403  .9299626  Mean of bmp_read
se_bmp_read   419    379  .0123766  .0006114  .0771605  Standard error of m_bmp_read
m_d1level_~d  419    379  .1596082  .0005403  .9299626  Mean of d1level_pirls_read
se_d1level~d  419    379  .0123766  .0006114  .0771605  Standard error of m_d1level_pirls_read
m_d2level_~d  419    379  .1700219  .0194905  .3878607  Mean of d2level_pirls_read
se_d2level~d  419    379  .0158364  .0044625   .046764  Standard error of m_d2level_pirls_read
m_d3level_~d  419    379  .3189792  .0110671  .5294558  Mean of d3level_pirls_read
se_d3level~d  419    379  .0192435   .002845  .0825337  Standard error of m_d3level_pirls_read
m_d4level_~d  419    379   .277438  .0006394  .5714049  Mean of d4level_pirls_read
se_d4level~d  419    379  .0180258  .0009878  .1013359  Standard error of m_d4level_pirls_read
m_d5level_~d  419    368  .0739528         0  .3941409  Mean of d5level_pirls_read
se_d5level~d  419    368  .0107655         0   .089228  Standard error of m_d5level_pirls_read
n_total       419     39  4947.265      1379     14657  # learners, by countrycode idgrade
n_male        419     39   2500.31       703      7089  # male learners, by countrycode idgrade
n_urban       419     38  3701.064         0     11388  # urban learners, by countrycode idgrade
n_has_qescs   419     39  4872.945         0     14657  # has_qescs learners, by countrycode idgrade
n_qescs       419     39  14969.47         0     43399  # qescs learners, by countrycode idgrade
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

~~~~

About the **419     observations** in this dataset:

~~~~
. tab countrycode idgrade

WB country |
   code (3 |       Grade ID
  letters) |         4          5 |     Total
-----------+----------------------+----------
       AUT |        11          0 |        11 
       BEL |        11          0 |        11 
       BGR |        11          0 |        11 
       DEU |        11          0 |        11 
       DNK |        11          0 |        11 
       ESP |        11          0 |        11 
       FRA |        11          0 |        11 
       GBR |        11          0 |        11 
       GEO |        11          0 |        11 
       HKG |         9          0 |         9 
       HUN |        11          0 |        11 
       IDN |        11          0 |        11 
       IRN |        11          0 |        11 
       ISL |        11         11 |        22 
       ISR |        11          0 |        11 
       ITA |        11          0 |        11 
       KWT |        11          0 |        11 
       LTU |        11          0 |        11 
       LUX |         0          9 |         9 
       LVA |        11          0 |        11 
       MAR |        11          0 |        11 
       MDA |        11          0 |        11 
       MKD |        11          0 |        11 
       NLD |        11          0 |        11 
       NOR |        11         11 |        22 
       NZL |         0         11 |        11 
       POL |        11          0 |        11 
       QAT |        11          0 |        11 
       ROU |        11          0 |        11 
       RUS |        11          0 |        11 
       SGP |        10          0 |        10 
       SVK |        11          0 |        11 
       SVN |        11          0 |        11 
       SWE |        11          0 |        11 
       TTO |        11          0 |        11 
       USA |         6          0 |         6 
       ZAF |         0         11 |        11 
-----------+----------------------+----------
     Total |       366         53 |       419 

. 
. tab subgroup

  Subgroups |
         of |
countrycode |
    idgrade |      Freq.     Percent        Cum.
------------+-----------------------------------
        all |         39        9.31        9.31
has_qescs=0 |          1        0.24        9.55
has_qescs=1 |         38        9.07       18.62
     male=0 |         39        9.31       27.92
     male=1 |         39        9.31       37.23
    qescs=1 |         38        9.07       46.30
    qescs=2 |         38        9.07       55.37
    qescs=3 |         38        9.07       64.44
    qescs=4 |         38        9.07       73.51
    qescs=5 |         38        9.07       82.58
    urban=0 |         36        8.59       91.17
    urban=1 |         37        8.83      100.00
------------+-----------------------------------
      Total |        419      100.00

~~~~
