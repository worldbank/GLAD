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
dofile_info: last modified by Ahmed Raza in Feburary 2, 2022
lastsave:    12 Feb 2022 18:03:47 by wb549384
~~~~


About the **60 variables** in this dataset:

~~~~
The variables belong to the following variable classifications:
idvars valuevars traitvars

idvars:    assessment year countrycode idgrade subgroup
valuevars: n_score_timss_math m_score_timss_math se_score_timss_math n_score_timss_scie m_score_timss_scie se_score_timss_scie n_fgt1_scie m_fgt1_scie se_fgt1_scie n_fgt1_math m_fgt1_math se_fgt1_math n_fgt2_scie m_fgt2_scie se_fgt2_scie n_fgt2_math m_fgt2_math se_fgt2_math n_sdg411_scie m_sdg411_scie se_sdg411_scie n_sdg411_math m_sdg411_math se_sdg411_math n_bmp_scie m_bmp_scie se_bmp_scie n_bmp_math m_bmp_math se_bmp_math m_d1level_timss_math se_d1level_timss_math m_d2level_timss_math se_d2level_timss_math m_d3level_timss_math se_d3level_timss_math m_d4level_timss_math se_d4level_timss_math m_d5level_timss_math se_d5level_timss_math m_d1level_timss_scie se_d1level_timss_scie m_d2level_timss_scie se_d2level_timss_scie m_d3level_timss_scie se_d3level_timss_scie m_d4level_timss_scie se_d4level_timss_scie m_d5level_timss_scie se_d5level_timss_scie
traitvars: n_total n_male n_urban n_has_qescs n_qescs

. codebook, compact

Variable      Obs Unique      Mean       Min       Max  Label
--------------------------------------------------------------------------------------------------------------------
assessment    955      1         .         .         .  Assessment
year          955      1      2011      2011      2011  Year of assessment
countrycode   955     61         .         .         .  WB country code (3 letters)
idgrade       955      5  6.165445         4         9  Grade ID
subgroup      955     12         .         .         .  Subgroups of countrycode idgrade
n_score_ti~h  955    744   2621.32        19     14720  Number of observations used to calculate m_score_timss_math
m_score_ti~h  955    856   469.252  236.3886  662.0937  Mean of score_timss_math
se_score_t~h  955    856  4.452794  1.335062  20.83848  Standard error of m_score_timss_math
n_score_ti~e  955    744   2621.32        19     14720  Number of observations used to calculate m_score_timss_scie
m_score_ti~e  955    856  473.4129  191.8338   647.717  Mean of score_timss_scie
se_score_t~e  955    856  4.703946  1.886162  28.69249  Standard error of m_score_timss_scie
n_fgt1_scie   948    642  978.1044         2     10110  Number of observations used to calculate m_fgt1_scie
m_fgt1_scie   948    849  .1592213  .0408897  .5539657  Mean of fgt1_scie
se_fgt1_scie  948    849  .0119156  .0033938  .0751071  Standard error of m_fgt1_scie
n_fgt1_math   948    643  1058.975         2     10492  Number of observations used to calculate m_fgt1_math
m_fgt1_math   948    849  .1538124  .0383301  .4567793  Mean of fgt1_math
se_fgt1_math  948    849  .0111565  .0029174  .1028235  Standard error of m_fgt1_math
n_fgt2_scie   948    642  978.1044         2     10110  Number of observations used to calculate m_fgt2_scie
m_fgt2_scie   948    849  .0481996  .0031809  .3675922  Mean of fgt2_scie
se_fgt2_scie  948    849  .0052212  .0011843  .0539581  Standard error of m_fgt2_scie
n_fgt2_math   948    643  1058.975         2     10492  Number of observations used to calculate m_fgt2_math
m_fgt2_math   948    849  .0423141  .0026096  .2615708  Mean of fgt2_math
se_fgt2_math  948    849  .0045576  .0007082  .0326419  Standard error of m_fgt2_math
n_sdg411_s~e  955    744   2621.32        19     14720  Number of observations used to calculate m_sdg411_scie
m_sdg411_s~e  955    855  .6469666  .0189588         1  Mean of sdg411_scie
se_sdg411_~e  955    855  .0176964         0  .1155476  Standard error of m_sdg411_scie
n_sdg411_m~h  955    744   2621.32        19     14720  Number of observations used to calculate m_sdg411_math
m_sdg411_m~h  955    854  .6172498  .0070572         1  Mean of sdg411_math
se_sdg411_~h  955    854  .0172263         0  .1352311  Standard error of m_sdg411_math
n_bmp_scie    955    744   2621.32        19     14720  Number of observations used to calculate m_bmp_scie
m_bmp_scie    955    855  .3530334         0  .9810412  Mean of bmp_scie
se_bmp_scie   955    855  .0176964         0  .1155476  Standard error of m_bmp_scie
n_bmp_math    955    744   2621.32        19     14720  Number of observations used to calculate m_bmp_math
m_bmp_math    955    854  .3827502         0  .9929428  Mean of bmp_math
se_bmp_math   955    854  .0172263         0  .1352311  Standard error of m_bmp_math
m_d1level_~h  955    853  .2574638         0  .9212746  Mean of d1level_timss_math
se_d1level~h  955    853  .0164052         0   .088742  Standard error of m_d1level_timss_math
m_d2level_~h  955    856  .2339977         0  .4117589  Mean of d2level_timss_math
se_d2level~h  955    856  .0173057         0  .1055312  Standard error of m_d2level_timss_math
m_d3level_~h  955    856  .2687576  .0070572   .484053  Mean of d3level_timss_math
se_d3level~h  955    856  .0175452  .0034037  .1103445  Standard error of m_d3level_timss_math
m_d4level_~h  955    856  .1731578         0  .5325603  Mean of d4level_timss_math
se_d4level~h  955    856  .0144939         0  .1140334  Standard error of m_d4level_timss_math
m_d5level_~h  955    830  .0666232         0  .7127666  Mean of d5level_timss_math
se_d5level~h  955    830  .0082982         0   .071382  Standard error of m_d5level_timss_math
m_d1level_~e  955    855  .2314032         0  .9510466  Mean of d1level_timss_scie
se_d1level~e  955    855  .0162897         0  .0942469  Standard error of m_d1level_timss_scie
m_d2level_~e  955    856  .2221802  .0139067  .4452187  Mean of d2level_timss_scie
se_d2level~e  955    856  .0173782  .0036194  .1854025  Standard error of m_d2level_timss_scie
m_d3level_~e  955    856  .2864246   .010507   .502372  Mean of d3level_timss_scie
se_d3level~e  955    856  .0185984  .0026838  .1962374  Standard error of m_d3level_timss_scie
m_d4level_~e  955    856  .1983229  .0003325  .5019273  Mean of d4level_timss_scie
se_d4level~e  955    856  .0160291  .0005116  .2855936  Standard error of m_d4level_timss_scie
m_d5level_~e  955    840  .0616691         0   .666738  Mean of d5level_timss_scie
se_d5level~e  955    840  .0087714         0  .0751729  Standard error of m_d5level_timss_scie
n_total       955     96   5513.02      3121     14720  # learners, by countrycode idgrade
n_male        955     92  2770.612      1539      7241  # male learners, by countrycode idgrade
n_urban       955     95  4497.766      2305     11373  # urban learners, by countrycode idgrade
n_has_qescs   955     78  4890.051         0     14720  # has_qescs learners, by countrycode idgrade
n_qescs       955     78  14989.24         0     44721  # qescs learners, by countrycode idgrade
--------------------------------------------------------------------------------------------------------------------

~~~~

About the **955     observations** in this dataset:

~~~~
. tab countrycode idgrade

WB country |
   code (3 |                        Grade ID
  letters) |         4          5          6          8          9 |     Total
-----------+-------------------------------------------------------+----------
       ARE |        11          0          0         11          0 |        22 
       ARM |         6          0          0          0         11 |        17 
       AUS |        11          0          0         11          0 |        22 
       AUT |        11          0          0          0          0 |        11 
       AZE |        11          0          0          0          0 |        11 
       BEL |         6          0          0          0          0 |         6 
       BHR |         6          0          0         11          0 |        17 
       BWA |         0          0         11          0         10 |        21 
       CHL |         6          0          0         11          0 |        17 
       CZE |        11          0          0          0          0 |        11 
       DEU |        11          0          0          0          0 |        11 
       DNK |         6          0          0          0          0 |         6 
       ESP |        11          0          0          0          0 |        11 
       FIN |        11          0          0         11          0 |        22 
       GBR |        11          6          0          0         11 |        28 
       GEO |        11          0          0         11          0 |        22 
       GHA |         0          0          0         11          0 |        11 
       HKG |        10          0          0         11          0 |        21 
       HND |         0          0         11          0         11 |        22 
       HRV |        11          0          0          0          0 |        11 
       HUN |        11          0          0         11          0 |        22 
       IDN |         0          0          0         11          0 |        11 
       IRL |        11          0          0          0          0 |        11 
       IRN |        11          0          0         11          0 |        22 
       ISR |         0          0          0         11          0 |        11 
       ITA |        11          0          0         11          0 |        22 
       JOR |         0          0          0         11          0 |        11 
       JPN |         5          0          0         10          0 |        15 
       KAZ |         6          0          0         11          0 |        17 
       KOR |         6          0          0         11          0 |        17 
       KWT |         6          0          0          0          0 |         6 
       LBN |         0          0          0         11          0 |        11 
       LTU |        11          0          0         11          0 |        22 
       MAR |        11          0          0         11          0 |        22 
       MKD |         0          0          0         11          0 |        11 
       MLT |         0         11          0          0          0 |        11 
       MYS |         0          0          0         11          0 |        11 
       NLD |         6          0          0          0          0 |         6 
       NOR |        11          0          0         11          0 |        22 
       NZL |         0          6          0          0         11 |        17 
       OMN |        11          0          0         11          0 |        22 
       POL |        11          0          0          0          0 |        11 
       PRT |        11          0          0          0          0 |        11 
       PSE |         0          0          0         11          0 |        11 
       QAT |        11          0          0         11          0 |        22 
       ROU |        11          0          0         11          0 |        22 
       RUS |        11          0          0         11          0 |        22 
       SAU |        11          0          0         11          0 |        22 
       SGP |        10          0          0         10          0 |        20 
       SRB |         6          0          0          0          0 |         6 
       SVK |        11          0          0          0          0 |        11 
       SVN |        11          0          0         11          0 |        22 
       SWE |        11          0          0         11          0 |        22 
       SYR |         0          0          0         11          0 |        11 
       THA |         6          0          0         11          0 |        17 
       TUN |         6          0          0         11          0 |        17 
       TUR |         6          0          0         11          0 |        17 
       UKR |         0          0          0         11          0 |        11 
       USA |         6          0          0         11          0 |        17 
       YEM |         6          0          6          0          0 |        12 
       ZAF |         0          0          0          0         11 |        11 
-----------+-------------------------------------------------------+----------
     Total |       423         23         28        416         65 |       955 

. 
. tab subgroup

  Subgroups |
         of |
countrycode |
    idgrade |      Freq.     Percent        Cum.
------------+-----------------------------------
        all |         96       10.05       10.05
has_qescs=0 |         19        1.99       12.04
has_qescs=1 |         77        8.06       20.10
     male=0 |         96       10.05       30.16
     male=1 |         96       10.05       40.21
    qescs=1 |         77        8.06       48.27
    qescs=2 |         77        8.06       56.34
    qescs=3 |         77        8.06       64.40
    qescs=4 |         77        8.06       72.46
    qescs=5 |         77        8.06       80.52
    urban=0 |         90        9.42       89.95
    urban=1 |         96       10.05      100.00
------------+-----------------------------------
      Total |        955      100.00

~~~~
