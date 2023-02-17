Documentation of CLO dataset
=====================================================================


[back to list of assessments](https://github.com/worldbank/GLAD/blob/master/README.md#indicators)

This dataset contains harmonized aggregated data from SACMEQ 2000 and is part of the Country Level Outcomes (CLO)

**Metadata** stored in this dataset:

~~~~
region:      SSA
year:        2000
assessment:  SACMEQ
master:      v01_M
adaptation:  wrk_A_GLAD
module:      CLO
ttl_info:    Joao Pedro de Azevedo [eduanalytics@worldbank.org]
dofile_info: last modified by Joao Pedro Azevedo in Feburary 5, 2022
lastsave:    6 Feb 2022 11:16:08 by wb255520
~~~~


About the **60 variables** in this dataset:

~~~~
The variables belong to the following variable classifications:
idvars valuevars traitvars

idvars:    assessment year countrycode idgrade subgroup
valuevars: n_score_scmeq_read m_score_scmeq_read se_score_scmeq_read n_score_scmeq_math m_score_scmeq_math se_score_scmeq_math n_fgt1_read m_fgt1_read se_fgt1_read n_fgt2_read m_fgt2_read se_fgt2_read n_sdg411_read m_sdg411_read se_sdg411_read n_bmp_read m_bmp_read se_bmp_read m_d1level_scmeq_read se_d1level_scmeq_read m_d2level_scmeq_read se_d2level_scmeq_read m_d3level_scmeq_read se_d3level_scmeq_read m_d4level_scmeq_read se_d4level_scmeq_read m_d5level_scmeq_read se_d5level_scmeq_read m_d6level_scmeq_read se_d6level_scmeq_read m_d7level_scmeq_read se_d7level_scmeq_read m_d8level_scmeq_read se_d8level_scmeq_read m_d1level_scmeq_math se_d1level_scmeq_math m_d2level_scmeq_math se_d2level_scmeq_math m_d3level_scmeq_math se_d3level_scmeq_math m_d4level_scmeq_math se_d4level_scmeq_math m_d5level_scmeq_math se_d5level_scmeq_math m_d6level_scmeq_math se_d6level_scmeq_math m_d7level_scmeq_math se_d7level_scmeq_math m_d8level_scmeq_math se_d8level_scmeq_math
traitvars: n_total n_male n_urban n_has_qescs n_qescs

. codebook, compact

Variable      Obs Unique      Mean       Min       Max  Label
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
assessment    143      1         .         .         .  Assessment
year          143      1      2000      2000      2000  Year of assessment
countrycode   143     13         .         .         .  WB country code (3 letters)
idgrade       143      1         6         6         6  Grade ID
subgroup      143     11         .         .         .  Subgroups of countrycode idgrade
n_score_sc~d  143    124  1367.909       244      5048  Number of observations used to calculate m_score_scmeq_read
m_score_sc~d  143    130  503.2084  399.0543  645.3806  Mean of score_scmeq_read
se_score_s~d  143    130  5.637254  1.912431  17.78431  Standard error of m_score_scmeq_read
n_score_sc~h  143    123  1358.182       244      4990  Number of observations used to calculate m_score_scmeq_math
m_score_sc~h  143    130  502.9929   400.808  693.7067  Mean of score_scmeq_math
se_score_s~h  143    130  5.650923    1.7129  20.15922  Standard error of m_score_scmeq_math
n_fgt1_read   143    123  833.5734        52      4075  Number of observations used to calculate m_fgt1_read
m_fgt1_read   143    130  .1368245  .0645204  .2259067  Mean of fgt1_read
se_fgt1_read  143    130  .0055341  .0025569  .0158337  Standard error of m_fgt1_read
n_fgt2_read   143    123  833.5734        52      4075  Number of observations used to calculate m_fgt2_read
m_fgt2_read   143    130  .0276281  .0071378  .0612196  Mean of fgt2_read
se_fgt2_read  143    130  .0020228   .000543   .010982  Standard error of m_fgt2_read
n_sdg411_r~d  143    124  1367.909       244      5048  Number of observations used to calculate m_sdg411_read
m_sdg411_r~d  143    130  .4097213  .0220337  .8678353  Mean of sdg411_read
se_sdg411_~d  143    130  .0242564  .0055312   .070446  Standard error of m_sdg411_read
n_bmp_read    143    124  1367.909       244      5048  Number of observations used to calculate m_bmp_read
m_bmp_read    143    130  .5902787  .1321647  .9779662  Mean of bmp_read
se_bmp_read   143    130  .0242564  .0055312   .070446  Standard error of m_bmp_read
m_d1level_~d  143    129  .0666514         0  .3270365  Mean of d1level_scmeq_read
se_d1level~d  143    129  .0094354         0  .0280931  Standard error of m_d1level_scmeq_read
m_d2level_~d  143    130  .1481983  .0040347  .4117451  Mean of d2level_scmeq_read
se_d2level~d  143    130  .0140537  .0020521  .0397507  Standard error of m_d2level_scmeq_read
m_d3level_~d  143    130  .1797422   .020165  .3688218  Mean of d3level_scmeq_read
se_d3level~d  143    130  .0148909  .0057442  .0305985  Standard error of m_d3level_scmeq_read
m_d4level_~d  143    130  .1956868  .0649922  .3969178  Mean of d4level_scmeq_read
se_d4level~d  143    130  .0168295  .0077712  .0282776  Standard error of m_d4level_scmeq_read
m_d5level_~d  143    130  .1657352  .0118576  .3458973  Mean of d5level_scmeq_read
se_d5level~d  143    130  .0150129  .0044474  .0309705  Standard error of m_d5level_scmeq_read
m_d6level_~d  143    130  .1099177  .0019424  .2855168  Mean of d6level_scmeq_read
se_d6level~d  143    130  .0126413  .0013918  .0333246  Standard error of m_d6level_scmeq_read
m_d7level_~d  143    129  .0921015         0  .3543918  Mean of d7level_scmeq_read
se_d7level~d  143    129  .0122238         0  .0468024  Standard error of m_d7level_scmeq_read
m_d8level_~d  143    105  .0419668         0  .3695433  Mean of d8level_scmeq_read
se_d8level~d  143    104  .0081683         0   .062581  Standard error of m_d8level_scmeq_read
m_d1level_~h  143    130  .0630673  .0012415  .2632818  Mean of d1level_scmeq_math
se_d1level~h  143    130  .0086324   .001028  .0310593  Standard error of m_d1level_scmeq_math
m_d2level_~h  143    130  .3347935  .0456244  .6544887  Mean of d2level_scmeq_math
se_d2level~h  143    130  .0198402  .0094328   .039072  Standard error of m_d2level_scmeq_math
m_d3level_~h  143    130  .2885623  .0997312  .4817314  Mean of d3level_scmeq_math
se_d3level~h  143    130   .019432  .0077233  .0431299  Standard error of m_d3level_scmeq_math
m_d4level_~h  143    130  .1505978  .0033651  .3473475  Mean of d4level_scmeq_math
se_d4level~h  143    130  .0145618  .0019112  .0472704  Standard error of m_d4level_scmeq_math
m_d5level_~h  143    128  .0787797         0  .2716838  Mean of d5level_scmeq_math
se_d5level~h  143    128  .0109189         0  .0320997  Standard error of m_d5level_scmeq_math
m_d6level_~h  143    116   .049637         0  .2521445  Mean of d6level_scmeq_math
se_d6level~h  143    116  .0088636         0   .052583  Standard error of m_d6level_scmeq_math
m_d7level_~h  143    101  .0241567         0  .1792045  Mean of d7level_scmeq_math
se_d7level~h  143    101  .0059542         0  .0520047  Standard error of m_d7level_scmeq_math
m_d8level_~h  143     79  .0104058         0  .2247314  Mean of d8level_scmeq_math
se_d8level~h  143     79  .0029887         0  .0312622  Standard error of m_d8level_scmeq_math
n_total       143     13  3013.231      1484      5048  # learners, by countrycode idgrade
n_male        143     12  1530.769       742      2462  # male learners, by countrycode idgrade
n_urban       143     13  1318.615       675      2202  # urban learners, by countrycode idgrade
n_has_qescs   143     13  3013.231      1484      5048  # has_qescs learners, by countrycode idgrade
n_qescs       143     13  8801.308      4359     16348  # qescs learners, by countrycode idgrade
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

~~~~

About the **143     observations** in this dataset:

~~~~
. tab countrycode idgrade

WB country |
   code (3 |  Grade ID
  letters) |         6 |     Total
-----------+-----------+----------
       BWA |        11 |        11 
       KEN |        11 |        11 
       LSO |        11 |        11 
       MOZ |        11 |        11 
       MUS |        11 |        11 
       MWI |        11 |        11 
       NAM |        11 |        11 
       SWZ |        11 |        11 
       SYC |        11 |        11 
       TZA |        11 |        11 
       UGA |        11 |        11 
       ZAF |        11 |        11 
       ZMB |        11 |        11 
-----------+-----------+----------
     Total |       143 |       143 

. 
. tab subgroup

  Subgroups |
         of |
countrycode |
    idgrade |      Freq.     Percent        Cum.
------------+-----------------------------------
        all |         13        9.09        9.09
has_qescs=1 |         13        9.09       18.18
     male=0 |         13        9.09       27.27
     male=1 |         13        9.09       36.36
    qescs=1 |         13        9.09       45.45
    qescs=2 |         13        9.09       54.55
    qescs=3 |         13        9.09       63.64
    qescs=4 |         13        9.09       72.73
    qescs=5 |         13        9.09       81.82
    urban=0 |         13        9.09       90.91
    urban=1 |         13        9.09      100.00
------------+-----------------------------------
      Total |        143      100.00

~~~~
