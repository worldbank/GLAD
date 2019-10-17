Documentation of CLO dataset
=====================================================================


[back to list of assessments](https://github.com/worldbank/GLAD/blob/master/README.md#indicators)

This dataset contains harmonized aggregated data from TIMSS 2011 and is part of the Country Level Outcomes (CLO)

**Metadata** stored in this dataset:

~~~~
region:      WLD
year:        2011
assessment:  TIMSS
master:      v01_M
adaptation:  wrk_A_GLAD
module:      CLO
ttl_info:    Joao Pedro de Azevedo [eduanalytics@worldbank.org]
dofile_info: last modified by Diana Goldemberg in October 8, 2019
lastsave:    10 Oct 2019 17:45:16 by wb552057
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
countrycode   480     61         .         .         .  WB country code (3 letters)
idgrade       480      5  5.989583         4         9  Grade ID
subgroup      480      5         .         .         .  Subgroups of countrycode idgrade
n_hpro_sci~e  257    250  3085.996        28     14720  Number of observations used to calculate m_hpro_science
m_hpro_sci~e  257    254   .785573  .0489534         1  Mean of hpro_science
se_hpro_sc~e  257    254  .0150198         0  .0592053  Standard error of m_hpro_science
n_hpro_math   257    250  3085.996        28     14720  Number of observations used to calculate m_hpro_math
m_hpro_math   257    254  .7856403  .0787254         1  Mean of hpro_math
se_hpro_math  257    254  .0147842         0  .0628919  Standard error of m_hpro_math
n_score_ti~h  473    451  3276.051        19     14720  Number of observations used to calculate m_score_timss_math
m_score_ti~h  473    470  467.5471  236.3886   616.108  Mean of score_timss_math
se_score_t~h  473    470  4.619695  1.335062  20.83848  Standard error of m_score_timss_math
n_score_ti~e  473    451  3276.051        19     14720  Number of observations used to calculate m_score_timss_science
m_score_ti~e  473    470  471.0802  191.8338  590.7126  Mean of score_timss_science
se_score_t~e  473    470  4.912153  1.886162  28.69249  Standard error of m_score_timss_science
m_d1level_~h  473    468  .2619579         0  .9212746  Mean of d1level_timss_math
se_d1level~h  473    468  .0165512         0   .088742  Standard error of m_d1level_timss_math
m_d2level_~h  473    470  .2324489  .0081401  .3866704  Mean of d2level_timss_math
se_d2level~h  473    470  .0162912  .0035927  .1055312  Standard error of m_d2level_timss_math
m_d3level_~h  473    470  .2679936  .0095456  .4670816  Mean of d3level_timss_math
se_d3level~h  473    470  .0163967   .004062  .1103445  Standard error of m_d3level_timss_math
m_d4level_~h  473    470  .1732363  .0003233  .5325603  Mean of d4level_timss_math
se_d4level~h  473    470  .0136763  .0004442  .1140334  Standard error of m_d4level_timss_math
m_d5level_~h  473    463  .0643633         0  .4913957  Mean of d5level_timss_math
se_d5level~h  473    463  .0079121         0   .071382  Standard error of m_d5level_timss_math
m_d1level_~e  473    469  .2372789         0  .9510466  Mean of d1level_timss_science
se_d1level~e  473    469  .0164835         0  .0942469  Standard error of m_d1level_timss_science
m_d2level_~e  473    470  .2213543   .036973  .4262861  Mean of d2level_timss_science
se_d2level~e  473    470  .0163957  .0036194  .1854025  Standard error of m_d2level_timss_science
m_d3level_~e  473    470  .2857168   .010507   .502372  Mean of d3level_timss_science
se_d3level~e  473    470  .0171963  .0026838  .1470996  Standard error of m_d3level_timss_science
m_d4level_~e  473    470  .1963044  .0005193  .4647481  Mean of d4level_timss_science
se_d4level~e  473    470  .0153452  .0008012  .2855936  Standard error of m_d4level_timss_science
m_d5level_~e  473    465  .0593455         0   .416691  Mean of d5level_timss_science
se_d5level~e  473    465  .0083059         0  .0751729  Standard error of m_d5level_timss_science
n_total       480     96  5487.563      3121     14720  # learners, by countrycode idgrade
n_male        480     92  2760.573      1539      7241  # male learners, by countrycode idgrade
n_urban       480     95  4478.583      2305     11373  # urban learners, by countrycode idgrade
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

~~~~

About the **480     observations** in this dataset:

~~~~
. tab countrycode idgrade

WB country |
   code (3 |                        Grade ID
  letters) |         4          5          6          8          9 |     Total
-----------+-------------------------------------------------------+----------
       ARE |         5          0          0          5          0 |        10 
       ARM |         5          0          0          0          5 |        10 
       AUS |         5          0          0          5          0 |        10 
       AUT |         5          0          0          0          0 |         5 
       AZE |         5          0          0          0          0 |         5 
       BEL |         5          0          0          0          0 |         5 
       BHR |         5          0          0          5          0 |        10 
       BWA |         0          0          5          0          5 |        10 
       CHL |         5          0          0          5          0 |        10 
       CZE |         5          0          0          0          0 |         5 
       DEU |         5          0          0          0          0 |         5 
       DNK |         5          0          0          0          0 |         5 
       ESP |         5          0          0          0          0 |         5 
       FIN |         5          0          0          5          0 |        10 
       GBR |         5          5          0          0          5 |        15 
       GEO |         5          0          0          5          0 |        10 
       GHA |         0          0          0          5          0 |         5 
       HKG |         5          0          0          5          0 |        10 
       HND |         0          0          5          0          5 |        10 
       HRV |         5          0          0          0          0 |         5 
       HUN |         5          0          0          5          0 |        10 
       IDN |         0          0          0          5          0 |         5 
       IRL |         5          0          0          0          0 |         5 
       IRN |         5          0          0          5          0 |        10 
       ISR |         0          0          0          5          0 |         5 
       ITA |         5          0          0          5          0 |        10 
       JOR |         0          0          0          5          0 |         5 
       JPN |         5          0          0          5          0 |        10 
       KAZ |         5          0          0          5          0 |        10 
       KOR |         5          0          0          5          0 |        10 
       KWT |         5          0          0          0          0 |         5 
       LBN |         0          0          0          5          0 |         5 
       LTU |         5          0          0          5          0 |        10 
       MAR |         5          0          0          5          0 |        10 
       MKD |         0          0          0          5          0 |         5 
       MLT |         0          5          0          0          0 |         5 
       MYS |         0          0          0          5          0 |         5 
       NLD |         5          0          0          0          0 |         5 
       NOR |         5          0          0          5          0 |        10 
       NZL |         0          5          0          0          5 |        10 
       OMN |         5          0          0          5          0 |        10 
       POL |         5          0          0          0          0 |         5 
       PRT |         5          0          0          0          0 |         5 
       PSE |         0          0          0          5          0 |         5 
       QAT |         5          0          0          5          0 |        10 
       ROU |         5          0          0          5          0 |        10 
       RUS |         5          0          0          5          0 |        10 
       SAU |         5          0          0          5          0 |        10 
       SGP |         5          0          0          5          0 |        10 
       SRB |         5          0          0          0          0 |         5 
       SVK |         5          0          0          0          0 |         5 
       SVN |         5          0          0          5          0 |        10 
       SWE |         5          0          0          5          0 |        10 
       SYR |         0          0          0          5          0 |         5 
       THA |         5          0          0          5          0 |        10 
       TUN |         5          0          0          5          0 |        10 
       TUR |         5          0          0          5          0 |        10 
       UKR |         0          0          0          5          0 |         5 
       USA |         5          0          0          5          0 |        10 
       YEM |         5          0          5          0          0 |        10 
       ZAF |         0          0          0          0          5 |         5 
-----------+-------------------------------------------------------+----------
     Total |       230         15         15        190         30 |       480 

. 
. tab subgroup

  Subgroups |
         of |
countrycode |
    idgrade |      Freq.     Percent        Cum.
------------+-----------------------------------
        all |         96       20.00       20.00
     male=0 |         96       20.00       40.00
     male=1 |         96       20.00       60.00
    urban=0 |         96       20.00       80.00
    urban=1 |         96       20.00      100.00
------------+-----------------------------------
      Total |        480      100.00

~~~~
