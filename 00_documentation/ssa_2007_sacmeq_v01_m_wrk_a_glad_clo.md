Documentation of CLO dataset
=====================================================================


[back to list of assessments](https://github.com/worldbank/GLAD/blob/master/README.md#indicators)

This dataset contains harmonized aggregated data from SACMEQ 2007 and is part of the Country Level Outcomes (CLO)

**Metadata** stored in this dataset:

~~~~
region:      SSA
year:        2007
assessment:  SACMEQ
master:      v01_M
adaptation:  wrk_A_GLAD
module:      CLO
ttl_info:    Joao Pedro de Azevedo [eduanalytics@worldbank.org]
dofile_info: last modified by Joao Pedro Azevedo in Feburary 5, 2022
lastsave:    6 Feb 2022 11:25:16 by wb255520
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
assessment    154      1         .         .         .  Assessment
year          154      1      2007      2007      2007  Year of assessment
countrycode   154     14         .         .         .  WB country code (3 letters)
idgrade       154      1         6         6         6  Grade ID
subgroup      154     11         .         .         .  Subgroups of countrycode idgrade
n_score_sc~d  154    134  1902.578       137      9071  Number of observations used to calculate m_score_scmeq_read
m_score_sc~d  154    140  512.3761  413.1621  657.2944  Mean of score_scmeq_read
se_score_s~d  154    140  4.827276  2.421727  17.69713  Standard error of m_score_scmeq_read
n_score_sc~h  154    137  1899.981       137      9051  Number of observations used to calculate m_score_scmeq_math
m_score_sc~h  154    139  512.7861  422.0468  719.2248  Mean of score_scmeq_math
se_score_s~h  154    140  4.369109  2.178393  15.91387  Standard error of m_score_scmeq_math
n_fgt1_read   154    133  1061.617        16      5600  Number of observations used to calculate m_fgt1_read
m_fgt1_read   154    140  .1365585  .0560802  .1994828  Mean of fgt1_read
se_fgt1_read  154    140  .0052355  .0020848   .038873  Standard error of m_fgt1_read
n_fgt2_read   154    133  1061.617        16      5600  Number of observations used to calculate m_fgt2_read
m_fgt2_read   154    140  .0273156  .0058908  .0491805  Mean of fgt2_read
se_fgt2_read  154    140  .0018698  .0006139  .0139447  Standard error of m_fgt2_read
n_sdg411_r~d  154    134  1902.578       137      9071  Number of observations used to calculate m_sdg411_read
m_sdg411_r~d  154    140  .4511848  .0359835  .9065335  Mean of sdg411_read
se_sdg411_~d  154    140  .0206867  .0094424   .042927  Standard error of m_sdg411_read
n_bmp_read    154    134  1902.578       137      9071  Number of observations used to calculate m_bmp_read
m_bmp_read    154    140  .5488152  .0934664  .9640165  Mean of bmp_read
se_bmp_read   154    140  .0206867  .0094424   .042927  Standard error of m_bmp_read
m_d1level_~d  154    138  .0529037         0  .1967314  Mean of d1level_scmeq_read
se_d1level~d  154    138  .0071174         0  .0210875  Standard error of m_d1level_scmeq_read
m_d2level_~d  154    140  .1212525  .0052098  .3418647  Mean of d2level_scmeq_read
se_d2level~d  154    140  .0110533  .0024079  .0268452  Standard error of m_d2level_scmeq_read
m_d3level_~d  154    140  .1876842  .0212851  .3950391  Mean of d3level_scmeq_read
se_d3level~d  154    140  .0132439  .0055031  .0262445  Standard error of m_d3level_scmeq_read
m_d4level_~d  154    140  .1869747  .0465739  .2944732  Mean of d4level_scmeq_read
se_d4level~d  154    140  .0138035  .0062017  .0264285  Standard error of m_d4level_scmeq_read
m_d5level_~d  154    140  .1557598  .0252636  .3942404  Mean of d5level_scmeq_read
se_d5level~d  154    140  .0123002  .0054755  .0381073  Standard error of m_d5level_scmeq_read
m_d6level_~d  154    140  .1346203   .005765  .3028907  Mean of d6level_scmeq_read
se_d6level~d  154    140  .0116341  .0029878  .0342029  Standard error of m_d6level_scmeq_read
m_d7level_~d  154    140  .1102609         0  .3762145  Mean of d7level_scmeq_read
se_d7level~d  154    140  .0109338         0  .0304981  Standard error of m_d7level_scmeq_read
m_d8level_~d  154    128  .0505438         0  .3632797  Mean of d8level_scmeq_read
se_d8level~d  154    128  .0077335         0  .0537608  Standard error of m_d8level_scmeq_read
m_d1level_~h  154    132  .0391954         0  .1608837  Mean of d1level_scmeq_math
se_d1level~h  154    132  .0055421         0  .0168169  Standard error of m_d1level_scmeq_math
m_d2level_~h  154    140  .2692301  .0177549  .5996205  Mean of d2level_scmeq_math
se_d2level~h  154    140  .0156911  .0059785  .0304742  Standard error of m_d2level_scmeq_math
m_d3level_~h  154    140  .3082322  .0510388  .4458354  Mean of d3level_scmeq_math
se_d3level~h  154    140  .0162299  .0087497  .0384319  Standard error of m_d3level_scmeq_math
m_d4level_~h  154    140  .2029312  .0256841  .3956134  Mean of d4level_scmeq_math
se_d4level~h  154    140  .0136974  .0061987  .0449536  Standard error of m_d4level_scmeq_math
m_d5level_~h  154    140  .0869859  .0033248  .2313025  Mean of d5level_scmeq_math
se_d5level~h  154    140  .0094171  .0017174  .0273014  Standard error of m_d5level_scmeq_math
m_d6level_~h  154    136  .0612204         0  .2855878  Mean of d6level_scmeq_math
se_d6level~h  154    136  .0079664         0  .0560706  Standard error of m_d6level_scmeq_math
m_d7level_~h  154    117  .0185262         0  .1762712  Mean of d7level_scmeq_math
se_d7level~h  154    117  .0041491         0  .0260283  Standard error of m_d7level_scmeq_math
m_d8level_~h  154     78  .0136787         0   .308504  Mean of d8level_scmeq_math
se_d8level~h  154     78  .0027412         0   .025025  Standard error of m_d8level_scmeq_math
n_total       154     14  4186.071      1480      9071  # learners, by countrycode idgrade
n_male        154     14  2062.571       755      4480  # male learners, by countrycode idgrade
n_urban       154     14  1723.429       662      4980  # urban learners, by countrycode idgrade
n_has_qescs   154     14  4186.071      1480      9071  # has_qescs learners, by countrycode idgrade
n_qescs       154     14  12254.86      4054     27334  # qescs learners, by countrycode idgrade
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

~~~~

About the **154     observations** in this dataset:

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
       ZWE |        11 |        11 
-----------+-----------+----------
     Total |       154 |       154 

. 
. tab subgroup

  Subgroups |
         of |
countrycode |
    idgrade |      Freq.     Percent        Cum.
------------+-----------------------------------
        all |         14        9.09        9.09
has_qescs=1 |         14        9.09       18.18
     male=0 |         14        9.09       27.27
     male=1 |         14        9.09       36.36
    qescs=1 |         14        9.09       45.45
    qescs=2 |         14        9.09       54.55
    qescs=3 |         14        9.09       63.64
    qescs=4 |         14        9.09       72.73
    qescs=5 |         14        9.09       81.82
    urban=0 |         14        9.09       90.91
    urban=1 |         14        9.09      100.00
------------+-----------------------------------
      Total |        154      100.00

~~~~
