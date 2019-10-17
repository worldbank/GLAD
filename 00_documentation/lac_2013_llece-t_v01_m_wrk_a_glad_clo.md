Documentation of CLO dataset
=====================================================================


[back to list of assessments](https://github.com/worldbank/GLAD/blob/master/README.md#indicators)

This dataset contains harmonized aggregated data from LLECE-T 2013 and is part of the Country Level Outcomes (CLO)

**Metadata** stored in this dataset:

~~~~
region:      LAC
year:        2013
assessment:  LLECE-T
master:      v01_M
adaptation:  wrk_A_GLAD
module:      CLO
ttl_info:    Joao Pedro de Azevedo [eduanalytics@worldbank.org]
dofile_info: last modified by Diana Goldemberg in October 8, 2019
lastsave:    9 Oct 2019 21:01:23 by wb552057
~~~~


About the **42 variables** in this dataset:

~~~~
The variables belong to the following variable classifications:
idvars valuevars traitvars

idvars:    countrycode idgrade subgroup
valuevars: n_hpro_read m_hpro_read se_hpro_read n_score_llece_read m_score_llece_read se_score_llece_read n_score_llece_math m_score_llece_math se_score_llece_math n_score_llece_science m_score_llece_science se_score_llece_science m_d1level_llece_read se_d1level_llece_read m_d2level_llece_read se_d2level_llece_read m_d3level_llece_read se_d3level_llece_read m_d4level_llece_read se_d4level_llece_read m_d1level_llece_math se_d1level_llece_math m_d2level_llece_math se_d2level_llece_math m_d3level_llece_math se_d3level_llece_math m_d4level_llece_math se_d4level_llece_math m_d1level_llece_science se_d1level_llece_science m_d2level_llece_science se_d2level_llece_science m_d3level_llece_science se_d3level_llece_science m_d4level_llece_science se_d4level_llece_science
traitvars: n_total n_male n_urban

. codebook, compact

Variable      Obs Unique      Mean       Min       Max  Label
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
countrycode   150     15         .         .         .  WB country code (3 letters)
idgrade       150      2       4.5         3         6  Grade ID
subgroup      150      5         .         .         .  Subgroups of countrycode idgrade
n_hpro_read   150     75  1132.213         0      5056  Number of observations used to calculate m_hpro_read
m_hpro_read    75     75  .2884398  .0450197  .6354902  Mean of hpro_read
se_hpro_read   75     75  .0096858  .0045321  .0273316  Standard error of m_hpro_read
n_score_ll~d  150    148  2240.253       273      5056  Number of observations used to calculate m_score_llece_read
m_score_ll~d  150    150  697.5091  612.3244  797.4229  Mean of score_llece_read
se_score_l~d  150    150  2.107487  1.325478  5.951816  Standard error of m_score_llece_read
n_score_ll~h  150    148  2176.427       267      4904  Number of observations used to calculate m_score_llece_math
m_score_ll~h  150    150  699.3534   614.081  787.8679  Mean of score_llece_math
se_score_l~h  150    150  2.054608  1.147016  5.378186  Standard error of m_score_llece_math
n_score_ll~e  150     75   1098.66         0      4884  Number of observations used to calculate m_score_llece_science
m_score_ll~e   75     75  699.5694  631.8945   768.603  Mean of score_llece_science
se_score_l~e   75     75  2.172939    1.3269  5.862137  Standard error of m_score_llece_science
m_d1level_~d  150    150  .2977295  .0351728  .7747568  Mean of d1level_llece_read
se_d1level~d  150    150  .0096019  .0030204  .0253025  Standard error of m_d1level_llece_read
m_d2level_~d  150    150  .3672209   .132353  .6243558  Mean of d2level_llece_read
se_d2level~d  150    150  .0104594  .0051009  .0284428  Standard error of m_d2level_llece_read
m_d3level_~d  150    150  .2088264  .0360477  .4376683  Mean of d3level_llece_read
se_d3level~d  150    150  .0090099  .0039324   .028571  Standard error of m_d3level_llece_read
m_d4level_~d  150    150  .1262232  .0084275  .4294391  Mean of d4level_llece_read
se_d4level~d  150    150  .0070469  .0024023  .0282565  Standard error of m_d4level_llece_read
m_d1level_~h  150    150  .4746519  .1423052  .8585318  Mean of d1level_llece_math
se_d1level~h  150    150  .0107796  .0052717  .0281708  Standard error of m_d1level_llece_math
m_d2level_~h  150    150  .2958174  .0866771  .5060649  Mean of d2level_llece_math
se_d2level~h  150    150  .0104395  .0052662  .0282314  Standard error of m_d2level_llece_math
m_d3level_~h  150    150  .1679653  .0025881   .420698  Mean of d3level_llece_math
se_d3level~h  150    150  .0080656  .0014505  .0265819  Standard error of m_d3level_llece_math
m_d4level_~h  150    150  .0615653  .0003518  .2424846  Mean of d4level_llece_math
se_d4level~h  150    150  .0049616  .0004429  .0259669  Standard error of m_d4level_llece_math
m_d1level_~e   75     75  .4019018   .181961  .7114924  Mean of d1level_llece_science
se_d1level~e   75     75  .0109604  .0059809  .0249288  Standard error of m_d1level_llece_science
m_d2level_~e   75     75  .3904898  .2489254  .4886717  Mean of d2level_llece_science
se_d2level~e   75     75  .0113191  .0068143  .0265895  Standard error of m_d2level_llece_science
m_d3level_~e   75     75  .1513051  .0241603  .3124655  Mean of d3level_llece_science
se_d3level~e   75     75  .0080507  .0031985  .0264103  Standard error of m_d3level_llece_science
m_d4level_~e   75     75  .0563033  .0049123  .2482063  Mean of d4level_llece_science
se_d4level~e   75     75  .0049161  .0013198   .023223  Standard error of m_d4level_llece_science
n_total       150     30  4230.033      3498      5862  # learners, by countrycode idgrade
n_male        150     29    1923.2      1360      2654  # male learners, by countrycode idgrade
n_urban       150     30    2576.6      1422      4010  # urban learners, by countrycode idgrade
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

~~~~

About the **150     observations** in this dataset:

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
       DOM |         5          5 |        10 
       ECU |         5          5 |        10 
       GTM |         5          5 |        10 
       HND |         5          5 |        10 
       MEX |         5          5 |        10 
       NIC |         5          5 |        10 
       PAN |         5          5 |        10 
       PER |         5          5 |        10 
       PRY |         5          5 |        10 
       URY |         5          5 |        10 
-----------+----------------------+----------
     Total |        75         75 |       150 

. 
. tab subgroup

  Subgroups |
         of |
countrycode |
    idgrade |      Freq.     Percent        Cum.
------------+-----------------------------------
        all |         30       20.00       20.00
     male=0 |         30       20.00       40.00
     male=1 |         30       20.00       60.00
    urban=0 |         30       20.00       80.00
    urban=1 |         30       20.00      100.00
------------+-----------------------------------
      Total |        150      100.00

~~~~
