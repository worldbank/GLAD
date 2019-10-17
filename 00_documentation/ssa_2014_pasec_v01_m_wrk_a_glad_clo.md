Documentation of CLO dataset
=====================================================================


[back to list of assessments](https://github.com/worldbank/GLAD/blob/master/README.md#indicators)

This dataset contains harmonized aggregated data from PASEC 2014 and is part of the Country Level Outcomes (CLO)

**Metadata** stored in this dataset:

~~~~
region:      SSA
year:        2014
assessment:  PASEC
master:      v01_M
adaptation:  wrk_A_GLAD
module:      CLO
ttl_info:    Joao Pedro de Azevedo [eduanalytics@worldbank.org]
dofile_info: last modified by Diana Goldemberg in October 8, 2019
lastsave:    9 Oct 2019 23:42:38 by wb552057
~~~~


About the **33 variables** in this dataset:

~~~~
The variables belong to the following variable classifications:
idvars valuevars traitvars

idvars:    countrycode idgrade subgroup
valuevars: n_hpro_read m_hpro_read se_hpro_read n_score_pasec_read m_score_pasec_read se_score_pasec_read n_score_pasec_math m_score_pasec_math se_score_pasec_math m_d1level_pasec_read se_d1level_pasec_read m_d2level_pasec_read se_d2level_pasec_read m_d3level_pasec_read se_d3level_pasec_read m_d4level_pasec_read se_d4level_pasec_read m_d5level_pasec_read se_d5level_pasec_read m_d1level_pasec_math se_d1level_pasec_math m_d2level_pasec_math se_d2level_pasec_math m_d3level_pasec_math se_d3level_pasec_math m_d4level_pasec_math se_d4level_pasec_math
traitvars: n_total n_male n_urban

. codebook, compact

Variable      Obs Unique      Mean       Min       Max  Label
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
countrycode   100     10         .         .         .  WB country code (3 letters)
idgrade       100      2         4         2         6  Grade ID
subgroup      100      5         .         .         .  Subgroups of countrycode idgrade
n_hpro_read    50     49    1872.4       300      3817  Number of observations used to calculate m_hpro_read
m_hpro_read    50     50  .1556784  .0028763  .3919792  Mean of hpro_read
se_hpro_read   50     50  .0172518  .0022349  .0347055  Standard error of m_hpro_read
n_score_pa~d  100     97   1193.25        94      3817  Number of observations used to calculate m_score_pasec_read
m_score_pa~d  100    100  495.9907  386.1915  667.8519  Mean of score_pasec_read
se_score_p~d  100    100  7.038532  2.034705  16.73271  Standard error of m_score_pasec_read
n_score_pa~h  100     97   1193.25        94      3817  Number of observations used to calculate m_score_pasec_math
m_score_pa~h  100    100  496.5913  395.6778  623.9837  Mean of score_pasec_math
se_score_p~h  100    100  7.154505  2.501515  14.43122  Standard error of m_score_pasec_math
m_d1level_~d  100    100  .1098434  .0006798  .4586009  Mean of d1level_pasec_read
se_d1level~d  100    100  .0217763  .0014935  .0758009  Standard error of m_d1level_pasec_read
m_d2level_~d  100    100  .2680905  .0241841  .5315909  Mean of d2level_pasec_read
se_d2level~d  100    100  .0309844  .0076426  .0893114  Standard error of m_d2level_pasec_read
m_d3level_~d  100    100  .2833876  .1006237  .4315645  Mean of d3level_pasec_read
se_d3level~d  100    100  .0300102  .0123279  .0912632  Standard error of m_d3level_pasec_read
m_d4level_~d  100    100  .1930836  .0097185  .5398428  Mean of d4level_pasec_read
se_d4level~d  100    100  .0242889  .0061461  .0765583  Standard error of m_d4level_pasec_read
m_d5level_~d  100     99   .145595         0  .6958395  Mean of d5level_pasec_read
se_d5level~d  100     99  .0200522         0  .0680446  Standard error of m_d5level_pasec_read
m_d1level_~h  100     99  .2270572         0   .734545  Mean of d1level_pasec_math
se_d1level~h  100     99   .027689         0  .0917645  Standard error of m_d1level_pasec_math
m_d2level_~h  100    100  .3190014  .0248901  .5323702  Mean of d2level_pasec_math
se_d2level~h  100    100  .0315845  .0095648  .1017949  Standard error of m_d2level_pasec_math
m_d3level_~h  100    100   .273591  .0433769  .5230974  Mean of d3level_pasec_math
se_d3level~h  100    100  .0301804  .0084315  .1057916  Standard error of m_d3level_pasec_math
m_d4level_~h  100    100  .1803504  .0028334  .7805088  Mean of d4level_pasec_math
se_d4level~h  100    100  .0241347  .0027363  .0652117  Standard error of m_d4level_pasec_math
n_total       100     19   1994.75       732      3817  # learners, by countrycode idgrade
n_male        100     20    1049.7       351      2006  # male learners, by countrycode idgrade
n_urban       100     20   1334.85       187      2977  # urban learners, by countrycode idgrade
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

~~~~

About the **100     observations** in this dataset:

~~~~
. tab countrycode idgrade

WB country |
   code (3 |       Grade ID
  letters) |         2          6 |     Total
-----------+----------------------+----------
       BDI |         5          5 |        10 
       BEN |         5          5 |        10 
       BFA |         5          5 |        10 
       CIV |         5          5 |        10 
       CMR |         5          5 |        10 
       COG |         5          5 |        10 
       NER |         5          5 |        10 
       SEN |         5          5 |        10 
       TCD |         5          5 |        10 
       TGO |         5          5 |        10 
-----------+----------------------+----------
     Total |        50         50 |       100 

. 
. tab subgroup

  Subgroups |
         of |
countrycode |
    idgrade |      Freq.     Percent        Cum.
------------+-----------------------------------
        all |         20       20.00       20.00
     male=0 |         20       20.00       40.00
     male=1 |         20       20.00       60.00
    urban=0 |         20       20.00       80.00
    urban=1 |         20       20.00      100.00
------------+-----------------------------------
      Total |        100      100.00

~~~~
