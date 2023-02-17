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
dofile_info: last modified by Ahmed Raza in Feburary 2, 2022
lastsave:    7 Feb 2022 07:34:27 by wb549384
~~~~


About the **58 variables** in this dataset:

~~~~
The variables belong to the following variable classifications:
idvars valuevars traitvars

idvars:    assessment year countrycode idgrade subgroup
valuevars: n_score_pasec_read m_score_pasec_read se_score_pasec_read n_score_pasec_math m_score_pasec_math se_score_pasec_math n_fgt1_read m_fgt1_read se_fgt1_read n_fgt1_math m_fgt1_math se_fgt1_math n_fgt2_read m_fgt2_read se_fgt2_read n_fgt2_math m_fgt2_math se_fgt2_math n_sdg411_read m_sdg411_read se_sdg411_read n_sdg411_math m_sdg411_math se_sdg411_math n_bmp_read m_bmp_read se_bmp_read n_bmp_math m_bmp_math se_bmp_math m_d1level_pasec_read se_d1level_pasec_read m_d2level_pasec_read se_d2level_pasec_read m_d3level_pasec_read se_d3level_pasec_read m_d4level_pasec_read se_d4level_pasec_read m_d5level_pasec_read se_d5level_pasec_read m_d1level_pasec_math se_d1level_pasec_math m_d2level_pasec_math se_d2level_pasec_math m_d3level_pasec_math se_d3level_pasec_math m_d4level_pasec_math se_d4level_pasec_math
traitvars: n_total n_male n_urban n_has_qescs n_qescs

. codebook, compact

Variable      Obs Unique      Mean       Min       Max  Label
--------------------------------------------------------------------------------------------------------------------
assessment    170      1         .         .         .  Assessment
year          170      1      2014      2014      2014  Year of assessment
countrycode   170     10         .         .         .  WB country code (3 letters)
idgrade       170      2  4.588235         2         6  Grade ID
subgroup      170     12         .         .         .  Subgroups of countrycode idgrade
n_score_pa~d  170    146  1120.194       127      3817  Number of observations used to calculate m_score_pasec_read
m_score_pa~d  170    150  501.6699  375.6826   652.027  Mean of score_pasec_read
se_score_p~d  170    150  7.000301  2.034705  23.67357  Standard error of m_score_pasec_read
n_score_pa~h  170    146  1120.194       127      3817  Number of observations used to calculate m_score_pasec_math
m_score_pa~h  170    150  501.2248  382.3768  614.4366  Mean of score_pasec_math
se_score_p~h  170    150  6.977146  2.663117  23.29032  Standard error of m_score_pasec_math
n_fgt1_read   170    146     911.5        12      3133  Number of observations used to calculate m_fgt1_read
m_fgt1_read   170    150  .1875588  .0724828  .3691847  Mean of fgt1_read
se_fgt1_read  170    150  .0092181  .0029484  .0306688  Standard error of m_fgt1_read
n_fgt1_math   169    145  885.9704        10      3374  Number of observations used to calculate m_fgt1_math
m_fgt1_math   169    149  .1880309   .046576  .3733029  Mean of fgt1_math
se_fgt1_math  169    149  .0099321  .0032528  .0406695  Standard error of m_fgt1_math
n_fgt2_read   170    146     911.5        12      3133  Number of observations used to calculate m_fgt2_read
m_fgt2_read   170    150   .050014  .0087163  .1483503  Mean of fgt2_read
se_fgt2_read  170    150  .0041148  .0009467  .0176917  Standard error of m_fgt2_read
n_fgt2_math   169    145  885.9704        10      3374  Number of observations used to calculate m_fgt2_math
m_fgt2_math   169    149  .0516554  .0035482   .151353  Mean of fgt2_math
se_fgt2_math  169    149  .0045167     .0009  .0253511  Standard error of m_fgt2_math
n_sdg411_r~d  170    146  1120.194       127      3817  Number of observations used to calculate m_sdg411_read
m_sdg411_r~d  170    150  .2170961  .0012132  .8894027  Mean of sdg411_read
se_sdg411_~d  170    150  .0270814   .001291  .0751394  Standard error of m_sdg411_read
n_sdg411_m~h  170    146  1120.194       127      3817  Number of observations used to calculate m_sdg411_math
m_sdg411_m~h  170    150    .28545   .001409  .9836816  Mean of sdg411_math
se_sdg411_~h  170    150  .0263488  .0014588   .080871  Standard error of m_sdg411_math
n_bmp_read    170    146  1120.194       127      3817  Number of observations used to calculate m_bmp_read
m_bmp_read    170    150  .7829039  .1105973  .9987868  Mean of bmp_read
se_bmp_read   170    150  .0270814   .001291  .0751394  Standard error of m_bmp_read
n_bmp_math    170    146  1120.194       127      3817  Number of observations used to calculate m_bmp_math
m_bmp_math    170    150    .71455  .0163184  .9985909  Mean of bmp_math
se_bmp_math   170    150  .0263488  .0014588   .080871  Standard error of m_bmp_math
m_d1level_~d  170    150  .0961054         0  .4375507  Mean of d1level_pasec_read
se_d1level~d  170    150  .0188638         0  .0850811  Standard error of m_d1level_pasec_read
m_d2level_~d  170    150  .2405543  .0196748  .4923404  Mean of d2level_pasec_read
se_d2level~d  170    150  .0280434  .0076426  .0655087  Standard error of m_d2level_pasec_read
m_d3level_~d  170    150  .2800333  .0896961  .4398182  Mean of d3level_pasec_read
se_d3level~d  170    150  .0295364  .0123279   .084384  Standard error of m_d3level_pasec_read
m_d4level_~d  170    150   .218131  .0193998  .5398428  Mean of d4level_pasec_read
se_d4level~d  170    150  .0259468  .0070226    .06104  Standard error of m_d4level_pasec_read
m_d5level_~d  170    150   .165176  .0012132  .6900674  Mean of d5level_pasec_read
se_d5level~d  170    150  .0224155   .001291  .0660503  Standard error of m_d5level_pasec_read
m_d1level_~h  170    149  .2296349         0  .8014793  Mean of d1level_pasec_math
se_d1level~h  170    149  .0267111         0  .0825713  Standard error of m_d1level_pasec_math
m_d2level_~h  170    150  .3135904  .0163184   .516813  Mean of d2level_pasec_math
se_d2level~h  170    150  .0300646  .0095648  .0649618  Standard error of m_d2level_pasec_math
m_d3level_~h  170    150   .276576  .0239682  .5230974  Mean of d3level_pasec_math
se_d3level~h  170    150  .0294279  .0075032  .0627227  Standard error of m_d3level_pasec_math
m_d4level_~h  170    150  .1801987   .001409  .7495074  Mean of d4level_pasec_math
se_d4level~h  170    150  .0242356  .0014588  .0727565  Standard error of m_d4level_pasec_math
n_total       170     19  2326.088       732      3817  # learners, by countrycode idgrade
n_male        170     20  1227.965       351      2006  # male learners, by countrycode idgrade
n_urban       170     20  819.4353       127      1576  # urban learners, by countrycode idgrade
n_has_qescs   170     11  2019.665         0      3817  # has_qescs learners, by countrycode idgrade
n_qescs       170     11  5717.735         0     11222  # qescs learners, by countrycode idgrade
--------------------------------------------------------------------------------------------------------------------

~~~~

About the **170     observations** in this dataset:

~~~~
. tab countrycode idgrade

WB country |
   code (3 |       Grade ID
  letters) |         2          6 |     Total
-----------+----------------------+----------
       BDI |         6         11 |        17 
       BEN |         6         11 |        17 
       BFA |         6         11 |        17 
       CIV |         6         11 |        17 
       CMR |         6         11 |        17 
       COG |         6         11 |        17 
       NER |         6         11 |        17 
       SEN |         6         11 |        17 
       TCD |         6         11 |        17 
       TGO |         6         11 |        17 
-----------+----------------------+----------
     Total |        60        110 |       170 

. 
. tab subgroup

  Subgroups |
         of |
countrycode |
    idgrade |      Freq.     Percent        Cum.
------------+-----------------------------------
        all |         20       11.76       11.76
has_qescs=0 |         10        5.88       17.65
has_qescs=1 |         10        5.88       23.53
     male=0 |         20       11.76       35.29
     male=1 |         20       11.76       47.06
    qescs=1 |         10        5.88       52.94
    qescs=2 |         10        5.88       58.82
    qescs=3 |         10        5.88       64.71
    qescs=4 |         10        5.88       70.59
    qescs=5 |         10        5.88       76.47
    urban=0 |         20       11.76       88.24
    urban=1 |         20       11.76      100.00
------------+-----------------------------------
      Total |        170      100.00

~~~~
