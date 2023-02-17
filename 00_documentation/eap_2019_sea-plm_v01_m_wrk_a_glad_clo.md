Documentation of CLO dataset
=====================================================================


[back to list of assessments](https://github.com/worldbank/GLAD/blob/master/README.md#indicators)

This dataset contains harmonized aggregated data from SEA-PLM 2019 and is part of the Country Level Outcomes (CLO)

**Metadata** stored in this dataset:

~~~~
region:      EAP
year:        2019
assessment:  SEA-PLM
master:      v01_M
adaptation:  wrk_A_GLAD
module:      CLO
ttl_info:    Joao Pedro de Azevedo [eduanalytics@worldbank.org]
dofile_info: last modified by Joao Pedro Azevedo in Feburary 5, 2022
lastsave:    6 Feb 2022 23:51:32 by wb255520
~~~~


About the **69 variables** in this dataset:

~~~~
The variables belong to the following variable classifications:
idvars valuevars traitvars

idvars:    assessment year countrycode idgrade subgroup
valuevars: n_score_saplm_read m_score_saplm_read se_score_saplm_read n_score_saplm_write m_score_saplm_write se_score_saplm_write n_score_saplm_math m_score_saplm_math se_score_saplm_math n_fgt1_read m_fgt1_read se_fgt1_read n_fgt1_math m_fgt1_math se_fgt1_math n_fgt2_read m_fgt2_read se_fgt2_read n_fgt2_math m_fgt2_math se_fgt2_math n_sdg411_read m_sdg411_read se_sdg411_read n_sdg411_math m_sdg411_math se_sdg411_math n_bmp_read m_bmp_read se_bmp_read n_bmp_math m_bmp_math se_bmp_math m_d1level_saplm_read se_d1level_saplm_read m_d2level_saplm_read se_d2level_saplm_read m_d3level_saplm_read se_d3level_saplm_read m_d4level_saplm_read se_d4level_saplm_read m_d5level_saplm_read se_d5level_saplm_read m_d1level_saplm_math se_d1level_saplm_math m_d2level_saplm_math se_d2level_saplm_math m_d3level_saplm_math se_d3level_saplm_math m_d4level_saplm_math se_d4level_saplm_math m_d5level_saplm_math se_d5level_saplm_math m_d6level_saplm_math se_d6level_saplm_math m_d7level_saplm_math se_d7level_saplm_math m_d8level_saplm_math se_d8level_saplm_math
traitvars: n_total n_male n_urban n_has_qescs n_qescs

. codebook, compact

Variable      Obs Unique      Mean       Min       Max  Label
-------------------------------------------------------------------------------------------------------
assessment     71      1         .         .         .  Assessment
year           71      1      2019      2019      2019  Year of assessment
countrycode    71      6         .         .         .  Country ID, as coded in rawdata
idgrade        71      1         5         5         5  Grade ID
subgroup       71     12         .         .         .  Subgroups of countrycode idgrade
n_score_sa~d   71     70  2196.127         5      6083  Number of observations used to calculate m_s...
m_score_sa~d   71     70  299.0708  256.7812  350.0764  Mean of score_saplm_read
se_score_s~d   71     70  .4977017  .2030114  4.411864  Standard error of m_score_saplm_read
n_score_sa~e   71     70  2196.127         5      6083  Number of observations used to calculate m_s...
m_score_sa~e   71     70   298.955   258.964  338.2115  Mean of score_saplm_write
se_score_s~e   71     70  .6459736  .2235312  7.101045  Standard error of m_score_saplm_write
n_score_sa~h   71     70  2196.127         5      6083  Number of observations used to calculate m_s...
m_score_sa~h   71     70  298.9083  264.8691  355.2993  Mean of score_saplm_math
se_score_s~h   71     70  .4731134  .1782952  3.185656  Standard error of m_score_saplm_math
n_fgt1_read    70     69  1606.286         5      5531  Number of observations used to calculate m_f...
m_fgt1_read    70     69  .0920569  .0325024  .1913552  Mean of fgt1_read
se_fgt1_read   70     69  .0014752  .0004667  .0097487  Standard error of m_fgt1_read
n_fgt1_math    71     69  1443.972         2      5051  Number of observations used to calculate m_f...
m_fgt1_math    71     70  .0757583  .0271377  .1400353  Mean of fgt1_math
se_fgt1_math   71     70  .0018988  .0004024  .0203288  Standard error of m_fgt1_math
n_fgt2_read    70     69  1606.286         5      5531  Number of observations used to calculate m_f...
m_fgt2_read    70     69  .0123371   .001899  .0392621  Mean of fgt2_read
se_fgt2_read   70     69  .0003546  .0001095  .0036122  Standard error of m_fgt2_read
n_fgt2_math    71     69  1443.972         2      5051  Number of observations used to calculate m_f...
m_fgt2_math    71     70    .00861  .0015818  .0210932  Mean of fgt2_math
se_fgt2_math   71     70  .0003551  .0000844  .0034211  Standard error of m_fgt2_math
n_sdg411_r~d   71     70  2196.127         5      6083  Number of observations used to calculate m_s...
m_sdg411_r~d   71     69  .2824954         0  .9461946  Mean of sdg411_read
se_sdg411_~d   71     69  .0073859         0  .0738261  Standard error of m_sdg411_read
n_sdg411_m~h   71     70  2196.127         5      6083  Number of observations used to calculate m_s...
m_sdg411_m~h   71     70  .3413939         0  .9795401  Mean of sdg411_math
se_sdg411_~h   71     70  .0069593         0  .0275632  Standard error of m_sdg411_math
n_bmp_read     71     70  2196.127         5      6083  Number of observations used to calculate m_b...
m_bmp_read     71     69  .7175046  .0538054         1  Mean of bmp_read
se_bmp_read    71     69  .0073859         0  .0738261  Standard error of m_bmp_read
n_bmp_math     71     70  2196.127         5      6083  Number of observations used to calculate m_b...
m_bmp_math     71     70  .6586061    .02046         1  Mean of bmp_math
se_bmp_math    71     70  .0069593         0  .0275632  Standard error of m_bmp_math
m_d1level_~d   71     70  .2239524         0  .8552969  Mean of d1level_saplm_read
se_d1level~d   71     70  .0114875         0  .1746662  Standard error of m_d1level_saplm_read
m_d2level_~d   71     70  .1885257         0  .3617429  Mean of d2level_saplm_read
se_d2level~d   71     70  .0139628         0  .2413073  Standard error of m_d2level_saplm_read
m_d3level_~d   71     70  .1775996  .0131813  .2996812  Mean of d3level_saplm_read
se_d3level~d   71     70  .0115834  .0024455  .1285215  Standard error of m_d3level_saplm_read
m_d4level_~d   71     68  .1274269         0  .2366126  Mean of d4level_saplm_read
se_d4level~d   71     68   .009619         0  .1050314  Standard error of m_d4level_saplm_read
m_d5level_~d   71     69  .2824954         0  .9461946  Mean of d5level_saplm_read
se_d5level~d   71     69  .0073859         0  .0738261  Standard error of m_d5level_saplm_read
m_d1level_~h   71     70  .1573933         0  .6448392  Mean of d1level_saplm_math
se_d1level~h   71     70  .0120383         0   .195586  Standard error of m_d1level_saplm_math
m_d2level_~h   71     70  .1640592  .0007566  .3145439  Mean of d2level_saplm_math
se_d2level~h   71     70  .0141928  .0005171  .2679152  Standard error of m_d2level_saplm_math
m_d3level_~h   71     70  .1822718  .0023652  .3057594  Mean of d3level_saplm_math
se_d3level~h   71     70  .0121005  .0006509  .1254081  Standard error of m_d3level_saplm_math
m_d4level_~h   71     70  .1548818         0  .2922515  Mean of d4level_saplm_math
se_d4level~h   71     70  .0103119         0  .0768072  Standard error of m_d4level_saplm_math
m_d5level_~h   71     70  .1164898         0  .2589417  Mean of d5level_saplm_math
se_d5level~h   71     70  .0080681         0  .0471417  Standard error of m_d5level_saplm_math
m_d6level_~h   71     68   .083735         0  .2783237  Mean of d6level_saplm_math
se_d6level~h   71     68  .0083229         0  .1293374  Standard error of m_d6level_saplm_math
m_d7level_~h   71     65  .0593506         0  .2372827  Mean of d7level_saplm_math
se_d7level~h   71     65  .0057359         0  .0982872  Standard error of m_d7level_saplm_math
m_d8level_~h   71     55  .0818185         0  .6615334  Mean of d8level_saplm_math
se_d8level~h   71     55  .0039242         0  .1127272  Standard error of m_d8level_saplm_math
n_total        71      6  5210.155      4479      6083  # learners, by countrycode idgrade
n_male         71      6  2639.324      2196      3071  # male learners, by countrycode idgrade
n_urban        71      6  2775.775      1436      3854  # urban learners, by countrycode idgrade
n_has_qescs    71      6  5197.648      4479      6070  # has_qescs learners, by countrycode idgrade
n_qescs        71      6   16027.3     13726     18237  # qescs learners, by countrycode idgrade
-------------------------------------------------------------------------------------------------------

~~~~

About the **71      observations** in this dataset:

~~~~
. tab countrycode idgrade

   Country |
    ID, as |
  coded in |  Grade ID
   rawdata |         5 |     Total
-----------+-----------+----------
       KHM |        12 |        12 
       LAO |        12 |        12 
       MMR |        12 |        12 
       MYS |        11 |        11 
       PHL |        12 |        12 
       VNM |        12 |        12 
-----------+-----------+----------
     Total |        71 |        71 

. 
. tab subgroup

  Subgroups |
         of |
countrycode |
    idgrade |      Freq.     Percent        Cum.
------------+-----------------------------------
        all |          6        8.45        8.45
has_qescs=0 |          5        7.04       15.49
has_qescs=1 |          6        8.45       23.94
     male=0 |          6        8.45       32.39
     male=1 |          6        8.45       40.85
    qescs=1 |          6        8.45       49.30
    qescs=2 |          6        8.45       57.75
    qescs=3 |          6        8.45       66.20
    qescs=4 |          6        8.45       74.65
    qescs=5 |          6        8.45       83.10
    urban=0 |          6        8.45       91.55
    urban=1 |          6        8.45      100.00
------------+-----------------------------------
      Total |         71      100.00

~~~~
