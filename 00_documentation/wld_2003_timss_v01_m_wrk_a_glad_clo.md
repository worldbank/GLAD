Documentation of CLO dataset
=====================================================================


[back to list of assessments](https://github.com/worldbank/GLAD/blob/master/README.md#indicators)

This dataset contains harmonized aggregated data from TIMSS 2003 and is part of the Country Level Outcomes (CLO)

**Metadata** stored in this dataset:

~~~~
region:      WLD
year:        2003
assessment:  TIMSS
master:      v01_M
adaptation:  wrk_A_GLAD
module:      CLO
ttl_info:    Joao Pedro de Azevedo [eduanalytics@worldbank.org]
dofile_info: last modified by Diana Goldemberg in October 8, 2019
lastsave:    10 Oct 2019 09:18:22 by wb552057
~~~~


About the **38 variables** in this dataset:

~~~~
The variables belong to the following variable classifications:
idvars valuevars traitvars

idvars:    countrycode idgrade subgroup
valuevars: n_hpro_science m_hpro_science se_hpro_science n_hpro_math m_hpro_math se_hpro_math n_score_timss_math m_score_timss_math se_score_timss_math n_score_timss_science m_score_timss_science se_score_timss_science m_d1level_timss_math se_d1level_timss_math m_d2level_timss_math se_d2level_timss_math m_d3level_timss_math se_d3level_timss_math m_d4level_timss_math se_d4level_timss_math m_d5level_timss_math se_d5level_timss_math m_d1level_timss_science se_d1level_timss_science m_d2level_timss_science se_d2level_timss_science m_d3level_timss_science se_d3level_timss_science m_d4level_timss_science se_d4level_timss_science m_d5level_timss_science se_d5level_timss_science
traitvars: n_total n_male n_urban

. codebook, compact

Variable      Obs Unique      Mean       Min       Max  Label
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
countrycode   350     47         .         .         .  WB country code (3 letters)
idgrade       350      2  6.628571         4         8  Grade ID
subgroup      350      5         .         .         .  Subgroups of countrycode idgrade
n_hpro_sci~e  117    116  2795.786        28      9829  Number of observations used to calculate m_hpro_science
m_hpro_sci~e  117    117  .7809225  .1872405   .993272  Mean of hpro_science
se_hpro_sc~e  117    117  .0146868  .0026708  .0533203  Standard error of m_hpro_science
n_hpro_math   117    116  2795.786        28      9829  Number of observations used to calculate m_hpro_math
m_hpro_math   117    116  .7763778  .1296775         1  Mean of hpro_math
se_hpro_math  117    116  .0153305         0  .0529202  Standard error of m_hpro_math
n_score_ti~h  341    335   2862.12        23      9829  Number of observations used to calculate m_score_timss_math
m_score_ti~h  341    341   465.335  215.7268  610.6737  Mean of score_timss_math
se_score_t~h  341    341  4.831443   1.59806  32.85824  Standard error of m_score_timss_math
n_score_ti~e  341    335   2862.12        23      9829  Number of observations used to calculate m_score_timss_science
m_score_ti~e  341    341  469.0158  183.7957  579.1807  Mean of score_timss_science
se_score_t~e  341    341  4.929762  1.480496  21.58089  Standard error of m_score_timss_science
m_d1level_~h  341    340  .2658193         0   .993952  Mean of d1level_timss_math
se_d1level~h  341    340  .0175496         0  .1071772  Standard error of m_d1level_timss_math
m_d2level_~h  341    341  .2326901  .0058274  .4523772  Mean of d2level_timss_math
se_d2level~h  341    341  .0180701  .0028978  .1658029  Standard error of m_d2level_timss_math
m_d3level_~h  341    341  .2658443  .0002205  .4608696  Mean of d3level_timss_math
se_d3level~h  341    341  .0183569  .0011811  .2119402  Standard error of m_d3level_timss_math
m_d4level_~h  341    339  .1761521         0  .5132801  Mean of d4level_timss_math
se_d4level~h  341    339   .014628         0  .1580446  Standard error of m_d4level_timss_math
m_d5level_~h  341    322  .0594942         0  .4700766  Mean of d5level_timss_math
se_d5level~h  341    322  .0080028         0  .0766548  Standard error of m_d5level_timss_math
m_d1level_~e  341    341  .2320874   .006728  .9840795  Mean of d1level_timss_science
se_d1level~e  341    341  .0164799  .0026708  .0865206  Standard error of m_d1level_timss_science
m_d2level_~e  341    341  .2270093  .0139935  .4379615  Mean of d2level_timss_science
se_d2level~e  341    341  .0179083  .0051789   .162913  Standard error of m_d2level_timss_science
m_d3level_~e  341    341  .2971662  .0019269  .5435143  Mean of d3level_timss_science
se_d3level~e  341    341  .0182873  .0016889  .1149783  Standard error of m_d3level_timss_science
m_d4level_~e  341    341  .1919952         0  .4513997  Mean of d4level_timss_science
se_d4level~e  341    341  .0156268         0  .1525618  Standard error of m_d4level_timss_science
m_d5level_~e  341    332  .0517419         0  .3460868  Mean of d5level_timss_science
se_d5level~e  341    332  .0079402         0  .0648769  Standard error of m_d5level_timss_science
n_total       350     70    4770.4      2514      9829  # learners, by countrycode idgrade
n_male        350     68  2378.057      1274      4921  # male learners, by countrycode idgrade
n_urban       350     69    3934.3      1443      7754  # urban learners, by countrycode idgrade
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

~~~~

About the **350     observations** in this dataset:

~~~~
. tab countrycode idgrade

WB country |
   code (3 |       Grade ID
  letters) |         4          8 |     Total
-----------+----------------------+----------
       ARM |         5          5 |        10 
       AUS |         5          5 |        10 
       BEL |         5          5 |        10 
       BGR |         0          5 |         5 
       BHR |         0          5 |         5 
       BWA |         0          5 |         5 
       CHL |         0          5 |         5 
       CYP |         5          5 |        10 
       EGY |         0          5 |         5 
       ESP |         0          5 |         5 
       EST |         0          5 |         5 
       GBR |         5          5 |        10 
       GHA |         0          5 |         5 
       HKG |         5          5 |        10 
       HUN |         5          5 |        10 
       IDN |         0          5 |         5 
       IRN |         5          5 |        10 
       ISR |         0          5 |         5 
       ITA |         5          5 |        10 
       JOR |         0          5 |         5 
       JPN |         5          5 |        10 
       KOR |         0          5 |         5 
       LBN |         0          5 |         5 
       LTU |         5          5 |        10 
       LVA |         5          5 |        10 
       MAR |         5          5 |        10 
       MDA |         5          5 |        10 
       MKD |         0          5 |         5 
       MYS |         0          5 |         5 
       NLD |         5          5 |        10 
       NOR |         5          5 |        10 
       NZL |         5          5 |        10 
       PHL |         5          5 |        10 
       PSE |         0          5 |         5 
       ROU |         0          5 |         5 
       RUS |         5          5 |        10 
       SAU |         0          5 |         5 
       SGP |         5          5 |        10 
       SRB |         0          5 |         5 
       SVK |         0          5 |         5 
       SVN |         5          5 |        10 
       SWE |         0          5 |         5 
       SYR |         0          5 |         5 
       TUN |         5          5 |        10 
       USA |         5          5 |        10 
       YEM |         5          0 |         5 
       ZAF |         0          5 |         5 
-----------+----------------------+----------
     Total |       120        230 |       350 

. 
. tab subgroup

  Subgroups |
         of |
countrycode |
    idgrade |      Freq.     Percent        Cum.
------------+-----------------------------------
        all |         70       20.00       20.00
     male=0 |         70       20.00       40.00
     male=1 |         70       20.00       60.00
    urban=0 |         70       20.00       80.00
    urban=1 |         70       20.00      100.00
------------+-----------------------------------
      Total |        350      100.00

~~~~
