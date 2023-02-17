Documentation of CLO dataset
=====================================================================


[back to list of assessments](https://github.com/worldbank/GLAD/blob/master/README.md#indicators)

This dataset contains harmonized aggregated data from AMPLB 2019 and is part of the Country Level Outcomes (CLO)

**Metadata** stored in this dataset:

~~~~
region:      SSA
year:        2019
assessment:  AMPLB
master:      v01_M
adaptation:  wrk_A_GLAD
module:      CLO
ttl_info:    Joao Pedro de Azevedo [eduanalytics@worldbank.org]
dofile_info: last modified by Yi Ning Wong in March 9, 2022
lastsave:    4 Apr 2022 11:55:25 by wb255520
~~~~


About the **22 variables** in this dataset:

~~~~
The variables belong to the following variable classifications:
idvars valuevars traitvars

idvars:    assessment year countrycode idgrade subgroup
valuevars: n_sdg411_read m_sdg411_read se_sdg411_read n_sdg411_math m_sdg411_math se_sdg411_math n_bmp_read m_bmp_read se_bmp_read n_bmp_math m_bmp_math se_bmp_math
traitvars: n_total n_male n_urban n_has_qescs n_qescs

. codebook, compact

Variable      Obs Unique      Mean       Min       Max  Label
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
assessment     48      1         .         .         .  Assessment
year           48      1      2019      2019      2019  Year of assessment
countrycode    48      6         .         .         .  WB country code (3 letters)
idgrade        48      1         6         6         6  Grade ID
subgroup       48     12         .         .         .  Subgroups of countrycode idgrade
n_sdg411_r~d   46     41  2272.174       520      6499  Number of observations used to calculate m_sdg411_read
m_sdg411_r~d   46     38  .0789009         0  .3256082  Mean of sdg411_read
se_sdg411_~d   46     38  .0045616         0  .0143304  Standard error of m_sdg411_read
n_sdg411_m~h   48     42  2396.792       520      6499  Number of observations used to calculate m_sdg411_math
m_sdg411_m~h   48     42  .2170041  .0305063  .7972655  Mean of sdg411_math
se_sdg411_~h   48     42  .0065756  .0016902  .0139101  Standard error of m_sdg411_math
n_bmp_read     46     41  2272.174       520      6499  Number of observations used to calculate m_bmp_read
m_bmp_read     46     38  .9210991  .6743919         1  Mean of bmp_read
se_bmp_read    46     38  .0045616         0  .0143304  Standard error of m_bmp_read
n_bmp_math     48     42  2396.792       520      6499  Number of observations used to calculate m_bmp_math
m_bmp_math     48     42  .7829959  .2027345  .9694937  Mean of bmp_math
se_bmp_math    48     42  .0065756  .0016902  .0139101  Standard error of m_bmp_math
n_total        48      6  4788.792      3811      6499  # learners, by countrycode idgrade
n_male         48      5  2071.667         0      3100  # male learners, by countrycode idgrade
n_urban        48      5  1287.458         0      1988  # urban learners, by countrycode idgrade
n_has_qescs    48      5  4365.625         0      6499  # has_qescs learners, by countrycode idgrade
n_qescs        48      5   12048.9         0     17662  # qescs learners, by countrycode idgrade
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

~~~~

About the **48      observations** in this dataset:

~~~~
. tab countrycode idgrade

WB country |
   code (3 |  Grade ID
  letters) |         6 |     Total
-----------+-----------+----------
       BDI |        11 |        11 
       BFA |        11 |        11 
       CIV |        11 |        11 
       KEN |         2 |         2 
       SEN |        11 |        11 
       ZMB |         2 |         2 
-----------+-----------+----------
     Total |        48 |        48 

. 
. tab subgroup

  Subgroups |
         of |
countrycode |
    idgrade |      Freq.     Percent        Cum.
------------+-----------------------------------
        all |          6       12.50       12.50
has_qescs=0 |          2        4.17       16.67
has_qescs=1 |          4        8.33       25.00
     male=0 |          4        8.33       33.33
     male=1 |          4        8.33       41.67
    qescs=1 |          4        8.33       50.00
    qescs=2 |          4        8.33       58.33
    qescs=3 |          4        8.33       66.67
    qescs=4 |          4        8.33       75.00
    qescs=5 |          4        8.33       83.33
    urban=0 |          4        8.33       91.67
    urban=1 |          4        8.33      100.00
------------+-----------------------------------
      Total |         48      100.00

~~~~
