Documentation of CLO dataset
=====================================================================


[back to list of assessments](https://github.com/worldbank/GLAD/blob/master/README.md#indicators)

This dataset contains harmonized aggregated data from LLECE 2013 and is part of the Country Level Outcomes (CLO)

**Metadata** stored in this dataset:

~~~~
region:      LAC
year:        2013
assessment:  LLECE
master:      v01_M
adaptation:  wrk_A_GLAD
module:      CLO
ttl_info:    Joao Pedro de Azevedo [eduanalytics@worldbank.org]
dofile_info: last modified by Diana Goldemberg in October 8, 2019
lastsave:    9 Oct 2019 21:00:56 by wb552057
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
countrycode   150     15         .         .         .  WB country code (3 letters)
idgrade       150      2       4.5         3         6  Grade ID
subgroup      150      5         .         .         .  Subgroups of countrycode idgrade
n_hpro_read   150     75  842.9733         0      3765  Number of observations used to calculate m_hpro_read
m_hpro_read    75     75  .4366038  .1143826  .7306223  Mean of hpro_read
se_hpro_read   75     75  .0124948  .0078515  .0320792  Standard error of m_hpro_read
n_score_ll~d  150    144   1631.24       217      3765  Number of observations used to calculate m_score_llece_read
m_score_ll~d  150    150   505.122  432.1596  576.5664  Mean of score_llece_read
se_score_l~d  150    150  2.031248   1.18579  5.034948  Standard error of m_score_llece_read
n_score_ll~h  150    142  1227.053       166      3111  Number of observations used to calculate m_score_llece_math
m_score_ll~h  150    150  513.2141  433.3111  579.0276  Mean of score_llece_math
se_score_l~h  150    150  2.368862  1.430957  6.834204  Standard error of m_score_llece_math
n_score_ll~e  150     75  619.7667         0      3038  Number of observations used to calculate m_score_llece_science
m_score_ll~e   75     75  495.4875  441.1458  569.8257  Mean of score_llece_science
se_score_l~e   75     75  2.735562  1.673311  7.545652  Standard error of m_score_llece_science
m_d1level_~d  150    144   .020905         0  .1329696  Mean of d1level_llece_read
se_d1level~d  150    144  .0032425         0  .0130714  Standard error of m_d1level_llece_read
m_d2level_~d  150    150  .2107087  .0461342  .4873517  Mean of d2level_llece_read
se_d2level~d  150    150  .0105017  .0039927  .0255012  Standard error of m_d2level_llece_read
m_d3level_~d  150    150  .3984947  .2216613  .4993167  Mean of d3level_llece_read
se_d3level~d  150    150  .0131212  .0073808  .0312423  Standard error of m_d3level_llece_read
m_d4level_~d  150    150  .2733609  .0648739  .4921224  Mean of d4level_llece_read
se_d4level~d  150    150  .0116987  .0061769      .034  Standard error of m_d4level_llece_read
m_d5level_~d  150    150  .0965308  .0063656  .3837621  Mean of d5level_llece_read
se_d5level~d  150    150  .0070158  .0017722  .0260713  Standard error of m_d5level_llece_read
m_d1level_~h  150    144  .0259417         0  .1630812  Mean of d1level_llece_math
se_d1level~h  150    144  .0042572         0  .0173479  Standard error of m_d1level_llece_math
m_d2level_~h  150    150  .2253034  .0136216  .5467032  Mean of d2level_llece_math
se_d2level~h  150    150  .0120362  .0026845  .0326419  Standard error of m_d2level_llece_math
m_d3level_~h  150    150  .3853826  .2245055  .5747712  Mean of d3level_llece_math
se_d3level~h  150    150  .0149957   .008454  .0365152  Standard error of m_d3level_llece_math
m_d4level_~h  150    150  .2659402  .0548579  .5379046  Mean of d4level_llece_math
se_d4level~h  150    150  .0130246  .0063379  .0341608  Standard error of m_d4level_llece_math
m_d5level_~h  150    150  .0974322  .0016007   .320646  Mean of d5level_llece_math
se_d5level~h  150    150  .0084781  .0012598  .0363345  Standard error of m_d5level_llece_math
m_d1level_~e   75     75  .0528872  .0066854  .1486914  Mean of d1level_llece_science
se_d1level~e   75     75  .0067925  .0026537  .0260873  Standard error of m_d1level_llece_science
m_d2level_~e   75     75  .3682144  .1949334  .5803256  Mean of d2level_llece_science
se_d2level~e   75     75  .0146871  .0085573  .0323903  Standard error of m_d2level_llece_science
m_d3level_~e   75     75  .4275792  .2842136  .5418925  Mean of d3level_llece_science
se_d3level~e   75     75  .0152781  .0090273  .0360859  Standard error of m_d3level_llece_science
m_d4level_~e   75     75  .1379429   .021973   .429757  Mean of d4level_llece_science
se_d4level~e   75     75   .010305  .0042398   .036009  Standard error of m_d4level_llece_science
m_d5level_~e   75     74  .0133762         0  .0481404  Mean of d5level_llece_science
se_d5level~e   75     74  .0031601         0  .0085282  Standard error of m_d5level_llece_science
n_total       150     30    3998.9      2825      5211  # learners, by countrycode idgrade
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
