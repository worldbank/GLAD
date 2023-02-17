Documentation of CLO dataset
=====================================================================


[back to list of assessments](https://github.com/worldbank/GLAD/blob/master/README.md#indicators)

This dataset contains harmonized aggregated data from LLECE 2013 and is part of the Country Level Outcomes (CLO)

**Metadata** stored in this dataset:

~~~~
region:      LAC
year:        2013
assessment:  LLECE
master:      v01_M
adaptation:  wrk_A_GLAD
module:      CLO
ttl_info:    Joao Pedro de Azevedo [eduanalytics@worldbank.org]
dofile_info: last modified by Joao Pedro Azevedo in Feburary 5, 2022
lastsave:    6 Feb 2022 11:08:32 by wb255520
~~~~


About the **61 variables** in this dataset:

~~~~
The variables belong to the following variable classifications:
idvars valuevars traitvars

idvars:    assessment year countrycode idgrade subgroup
valuevars: n_score_llece_read m_score_llece_read se_score_llece_read n_score_llece_math m_score_llece_math se_score_llece_math n_score_llece_sci m_score_llece_sci se_score_llece_sci n_fgt1_read m_fgt1_read se_fgt1_read n_fgt2_read m_fgt2_read se_fgt2_read n_sdg411_read m_sdg411_read se_sdg411_read n_bmp_read m_bmp_read se_bmp_read m_d1level_llece_read se_d1level_llece_read m_d2level_llece_read se_d2level_llece_read m_d3level_llece_read se_d3level_llece_read m_d4level_llece_read se_d4level_llece_read m_d5level_llece_read se_d5level_llece_read m_d1level_llece_math se_d1level_llece_math m_d2level_llece_math se_d2level_llece_math m_d3level_llece_math se_d3level_llece_math m_d4level_llece_math se_d4level_llece_math m_d5level_llece_math se_d5level_llece_math m_d1level_llece_sci se_d1level_llece_sci m_d2level_llece_sci se_d2level_llece_sci m_d3level_llece_sci se_d3level_llece_sci m_d4level_llece_sci se_d4level_llece_sci m_d5level_llece_sci se_d5level_llece_sci
traitvars: n_total n_male n_urban n_has_qescs n_qescs

. codebook, compact

Variable      Obs Unique      Mean       Min       Max  Label
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
assessment    360      1         .         .         .  Assessment
year          360      1      2013      2013      2013  Year of assessment
countrycode   360     15         .         .         .  WB country code (3 letters)
idgrade       360      2       4.5         3         6  Grade ID
subgroup      360     12         .         .         .  Subgroups of countrycode idgrade
n_score_ll~d  330    275  1239.176       217      3765  Number of observations used to calculate m_score_llece_read
m_score_ll~d  330    300  506.0738  423.2692  598.0381  Mean of score_llece_read
se_score_l~d  330    300  4.475113  2.259209  13.04247  Standard error of m_score_llece_read
n_score_ll~h  360    327  1124.517       184      3989  Number of observations used to calculate m_score_llece_math
m_score_ll~h  360    360  514.0733  421.5004  614.4813  Mean of score_llece_math
se_score_l~h  360    360  5.148418  2.127069  18.04992  Standard error of m_score_llece_math
n_score_ll~i  180    168  1114.194       238      3893  Number of observations used to calculate m_score_llece_sci
m_score_ll~i  180    180  497.9386  423.5757  584.4591  Mean of score_llece_sci
se_score_l~i  180    180  5.390658   2.50539   33.5178  Standard error of m_score_llece_sci
n_fgt1_read   165    137  674.1273        61      2243  Number of observations used to calculate m_fgt1_read
m_fgt1_read   165    150  .1319128  .0804748  .2137951  Mean of fgt1_read
se_fgt1_read  165    150  .0063648   .003059  .0203101  Standard error of m_fgt1_read
n_fgt2_read   165    137  674.1273        61      2243  Number of observations used to calculate m_fgt2_read
m_fgt2_read   165    150   .026608  .0115237  .0594803  Mean of fgt2_read
se_fgt2_read  165    150  .0022972  .0010916  .0075518  Standard error of m_fgt2_read
n_sdg411_r~d  165    142  1278.691       242      3765  Number of observations used to calculate m_sdg411_read
m_sdg411_r~d  165    150  .4443418  .0970829  .8431447  Mean of sdg411_read
se_sdg411_~d  165    150  .0253839  .0122378   .104006  Standard error of m_sdg411_read
n_bmp_read    165    142  1278.691       242      3765  Number of observations used to calculate m_bmp_read
m_bmp_read    165    150  .5556582  .1568554  .9029171  Mean of bmp_read
se_bmp_read   165    150  .0253839  .0122378   .104006  Standard error of m_bmp_read
m_d1level_~d  330    270  .0206843         0  .1543626  Mean of d1level_llece_read
se_d1level~d  330    270  .0058011         0  .0382792  Standard error of m_d1level_llece_read
m_d2level_~d  330    300  .2075643  .0175234  .5037782  Mean of d2level_llece_read
se_d2level~d  330    300  .0203332  .0055357  .0650208  Standard error of m_d2level_llece_read
m_d3level_~d  330    300  .3972598  .1147963  .5343425  Mean of d3level_llece_read
se_d3level~d  330    300  .0232337  .0107783  .0925413  Standard error of m_d3level_llece_read
m_d4level_~d  330    300  .2752604  .0608672  .5397645  Mean of d4level_llece_read
se_d4level~d  330    300  .0212322  .0092538  .0992053  Standard error of m_d4level_llece_read
m_d5level_~d  330    300  .0992313         0  .5412363  Mean of d5level_llece_read
se_d5level~d  330    300  .0122394         0  .0870905  Standard error of m_d5level_llece_read
m_d1level_~h  360    334   .031671         0  .2728012  Mean of d1level_llece_math
se_d1level~h  360    334   .007545         0  .0463853  Standard error of m_d1level_llece_math
m_d2level_~h  360    360  .2271635         0  .6033329  Mean of d2level_llece_math
se_d2level~h  360    360  .0219113         0  .0726718  Standard error of m_d2level_llece_math
m_d3level_~h  360    360  .3691847  .1103395  .6186014  Mean of d3level_llece_math
se_d3level~h  360    360  .0253672  .0100035  .0779154  Standard error of m_d3level_llece_math
m_d4level_~h  360    360  .2613875  .0051441  .5503706  Mean of d4level_llece_math
se_d4level~h  360    360  .0219399  .0037785  .0901785  Standard error of m_d4level_llece_math
m_d5level_~h  360    358  .1105933         0  .4365646  Mean of d5level_llece_math
se_d5level~h  360    358  .0159599         0   .095552  Standard error of m_d5level_llece_math
m_d1level_~i  180    180  .0561947  .0053408  .1970528  Mean of d1level_llece_sci
se_d1level~i  180    180  .0115753  .0024704  .0713737  Standard error of m_d1level_llece_sci
m_d2level_~i  180    180  .3596725  .1131621  .6118376  Mean of d2level_llece_sci
se_d2level~i  180    180   .025392  .0112302  .1070937  Standard error of m_d2level_llece_sci
m_d3level_~i  180    180  .4170526  .2275664  .5601829  Mean of d3level_llece_sci
se_d3level~i  180    180  .0257152   .010437  .1654955  Standard error of m_d3level_llece_sci
m_d4level_~i  180    180  .1493161  .0086741  .3946156  Mean of d4level_llece_sci
se_d4level~i  180    180  .0179049  .0048845   .187364  Standard error of m_d4level_llece_sci
m_d5level_~i  180    169   .017764         0  .1215963  Mean of d5level_llece_sci
se_d5level~i  180    168  .0049583         0  .0214952  Standard error of m_d5level_llece_sci
n_total       360     30    3998.9      2825      5211  # learners, by countrycode idgrade
n_male        360     29    1923.2      1360      2654  # male learners, by countrycode idgrade
n_urban       360     30    2576.6      1422      4010  # urban learners, by countrycode idgrade
n_has_qescs   360     30  2737.367      1937      3765  # has_qescs learners, by countrycode idgrade
n_qescs       360     30  8629.633      5727     11913  # qescs learners, by countrycode idgrade
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

~~~~

About the **360     observations** in this dataset:

~~~~
. tab countrycode idgrade

WB country |
   code (3 |       Grade ID
  letters) |         3          6 |     Total
-----------+----------------------+----------
       ARG |        12         12 |        24 
       BRA |        12         12 |        24 
       CHL |        12         12 |        24 
       COL |        12         12 |        24 
       CRI |        12         12 |        24 
       DOM |        12         12 |        24 
       ECU |        12         12 |        24 
       GTM |        12         12 |        24 
       HND |        12         12 |        24 
       MEX |        12         12 |        24 
       NIC |        12         12 |        24 
       PAN |        12         12 |        24 
       PER |        12         12 |        24 
       PRY |        12         12 |        24 
       URY |        12         12 |        24 
-----------+----------------------+----------
     Total |       180        180 |       360 

. 
. tab subgroup

  Subgroups |
         of |
countrycode |
    idgrade |      Freq.     Percent        Cum.
------------+-----------------------------------
        all |         30        8.33        8.33
has_qescs=0 |         30        8.33       16.67
has_qescs=1 |         30        8.33       25.00
     male=0 |         30        8.33       33.33
     male=1 |         30        8.33       41.67
    qescs=1 |         30        8.33       50.00
    qescs=2 |         30        8.33       58.33
    qescs=3 |         30        8.33       66.67
    qescs=4 |         30        8.33       75.00
    qescs=5 |         30        8.33       83.33
    urban=0 |         30        8.33       91.67
    urban=1 |         30        8.33      100.00
------------+-----------------------------------
      Total |        360      100.00

~~~~
