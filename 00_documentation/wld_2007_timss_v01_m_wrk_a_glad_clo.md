Documentation of CLO dataset
=====================================================================


[back to list of assessments](https://github.com/worldbank/GLAD/blob/master/README.md#indicators)

This dataset contains harmonized aggregated data from TIMSS 2007 and is part of the Country Level Outcomes (CLO)

**Metadata** stored in this dataset:

~~~~
region:      WLD
year:        2007
assessment:  TIMSS
master:      v01_M
adaptation:  wrk_A_GLAD
module:      CLO
ttl_info:    Joao Pedro de Azevedo [eduanalytics@worldbank.org]
dofile_info: last modified by Diana Goldemberg in October 8, 2019
lastsave:    10 Oct 2019 22:53:02 by wb552057
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
countrycode   415     57         .         .         .  WB country code (3 letters)
idgrade       415      3  6.325301         4         9  Grade ID
subgroup      415      5         .         .         .  Subgroups of countrycode idgrade
n_hpro_sci~e  172    163  2763.686        65      8245  Number of observations used to calculate m_hpro_science
m_hpro_sci~e  172    171  .7551085   .066813  .9943913  Mean of hpro_science
se_hpro_sc~e  172    172  .0152631  .0025909  .0814764  Standard error of m_hpro_science
n_hpro_math   172    163  2763.686        65      8245  Number of observations used to calculate m_hpro_math
m_hpro_math   172    172  .7321741  .0501434  .9987154  Mean of hpro_math
se_hpro_math  172    172  .0153065   .001142  .0886492  Standard error of m_hpro_math
n_score_ti~h  407    378  2774.857        34      8245  Number of observations used to calculate m_score_timss_math
m_score_ti~h  407    407  451.6672   214.126  608.7323  Mean of score_timss_math
se_score_t~h  407    407  4.777583  1.043207  37.60693  Standard error of m_score_timss_math
n_score_ti~e  407    379  2767.968        34      8245  Number of observations used to calculate m_score_timss_science
m_score_ti~e  407    407  463.4101  188.2397  587.2039  Mean of score_timss_science
se_score_t~e  407    407  4.980068  1.359126  34.67554  Standard error of m_score_timss_science
m_d1level_~h  407    407  .3158301  .0012846  .9498566  Mean of d1level_timss_math
se_d1level~h  407    407  .0180103   .001142  .1341612  Standard error of m_d1level_timss_math
m_d2level_~h  407    407  .2357864  .0227614  .4347067  Mean of d2level_timss_math
se_d2level~h  407    407  .0174764  .0038334  .1221164  Standard error of m_d2level_timss_math
m_d3level_~h  407    407  .2453822  .0068023  .4806029  Mean of d3level_timss_math
se_d3level~h  407    407  .0161821  .0016718   .106373  Standard error of m_d3level_timss_math
m_d4level_~h  407    406  .1474463         0  .4234448  Mean of d4level_timss_math
se_d4level~h  407    406   .012556         0  .1527748  Standard error of m_d4level_timss_math
m_d5level_~h  407    371  .0555551         0  .4253082  Mean of d5level_timss_math
se_d5level~h  407    371  .0073128         0  .1401536  Standard error of m_d5level_timss_math
m_d1level_~e  407    407  .2596833  .0056087   .933187  Mean of d1level_timss_science
se_d1level~e  407    407  .0177152  .0025909   .154094  Standard error of m_d1level_timss_science
m_d2level_~e  407    407  .2378705  .0454231  .5013358  Mean of d2level_timss_science
se_d2level~e  407    407  .0172563   .004936  .1280914  Standard error of m_d2level_timss_science
m_d3level_~e  407    407  .2719857  .0156188  .4906965  Mean of d3level_timss_science
se_d3level~e  407    407  .0178486  .0031712  .1461301  Standard error of m_d3level_timss_science
m_d4level_~e  407    407  .1745374         0  .4091849  Mean of d4level_timss_science
se_d4level~e  407    407  .0140457         0  .1411929  Standard error of m_d4level_timss_science
m_d5level_~e  407    399  .0559231         0   .370331  Mean of d5level_timss_science
se_d5level~e  407    399  .0080445         0   .154168  Standard error of m_d5level_timss_science
n_total       415     81  4609.096      3060      8245  # learners, by countrycode idgrade
n_male        415     79  2307.169      1450      4113  # male learners, by countrycode idgrade
n_urban       415     81  3889.928      2536      7026  # urban learners, by countrycode idgrade
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

~~~~

About the **415     observations** in this dataset:

~~~~
. tab countrycode idgrade

WB country |
   code (3 |             Grade ID
  letters) |         4          8          9 |     Total
-----------+---------------------------------+----------
       ARM |         5          5          0 |        10 
       AUS |         5          5          0 |        10 
       AUT |         5          0          0 |         5 
       BGR |         0          5          0 |         5 
       BHR |         0          5          0 |         5 
       BIH |         0          5          0 |         5 
       BWA |         0          5          0 |         5 
       COL |         5          5          0 |        10 
       CYP |         0          5          0 |         5 
       CZE |         5          5          0 |        10 
       DEU |         5          0          0 |         5 
       DNK |         5          0          0 |         5 
       DZA |         5          5          0 |        10 
       EGY |         0          5          0 |         5 
       GBR |         5          5          0 |        10 
       GEO |         5          5          0 |        10 
       GHA |         0          5          0 |         5 
       HKG |         5          5          0 |        10 
       HUN |         5          5          0 |        10 
       IDN |         0          5          0 |         5 
       IRN |         5          5          0 |        10 
       ISR |         0          5          0 |         5 
       ITA |         5          5          0 |        10 
       JOR |         0          5          0 |         5 
       JPN |         5          5          0 |        10 
       KAZ |         5          0          0 |         5 
       KOR |         0          5          0 |         5 
       KWT |         5          5          0 |        10 
       LBN |         0          5          0 |         5 
       LTU |         5          5          0 |        10 
       LVA |         5          0          0 |         5 
       MAR |         5          5          0 |        10 
       MLT |         0          0          5 |         5 
       MNG |         5          5          0 |        10 
       MYS |         0          5          0 |         5 
       NLD |         5          0          0 |         5 
       NOR |         5          5          0 |        10 
       NZL |         5          0          0 |         5 
       OMN |         0          5          0 |         5 
       PSE |         0          5          0 |         5 
       QAT |         5          5          0 |        10 
       ROU |         0          5          0 |         5 
       RUS |         5          5          0 |        10 
       SAU |         0          5          0 |         5 
       SGP |         5          5          0 |        10 
       SLV |         5          5          0 |        10 
       SRB |         0          5          0 |         5 
       SVK |         5          0          0 |         5 
       SVN |         5          5          0 |        10 
       SWE |         5          5          0 |        10 
       SYR |         0          5          0 |         5 
       THA |         0          5          0 |         5 
       TUN |         5          5          0 |        10 
       TUR |         0          5          0 |         5 
       UKR |         5          5          0 |        10 
       USA |         5          5          0 |        10 
       YEM |         5          0          0 |         5 
-----------+---------------------------------+----------
     Total |       175        235          5 |       415 

. 
. tab subgroup

  Subgroups |
         of |
countrycode |
    idgrade |      Freq.     Percent        Cum.
------------+-----------------------------------
        all |         83       20.00       20.00
     male=0 |         83       20.00       40.00
     male=1 |         83       20.00       60.00
    urban=0 |         83       20.00       80.00
    urban=1 |         83       20.00      100.00
------------+-----------------------------------
      Total |        415      100.00

~~~~
