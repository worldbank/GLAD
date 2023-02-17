Documentation of GLAD dataset
=====================================================================


[back to list of assessments](https://github.com/worldbank/GLAD/blob/master/README.md#harmonization)

This dataset is part of the Global Learning Assessment Database (GLAD). It contains microdata from LLECE 2006. Each observation corresponds to one learner (student or pupil), and the variables have been harmonized.

**Metadata** stored in this dataset:

~~~~
region:      LAC
year:        2006
assessment:  LLECE
master:      v01_M
adaptation:  wrk_A_GLAD
module:      ALL
ttl_info:    Joao Pedro de Azevedo [eduanalytics@worldbank.org]
dofile_info: last modified by Joao Pedro Azevedo in Feb 05, 2022
lastsave:    6 Feb 2022 10:15:30 by wb255520
~~~~


About the **70 variables** in this dataset:

~~~~
The variables belong to the following variable classifications:
    idvars keyvars valuevars traitvars sesvars samplevars

idvars:     idcntry_raw idschool idgrade idlearner
keyvars:    surveyid countrycode national_level
valuevars:  score_llece_read score_llece_math score_llece_sci level_llece_read level_llece_math level_llece_sci
traitvars:  age urban male qescs has_qescs
sesvars: ses qses escs qescs nescs qnescs nnescs qnnescs escs_compute homepos_std homepos paredu_std hiedu homepos_o paredu roomspc floor nbooks electricity water sewage phone cabletv internet tv radio soundsystem videorec dvdorvhs computer cellphone refrigerator stove microwave washer dryer dishwasher moto auto


Variable         Obs Unique       Mean        Min       Max  Label
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
idcntry_raw   196040     17   11.07802          1        21  Country ID, as coded in rawdata
idschool      196040    231    90.7797          1       231  School ID
idgrade       196040      2   4.458192          3         6  Grade ID
idlearner     196040 196040   1.12e+09   1.00e+08  2.12e+09  Learner ID
surveyid      196040      1          .          .         .  Survey ID (Region_Year_Assessment)
countrycode   196040     16          .          .         .  WB country code (3 letters)
national_l~l  196040      2   .9452357          0         1  Idcntry_raw is a national level
score_llec~d  185091    329   511.3148  -48.33484  970.1854  Llece score for read
score_llec~h  187996    841   507.9794  -55.01115   1135.41  Llece score for math
score_llec~i   53979    337   508.8589  -68.76551   1188.77  Llece score for science
level_llec~d  185091      5   2.255518          0         4  Llece level for read
level_llec~h  187996      5   2.089656          0         4  Llece level for math
level_llec~i   53979      5    1.80535          0         4  Llece level for science
age           185879     44   10.57118          4        50  Learner age at time of assessment
urban         196040      2    .795251          0         1  School is located in urban/rural area
male          187018      2   .5031387          0         1  Learner gender is male/female
qescs         186462      5   3.278496          1         5  Quintiles of Socio-Economic Status
has_qescs     196040      2   .9511426          0         1  Dummy variable for observations with a valid QESCS
ses           163969 128370   .0823761  -2.769182  2.726717  SES (single-step IRT)
qses          163969      5   3.114699          1         5  Quintiles of SES
escs          186462 123696  -.0209971   -3.10078  2.428199  ESCS (original in GLAD v01)
qescs         186462      5   3.278496          1         5  Quintiles of Socio-Economic Status
nescs         163958 108424   .2361926   -3.11257  3.122844  New ESCS (IRT + PCA)
qnescs        163958      5   3.293789          1         5  Quintiles of New ESCS
nnescs        163644 114365  -.0986269  -3.294554   2.61709  NN ESCS (IRT + polychoricPCA)
qnnescs       163644      5   3.275335          1         5  Quintiles of NN ESCS
escs_compute  196040      3   1.650612          0         2  Computation of ESCS
homepos_std   163958  86185   .0876338  -2.711484  2.687616  Home possessions composite indicator (imp.std.)
homepos       163644  85876   .0816731  -2.528949  2.506605  Home possessions composite indicator
paredu_std    163958      5    .246393  -1.690355  1.728752  Parents' highest educational attainment (imp.std.)
hiedu         186462      7   4.095258          1         7  Parents' highest educational attainment
homepos_o     186462 102869   .2468049   -6.56064  6.164906  Scores for component 1
paredu        159942      5   3.276807          1         5  Parents' highest educational attainment
roomspc       130080      4       1.75          0         3  Rooms per household inhabitant
floor         158657      4   2.482494          1         4  Floor material
nbooks        160446      4   2.561179          1         4  Number of books at home
electricity   160563      2   .9513275          0         1  Home has electricity
water         156524      2   .8843117          0         1  Home is connected to public piped water
sewage        143271      2   .7060745          0         1  Home is connected to sewage system
phone         137984      2   .5618405          0         1  Telephone availability at home
cabletv       130358      2   .3711088          0         1  Cable / Satellite TV service at home
internet      120799      2   .1244547          0         1  Internet access at home
tv            156753      2   .8669053          0         1  Has a color TV at home
radio         149856      2   .8385383          0         1  Has a radio at home
soundsystem   141573      2   .5939056          0         1  Has a sound system at home
videorec      130316      2    .296157          0         1  Has a video recorder at home
dvdorvhs      136509      2    .476247          0         1  Has a DVD or VHS at home
computer      130256      2   .2831731          0         1  Has a computer at home
cellphone     146698      2    .711598          0         1  Has a cellphone at home
refrigerator  149397      2   .7778068          0         1  Has a refrigerator at home
stove         151440      2   .8385565          0         1  Has a gas/electric stove at home
microwave     131898      2   .3346146          0         1  Has a microwave at home
washer        140989      2   .5794849          0         1  Has a washer machine at home
dryer         127438      2   .1973587          0         1  Has a dryer machine at home
dishwasher    124813      2   .0928189          0         1  Has a dishwasher at home
moto          125244      2   .1450209          0         1  Has a moto at home
auto          130246      2   .3070804          0         1  Has an auto at home
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


Plus the variables merged-on-the-fly, which are:

traitvars:  lp01_threshold_var lp01_threshold_val lp01_threshold_res
valuevars:  sdg411_read bmp_read fgt1_read fgt2_read
~~~~

About the **196,040 observations** in this dataset:

~~~~
. tab countrycode idgrade if national_level==1

WB country |
   code (3 |       Grade ID
  letters) |         3          6 |     Total
-----------+----------------------+----------
       ARG |     6,663      6,595 |    13,258 
       BRA |     5,711      5,422 |    11,133 
       CHL |     6,136      6,912 |    13,048 
       COL |     5,902      6,026 |    11,928 
       CRI |     5,233      4,703 |     9,936 
       CUB |     5,293      5,902 |    11,195 
       DOM |     4,554      4,618 |     9,172 
       ECU |     5,349      5,376 |    10,725 
       GTM |     7,095      5,365 |    12,460 
       MEX |     4,753      4,825 |     9,578 
       NIC |     6,885      6,741 |    13,626 
       PAN |     6,476      5,608 |    12,084 
       PER |     4,814      4,662 |     9,476 
       PRY |     5,506      4,777 |    10,283 
       SLV |     7,474      6,342 |    13,816 
       URY |     7,209      6,377 |    13,586 
-----------+----------------------+----------
     Total |    95,053     90,251 |   185,304 

. 
. tab countrycode idgrade if national_level==0

WB country |
   code (3 |       Grade ID
  letters) |         3          6 |     Total
-----------+----------------------+----------
       MEX |     5,699      5,037 |    10,736 
-----------+----------------------+----------
     Total |     5,699      5,037 |    10,736 

~~~~

**Harmonization** of proficiency (done on-the-fly):

~~~~

         sdg411_read |      Freq.     Percent        Cum.
---------------------+-----------------------------------
      Non-proficient |     48,825       24.91       24.91
          Proficient |     41,646       21.24       46.15
 Missing score/level |      4,817        2.46       48.61
Non-harmonized grade |    100,752       51.39      100.00
---------------------+-----------------------------------
               Total |    196,040      100.00

            bmp_read |      Freq.     Percent        Cum.
---------------------+-----------------------------------
          Proficient |     41,646       21.24       21.24
      Non-proficient |     48,825       24.91       46.15
Non-harmonized grade |    105,569       53.85      100.00
---------------------+-----------------------------------
               Total |    196,040      100.00

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
   fgt1_read |     48,825    .1503129    .1116938   .0003553   1.094099

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
   fgt2_read |     48,825    .0350692    .0570742   1.26e-07   1.197052



     +--------------------------------------------------------+
     | idgrade   prefix               harmonization_condition |
     |--------------------------------------------------------|
  1. |       3     lp01                      no harmonization |
  2. |       6     lp01   read = (score_llece_read >= 513.66) |
     +--------------------------------------------------------+

~~~~
