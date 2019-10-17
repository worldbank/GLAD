Documentation of CLO dataset
=====================================================================


[back to list of assessments](https://github.com/worldbank/GLAD/blob/master/README.md#indicators)

This dataset contains harmonized aggregated data from TIMSS 2015 and is part of the Country Level Outcomes (CLO)

**Metadata** stored in this dataset:

~~~~
region:      WLD
year:        2015
assessment:  TIMSS
master:      v01_M
adaptation:  wrk_A_GLAD
module:      CLO
ttl_info:    Joao Pedro de Azevedo [eduanalytics@worldbank.org]
dofile_info: last modified by Diana Goldemberg in October 8, 2019
lastsave:    10 Oct 2019 17:03:00 by wb552057
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
countrycode   445     55         .         .         .  WB country code (3 letters)
idgrade       445      4  5.898876         4         9  Grade ID
subgroup      445      5         .         .         .  Subgroups of countrycode idgrade
n_hpro_sci~e  234    226  3275.731        48     21177  Number of observations used to calculate m_hpro_science
m_hpro_sci~e  234    234  .8572153  .2934772  .9971925  Mean of hpro_science
se_hpro_sc~e  234    234  .0115328   .001344  .0426569  Standard error of m_hpro_science
n_hpro_math   244    237  3640.426        48     21177  Number of observations used to calculate m_hpro_math
m_hpro_math   244    244   .840676  .2921805         1  Mean of hpro_math
se_hpro_math  244    244  .0114119         0  .0451066  Standard error of m_hpro_math
n_score_ti~h  443    423  3725.485        48     21177  Number of observations used to calculate m_score_timss_math
m_score_ti~h  443    443  489.1289  345.3593  625.7469  Mean of score_timss_math
se_score_t~h  443    443  3.952271  .9858812  24.64586  Standard error of m_score_timss_math
n_score_ti~e  433    412  3530.363        48     21177  Number of observations used to calculate m_score_timss_science
m_score_ti~e  433    433   492.754  322.3419  597.2267  Mean of score_timss_science
se_score_t~e  433    433  4.123634  1.654246   19.2154  Standard error of m_score_timss_science
m_d1level_~h  443    443  .1966462         0  .7862217  Mean of d1level_timss_math
se_d1level~h  443    443  .0131881         0  .0462161  Standard error of m_d1level_timss_math
m_d2level_~h  443    443  .2210706  .0054778  .4181248  Mean of d2level_timss_math
se_d2level~h  443    443  .0137938  .0038265  .0524859  Standard error of m_d2level_timss_math
m_d3level_~h  443    443   .287518  .0436319  .4772413  Mean of d3level_timss_math
se_d3level~h  443    443  .0152063  .0058882  .1240082  Standard error of m_d3level_timss_math
m_d4level_~h  443    443  .2101999   .005584  .5174269  Mean of d4level_timss_math
se_d4level~h  443    443  .0135178  .0019225  .1074588  Standard error of m_d4level_timss_math
m_d5level_~h  443    443  .0845652         0  .5688712  Mean of d5level_timss_math
se_d5level~h  443    443  .0091636         0  .1460237  Standard error of m_d5level_timss_math
m_d1level_~e  433    433  .1762854  .0028075  .8070974  Mean of d1level_timss_science
se_d1level~e  433    433   .013109   .001344  .0477691  Standard error of m_d1level_timss_science
m_d2level_~e  433    433  .2052833   .039017   .378448  Mean of d2level_timss_science
se_d2level~e  433    433  .0141526  .0046796  .1231322  Standard error of m_d2level_timss_science
m_d3level_~e  433    433  .3063319  .0435441  .4838658  Mean of d3level_timss_science
se_d3level~e  433    433  .0158731   .005492  .0997563  Standard error of m_d3level_timss_science
m_d4level_~e  433    433  .2351773  .0133152  .4737721  Mean of d4level_timss_science
se_d4level~e  433    433  .0145207  .0029688   .128936  Standard error of m_d4level_timss_science
m_d5level_~e  433    433  .0769221   .000519  .4305771  Mean of d5level_timss_science
se_d5level~e  433    433  .0089135  .0004787  .0663702  Standard error of m_d5level_timss_science
n_total       445     89  6251.921      3600     21177  # learners, by countrycode idgrade
n_male        445     89  3149.775      1761     10860  # male learners, by countrycode idgrade
n_urban       445     89  4155.135       997     13585  # urban learners, by countrycode idgrade
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

~~~~

About the **445     observations** in this dataset:

~~~~
. tab countrycode idgrade

WB country |
   code (3 |                  Grade ID
  letters) |         4          5          8          9 |     Total
-----------+--------------------------------------------+----------
       ARE |         5          0          5          0 |        10 
       ARM |         5          0          0          5 |        10 
       AUS |         5          0          5          0 |        10 
       BEL |         5          0          0          0 |         5 
       BGR |         5          0          0          0 |         5 
       BHR |         5          0          5          0 |        10 
       BWA |         0          0          0          5 |         5 
       CAN |         5          0          5          0 |        10 
       CHL |         5          0          5          0 |        10 
       CYP |         5          0          0          0 |         5 
       CZE |         5          0          0          0 |         5 
       DEU |         5          0          0          0 |         5 
       DNK |         5          0          0          0 |         5 
       EGY |         0          0          5          0 |         5 
       ESP |         5          0          0          0 |         5 
       FIN |         5          0          0          0 |         5 
       FRA |         5          0          0          0 |         5 
       GBR |         5          0          5          0 |        10 
       GEO |         5          0          5          0 |        10 
       HKG |         5          0          5          0 |        10 
       HRV |         5          0          0          0 |         5 
       HUN |         5          0          5          0 |        10 
       IDN |         5          0          0          0 |         5 
       IRL |         5          0          5          0 |        10 
       IRN |         5          0          5          0 |        10 
       ISR |         0          0          5          0 |         5 
       ITA |         5          0          5          0 |        10 
       JOR |         5          0          5          0 |        10 
       JPN |         5          0          5          0 |        10 
       KAZ |         5          0          5          0 |        10 
       KOR |         5          0          5          0 |        10 
       KWT |         5          0          5          0 |        10 
       LBN |         0          0          5          0 |         5 
       LTU |         5          0          5          0 |        10 
       MAR |         5          0          5          0 |        10 
       MLT |         0          0          0          5 |         5 
       MYS |         0          0          5          0 |         5 
       NLD |         5          0          0          0 |         5 
       NOR |         5          5          5          5 |        20 
       NZL |         0          5          0          5 |        10 
       OMN |         5          0          5          0 |        10 
       POL |         5          0          0          0 |         5 
       PRT |         5          0          0          0 |         5 
       QAT |         5          0          5          0 |        10 
       RUS |         5          0          5          0 |        10 
       SAU |         5          0          5          0 |        10 
       SGP |         5          0          5          0 |        10 
       SRB |         5          0          0          0 |         5 
       SVK |         5          0          0          0 |         5 
       SVN |         5          0          5          0 |        10 
       SWE |         5          0          5          0 |        10 
       THA |         0          0          5          0 |         5 
       TUR |         5          0          5          0 |        10 
       USA |         5          0          5          0 |        10 
       ZAF |         0          5          0          5 |        10 
-----------+--------------------------------------------+----------
     Total |       230         15        170         30 |       445 

. 
. tab subgroup

  Subgroups |
         of |
countrycode |
    idgrade |      Freq.     Percent        Cum.
------------+-----------------------------------
        all |         89       20.00       20.00
     male=0 |         89       20.00       40.00
     male=1 |         89       20.00       60.00
    urban=0 |         89       20.00       80.00
    urban=1 |         89       20.00      100.00
------------+-----------------------------------
      Total |        445      100.00

~~~~
