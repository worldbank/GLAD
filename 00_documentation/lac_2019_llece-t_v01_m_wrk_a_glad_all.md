Documentation of GLAD dataset
=====================================================================


[back to list of assessments](https://github.com/worldbank/GLAD/blob/master/README.md#harmonization)

This dataset is part of the Global Learning Assessment Database (GLAD). It contains microdata from LLECE-T 2019. Each observation corresponds to one learner (student or pupil), and the variables have been harmonized.

**Metadata** stored in this dataset:

~~~~
region:      LAC
year:        2019
assessment:  LLECE-T
master:      v01_M
adaptation:  wrk_A_GLAD
module:      ALL
ttl_info:    Joao Pedro de Azevedo [eduanalytics@worldbank.org]
dofile_info: last modified by Alison Gilberto in May 17, 2022
lastsave:    14 Jun 2022 13:54:20 by wb576985
~~~~


About the **205 variables** in this dataset:

~~~~
The variables belong to the following variable classifications:
    idvars keyvars valuevars traitvars samplevars

idvars:     idcntry_raw idschool idgrade idclass idlearner
keyvars:    surveyid countrycode national_level
valuevars:  score_llece_read_01 score_llece_math_01 score_llece_read_02 score_llece_math_02 score_llece_read_03 score_llece_math_03 score_llece_read_04 score_llece_math_04 score_llece_read_05 score_llece_math_05 level_llece_read_01 level_llece_math_01 level_llece_read_02 level_llece_math_02 level_llece_read_03 level_llece_math_03 level_llece_read_04 level_llece_math_04 level_llece_read_05 level_llece_math_05
traitvars:  age urban male qescs has_qescs
samplevars: strata learner_weight weight_replicate1 weight_replicate2 weight_replicate3 weight_replicate4 weight_replicate5 weight_replicate6 weight_replicate7 weight_replicate8 weight_replicate9 weight_replicate10 weight_replicate11 weight_replicate12 weight_replicate13 weight_replicate14 weight_replicate15 weight_replicate16 weight_replicate17 weight_replicate18 weight_replicate19 weight_replicate20 weight_replicate21 weight_replicate22 weight_replicate23 weight_replicate24 weight_replicate25 weight_replicate26 weight_replicate27 weight_replicate28 weight_replicate29 weight_replicate30 weight_replicate31 weight_replicate32 weight_replicate33 weight_replicate34 weight_replicate35 weight_replicate36 weight_replicate37 weight_replicate38 weight_replicate39 weight_replicate40 weight_replicate41 weight_replicate42 weight_replicate43 weight_replicate44 weight_replicate45 weight_replicate46 weight_replicate47 weight_replicate48 weight_replicate49 weight_replicate50 weight_replicate51 weight_replicate52 weight_replicate53 weight_replicate54 weight_replicate55 weight_replicate56 weight_replicate57 weight_replicate58 weight_replicate59 weight_replicate60 weight_replicate61 weight_replicate62 weight_replicate63 weight_replicate64 weight_replicate65 weight_replicate66 weight_replicate67 weight_replicate68 weight_replicate69 weight_replicate70 weight_replicate71 weight_replicate72 weight_replicate73 weight_replicate74 weight_replicate75 weight_replicate76 weight_replicate77 weight_replicate78 weight_replicate79 weight_replicate80 weight_replicate81 weight_replicate82 weight_replicate83 weight_replicate84 weight_replicate85 weight_replicate86 weight_replicate87 weight_replicate88 weight_replicate89 weight_replicate90 weight_replicate91 weight_replicate92 weight_replicate93 weight_replicate94 weight_replicate95 weight_replicate96 weight_replicate97 weight_replicate98 weight_replicate99 weight_replicate100


Variable         Obs Unique      Mean       Min       Max  Label
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
idcntry_raw   161139     16  359.3203        32       858  Country ID, as coded in rawdata
idschool      161139    476  1170.355      1001      3292  School ID
idgrade       161139      2  4.504794         3         6  Grade ID
idclass       161139   1347  112406.3       -99    329201  Class ID
idlearner     161139  42223  1.17e+07  1.00e+07  3.29e+07  Learner ID
surveyid      161139      1         .         .         .  Survey ID (Region_Year_Assessment)
countrycode   161139     16         .         .         .  WB country code (3 letters)
national_l~l  161139      1         1         1         1  Idcntry_raw is a national level
score_l~d_01  161139   6336  701.5406       250    1102.2  Plausible value 1: LLECE-T score for read
score_l~h_01  161139   5895  699.3428     274.8      1110  Plausible value 1: LLECE-T score for math
score_l~d_02  161139   6342  701.3289       250    1112.9  Plausible value 2: LLECE-T score for read
score_l~h_02  161139   5887  699.5747     259.9    1133.8  Plausible value 2: LLECE-T score for math
score_l~d_03  161139   6319  702.1909       250    1138.8  Plausible value 3: LLECE-T score for read
score_l~h_03  161139   5898  700.1605     289.8    1122.9  Plausible value 3: LLECE-T score for math
score_l~d_04  161139   6297  701.9448       250    1104.4  Plausible value 4: LLECE-T score for read
score_l~h_04  161139   5846  699.6146       250    1123.8  Plausible value 4: LLECE-T score for math
score_l~d_05  161139   6330  701.9136       250    1104.5  Plausible value 5: LLECE-T score for read
score_l~h_05  161139   5897  699.4676     257.6    1123.2  Plausible value 5: LLECE-T score for math
level_l~d_01  161139      4  2.210328         1         4  Plausible value 1: LLECE-T level for read
level_l~h_01  161139      4  1.820807         1         4  Plausible value 1: LLECE-T level for math
level_l~d_02  161139      4  2.210272         1         4  Plausible value 2: LLECE-T level for read
level_l~h_02  161139      4  1.823171         1         4  Plausible value 2: LLECE-T level for math
level_l~d_03  161139      4  2.216335         1         4  Plausible value 3: LLECE-T level for read
level_l~h_03  161139      4  1.826311         1         4  Plausible value 3: LLECE-T level for math
level_l~d_04  161139      4  2.213139         1         4  Plausible value 4: LLECE-T level for read
level_l~h_04  161139      4  1.820757         1         4  Plausible value 4: LLECE-T level for math
level_l~d_05  161139      4  2.213784         1         4  Plausible value 5: LLECE-T level for read
level_l~h_05  161139      4  1.819448         1         4  Plausible value 5: LLECE-T level for math
age           151265      9  10.38509         7        15  Learner age at time of assessment
urban         161139      2  .2418037         0         1  School is located in urban/rural area
male          161139      2  .5036397         0         1  Learner gender is male/female
qescs         159291      5  3.137409         1         5  Quintiles of Socio-Economic Status
has_qescs     161139      2  .9885316         0         1  Dummy variable for observations with a valid QESCS
strata        161139    184  4.86e+07  3.03e+07  6.86e+07  Strata
learner_we~t  161139   6538   114.651  1.944444  3807.318  Learner weight
weight_re~e1  161139   6864  114.6102  1.042407  5153.409  Replicated weight 1
weight_re~e2  161139   6888  114.4105  1.042407  4874.624  Replicated weight 2
weight_re~e3  161139   6856  114.7655  1.042407  4874.624  Replicated weight 3
weight_re~e4  161139   6866   114.791  1.080978  5153.409  Replicated weight 4
weight_re~e5  161139   6871   115.054  1.042407  4874.624  Replicated weight 5
weight_re~e6  161139   6882  114.2283   1.13536  5153.409  Replicated weight 6
weight_re~e7  161139   6874  114.6879  1.150105  5153.409  Replicated weight 7
weight_re~e8  161139   6893  115.1552  1.042407  5153.409  Replicated weight 8
weight_re~e9  161139   6880   114.983  1.150105  5153.409  Replicated weight 9
weight_re~10  161139   6878  114.0133  1.042407  4874.624  Replicated weight 10
weight_re~11  161139   6882  114.8382  1.042407  5153.409  Replicated weight 11
weight_re~12  161139   6885  114.2498  1.042407  5153.409  Replicated weight 12
weight_re~13  161139   6868  114.7525  1.186929  5153.409  Replicated weight 13
weight_re~14  161139   6862  115.1749  1.042407  5153.409  Replicated weight 14
weight_re~15  161139   6864  113.9495  1.082333  5153.409  Replicated weight 15
weight_re~16  161139   6861  114.8296  1.080978  5153.409  Replicated weight 16
weight_re~17  161139   6878  114.4442  1.080978  5153.409  Replicated weight 17
weight_re~18  161139   6874  115.3744  1.080978  4874.624  Replicated weight 18
weight_re~19  161139   6865  114.9214  1.080978  4874.624  Replicated weight 19
weight_re~20  161139   6856  114.4258   1.13536  5153.409  Replicated weight 20
weight_re~21  161139   6869  114.5394  1.080978  4874.624  Replicated weight 21
weight_re~22  161139   6873  114.4474  1.082333  4874.624  Replicated weight 22
weight_re~23  161139   6896  114.3107  1.042407  4874.624  Replicated weight 23
weight_re~24  161139   6879  114.8797  1.042407  5153.409  Replicated weight 24
weight_re~25  161139   6867  114.3749  1.191099  5153.409  Replicated weight 25
weight_re~26  161139   6881  114.6935  1.042407  4874.624  Replicated weight 26
weight_re~27  161139   6881  113.5252  1.080978  4874.624  Replicated weight 27
weight_re~28  161139   6870  114.5227  1.082333  4874.624  Replicated weight 28
weight_re~29  161139   6887  114.1303  1.082333  4874.624  Replicated weight 29
weight_re~30  161139   6880  114.9586  1.080978  4874.624  Replicated weight 30
weight_re~31  161139   6869  114.6533  1.080978  4874.624  Replicated weight 31
weight_re~32  161139   6862   114.483  1.080978  5153.409  Replicated weight 32
weight_re~33  161139   6878  115.1592  1.042407  4874.624  Replicated weight 33
weight_re~34  161139   6873  115.3033  1.080978  4874.624  Replicated weight 34
weight_re~35  161139   6869  114.5707  1.082333  4874.624  Replicated weight 35
weight_re~36  161139   6860  114.4498  1.042407  4874.624  Replicated weight 36
weight_re~37  161139   6872  114.5027  1.082333  5153.409  Replicated weight 37
weight_re~38  161139   6889  114.6663  1.042407  4874.624  Replicated weight 38
weight_re~39  161139   6867    114.75  1.080978  5153.409  Replicated weight 39
weight_re~40  161139   6876  115.5636  1.080978  5153.409  Replicated weight 40
weight_re~41  161139   6885  114.6873  1.042407  4874.624  Replicated weight 41
weight_re~42  161139   6882  115.2876  1.042407  4874.624  Replicated weight 42
weight_re~43  161139   6871  115.0155  1.042407  4874.624  Replicated weight 43
weight_re~44  161139   6873  114.3496  1.082333  5153.409  Replicated weight 44
weight_re~45  161139   6884  114.2308  1.042407  5153.409  Replicated weight 45
weight_re~46  161139   6886  115.3858  1.080978  5153.409  Replicated weight 46
weight_re~47  161139   6867  114.5239  1.042407  4874.624  Replicated weight 47
weight_re~48  161139   6881  114.1469  1.082333  5153.409  Replicated weight 48
weight_re~49  161139   6878  114.6612  1.080978  5153.409  Replicated weight 49
weight_re~50  161139   6874     114.7  1.080978  4874.624  Replicated weight 50
weight_re~51  161139   6865  114.7507  1.080978  5153.409  Replicated weight 51
weight_re~52  161139   6869  114.0228  1.042407  4874.624  Replicated weight 52
weight_re~53  161139   6882  113.8129  1.082333  5153.409  Replicated weight 53
weight_re~54  161139   6864  114.1835  1.082333  4874.624  Replicated weight 54
weight_re~55  161139   6885  114.2713  1.080978  5153.409  Replicated weight 55
weight_re~56  161139   6883    114.84  1.042407  5153.409  Replicated weight 56
weight_re~57  161139   6893  114.4983  1.080978  4874.624  Replicated weight 57
weight_re~58  161139   6879  114.6727  1.042407  5153.409  Replicated weight 58
weight_re~59  161139   6885  114.8185  1.042407  5153.409  Replicated weight 59
weight_re~60  161139   6876  114.1849   1.13536  5153.409  Replicated weight 60
weight_re~61  161139   6889  115.0024  1.042407  5153.409  Replicated weight 61
weight_re~62  161139   6868  115.4376   1.13536  4874.624  Replicated weight 62
weight_re~63  161139   6876  114.4058  1.080978  4874.624  Replicated weight 63
weight_re~64  161139   6879   114.826  1.150835  4874.624  Replicated weight 64
weight_re~65  161139   6896  114.7672  1.042407  5153.409  Replicated weight 65
weight_re~66  161139   6872   114.908  1.082333  4874.624  Replicated weight 66
weight_re~67  161139   6868   115.119   1.13536  4874.624  Replicated weight 67
weight_re~68  161139   6875  114.4008  1.042407  5153.409  Replicated weight 68
weight_re~69  161139   6887  114.8084  1.042407  5153.409  Replicated weight 69
weight_re~70  161139   6879   114.642  1.042407  4874.624  Replicated weight 70
weight_re~71  161139   6862  114.3404  1.042407  4874.624  Replicated weight 71
weight_re~72  161139   6874   114.716  1.042407  5153.409  Replicated weight 72
weight_re~73  161139   6875   114.949  1.042407  5153.409  Replicated weight 73
weight_re~74  161139   6867  114.4626  1.042407  4874.624  Replicated weight 74
weight_re~75  161139   6873  114.7065  1.042407  4874.624  Replicated weight 75
weight_re~76  161139   6873  114.6605  1.042407  5153.409  Replicated weight 76
weight_re~77  161139   6873  115.3991  1.150105  4874.624  Replicated weight 77
weight_re~78  161139   6865  114.6692  1.042407  5153.409  Replicated weight 78
weight_re~79  161139   6878  114.8807  1.080978  5153.409  Replicated weight 79
weight_re~80  161139   6881  114.1221  1.042407  5153.409  Replicated weight 80
weight_re~81  161139   6869  114.4838  1.042407  4874.624  Replicated weight 81
weight_re~82  161139   6879  113.9682  1.150105  4874.624  Replicated weight 82
weight_re~83  161139   6875  114.6016  1.042407  4874.624  Replicated weight 83
weight_re~84  161139   6880  114.3446  1.042407  4874.624  Replicated weight 84
weight_re~85  161139   6880  115.1939  1.042407  5153.409  Replicated weight 85
weight_re~86  161139   6878  114.9246  1.042407  4874.624  Replicated weight 86
weight_re~87  161139   6870    114.45  1.042407  4874.624  Replicated weight 87
weight_re~88  161139   6870  114.8944  1.042407  5153.409  Replicated weight 88
weight_re~89  161139   6883  114.4254  1.080978  4874.624  Replicated weight 89
weight_re~90  161139   6887  114.7677  1.042407  5153.409  Replicated weight 90
weight_re~91  161139   6872  114.5118  1.042407  4874.624  Replicated weight 91
weight_re~92  161139   6875  114.4848  1.042407  5153.409  Replicated weight 92
weight_re~93  161139   6872  115.0142  1.082333  5153.409  Replicated weight 93
weight_re~94  161139   6882  114.3877  1.042407  4874.624  Replicated weight 94
weight_re~95  161139   6877  114.6092  1.080978  4874.624  Replicated weight 95
weight_re~96  161139   6883  114.3176  1.042407  5153.409  Replicated weight 96
weight_re~97  161139   6877  114.6722  1.080978  5153.409  Replicated weight 97
weight_re~98  161139   6860  114.7086  1.080978  4874.624  Replicated weight 98
weight_re~99  161139   6870  114.7233  1.150105  4874.624  Replicated weight 99
weight_r~100  161139   6887  115.2044  1.042407  5153.409  Replicated weight 100
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


Plus the variables merged-on-the-fly, which are:

traitvars:  lp01_threshold_var lp02_threshold_var lp03_threshold_var lp04_threshold_var lp05_threshold_var lp06_threshold_var lp07_threshold_var lp08_threshold_var lp09_threshold_var lp10_threshold_var lp01_threshold_val lp02_threshold_val lp03_threshold_val lp04_threshold_val lp05_threshold_val lp06_threshold_val lp07_threshold_val lp08_threshold_val lp09_threshold_val lp10_threshold_val lp01_threshold_res lp02_threshold_res lp03_threshold_res lp04_threshold_res lp05_threshold_res lp06_threshold_res lp07_threshold_res lp08_threshold_res lp09_threshold_res lp10_threshold_res
valuevars:  sdg411_read_01 bmp_read_01 fgt1_read_01 fgt2_read_01 sdg411_read_02 bmp_read_02 fgt1_read_02 fgt2_read_02 sdg411_read_03 bmp_read_03 fgt1_read_03 fgt2_read_03 sdg411_read_04 bmp_read_04 fgt1_read_04 fgt2_read_04 sdg411_read_05 bmp_read_05 fgt1_read_05 fgt2_read_05 sdg411_math_01 bmp_math_01 fgt1_math_01 fgt2_math_01 sdg411_math_02 bmp_math_02 fgt1_math_02 fgt2_math_02 sdg411_math_03 bmp_math_03 fgt1_math_03 fgt2_math_03 sdg411_math_04 bmp_math_04 fgt1_math_04 fgt2_math_04 sdg411_math_05 bmp_math_05 fgt1_math_05 fgt2_math_05
~~~~

About the **161,139 observations** in this dataset:

~~~~
. tab countrycode idgrade if national_level==1

WB country |
   code (3 |       Grade ID
  letters) |         3          6 |     Total
-----------+----------------------+----------
       ARG |     5,069      5,004 |    10,073 
       BRA |     4,522      4,349 |     8,871 
       COL |     4,158      4,467 |     8,625 
       CRI |     3,593      3,699 |     7,292 
       CUB |     5,273      5,126 |    10,399 
       DOM |     4,986      4,899 |     9,885 
       ECU |     6,676      6,758 |    13,434 
       GTM |     5,393      4,895 |    10,288 
       HND |     4,179      4,423 |     8,602 
       MEX |     4,587      4,824 |     9,411 
       NIC |     4,863      4,868 |     9,731 
       PAN |     5,346      5,632 |    10,978 
       PER |     6,018      5,938 |    11,956 
       PRY |     4,956      4,849 |     9,805 
       SLV |     5,814      5,920 |    11,734 
       URY |     4,879      5,176 |    10,055 
-----------+----------------------+----------
     Total |    80,312     80,827 |   161,139 

. 
. tab countrycode idgrade if national_level==0
no observations

~~~~

**Harmonization** of proficiency (done on-the-fly):

~~~~

      sdg411_read_01 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
      Non-proficient |    103,242       64.07       64.07
          Proficient |     57,897       35.93      100.00
---------------------+-----------------------------------
               Total |    161,139      100.00

         bmp_read_01 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
          Proficient |     57,897       35.93       35.93
      Non-proficient |    103,242       64.07      100.00
---------------------+-----------------------------------
               Total |    161,139      100.00

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
fgt1_read_01 |    103,242    .1424628    .0953096   .0001326    .668435

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
fgt2_read_01 |    103,242    .0293795    .0356551   1.76e-08   .4468054

      sdg411_read_02 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
      Non-proficient |    102,983       63.91       63.91
          Proficient |     58,156       36.09      100.00
---------------------+-----------------------------------
               Total |    161,139      100.00

         bmp_read_02 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
          Proficient |     58,156       36.09       36.09
      Non-proficient |    102,983       63.91      100.00
---------------------+-----------------------------------
               Total |    161,139      100.00

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
fgt1_read_02 |    102,983    .1436886    .0961522   .0001326    .668435

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
fgt2_read_02 |    102,983    .0298916    .0360233   1.76e-08   .4468054

      sdg411_read_03 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
      Non-proficient |    102,787       63.79       63.79
          Proficient |     58,352       36.21      100.00
---------------------+-----------------------------------
               Total |    161,139      100.00

         bmp_read_03 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
          Proficient |     58,352       36.21       36.21
      Non-proficient |    102,787       63.79      100.00
---------------------+-----------------------------------
               Total |    161,139      100.00

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
fgt1_read_03 |    102,787    .1422446    .0951408   .0001326    .668435

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
fgt2_read_03 |    102,787    .0292852    .0353357   1.76e-08   .4468054

      sdg411_read_04 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
      Non-proficient |    103,061       63.96       63.96
          Proficient |     58,078       36.04      100.00
---------------------+-----------------------------------
               Total |    161,139      100.00

         bmp_read_04 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
          Proficient |     58,078       36.04       36.04
      Non-proficient |    103,061       63.96      100.00
---------------------+-----------------------------------
               Total |    161,139      100.00

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
fgt1_read_04 |    103,061    .1420075    .0951526   .0001326    .668435

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
fgt2_read_04 |    103,061    .0292201    .0352723   1.76e-08   .4468054

      sdg411_read_05 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
      Non-proficient |    102,912       63.87       63.87
          Proficient |     58,227       36.13      100.00
---------------------+-----------------------------------
               Total |    161,139      100.00

         bmp_read_05 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
          Proficient |     58,227       36.13       36.13
      Non-proficient |    102,912       63.87      100.00
---------------------+-----------------------------------
               Total |    161,139      100.00

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
fgt1_read_05 |    102,912    .1423449    .0955952   .0001326    .668435

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
fgt2_read_05 |    102,912    .0294004     .035764   1.76e-08   .4468054

      sdg411_math_01 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
      Non-proficient |    123,326       76.53       76.53
          Proficient |     37,813       23.47      100.00
---------------------+-----------------------------------
               Total |    161,139      100.00

         bmp_math_01 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
          Proficient |     37,813       23.47       23.47
      Non-proficient |    123,326       76.53      100.00
---------------------+-----------------------------------
               Total |    161,139      100.00

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
fgt1_math_01 |    123,326    .1437608    .0874534   .0001267      .6336

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
fgt2_math_01 |    123,326    .0283152    .0304813   1.61e-08    .401449

      sdg411_math_02 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
      Non-proficient |    123,485       76.63       76.63
          Proficient |     37,654       23.37      100.00
---------------------+-----------------------------------
               Total |    161,139      100.00

         bmp_math_02 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
          Proficient |     37,654       23.37       23.37
      Non-proficient |    123,485       76.63      100.00
---------------------+-----------------------------------
               Total |    161,139      100.00

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
fgt1_math_02 |    123,485    .1436838    .0875243   .0001267   .6534666

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
fgt2_math_02 |    123,485    .0283055    .0305158   1.61e-08   .4270186

      sdg411_math_03 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
      Non-proficient |    123,420       76.59       76.59
          Proficient |     37,719       23.41      100.00
---------------------+-----------------------------------
               Total |    161,139      100.00

         bmp_math_03 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
          Proficient |     37,719       23.41       23.41
      Non-proficient |    123,420       76.59      100.00
---------------------+-----------------------------------
               Total |    161,139      100.00

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
fgt1_math_03 |    123,420    .1433266    .0872567   .0001267   .6831432

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
fgt2_math_03 |    123,420    .0281562    .0303538   1.61e-08   .4666846

      sdg411_math_04 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
      Non-proficient |    123,645       76.73       76.73
          Proficient |     37,494       23.27      100.00
---------------------+-----------------------------------
               Total |    161,139      100.00

         bmp_math_04 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
          Proficient |     37,494       23.27       23.27
      Non-proficient |    123,645       76.73      100.00
---------------------+-----------------------------------
               Total |    161,139      100.00

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
fgt1_math_04 |    123,645    .1431731    .0872821   .0001267   .6178707

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
fgt2_math_04 |    123,645    .0281166     .030484   1.61e-08   .3817643

      sdg411_math_05 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
      Non-proficient |    123,838       76.85       76.85
          Proficient |     37,301       23.15      100.00
---------------------+-----------------------------------
               Total |    161,139      100.00

         bmp_math_05 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
          Proficient |     37,301       23.15       23.15
      Non-proficient |    123,838       76.85      100.00
---------------------+-----------------------------------
               Total |    161,139      100.00

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
fgt1_math_05 |    123,838    .1432084    .0872447   .0001267   .6565334

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
fgt2_math_05 |    123,838    .0281202     .030494   1.61e-08   .4310361



     +-----------------------------------------------------------+
     | idgrade   prefix                  harmonization_condition |
     |-----------------------------------------------------------|
  1. |       3     lp01   read_01 = (score_llece_read_01 >= 729) |
  2. |       3     lp02   read_02 = (score_llece_read_02 >= 729) |
  3. |       3     lp03   read_03 = (score_llece_read_03 >= 729) |
  4. |       3     lp04   read_04 = (score_llece_read_04 >= 729) |
  5. |       3     lp05   read_05 = (score_llece_read_05 >= 729) |
     |-----------------------------------------------------------|
  6. |       3     lp06   math_01 = (score_llece_math_01 >= 750) |
  7. |       3     lp07   math_02 = (score_llece_math_02 >= 750) |
  8. |       3     lp08   math_03 = (score_llece_math_03 >= 750) |
  9. |       3     lp09   math_04 = (score_llece_math_04 >= 750) |
 10. |       3     lp10   math_05 = (score_llece_math_05 >= 750) |
     |-----------------------------------------------------------|
 11. |       6     lp01   read_01 = (score_llece_read_01 >= 754) |
 12. |       6     lp02   read_02 = (score_llece_read_02 >= 754) |
 13. |       6     lp03   read_03 = (score_llece_read_03 >= 754) |
 14. |       6     lp04   read_04 = (score_llece_read_04 >= 754) |
 15. |       6     lp05   read_05 = (score_llece_read_05 >= 754) |
     |-----------------------------------------------------------|
 16. |       6     lp06   math_01 = (score_llece_math_02 >= 789) |
 17. |       6     lp07   math_02 = (score_llece_math_02 >= 789) |
 18. |       6     lp08   math_03 = (score_llece_math_04 >= 789) |
 19. |       6     lp09   math_04 = (score_llece_math_05 >= 789) |
 20. |       6     lp10   math_05 = (score_llece_math_05 >= 789) |
     +-----------------------------------------------------------+

~~~~
