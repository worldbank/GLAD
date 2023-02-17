Documentation of CLO dataset
=====================================================================


[back to list of assessments](https://github.com/worldbank/GLAD/blob/master/README.md#indicators)

This dataset contains harmonized aggregated data from AMPLB 2021 and is part of the Country Level Outcomes (CLO)

**Metadata** stored in this dataset:

~~~~
region:      SSA
year:        2021
assessment:  AMPLB
master:      v01_M
adaptation:  wrk_A_GLAD
module:      CLO
ttl_info:    Joao Pedro de Azevedo [eduanalytics@worldbank.org]
dofile_info: last modified by Yi Ning Wong in March 9, 2022
lastsave:    1 Apr 2022 22:08:30 by wb255520
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
assessment     66      1         .         .         .  Assessment
year           66      1      2021      2021      2021  Year of assessment
countrycode    66      6         .         .         .  WB country code (3 letters)
idgrade        66      3         6         5         7  Grade ID
subgroup       66     11         .         .         .  Subgroups of countrycode idgrade
n_sdg411_r~d   66     56  2164.909       187      5880  Number of observations used to calculate m_sdg411_read
m_sdg411_r~d   66     60  .1467066         0  .7742057  Mean of sdg411_read
se_sdg411_~d   66     60  .0049234         0   .019263  Standard error of m_sdg411_read
n_sdg411_m~h   66     56  2164.909       187      5880  Number of observations used to calculate m_sdg411_math
m_sdg411_m~h   66     60  .2698831  .0037991  .8362334  Mean of sdg411_math
se_sdg411_~h   66     60  .0070521  .0013077    .02355  Standard error of m_sdg411_math
n_bmp_read     66     56  2164.909       187      5880  Number of observations used to calculate m_bmp_read
m_bmp_read     66     60  .8532934  .2257943         1  Mean of bmp_read
se_bmp_read    66     60  .0049234         0   .019263  Standard error of m_bmp_read
n_bmp_math     66     56  2164.909       187      5880  Number of observations used to calculate m_bmp_math
m_bmp_math     66     60  .7301169  .1637667  .9962009  Mean of bmp_math
se_bmp_math    66     60  .0070521  .0013077    .02355  Standard error of m_bmp_math
n_total        66      6  4776.167      4403      5880  # learners, by countrycode idgrade
n_male         66      6  2277.167      2021      2914  # male learners, by countrycode idgrade
n_urban        66      6  686.3333       187      1221  # urban learners, by countrycode idgrade
n_has_qescs    66      6  4776.167      4403      5880  # has_qescs learners, by countrycode idgrade
n_qescs        66      6  14271.67     13007     17669  # qescs learners, by countrycode idgrade
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

~~~~

About the **66      observations** in this dataset:

~~~~
. tab countrycode idgrade

WB country |
   code (3 |             Grade ID
  letters) |         5          6          7 |     Total
-----------+---------------------------------+----------
       BDI |         0         11          0 |        11 
       BFA |         0         11          0 |        11 
       CIV |         0         11          0 |        11 
       KEN |         0          0         11 |        11 
       SEN |         0         11          0 |        11 
       ZMB |        11          0          0 |        11 
-----------+---------------------------------+----------
     Total |        11         44         11 |        66 

. 
. tab subgroup

  Subgroups |
         of |
countrycode |
    idgrade |      Freq.     Percent        Cum.
------------+-----------------------------------
        all |          6        9.09        9.09
has_qescs=1 |          6        9.09       18.18
     male=0 |          6        9.09       27.27
     male=1 |          6        9.09       36.36
    qescs=1 |          6        9.09       45.45
    qescs=2 |          6        9.09       54.55
    qescs=3 |          6        9.09       63.64
    qescs=4 |          6        9.09       72.73
    qescs=5 |          6        9.09       81.82
    urban=0 |          6        9.09       90.91
    urban=1 |          6        9.09      100.00
------------+-----------------------------------
      Total |         66      100.00

~~~~
