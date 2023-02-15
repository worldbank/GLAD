Documentation of CLO dataset
=====================================================================


[back to list of assessments](https://github.com/worldbank/GLAD/blob/master/README.md#indicators)

This dataset contains harmonized aggregated data from PASEC 2014 and is part of the Country Level Outcomes (CLO)

**Metadata** stored in this dataset:

~~~~
region:      SSA
year:        2014
assessment:  PASEC
master:      v02_M
adaptation:  wrk_A_GLAD
module:      ESCS
ttl_info:    Joao Pedro de Azevedo [eduanalytics@worldbank.org]
dofile_info: last modified by Diana Goldemberg in April 15, 2020
lastsave:    19 Jul 2021 17:15:27 by wb576911
~~~~


About the **46 variables** in this dataset:

~~~~
The variables belong to the following variable classifications:
idvars valuevars traitvars

idvars:    assessment year countrycode idgrade subgroup
valuevars: n_score_pasec_read m_score_pasec_read se_score_pasec_read n_score_pasec_math m_score_pasec_math se_score_pasec_math n_fgt1_read m_fgt1_read se_fgt1_read n_fgt2_read m_fgt2_read se_fgt2_read n_sdg411_read m_sdg411_read se_sdg411_read n_bmp_read m_bmp_read se_bmp_read m_d1level_pasec_read se_d1level_pasec_read m_d2level_pasec_read se_d2level_pasec_read m_d3level_pasec_read se_d3level_pasec_read m_d4level_pasec_read se_d4level_pasec_read m_d5level_pasec_read se_d5level_pasec_read m_d1level_pasec_math se_d1level_pasec_math m_d2level_pasec_math se_d2level_pasec_math m_d3level_pasec_math se_d3level_pasec_math m_d4level_pasec_math se_d4level_pasec_math
traitvars: n_total n_male n_urban n_has_qescs n_qescs

. codebook, compact

Variable      Obs Unique      Mean       Min       Max  Label
---------------------------------------------------------------------------------------------------------
assessment    500      1         .         .         .  Assessment
year          500      1      2014      2014      2014  Year of assessment
countrycode   500     10         .         .         .  WB country code (3 letters)
idgrade       500      2         4         2         6  Grade ID
subgroup      500     25         .         .         .  Subgroups of countrycode idgrade
n_score_pa~d  170    146  1120.194       127      3817  Number of observations used to calculate m_sco...
m_score_pa~d  170    150  501.6699  375.6826   652.027  Mean of score_pasec_read
se_score_p~d  170    150  7.000301  2.034705  23.67357  Standard error of m_score_pasec_read
n_score_pa~h  170    146  1120.194       127      3817  Number of observations used to calculate m_sco...
m_score_pa~h  170    150  501.2248  382.3768  614.4366  Mean of score_pasec_math
se_score_p~h  170    150  6.977146  2.663117  23.29032  Standard error of m_score_pasec_math
n_fgt1_read   110     99  1187.964       176      3133  Number of observations used to calculate m_fgt...
m_fgt1_read   110    100  .2048519  .1170607  .3691847  Mean of fgt1_read
se_fgt1_read  110    100  .0084358  .0029484  .0263649  Standard error of m_fgt1_read
n_fgt2_read   110     99  1187.964       176      3133  Number of observations used to calculate m_fgt...
m_fgt2_read   110    100  .0582241  .0190097  .1483503  Mean of fgt2_read
se_fgt2_read  110    100  .0040609  .0009467  .0129224  Standard error of m_fgt2_read
n_sdg411_r~d  110     99    1418.6       339      3817  Number of observations used to calculate m_sdg...
m_sdg411_r~d  110    100  .1754258  .0012132  .5090116  Mean of sdg411_read
se_sdg411_~d  110    100  .0213052   .001291  .0660503  Standard error of m_sdg411_read
n_bmp_read    110     99    1418.6       339      3817  Number of observations used to calculate m_bmp...
m_bmp_read    110    100  .8245742  .4909884  .9987868  Mean of bmp_read
se_bmp_read   110    100  .0213052   .001291  .0660503  Standard error of m_bmp_read
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
n_total       500     19   1994.75       732      3817  # learners, by countrycode idgrade
n_male        500     20    1049.7       351      2006  # male learners, by countrycode idgrade
n_urban       500     20    700.45       127      1576  # urban learners, by countrycode idgrade
n_has_qescs   500     11   1560.65         0      3817  # has_qescs learners, by countrycode idgrade
n_qescs       500     11   4418.25         0     11222  # qescs learners, by countrycode idgrade
---------------------------------------------------------------------------------------------------------

~~~~

About the **500     observations** in this dataset:

~~~~
. tab countrycode idgrade

WB country |
   code (3 |       Grade ID
  letters) |         2          6 |     Total
-----------+----------------------+----------
       BDI |        25         25 |        50 
       BEN |        25         25 |        50 
       BFA |        25         25 |        50 
       CIV |        25         25 |        50 
       CMR |        25         25 |        50 
       COG |        25         25 |        50 
       NER |        25         25 |        50 
       SEN |        25         25 |        50 
       TCD |        25         25 |        50 
       TGO |        25         25 |        50 
-----------+----------------------+----------
     Total |       250        250 |       500 

. 
. tab subgroup

  Subgroups |
         of |
countrycode |
    idgrade |      Freq.     Percent        Cum.
------------+-----------------------------------
        all |         20        4.00        4.00
has_qescs=0 |         20        4.00        8.00
has_qescs=1 |         20        4.00       12.00
has_qescs=2 |         20        4.00       16.00
has_qescs=3 |         20        4.00       20.00
has_qescs=4 |         20        4.00       24.00
has_qescs=5 |         20        4.00       28.00
     male=0 |         20        4.00       32.00
     male=1 |         20        4.00       36.00
     male=2 |         20        4.00       40.00
     male=3 |         20        4.00       44.00
     male=4 |         20        4.00       48.00
     male=5 |         20        4.00       52.00
    qescs=0 |         20        4.00       56.00
    qescs=1 |         20        4.00       60.00
    qescs=2 |         20        4.00       64.00
    qescs=3 |         20        4.00       68.00
    qescs=4 |         20        4.00       72.00
    qescs=5 |         20        4.00       76.00
    urban=0 |         20        4.00       80.00
    urban=1 |         20        4.00       84.00
    urban=2 |         20        4.00       88.00
    urban=3 |         20        4.00       92.00
    urban=4 |         20        4.00       96.00
    urban=5 |         20        4.00      100.00
------------+-----------------------------------
      Total |        500      100.00

~~~~
