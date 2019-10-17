Documentation of CLO dataset
=====================================================================


[back to list of assessments](https://github.com/worldbank/GLAD/blob/master/README.md#indicators)

This dataset contains harmonized aggregated data from LLECE 2006 and is part of the Country Level Outcomes (CLO)

**Metadata** stored in this dataset:

~~~~
region:      LAC
year:        2006
assessment:  LLECE
master:      v01_M
adaptation:  wrk_A_GLAD
module:      CLO
ttl_info:    Joao Pedro de Azevedo [eduanalytics@worldbank.org]
dofile_info: last modified by Diana Goldemberg in October 8, 2019
lastsave:    9 Oct 2019 21:00:26 by wb552057
~~~~


About the **48 variables** in this dataset:

~~~~
The variables belong to the following variable classifications:
idvars valuevars traitvars

idvars:    countrycode idgrade subgroup
valuevars: n_hpro_read m_hpro_read se_hpro_read n_score_llece_read m_score_llece_read se_score_llece_read n_score_llece_math m_score_llece_math se_score_llece_math n_score_llece_science m_score_llece_science se_score_llece_science m_d1level_llece_read se_d1level_llece_read m_d2level_llece_read se_d2level_llece_read m_d3level_llece_read se_d3level_llece_read m_d4level_llece_read se_d4level_llece_read m_d5level_llece_read se_d5level_llece_read m_d1level_llece_math se_d1level_llece_math m_d2level_llece_math se_d2level_llece_math m_d3level_llece_math se_d3level_llece_math m_d4level_llece_math se_d4level_llece_math m_d5level_llece_math se_d5level_llece_math m_d1level_llece_science se_d1level_llece_science m_d2level_llece_science se_d2level_llece_science m_d3level_llece_science se_d3level_llece_science m_d4level_llece_science se_d4level_llece_science m_d5level_llece_science se_d5level_llece_science
traitvars: n_total n_male n_urban

. codebook, compact

Variable      Obs Unique      Mean       Min       Max  Label
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
countrycode   160     16         .         .         .  WB country code (3 letters)
idgrade       160      2       4.5         3         6  Grade ID
subgroup      160      5         .         .         .  Subgroups of countrycode idgrade
n_hpro_read   160     81  1587.412         0      6616  Number of observations used to calculate m_hpro_read
m_hpro_read    80     80  .4024968   .060597  .7788593  Mean of hpro_read
se_hpro_read   80     80  .0090574  .0046539  .0286085  Standard error of m_hpro_read
n_score_ll~d  160    158      3231       295      7302  Number of observations used to calculate m_score_llece_read
m_score_ll~d  160    160  497.5197  383.8596  633.8776  Mean of score_llece_read
se_score_l~d  160    160  1.854446  .9273065  6.142234  Standard error of m_score_llece_read
n_score_ll~h  160    159  3121.625       292      7227  Number of observations used to calculate m_score_llece_math
m_score_ll~h  160    160  499.5336  398.2435  650.4786  Mean of score_llece_math
se_score_l~h  160    160  1.840584  .8829151  6.228195  Standard error of m_score_llece_math
n_score_ll~e  160     45    871.25         0      6179  Number of observations used to calculate m_score_llece_science
m_score_ll~e   45     45  498.7802  418.7669  665.3496  Mean of score_llece_science
se_score_l~e   45     45  1.923779  1.007913  5.869307  Standard error of m_score_llece_science
m_d1level_~d  160    160  .0513157  .0005649  .3560865  Mean of d1level_llece_read
se_d1level~d  160    160  .0038019  .0005203  .0142384  Standard error of m_d1level_llece_read
m_d2level_~d  160    160  .2474674  .0351879  .5683818  Mean of d2level_llece_read
se_d2level~d  160    160  .0082322  .0029095  .0240713  Standard error of m_d2level_llece_read
m_d3level_~d  160    160  .3581944  .1528439  .5300938  Mean of d3level_llece_read
se_d3level~d  160    160  .0095598  .0051725  .0282928  Standard error of m_d3level_llece_read
m_d4level_~d  160    160  .2134894  .0184777  .3903553  Mean of d4level_llece_read
se_d4level~d  160    160  .0078138  .0028388  .0243489  Standard error of m_d4level_llece_read
m_d5level_~d  160    160  .1295331  .0014606  .5349003  Mean of d5level_llece_read
se_d5level~d  160    160  .0056144  .0011356   .022323  Standard error of m_d5level_llece_read
m_d1level_~h  160    160  .0670906         0  .4027343  Mean of d1level_llece_math
se_d1level~h  160    160   .004414         0  .0156633  Standard error of m_d1level_llece_math
m_d2level_~h  160    160  .2778406  .0332478  .5691484  Mean of d2level_llece_math
se_d2level~h  160    160  .0085099  .0025872  .0270122  Standard error of m_d2level_llece_math
m_d3level_~h  160    160   .344678  .0640659  .5450261  Mean of d3level_llece_math
se_d3level~h  160    160   .009443  .0046695  .0264351  Standard error of m_d3level_llece_math
m_d4level_~h  160    160  .1998015  .0041296   .459668  Mean of d4level_llece_math
se_d4level~h  160    160  .0075608  .0015064  .0285999  Standard error of m_d4level_llece_math
m_d5level_~h  160    160  .1105892         0  .5517421  Mean of d5level_llece_math
se_d5level~h  160    160  .0051791         0   .023711  Standard error of m_d5level_llece_math
m_d1level_~e   45     45  .0549528  .0018048  .1558533  Mean of d1level_llece_science
se_d1level~e   45     45  .0045448  .0006593  .0127421  Standard error of m_d1level_llece_science
m_d2level_~e   45     45  .3883536    .07523  .6726403  Mean of d2level_llece_science
se_d2level~e   45     45  .0096299  .0036971  .0269426  Standard error of m_d2level_llece_science
m_d3level_~e   45     45  .3866131  .1642998  .5298123  Mean of d3level_llece_science
se_d3level~e   45     45  .0099259   .005719  .0291575  Standard error of m_d3level_llece_science
m_d4level_~e   45     45  .1232854  .0072066  .3317907  Mean of d4level_llece_science
se_d4level~e   45     45   .006081  .0018093  .0230609  Standard error of m_d4level_llece_science
m_d5level_~e   45     43  .0467951         0  .3556274  Mean of d5level_llece_science
se_d5level~e   45     43  .0025773         0   .014096  Standard error of m_d5level_llece_science
n_total       160     31   5790.75      4554      7474  # learners, by countrycode idgrade
n_male        160     32    2774.5      2036      3745  # male learners, by countrycode idgrade
n_urban       160     32  4610.719      3170      6826  # urban learners, by countrycode idgrade
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

~~~~

About the **160     observations** in this dataset:

~~~~
. tab countrycode idgrade

WB country |
   code (3 |       Grade ID
  letters) |         3          6 |     Total
-----------+----------------------+----------
       ARG |         5          5 |        10 
       BRA |         5          5 |        10 
       CHL |         5          5 |        10 
       COL |         5          5 |        10 
       CRI |         5          5 |        10 
       CUB |         5          5 |        10 
       DOM |         5          5 |        10 
       ECU |         5          5 |        10 
       GTM |         5          5 |        10 
       MEX |         5          5 |        10 
       NIC |         5          5 |        10 
       PAN |         5          5 |        10 
       PER |         5          5 |        10 
       PRY |         5          5 |        10 
       SLV |         5          5 |        10 
       URY |         5          5 |        10 
-----------+----------------------+----------
     Total |        80         80 |       160 

. 
. tab subgroup

  Subgroups |
         of |
countrycode |
    idgrade |      Freq.     Percent        Cum.
------------+-----------------------------------
        all |         32       20.00       20.00
     male=0 |         32       20.00       40.00
     male=1 |         32       20.00       60.00
    urban=0 |         32       20.00       80.00
    urban=1 |         32       20.00      100.00
------------+-----------------------------------
      Total |        160      100.00

~~~~
