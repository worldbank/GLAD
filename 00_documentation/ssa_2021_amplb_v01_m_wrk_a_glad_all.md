Documentation of GLAD dataset
=====================================================================


[back to list of assessments](https://github.com/worldbank/GLAD/blob/master/README.md#harmonization)

This dataset is part of the Global Learning Assessment Database (GLAD). It contains microdata from AMPLB 2021. Each observation corresponds to one learner (student or pupil), and the variables have been harmonized.

**Metadata** stored in this dataset:

~~~~
region:      SSA
year:        2021
assessment:  AMPLB
master:      v01_M
adaptation:  wrk_A_GLAD
module:      ALL
ttl_info:    Joao Pedro de Azevedo [eduanalytics@worldbank.org]
dofile_info: last modified by Yi Ning Wong in 2/24, 2022
lastsave:    1 Apr 2022 19:29:24 by wb255520
~~~~


About the **190 variables** in this dataset:

~~~~
The variables belong to the following variable classifications:
    idvars keyvars valuevars traitvars samplevars

idvars:     idcntry_raw idschool idgrade idlearner
keyvars:    surveyid countrycode national_level
valuevars:  score_amplb_read_01 score_amplb_math_01 score_amplb_read_02 score_amplb_math_02 score_amplb_read_03 score_amplb_math_03 score_amplb_read_04 score_amplb_math_04 score_amplb_read_05 score_amplb_math_05
traitvars:  age male escs has_qescs qescs urban
samplevars: strata learner_weight weight_replicate1 weight_replicate2 weight_replicate3 weight_replicate4 weight_replicate5 weight_replicate6 weight_replicate7 weight_replicate8 weight_replicate9 weight_replicate10 weight_replicate11 weight_replicate12 weight_replicate13 weight_replicate14 weight_replicate15 weight_replicate16 weight_replicate17 weight_replicate18 weight_replicate19 weight_replicate20 weight_replicate21 weight_replicate22 weight_replicate23 weight_replicate24 weight_replicate25 weight_replicate26 weight_replicate27 weight_replicate28 weight_replicate29 weight_replicate30 weight_replicate31 weight_replicate32 weight_replicate33 weight_replicate34 weight_replicate35 weight_replicate36 weight_replicate37 weight_replicate38 weight_replicate39 weight_replicate40 weight_replicate41 weight_replicate42 weight_replicate43 weight_replicate44 weight_replicate45 weight_replicate46 weight_replicate47 weight_replicate48 weight_replicate49 weight_replicate50 weight_replicate51 weight_replicate52 weight_replicate53 weight_replicate54 weight_replicate55 weight_replicate56 weight_replicate57 weight_replicate58 weight_replicate59 weight_replicate60 weight_replicate61 weight_replicate62 weight_replicate63 weight_replicate64 weight_replicate65 weight_replicate66 weight_replicate67 weight_replicate68 weight_replicate69 weight_replicate70 weight_replicate71 weight_replicate72 weight_replicate73 weight_replicate74 weight_replicate75 weight_replicate76 weight_replicate77 weight_replicate78 weight_replicate79 weight_replicate80 weight_replicate81 weight_replicate82 weight_replicate83 weight_replicate84 weight_replicate85 weight_replicate86 weight_replicate87 weight_replicate88 weight_replicate89 weight_replicate90 weight_replicate91 weight_replicate92 weight_replicate93 weight_replicate94 weight_replicate95


Variable        Obs Unique       Mean        Min       Max  Label
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
idcntry_raw   28657      6          .          .         .  Country ID, as coded in rawdata
idschool      28657   1479   38213.93      11001     65688  School ID
idgrade       28657      3   6.051541          5         7  Grade ID
idlearner     28657  28657   1.38e+07   1.11e+07  1.66e+07  Learner ID
surveyid      28657      1          .          .         .  Survey ID (Region_Year_Assessment)
countrycode   28657      6          .          .         .  WB country code (3 letters)
national_l~l  28657      1          1          1         1  Idcntry_raw is a national level
score_a~d_01  28657      2   .1513417          0         1  Plausible value 1: AMPLB score for reading
score_a~h_01  28657      2   .2834212          0         1  Plausible value 1: AMPLB score for math
score_a~d_02  28657      2   .1501204          0         1  Plausible value 2: AMPLB score for reading
score_a~h_02  28657      2   .2870852          0         1  Plausible value 2: AMPLB score for math
score_a~d_03  28657      2   .1507834          0         1  Plausible value 3: AMPLB score for reading
score_a~h_03  28657      2   .2861779          0         1  Plausible value 3: AMPLB score for math
score_a~d_04  28657      2   .1508183          0         1  Plausible value 4: AMPLB score for reading
score_a~h_04  28657      2   .2830722          0         1  Plausible value 4: AMPLB score for math
score_a~d_05  28657      2    .149597          0         1  Plausible value 5: AMPLB score for reading
score_a~h_05  28657      2   .2855498          0         1  Plausible value 5: AMPLB score for math
age           28537    147   13.28915          9      24.5  Learner age at time of assessment
male          28657      2   .4767771          0         1  Learner gender is male/female
escs          28657  16650  -1.69e-09  -.5772906  7.047193  Socioeconomic Status
has_qescs     28657      1          1          1         1  Dummy variable for observations with a valid QESCS
qescs         28657      5   2.988101          1         5  Quintiles of Socio-Economic Status
urban         28256      2    .145739          0         1  
strata        28657     47   13.24371          1        47  Strata
learner_we~t  28657   1382    103.782   2.536364  384.7955  Learner weight
weight_re~e1  28657   1376    103.809          0  384.7955  Replicate weight 1
weight_re~e2  28657   1378   103.7925          0  384.7955  Replicate weight 2
weight_re~e3  28657   1377    103.791          0  384.7955  Replicate weight 3
weight_re~e4  28657   1379   103.7901          0  384.7955  Replicate weight 4
weight_re~e5  28657   1378   103.6265          0  384.7955  Replicate weight 5
weight_re~e6  28657   1377   103.7481          0  394.4118  Replicate weight 6
weight_re~e7  28657   1379   103.7625          0    391.65  Replicate weight 7
weight_re~e8  28657   1380   103.7737          0    391.65  Replicate weight 8
weight_re~e9  28657   1378   103.7534          0  384.7955  Replicate weight 9
weight_re~10  28657   1378   103.7571          0    391.65  Replicate weight 10
weight_re~11  28657   1377   103.7887          0  384.7955  Replicate weight 11
weight_re~12  28657   1378    103.797          0  384.7955  Replicate weight 12
weight_re~13  28657   1377   103.9271          0  384.7955  Replicate weight 13
weight_re~14  28657   1378   103.6196          0  519.9479  Replicate weight 14
weight_re~15  28657   1378   103.5598          0  384.7955  Replicate weight 15
weight_re~16  28657   1377   103.9149          0  615.1385  Replicate weight 16
weight_re~17  28657   1379   103.7774          0  384.7955  Replicate weight 17
weight_re~18  28657   1380   103.7515          0   396.601  Replicate weight 18
weight_re~19  28657   1378   103.6751          0  435.9167  Replicate weight 19
weight_re~20  28657   1380   103.7096          0  444.6659  Replicate weight 20
weight_re~21  28657   1379   103.7624          0  423.0956  Replicate weight 21
weight_re~22  28657   1380   103.7069          0  421.4375  Replicate weight 22
weight_re~23  28657   1377   103.6456          0  410.9016  Replicate weight 23
weight_re~24  28657   1378   103.7781          0  415.1001  Replicate weight 24
weight_re~25  28657   1380   103.6483          0   424.809  Replicate weight 25
weight_re~26  28657   1377   104.0092          0  495.5826  Replicate weight 26
weight_re~27  28657   1379   103.7708          0  384.7955  Replicate weight 27
weight_re~28  28657   1378   103.7586          0  392.4967  Replicate weight 28
weight_re~29  28657   1378   103.6591          0  384.7955  Replicate weight 29
weight_re~30  28657   1381   103.8787          0    413.48  Replicate weight 30
weight_re~31  28657   1380   103.7932          0  384.7955  Replicate weight 31
weight_re~32  28657   1379   103.8657          0    413.48  Replicate weight 32
weight_re~33  28657   1382   103.7091          0  453.1491  Replicate weight 33
weight_re~34  28657   1379   103.8369          0  384.7955  Replicate weight 34
weight_re~35  28657   1380   103.8705          0  384.7955  Replicate weight 35
weight_re~36  28657   1381   103.8679          0    388.22  Replicate weight 36
weight_re~37  28657   1380   103.8055          0  384.7955  Replicate weight 37
weight_re~38  28657   1380   103.8077          0  499.8189  Replicate weight 38
weight_re~39  28657   1379   103.7612          0    388.22  Replicate weight 39
weight_re~40  28657   1377   103.8693          0  384.7955  Replicate weight 40
weight_re~41  28657   1378   103.8374          0  384.7955  Replicate weight 41
weight_re~42  28657   1379   103.8294          0  425.0453  Replicate weight 42
weight_re~43  28657   1381   103.8456          0  410.3886  Replicate weight 43
weight_re~44  28657   1379   103.8191          0  404.6887  Replicate weight 44
weight_re~45  28657   1380    103.653          0  410.3886  Replicate weight 45
weight_re~46  28657   1377   103.8296          0  475.0063  Replicate weight 46
weight_re~47  28657   1377   103.7699          0  384.7955  Replicate weight 47
weight_re~48  28657   1379   103.9331          0   684.933  Replicate weight 48
weight_re~49  28657   1378   103.8019          0  390.0936  Replicate weight 49
weight_re~50  28657   1379   103.7962          0  384.7955  Replicate weight 50
weight_re~51  28657   1380    103.813          0  384.7955  Replicate weight 51
weight_re~52  28657   1378   103.8554          0  384.7955  Replicate weight 52
weight_re~53  28657   1380   103.7699          0  384.7955  Replicate weight 53
weight_re~54  28657   1379   103.7358          0  387.6956  Replicate weight 54
weight_re~55  28657   1381   103.7689          0  424.6809  Replicate weight 55
weight_re~56  28657   1378   103.7336          0  384.7955  Replicate weight 56
weight_re~57  28657   1379    103.834          0  421.3107  Replicate weight 57
weight_re~58  28657   1379   103.7652          0  384.7955  Replicate weight 58
weight_re~59  28657   1377   103.8423          0  394.4881  Replicate weight 59
weight_re~60  28657   1379   103.7753          0  384.7955  Replicate weight 60
weight_re~61  28657   1379   103.7782          0  458.8116  Replicate weight 61
weight_re~62  28657   1379   103.8324          0  401.8642  Replicate weight 62
weight_re~63  28657   1377   103.7257          0  384.7955  Replicate weight 63
weight_re~64  28657   1378   103.7022          0    391.56  Replicate weight 64
weight_re~65  28657   1378   103.6263          0  384.7955  Replicate weight 65
weight_re~66  28657   1378   103.8018          0  394.7929  Replicate weight 66
weight_re~67  28657   1377   103.7726          0  404.8551  Replicate weight 67
weight_re~68  28657   1378   103.7082          0  414.0696  Replicate weight 68
weight_re~69  28657   1380   103.6868          0  384.7955  Replicate weight 69
weight_re~70  28657   1379   103.7214          0  384.7955  Replicate weight 70
weight_re~71  28657   1377   103.7998          0  407.1541  Replicate weight 71
weight_re~72  28657   1379   103.6779          0  384.7955  Replicate weight 72
weight_re~73  28657   1378   103.8095          0  436.7609  Replicate weight 73
weight_re~74  28657   1379   103.8851          0  509.7926  Replicate weight 74
weight_re~75  28657   1381   103.8772          0  384.7955  Replicate weight 75
weight_re~76  28657   1379   103.7133          0  384.7955  Replicate weight 76
weight_re~77  28657   1379   103.8935          0  397.0238  Replicate weight 77
weight_re~78  28657   1378   103.7271          0  408.5106  Replicate weight 78
weight_re~79  28657   1378   103.8117          0  389.7759  Replicate weight 79
weight_re~80  28657   1378   103.7987          0  471.3016  Replicate weight 80
weight_re~81  28657   1379   103.8379          0  429.8109  Replicate weight 81
weight_re~82  28657   1378   103.7212          0    429.46  Replicate weight 82
weight_re~83  28657   1377   103.9286          0   409.246  Replicate weight 83
weight_re~84  28657   1378   103.8184          0  426.7729  Replicate weight 84
weight_re~85  28657   1379   103.8766          0  423.2255  Replicate weight 85
weight_re~86  28657   1381   103.7921          0  442.1067  Replicate weight 86
weight_re~87  28657   1382   103.7651          0  426.0301  Replicate weight 87
weight_re~88  28657   1380   103.8466          0  384.7955  Replicate weight 88
weight_re~89  28657   1379   103.8827          0  384.7955  Replicate weight 89
weight_re~90  28657   1378   103.8154          0  384.7955  Replicate weight 90
weight_re~91  28657   1380   103.7561          0  384.7955  Replicate weight 91
weight_re~92  28657   1378   103.8808          0  432.6112  Replicate weight 92
weight_re~93  28657   1376   103.7618          0  384.7955  Replicate weight 93
weight_re~94  28657   1379   103.6267          0  362.4313  Replicate weight 94
weight_re~95  28657   1378   103.8296          0  384.7955  Replicate weight 95
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


Plus the variables merged-on-the-fly, which are:

traitvars:  lp01_threshold_var lp02_threshold_var lp03_threshold_var lp04_threshold_var lp05_threshold_var lp06_threshold_var lp07_threshold_var lp08_threshold_var lp09_threshold_var lp10_threshold_var lp01_threshold_val lp02_threshold_val lp03_threshold_val lp04_threshold_val lp05_threshold_val lp06_threshold_val lp07_threshold_val lp08_threshold_val lp09_threshold_val lp10_threshold_val lp01_threshold_res lp02_threshold_res lp03_threshold_res lp04_threshold_res lp05_threshold_res lp06_threshold_res lp07_threshold_res lp08_threshold_res lp09_threshold_res lp10_threshold_res
valuevars:  sdg411_read_01 bmp_read_01 fgt1_read_01 fgt2_read_01 sdg411_read_02 bmp_read_02 fgt1_read_02 fgt2_read_02 sdg411_read_03 bmp_read_03 fgt1_read_03 fgt2_read_03 sdg411_read_04 bmp_read_04 fgt1_read_04 fgt2_read_04 sdg411_read_05 bmp_read_05 fgt1_read_05 fgt2_read_05 sdg411_math_01 bmp_math_01 fgt1_math_01 fgt2_math_01 sdg411_math_02 bmp_math_02 fgt1_math_02 fgt2_math_02 sdg411_math_03 bmp_math_03 fgt1_math_03 fgt2_math_03 sdg411_math_04 bmp_math_04 fgt1_math_04 fgt2_math_04 sdg411_math_05 bmp_math_05 fgt1_math_05 fgt2_math_05
~~~~

About the **28,657  observations** in this dataset:

~~~~
. tab countrycode idgrade if national_level==1

WB country |
   code (3 |             Grade ID
  letters) |         5          6          7 |     Total
-----------+---------------------------------+----------
       BDI |         0      4,677          0 |     4,677 
       BFA |         0      4,513          0 |     4,513 
       CIV |         0      4,643          0 |     4,643 
       KEN |         0          0      5,880 |     5,880 
       SEN |         0      4,541          0 |     4,541 
       ZMB |     4,403          0          0 |     4,403 
-----------+---------------------------------+----------
     Total |     4,403     18,374      5,880 |    28,657 

. 
. tab countrycode idgrade if national_level==0
no observations

~~~~

**Harmonization** of proficiency (done on-the-fly):

~~~~

      sdg411_read_01 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
      Non-proficient |     24,383       85.09       85.09
          Proficient |      4,274       14.91      100.00
---------------------+-----------------------------------
               Total |     28,657      100.00

         bmp_read_01 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
          Proficient |      4,274       14.91       14.91
      Non-proficient |     24,383       85.09      100.00
---------------------+-----------------------------------
               Total |     28,657      100.00

fgt1_read_0 |
          1 |      Freq.     Percent        Cum.
------------+-----------------------------------
          1 |     24,383       85.09       85.09
          . |      4,274       14.91      100.00
------------+-----------------------------------
      Total |     28,657      100.00

fgt2_read_0 |
          1 |      Freq.     Percent        Cum.
------------+-----------------------------------
          1 |     24,383       85.09       85.09
          . |      4,274       14.91      100.00
------------+-----------------------------------
      Total |     28,657      100.00

      sdg411_read_02 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
      Non-proficient |     24,355       84.99       84.99
          Proficient |      4,302       15.01      100.00
---------------------+-----------------------------------
               Total |     28,657      100.00

         bmp_read_02 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
          Proficient |      4,302       15.01       15.01
      Non-proficient |     24,355       84.99      100.00
---------------------+-----------------------------------
               Total |     28,657      100.00

fgt1_read_0 |
          2 |      Freq.     Percent        Cum.
------------+-----------------------------------
          1 |     24,355       84.99       84.99
          . |      4,302       15.01      100.00
------------+-----------------------------------
      Total |     28,657      100.00

fgt2_read_0 |
          2 |      Freq.     Percent        Cum.
------------+-----------------------------------
          1 |     24,355       84.99       84.99
          . |      4,302       15.01      100.00
------------+-----------------------------------
      Total |     28,657      100.00

      sdg411_read_03 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
      Non-proficient |     24,336       84.92       84.92
          Proficient |      4,321       15.08      100.00
---------------------+-----------------------------------
               Total |     28,657      100.00

         bmp_read_03 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
          Proficient |      4,321       15.08       15.08
      Non-proficient |     24,336       84.92      100.00
---------------------+-----------------------------------
               Total |     28,657      100.00

fgt1_read_0 |
          3 |      Freq.     Percent        Cum.
------------+-----------------------------------
          1 |     24,336       84.92       84.92
          . |      4,321       15.08      100.00
------------+-----------------------------------
      Total |     28,657      100.00

fgt2_read_0 |
          3 |      Freq.     Percent        Cum.
------------+-----------------------------------
          1 |     24,336       84.92       84.92
          . |      4,321       15.08      100.00
------------+-----------------------------------
      Total |     28,657      100.00

      sdg411_read_04 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
      Non-proficient |     24,335       84.92       84.92
          Proficient |      4,322       15.08      100.00
---------------------+-----------------------------------
               Total |     28,657      100.00

         bmp_read_04 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
          Proficient |      4,322       15.08       15.08
      Non-proficient |     24,335       84.92      100.00
---------------------+-----------------------------------
               Total |     28,657      100.00

fgt1_read_0 |
          4 |      Freq.     Percent        Cum.
------------+-----------------------------------
          1 |     24,335       84.92       84.92
          . |      4,322       15.08      100.00
------------+-----------------------------------
      Total |     28,657      100.00

fgt2_read_0 |
          4 |      Freq.     Percent        Cum.
------------+-----------------------------------
          1 |     24,335       84.92       84.92
          . |      4,322       15.08      100.00
------------+-----------------------------------
      Total |     28,657      100.00

      sdg411_read_05 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
      Non-proficient |     24,370       85.04       85.04
          Proficient |      4,287       14.96      100.00
---------------------+-----------------------------------
               Total |     28,657      100.00

         bmp_read_05 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
          Proficient |      4,287       14.96       14.96
      Non-proficient |     24,370       85.04      100.00
---------------------+-----------------------------------
               Total |     28,657      100.00

fgt1_read_0 |
          5 |      Freq.     Percent        Cum.
------------+-----------------------------------
          1 |     24,370       85.04       85.04
          . |      4,287       14.96      100.00
------------+-----------------------------------
      Total |     28,657      100.00

fgt2_read_0 |
          5 |      Freq.     Percent        Cum.
------------+-----------------------------------
          1 |     24,370       85.04       85.04
          . |      4,287       14.96      100.00
------------+-----------------------------------
      Total |     28,657      100.00

      sdg411_math_01 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
      Non-proficient |     20,535       71.66       71.66
          Proficient |      8,122       28.34      100.00
---------------------+-----------------------------------
               Total |     28,657      100.00

         bmp_math_01 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
          Proficient |      8,122       28.34       28.34
      Non-proficient |     20,535       71.66      100.00
---------------------+-----------------------------------
               Total |     28,657      100.00

fgt1_math_0 |
          1 |      Freq.     Percent        Cum.
------------+-----------------------------------
          1 |     20,535       71.66       71.66
          . |      8,122       28.34      100.00
------------+-----------------------------------
      Total |     28,657      100.00

fgt2_math_0 |
          1 |      Freq.     Percent        Cum.
------------+-----------------------------------
          1 |     20,535       71.66       71.66
          . |      8,122       28.34      100.00
------------+-----------------------------------
      Total |     28,657      100.00

      sdg411_math_02 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
      Non-proficient |     20,430       71.29       71.29
          Proficient |      8,227       28.71      100.00
---------------------+-----------------------------------
               Total |     28,657      100.00

         bmp_math_02 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
          Proficient |      8,227       28.71       28.71
      Non-proficient |     20,430       71.29      100.00
---------------------+-----------------------------------
               Total |     28,657      100.00

fgt1_math_0 |
          2 |      Freq.     Percent        Cum.
------------+-----------------------------------
          1 |     20,430       71.29       71.29
          . |      8,227       28.71      100.00
------------+-----------------------------------
      Total |     28,657      100.00

fgt2_math_0 |
          2 |      Freq.     Percent        Cum.
------------+-----------------------------------
          1 |     20,430       71.29       71.29
          . |      8,227       28.71      100.00
------------+-----------------------------------
      Total |     28,657      100.00

      sdg411_math_03 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
      Non-proficient |     20,456       71.38       71.38
          Proficient |      8,201       28.62      100.00
---------------------+-----------------------------------
               Total |     28,657      100.00

         bmp_math_03 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
          Proficient |      8,201       28.62       28.62
      Non-proficient |     20,456       71.38      100.00
---------------------+-----------------------------------
               Total |     28,657      100.00

fgt1_math_0 |
          3 |      Freq.     Percent        Cum.
------------+-----------------------------------
          1 |     20,456       71.38       71.38
          . |      8,201       28.62      100.00
------------+-----------------------------------
      Total |     28,657      100.00

fgt2_math_0 |
          3 |      Freq.     Percent        Cum.
------------+-----------------------------------
          1 |     20,456       71.38       71.38
          . |      8,201       28.62      100.00
------------+-----------------------------------
      Total |     28,657      100.00

      sdg411_math_04 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
      Non-proficient |     20,545       71.69       71.69
          Proficient |      8,112       28.31      100.00
---------------------+-----------------------------------
               Total |     28,657      100.00

         bmp_math_04 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
          Proficient |      8,112       28.31       28.31
      Non-proficient |     20,545       71.69      100.00
---------------------+-----------------------------------
               Total |     28,657      100.00

fgt1_math_0 |
          4 |      Freq.     Percent        Cum.
------------+-----------------------------------
          1 |     20,545       71.69       71.69
          . |      8,112       28.31      100.00
------------+-----------------------------------
      Total |     28,657      100.00

fgt2_math_0 |
          4 |      Freq.     Percent        Cum.
------------+-----------------------------------
          1 |     20,545       71.69       71.69
          . |      8,112       28.31      100.00
------------+-----------------------------------
      Total |     28,657      100.00

      sdg411_math_05 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
      Non-proficient |     20,474       71.45       71.45
          Proficient |      8,183       28.55      100.00
---------------------+-----------------------------------
               Total |     28,657      100.00

         bmp_math_05 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
          Proficient |      8,183       28.55       28.55
      Non-proficient |     20,474       71.45      100.00
---------------------+-----------------------------------
               Total |     28,657      100.00

fgt1_math_0 |
          5 |      Freq.     Percent        Cum.
------------+-----------------------------------
          1 |     20,474       71.45       71.45
          . |      8,183       28.55      100.00
------------+-----------------------------------
      Total |     28,657      100.00

fgt2_math_0 |
          5 |      Freq.     Percent        Cum.
------------+-----------------------------------
          1 |     20,474       71.45       71.45
          . |      8,183       28.55      100.00
------------+-----------------------------------
      Total |     28,657      100.00



     +---------------------------------------------------------+
     | idgrade   prefix                harmonization_condition |
     |---------------------------------------------------------|
  1. |       5     lp01   read_01 = (score_amplb_read_01 >= 1) |
  2. |       5     lp02   read_02 = (score_amplb_read_02 >= 1) |
  3. |       5     lp03   read_03 = (score_amplb_read_03 >= 1) |
  4. |       5     lp04   read_04 = (score_amplb_read_04 >= 1) |
  5. |       5     lp05   read_05 = (score_amplb_read_05 >= 1) |
     |---------------------------------------------------------|
  6. |       5     lp06   math_01 = (score_amplb_math_01 >= 1) |
  7. |       5     lp07   math_02 = (score_amplb_math_02 >= 1) |
  8. |       5     lp08   math_03 = (score_amplb_math_03 >= 1) |
  9. |       5     lp09   math_04 = (score_amplb_math_04 >= 1) |
 10. |       5     lp10   math_05 = (score_amplb_math_05 >= 1) |
     |---------------------------------------------------------|
 11. |       6     lp01   read_01 = (score_amplb_read_02 >= 1) |
 12. |       6     lp02   read_02 = (score_amplb_read_02 >= 1) |
 13. |       6     lp03   read_03 = (score_amplb_read_03 >= 1) |
 14. |       6     lp04   read_04 = (score_amplb_read_04 >= 1) |
 15. |       6     lp05   read_05 = (score_amplb_read_05 >= 1) |
     |---------------------------------------------------------|
 16. |       6     lp06   math_01 = (score_amplb_math_01 >= 1) |
 17. |       6     lp07   math_02 = (score_amplb_math_02 >= 1) |
 18. |       6     lp08   math_03 = (score_amplb_math_03 >= 1) |
 19. |       6     lp09   math_04 = (score_amplb_math_04 >= 1) |
 20. |       6     lp10   math_05 = (score_amplb_math_05 >= 1) |
     |---------------------------------------------------------|
 21. |       7     lp01   read_01 = (score_amplb_read_03 >= 1) |
 22. |       7     lp02   read_02 = (score_amplb_read_02 >= 1) |
 23. |       7     lp03   read_03 = (score_amplb_read_03 >= 1) |
 24. |       7     lp04   read_04 = (score_amplb_read_04 >= 1) |
 25. |       7     lp05   read_05 = (score_amplb_read_05 >= 1) |
     |---------------------------------------------------------|
 26. |       7     lp06   math_01 = (score_amplb_math_01 >= 1) |
 27. |       7     lp07   math_02 = (score_amplb_math_02 >= 1) |
 28. |       7     lp08   math_03 = (score_amplb_math_03 >= 1) |
 29. |       7     lp09   math_04 = (score_amplb_math_04 >= 1) |
 30. |       7     lp10   math_05 = (score_amplb_math_05 >= 1) |
     +---------------------------------------------------------+

~~~~
