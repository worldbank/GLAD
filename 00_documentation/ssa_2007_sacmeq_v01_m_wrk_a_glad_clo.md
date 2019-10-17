Documentation of CLO dataset
=====================================================================


[back to list of assessments](https://github.com/worldbank/GLAD/blob/master/README.md#indicators)

This dataset contains harmonized aggregated data from SACMEQ 2007 and is part of the Country Level Outcomes (CLO)

**Metadata** stored in this dataset:

~~~~
region:      SSA
year:        2007
assessment:  SACMEQ
master:      v01_M
adaptation:  wrk_A_GLAD
module:      CLO
ttl_info:    Joao Pedro de Azevedo [eduanalytics@worldbank.org]
dofile_info: last modified by Diana Goldemberg in October 8, 2019
lastsave:    9 Oct 2019 21:01:52 by wb552057
~~~~


About the **47 variables** in this dataset:

~~~~
The variables belong to the following variable classifications:
idvars valuevars traitvars

idvars:    countrycode idgrade subgroup
valuevars: n_hpro_read m_hpro_read se_hpro_read n_score_sacmeq_read m_score_sacmeq_read se_score_sacmeq_read n_score_sacmeq_math m_score_sacmeq_math se_score_sacmeq_math m_d1level_sacmeq_read se_d1level_sacmeq_read m_d2level_sacmeq_read se_d2level_sacmeq_read m_d3level_sacmeq_read se_d3level_sacmeq_read m_d4level_sacmeq_read se_d4level_sacmeq_read m_d5level_sacmeq_read se_d5level_sacmeq_read m_d6level_sacmeq_read se_d6level_sacmeq_read m_d7level_sacmeq_read se_d7level_sacmeq_read m_d8level_sacmeq_read se_d8level_sacmeq_read m_d1level_sacmeq_math se_d1level_sacmeq_math m_d2level_sacmeq_math se_d2level_sacmeq_math m_d3level_sacmeq_math se_d3level_sacmeq_math m_d4level_sacmeq_math se_d4level_sacmeq_math m_d5level_sacmeq_math se_d5level_sacmeq_math m_d6level_sacmeq_math se_d6level_sacmeq_math m_d7level_sacmeq_math se_d7level_sacmeq_math m_d8level_sacmeq_math se_d8level_sacmeq_math
traitvars: n_total n_male n_urban

. codebook, compact

Variable      Obs Unique      Mean       Min       Max  Label
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
countrycode    70     14         .         .         .  WB country code (3 letters)
idgrade        70      1         6         6         6  Grade ID
subgroup       70      5         .         .         .  Subgroups of countrycode idgrade
n_hpro_read    70     70  2511.243       458      9071  Number of observations used to calculate m_hpro_read
m_hpro_read    70     70  .4527684  .0506142  .8811952  Mean of hpro_read
se_hpro_read   70     70     .0096  .0047936  .0219087  Standard error of m_hpro_read
n_score_sa~d   70     70  2511.243       458      9071  Number of observations used to calculate m_score_sacmeq_read
m_score_sa~d   70     70  512.5799  423.5698  607.5967  Mean of score_sacmeq_read
se_score_s~d   70     70  1.968236  .9916837  5.725914  Standard error of m_score_sacmeq_read
n_score_sa~h   70     70  2507.814       458      9051  Number of observations used to calculate m_score_sacmeq_math
m_score_sa~h   70     70  512.8307  428.5702   634.134  Mean of score_sacmeq_math
se_score_s~h   70     70  1.846337  .9390171  4.557923  Standard error of m_score_sacmeq_math
m_d1level_~d   70     70  .0527958  .0007068  .1707655  Mean of d1level_sacmeq_read
se_d1level~d   70     70  .0045423  .0007537  .0109355  Standard error of m_d1level_sacmeq_read
m_d2level_~d   70     70  .1206637  .0064006  .3125096  Mean of d2level_sacmeq_read
se_d2level~d   70     70  .0066137  .0017486  .0148903  Standard error of m_d2level_sacmeq_read
m_d3level_~d   70     70  .1867834  .0255246  .3831808  Mean of d3level_sacmeq_read
se_d3level~d   70     70  .0081081  .0036117  .0188698  Standard error of m_d3level_sacmeq_read
m_d4level_~d   70     70  .1869887  .0741164  .2932706  Mean of d4level_sacmeq_read
se_d4level~d   70     70  .0084731  .0037185  .0170561  Standard error of m_d4level_sacmeq_read
m_d5level_~d   70     70  .1562414  .0327171   .359185  Mean of d5level_sacmeq_read
se_d5level~d   70     70  .0077617  .0032375  .0150924  Standard error of m_d5level_sacmeq_read
m_d6level_~d   70     70  .1353311  .0082286  .2909763  Mean of d6level_sacmeq_read
se_d6level~d   70     70  .0071703  .0022458  .0188378  Standard error of m_d6level_sacmeq_read
m_d7level_~d   70     70  .1112742  .0047547  .3545035  Mean of d7level_sacmeq_read
se_d7level~d   70     70   .006333  .0015198  .0187885  Standard error of m_d7level_sacmeq_read
m_d8level_~d   70     68  .0499217         0  .2026297  Mean of d8level_sacmeq_read
se_d8level~d   70     68   .004069         0  .0167566  Standard error of m_d8level_sacmeq_read
m_d1level_~h   70     69  .0390709         0  .1593346  Mean of d1level_sacmeq_math
se_d1level~h   70     69  .0037514         0  .0102808  Standard error of m_d1level_sacmeq_math
m_d2level_~h   70     70  .2682596  .0552562  .5610961  Mean of d2level_sacmeq_math
se_d2level~h   70     70  .0090178  .0043686  .0193378  Standard error of m_d2level_sacmeq_math
m_d3level_~h   70     70  .3083889  .1408493  .4300076  Mean of d3level_sacmeq_math
se_d3level~h   70     70  .0101442   .004769   .019917  Standard error of m_d3level_sacmeq_math
m_d4level_~h   70     70  .2040142  .0448221  .3870929  Mean of d4level_sacmeq_math
se_d4level~h   70     70  .0086942  .0037931  .0209877  Standard error of m_d4level_sacmeq_math
m_d5level_~h   70     70  .0875103   .008463   .230532  Mean of d5level_sacmeq_math
se_d5level~h   70     70  .0058897   .001582  .0165308  Standard error of m_d5level_sacmeq_math
m_d6level_~h   70     70  .0610165         0  .2125002  Mean of d6level_sacmeq_math
se_d6level~h   70     70   .004673         0  .0154442  Standard error of m_d6level_sacmeq_math
m_d7level_~h   70     66   .018315         0  .1121112  Mean of d7level_sacmeq_math
se_d7level~h   70     66  .0023343         0  .0083655  Standard error of m_d7level_sacmeq_math
m_d8level_~h   70     46  .0134245         0  .1483967  Mean of d8level_sacmeq_math
se_d8level~h   70     46  .0015861         0  .0088025  Standard error of m_d8level_sacmeq_math
n_total        70     14  4186.071      1480      9071  # learners, by countrycode idgrade
n_male         70     14  2062.571       755      4480  # male learners, by countrycode idgrade
n_urban        70     14  1723.429       662      4980  # urban learners, by countrycode idgrade
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

~~~~

About the **70      observations** in this dataset:

~~~~
. tab countrycode idgrade

WB country |
   code (3 |  Grade ID
  letters) |         6 |     Total
-----------+-----------+----------
       BWA |         5 |         5 
       KEN |         5 |         5 
       LSO |         5 |         5 
       MOZ |         5 |         5 
       MUS |         5 |         5 
       MWI |         5 |         5 
       NAM |         5 |         5 
       SWZ |         5 |         5 
       SYC |         5 |         5 
       TZA |         5 |         5 
       UGA |         5 |         5 
       ZAF |         5 |         5 
       ZMB |         5 |         5 
       ZWE |         5 |         5 
-----------+-----------+----------
     Total |        70 |        70 

. 
. tab subgroup

  Subgroups |
         of |
countrycode |
    idgrade |      Freq.     Percent        Cum.
------------+-----------------------------------
        all |         14       20.00       20.00
     male=0 |         14       20.00       40.00
     male=1 |         14       20.00       60.00
    urban=0 |         14       20.00       80.00
    urban=1 |         14       20.00      100.00
------------+-----------------------------------
      Total |         70      100.00

~~~~
