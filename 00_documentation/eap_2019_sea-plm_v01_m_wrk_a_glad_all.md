      - cap noi _dyntext `"`srcfile'"' `opargs', `stop' `embedimage' basedir("`destfile'")
      = cap noi _dyntext `"dyntext_GLAD.txt"' ,   basedir("C:/Users/wb576985/Documents/GitHub/GLAD-Production/00_documentation/eap_2019
> _sea-plm_v01_m_wrk_a_glad_all.md")
Documentation of GLAD dataset
=====================================================================


[back to list of assessments](https://github.com/worldbank/GLAD/blob/master/README.md#harmonization)

This dataset is part of the Global Learning Assessment Database (GLAD). It contains microdata from SEA-PLM 2019. Each observation corresponds to one learner (student or pupil), and the variables have been harmonized.

**Metadata** stored in this dataset:

~~~~
region:      EAP
year:        2019
assessment:  SEA-PLM
master:      v01_M
adaptation:  wrk_A_GLAD
module:      ALL
ttl_info:    Joao Pedro de Azevedo [eduanalytics@worldbank.org]
dofile_info: last modified by Yi Ning Wong in Feb 14, 2021
lastsave:    14 Jul 2021 16:32:57 by wb576985
~~~~


About the **205 variables** in this dataset:

~~~~
The variables belong to the following variable classifications:
    idvars keyvars valuevars traitvars samplevars

idvars:     idschool idgrade idclass idlearner
keyvars:    surveyid countrycode national_level
valuevars:  score_saplm_read_01 score_saplm_write_01 score_saplm_math_01 score_saplm_read_02 score_saplm_write_02 score_saplm_math_02 score_saplm_read_03 score_saplm_write_03 score_saplm_math_03 score_saplm_read_04 score_saplm_write_04 score_saplm_math_04 score_saplm_read_05 score_saplm_write_05 score_saplm_math_05 level_saplm_read_01 level_saplm_math_01 level_saplm_read_02 level_saplm_math_02 level_saplm_read_03 level_saplm_math_03 level_saplm_read_04 level_saplm_math_04 level_saplm_read_05 level_saplm_math_05
traitvars:  age urban urban_o1 urban_o2 male escs
samplevars: strata learner_weight weight_replicate1 weight_replicate2 weight_replicate3 weight_replicate4 weight_replicate5 weight_replicate6 weight_replicate7 weight_replicate8 weight_replicate9 weight_replicate10 weight_replicate11 weight_replicate12 weight_replicate13 weight_replicate14 weight_replicate15 weight_replicate16 weight_replicate17 weight_replicate18 weight_replicate19 weight_replicate20 weight_replicate21 weight_replicate22 weight_replicate23 weight_replicate24 weight_replicate25 weight_replicate26 weight_replicate27 weight_replicate28 weight_replicate29 weight_replicate30 weight_replicate31 weight_replicate32 weight_replicate33 weight_replicate34 weight_replicate35 weight_replicate36 weight_replicate37 weight_replicate38 weight_replicate39 weight_replicate40 weight_replicate41 weight_replicate42 weight_replicate43 weight_replicate44 weight_replicate45 weight_replicate46 weight_replicate47 weight_replicate48 weight_replicate49 weight_replicate50 weight_replicate51 weight_replicate52 weight_replicate53 weight_replicate54 weight_replicate55 weight_replicate56 weight_replicate57 weight_replicate58 weight_replicate59 weight_replicate60 weight_replicate61 weight_replicate62 weight_replicate63 weight_replicate64 weight_replicate65 weight_replicate66 weight_replicate67 weight_replicate68 weight_replicate69 weight_replicate70 weight_replicate71 weight_replicate72 weight_replicate73 weight_replicate74 weight_replicate75 weight_replicate76 weight_replicate77 weight_replicate78 weight_replicate79 weight_replicate80 weight_replicate81 weight_replicate82 weight_replicate83 weight_replicate84 weight_replicate85 weight_replicate86 weight_replicate87 weight_replicate88 weight_replicate89 weight_replicate90 weight_replicate91 weight_replicate92 weight_replicate93 weight_replicate94 weight_replicate95


Variable        Obs Unique      Mean        Min       Max  Label
---------------------------------------------------------------------------------------------------------------------------------------
idschool      31200   1095  407.8029          2      1096  School ID
idgrade       31200      1         5          5         5  Grade ID
idclass       31200   1095  407.8029          2      1096  Class ID
idlearner     31200  31200  15872.95          1     31632  Learner ID
surveyid      31200      1         .          .         .  Survey ID (Region_Year_Assessment)
countrycode   31200      6         .          .         .  Country ID, as coded in rawdata
national_l~l  31200      1         1          1         1  
score_s~d_01  31200  31200  299.6428   200.5679   411.173  Plausible value 1: SEA-PLM score for reading
score_s~e_01  31200  31200  299.6135   144.9113  403.2537  Plausible value 1: SEA-PLM score for writing
score_s~h_01  31200  31200  299.5678   199.2898  419.7174  Plausible value 1: SEA-PLM score for mathematics
score_s~d_02  31200  31200  299.6189   193.5809  418.9354  Plausible value 2: SEA-PLM score for reading
score_s~e_02  31200  31200   299.625   154.4041  403.2821  Plausible value 2: SEA-PLM score for writing
score_s~h_02  31200  31200  299.5274   195.0542  418.5245  Plausible value 2: SEA-PLM score for mathematics
score_s~d_03  31200  31200  299.6048   189.0973  407.7797  Plausible value 3: SEA-PLM score for reading
score_s~e_03  31200  31200  299.4717   175.8763  396.8031  Plausible value 3: SEA-PLM score for writing
score_s~h_03  31200  31200  299.5284   186.8819  433.3321  Plausible value 3: SEA-PLM score for mathematics
score_s~d_04  31200  31200   299.533    196.907  406.1695  Plausible value 4: SEA-PLM score for reading
score_s~e_04  31200  31200  299.4974   161.4246  399.3487  Plausible value 4: SEA-PLM score for writing
score_s~h_04  31200  31200  299.4153   207.3139  417.3063  Plausible value 4: SEA-PLM score for mathematics
score_s~d_05  31200  31200  299.6546   200.7802   410.308  Plausible value 5: SEA-PLM score for reading
score_s~e_05  31200  31200  299.5687   153.0666  402.2052  Plausible value 5: SEA-PLM score for writing
score_s~h_05  31200  31200  299.4698   191.3845  425.5878  Plausible value 5: SEA-PLM score for mathematics
level_s~d_01  31200      5  4.084904          2         6  Plausible value 1: SEA-PLM level for reading
level_s~h_01  31200      8  4.847564          2         9  Plausible value 1: SEA-PLM level for mathematics
level_s~d_02  31200      5  4.083878          2         6  Plausible value 2: SEA-PLM level for reading
level_s~h_02  31200      8  4.839808          2         9  Plausible value 2: SEA-PLM level for mathematics
level_s~d_03  31200      5  4.082468          2         6  Plausible value 3: SEA-PLM level for reading
level_s~h_03  31200      8  4.843814          2         9  Plausible value 3: SEA-PLM level for mathematics
level_s~d_04  31200      5  4.079423          2         6  Plausible value 4: SEA-PLM level for reading
level_s~h_04  31200      8  4.834487          2         9  Plausible value 4: SEA-PLM level for mathematics
level_s~d_05  31200      5  4.086474          2         6  Plausible value 5: SEA-PLM level for reading
level_s~h_05  31200      8  4.838942          2         9  Plausible value 5: SEA-PLM level for mathematics
age           31193     14  11.20832          7        20  Learner age at time of assessment
urban         31200      2  .5349679          0         1  School is located in urban/rural area
urban_o1      31184      7         .          .         .  Original variable of urban: school is located in area described as
urban_o2      30680    724  846.6989          8     10708  Original variable of urban: population size of the school area
male          31199      2  .5063944          0         1  Learner gender is male/female
escs          31126  12156  2.32e-16  -3.286241  4.232243  Socioeconomic status: SEA-PLM
strata        31200     18  5.372724          1        18  Strata
learner_we~t  31200    869   174.307   8.318038  798.3182  Learner weight
weight_re~e1  31200    866  174.4663          0  1350.987  Replicate weight 1
weight_re~e2  31200    869  174.5762          0  900.6583  Replicate weight 2
weight_re~e3  31200    866  174.8711          0  1350.987  Replicate weight 3
weight_re~e4  31200    864  174.0116          0  798.3182  Replicate weight 4
weight_re~e5  31200    865  174.3094          0  798.3182  Replicate weight 5
weight_re~e6  31200    865  174.3034          0  1132.182  Replicate weight 6
weight_re~e7  31200    866   174.889          0  1125.713  Replicate weight 7
weight_re~e8  31200    867  174.3665          0  798.3182  Replicate weight 8
weight_re~e9  31200    865  174.1852          0  798.3182  Replicate weight 9
weight_re~10  31200    868  174.2894          0  874.1586  Replicate weight 10
weight_re~11  31200    866  174.2992          0  1373.678  Replicate weight 11
weight_re~12  31200    868  174.3994          0  1373.678  Replicate weight 12
weight_re~13  31200    865  174.5956          0   1190.02  Replicate weight 13
weight_re~14  31200    867  173.9545          0  798.3182  Replicate weight 14
weight_re~15  31200    864  174.3705          0  798.3182  Replicate weight 15
weight_re~16  31200    866  174.1421          0  798.3182  Replicate weight 16
weight_re~17  31200    867  174.2847          0  798.3182  Replicate weight 17
weight_re~18  31200    867  173.8005          0  1346.521  Replicate weight 18
weight_re~19  31200    866  174.4313          0  798.3182  Replicate weight 19
weight_re~20  31200    867   174.757          0  798.3182  Replicate weight 20
weight_re~21  31200    866  173.9512          0  798.3182  Replicate weight 21
weight_re~22  31200    868  174.6336          0  798.3182  Replicate weight 22
weight_re~23  31200    866  174.3165          0  798.3182  Replicate weight 23
weight_re~24  31200    863  174.0493          0  897.6806  Replicate weight 24
weight_re~25  31200    865  174.2941          0  798.3182  Replicate weight 25
weight_re~26  31200    869  174.6972          0  1346.521  Replicate weight 26
weight_re~27  31200    864  174.2823          0  798.3182  Replicate weight 27
weight_re~28  31200    865   174.492          0     970.8  Replicate weight 28
weight_re~29  31200    867  174.3169          0  798.3182  Replicate weight 29
weight_re~30  31200    867  174.6166          0  798.3182  Replicate weight 30
weight_re~31  31200    870  174.6321          0  1563.943  Replicate weight 31
weight_re~32  31200    868  174.4266          0  1042.629  Replicate weight 32
weight_re~33  31200    868  174.4587          0  798.3182  Replicate weight 33
weight_re~34  31200    866  173.9526          0  798.3182  Replicate weight 34
weight_re~35  31200    868  174.0171          0  1018.045  Replicate weight 35
weight_re~36  31200    866  174.1107          0  1110.591  Replicate weight 36
weight_re~37  31200    868  174.2583          0  1412.638  Replicate weight 37
weight_re~38  31200    867  174.4498          0  798.3182  Replicate weight 38
weight_re~39  31200    869  174.1751          0  1294.918  Replicate weight 39
weight_re~40  31200    868  174.1708          0  1220.821  Replicate weight 40
weight_re~41  31200    866  174.2287          0   1012.83  Replicate weight 41
weight_re~42  31200    868  174.0551          0  1139.433  Replicate weight 42
weight_re~43  31200    866  174.1561          0  813.8809  Replicate weight 43
weight_re~44  31200    866  174.4618          0  969.7305  Replicate weight 44
weight_re~45  31200    867  174.3068          0  798.3182  Replicate weight 45
weight_re~46  31200    867  174.2364          0  798.3182  Replicate weight 46
weight_re~47  31200    867  174.4322          0  1381.158  Replicate weight 47
weight_re~48  31200    868  174.0635          0  798.3182  Replicate weight 48
weight_re~49  31200    866  174.0912          0  898.0606  Replicate weight 49
weight_re~50  31200    867   174.235          0  798.3182  Replicate weight 50
weight_re~51  31200    866  174.4081          0   1241.89  Replicate weight 51
weight_re~52  31200    866     174.3          0  798.3182  Replicate weight 52
weight_re~53  31200    866  174.1903          0  798.3182  Replicate weight 53
weight_re~54  31200    866  174.5084          0  798.3182  Replicate weight 54
weight_re~55  31200    866  174.6951          0  798.3182  Replicate weight 55
weight_re~56  31200    867  174.4408          0  915.5532  Replicate weight 56
weight_re~57  31200    869  174.2643          0  921.5766  Replicate weight 57
weight_re~58  31200    866  174.4801          0  798.3182  Replicate weight 58
weight_re~59  31200    866  174.0243          0  1254.186  Replicate weight 59
weight_re~60  31200    866  174.1811          0  1363.245  Replicate weight 60
weight_re~61  31200    865   174.503          0  798.3182  Replicate weight 61
weight_re~62  31200    867  174.2031          0    1254.5  Replicate weight 62
weight_re~63  31200    868  174.2362          0  1155.757  Replicate weight 63
weight_re~64  31200    869  174.0924          0  798.3182  Replicate weight 64
weight_re~65  31200    867  174.2822          0  1596.636  Replicate weight 65
weight_re~66  31200    868   174.614          0  798.3182  Replicate weight 66
weight_re~67  31200    868  174.3539          0  798.3182  Replicate weight 67
weight_re~68  31200    869  174.1225          0  798.3182  Replicate weight 68
weight_re~69  31200    868   174.587          0  798.3182  Replicate weight 69
weight_re~70  31200    867  174.4886          0   1126.43  Replicate weight 70
weight_re~71  31200    867  174.4111          0  798.3182  Replicate weight 71
weight_re~72  31200    867  174.4349          0  798.3182  Replicate weight 72
weight_re~73  31200    867  173.8468          0  1305.134  Replicate weight 73
weight_re~74  31200    868  174.5312          0   880.158  Replicate weight 74
weight_re~75  31200    869   174.195          0   1043.15  Replicate weight 75
weight_re~76  31200    866  174.0593          0  798.3182  Replicate weight 76
weight_re~77  31200    869  174.4338          0  1192.989  Replicate weight 77
weight_re~78  31200    866  174.1979          0  798.3182  Replicate weight 78
weight_re~79  31200    870  174.4265          0  926.3676  Replicate weight 79
weight_re~80  31200    868  174.4393          0  798.3182  Replicate weight 80
weight_re~81  31200    870  174.2604          0  798.3182  Replicate weight 81
weight_re~82  31200    869  174.3187          0  798.3182  Replicate weight 82
weight_re~83  31200    870  174.2659          0  798.3182  Replicate weight 83
weight_re~84  31200    870  174.3839          0  798.3182  Replicate weight 84
weight_re~85  31200    870  174.4384          0  798.3182  Replicate weight 85
weight_re~86  31200    872  174.3212          0  798.3182  Replicate weight 86
weight_re~87  31200    870  174.3363          0  798.3182  Replicate weight 87
weight_re~88  31200    867  174.3526          0  1154.457  Replicate weight 88
weight_re~89  31200    867  174.3668          0  798.3182  Replicate weight 89
weight_re~90  31200    868  174.6124          0  1205.885  Replicate weight 90
weight_re~91  31200    869   174.303          0  798.3182  Replicate weight 91
weight_re~92  31200    868  174.3074          0  798.3182  Replicate weight 92
weight_re~93  31200    867  174.2992          0  798.3182  Replicate weight 93
weight_re~94  31200    868  174.3223          0  798.3182  Replicate weight 94
weight_re~95  31200    869  174.2999          0  798.3182  Replicate weight 95
---------------------------------------------------------------------------------------------------------------------------------------


Plus the variables merged-on-the-fly, which are:

traitvars:  lp01_threshold_var lp02_threshold_var lp03_threshold_var lp04_threshold_var lp05_threshold_var lp06_threshold_var lp07_threshold_var lp08_threshold_var lp09_threshold_var lp10_threshold_var lp01_threshold_val lp02_threshold_val lp03_threshold_val lp04_threshold_val lp05_threshold_val lp06_threshold_val lp07_threshold_val lp08_threshold_val lp09_threshold_val lp10_threshold_val lp01_threshold_res lp02_threshold_res lp03_threshold_res lp04_threshold_res lp05_threshold_res lp06_threshold_res lp07_threshold_res lp08_threshold_res lp09_threshold_res lp10_threshold_res
valuevars:  sdg411_read_01 bmp_read_01 fgt1_read_01 fgt2_read_01 sdg411_read_02 bmp_read_02 fgt1_read_02 fgt2_read_02 sdg411_read_03 bmp_read_03 fgt1_read_03 fgt2_read_03 sdg411_read_04 bmp_read_04 fgt1_read_04 fgt2_read_04 sdg411_read_05 bmp_read_05 fgt1_read_05 fgt2_read_05 sdg411_math_01 bmp_math_01 fgt1_math_01 fgt2_math_01 sdg411_math_02 bmp_math_02 fgt1_math_02 fgt2_math_02 sdg411_math_03 bmp_math_03 fgt1_math_03 fgt2_math_03 sdg411_math_04 bmp_math_04 fgt1_math_04 fgt2_math_04 sdg411_math_05 bmp_math_05 fgt1_math_05 fgt2_math_05
~~~~

About the **31,200  observations** in this dataset:

~~~~
. tab countrycode idgrade if national_level==1

   Country |
    ID, as |
  coded in |  Grade ID
   rawdata |         5 |     Total
-----------+-----------+----------
       KHM |     5,396 |     5,396 
       LAO |     4,698 |     4,698 
       MMR |     5,707 |     5,707 
       MYS |     4,479 |     4,479 
       PHL |     6,083 |     6,083 
       VNM |     4,837 |     4,837 
-----------+-----------+----------
     Total |    31,200 |    31,200 

. 
. tab countrycode idgrade if national_level==0
no observations

~~~~

**Harmonization** of proficiency (done on-the-fly):

~~~~

      sdg411_read_01 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
      Non-proficient |     22,551       72.28       72.28
          Proficient |      8,649       27.72      100.00
---------------------+-----------------------------------
               Total |     31,200      100.00

         bmp_read_01 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
          Proficient |      8,649       27.72       27.72
      Non-proficient |     22,551       72.28      100.00
---------------------+-----------------------------------
               Total |     31,200      100.00

    Variable |        Obs        Mean    Std. Dev.       Min        Max
-------------+---------------------------------------------------------
fgt1_read_01 |     22,551    .1006931    .0593632   5.10e-06   .3672937

    Variable |        Obs        Mean    Std. Dev.       Min        Max
-------------+---------------------------------------------------------
fgt2_read_01 |     22,551    .0136629    .0139879   2.60e-11   .1349047

      sdg411_read_02 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
      Non-proficient |     22,507       72.14       72.14
          Proficient |      8,693       27.86      100.00
---------------------+-----------------------------------
               Total |     31,200      100.00

         bmp_read_02 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
          Proficient |      8,693       27.86       27.86
      Non-proficient |     22,507       72.14      100.00
---------------------+-----------------------------------
               Total |     31,200      100.00

    Variable |        Obs        Mean    Std. Dev.       Min        Max
-------------+---------------------------------------------------------
fgt1_read_02 |     22,507    .1009987    .0592989   8.00e-06   .3893347

    Variable |        Obs        Mean    Std. Dev.       Min        Max
-------------+---------------------------------------------------------
fgt2_read_02 |     22,507    .0137169    .0140383   6.40e-11   .1515815

      sdg411_read_03 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
      Non-proficient |     22,606       72.46       72.46
          Proficient |      8,594       27.54      100.00
---------------------+-----------------------------------
               Total |     31,200      100.00

         bmp_read_03 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
          Proficient |      8,594       27.54       27.54
      Non-proficient |     22,606       72.46      100.00
---------------------+-----------------------------------
               Total |     31,200      100.00

    Variable |        Obs        Mean    Std. Dev.       Min        Max
-------------+---------------------------------------------------------
fgt1_read_03 |     22,606    .1004689    .0596175   .0000265   .4034784

    Variable |        Obs        Mean    Std. Dev.       Min        Max
-------------+---------------------------------------------------------
fgt2_read_03 |     22,606    .0136481    .0140505   7.03e-10   .1627948

      sdg411_read_04 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
      Non-proficient |     22,557       72.30       72.30
          Proficient |      8,643       27.70      100.00
---------------------+-----------------------------------
               Total |     31,200      100.00

         bmp_read_04 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
          Proficient |      8,643       27.70       27.70
      Non-proficient |     22,557       72.30      100.00
---------------------+-----------------------------------
               Total |     31,200      100.00

    Variable |        Obs        Mean    Std. Dev.       Min        Max
-------------+---------------------------------------------------------
fgt1_read_04 |     22,557    .1009959    .0593935   7.86e-06   .3788422

    Variable |        Obs        Mean    Std. Dev.       Min        Max
-------------+---------------------------------------------------------
fgt2_read_04 |     22,557    .0137276    .0139574   6.17e-11   .1435214

      sdg411_read_05 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
      Non-proficient |     22,501       72.12       72.12
          Proficient |      8,699       27.88      100.00
---------------------+-----------------------------------
               Total |     31,200      100.00

         bmp_read_05 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
          Proficient |      8,699       27.88       27.88
      Non-proficient |     22,501       72.12      100.00
---------------------+-----------------------------------
               Total |     31,200      100.00

    Variable |        Obs        Mean    Std. Dev.       Min        Max
-------------+---------------------------------------------------------
fgt1_read_05 |     22,501    .1007751    .0591255   .0000238   .3666241

    Variable |        Obs        Mean    Std. Dev.       Min        Max
-------------+---------------------------------------------------------
fgt2_read_05 |     22,501    .0136513    .0138427   5.68e-10   .1344132

      sdg411_math_01 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
      Non-proficient |     20,558       65.89       65.89
          Proficient |     10,642       34.11      100.00
---------------------+-----------------------------------
               Total |     31,200      100.00

         bmp_math_01 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
          Proficient |     10,642       34.11       34.11
      Non-proficient |     20,558       65.89      100.00
---------------------+-----------------------------------
               Total |     31,200      100.00

    Variable |        Obs        Mean    Std. Dev.       Min        Max
-------------+---------------------------------------------------------
fgt1_math_01 |     20,558     .083117    .0519025   8.83e-07   .3529552

    Variable |        Obs        Mean    Std. Dev.       Min        Max
-------------+---------------------------------------------------------
fgt2_math_01 |     20,558    .0096022    .0107455   7.80e-13   .1245774

      sdg411_math_02 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
      Non-proficient |     20,517       65.76       65.76
          Proficient |     10,683       34.24      100.00
---------------------+-----------------------------------
               Total |     31,200      100.00

         bmp_math_02 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
          Proficient |     10,683       34.24       34.24
      Non-proficient |     20,517       65.76      100.00
---------------------+-----------------------------------
               Total |     31,200      100.00

    Variable |        Obs        Mean    Std. Dev.       Min        Max
-------------+---------------------------------------------------------
fgt1_math_02 |     20,517    .0836433    .0520617   .0000137   .3667073

    Variable |        Obs        Mean    Std. Dev.       Min        Max
-------------+---------------------------------------------------------
fgt2_math_02 |     20,517    .0097065    .0107776   1.87e-10   .1344742

      sdg411_math_03 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
      Non-proficient |     20,601       66.03       66.03
          Proficient |     10,599       33.97      100.00
---------------------+-----------------------------------
               Total |     31,200      100.00

         bmp_math_03 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
          Proficient |     10,599       33.97       33.97
      Non-proficient |     20,601       66.03      100.00
---------------------+-----------------------------------
               Total |     31,200      100.00

    Variable |        Obs        Mean    Std. Dev.       Min        Max
-------------+---------------------------------------------------------
fgt1_math_03 |     20,601    .0830194    .0519632   .0000248   .3932406

    Variable |        Obs        Mean    Std. Dev.       Min        Max
-------------+---------------------------------------------------------
fgt2_math_03 |     20,601    .0095923    .0107209   6.17e-10   .1546382

      sdg411_math_04 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
      Non-proficient |     20,576       65.95       65.95
          Proficient |     10,624       34.05      100.00
---------------------+-----------------------------------
               Total |     31,200      100.00

         bmp_math_04 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
          Proficient |     10,624       34.05       34.05
      Non-proficient |     20,576       65.95      100.00
---------------------+-----------------------------------
               Total |     31,200      100.00

    Variable |        Obs        Mean    Std. Dev.       Min        Max
-------------+---------------------------------------------------------
fgt1_math_04 |     20,576    .0836744     .052385   4.54e-06    .326903

    Variable |        Obs        Mean    Std. Dev.       Min        Max
-------------+---------------------------------------------------------
fgt2_math_04 |     20,576    .0097455    .0108162   2.06e-11   .1068656

      sdg411_math_05 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
      Non-proficient |     20,517       65.76       65.76
          Proficient |     10,683       34.24      100.00
---------------------+-----------------------------------
               Total |     31,200      100.00

         bmp_math_05 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
          Proficient |     10,683       34.24       34.24
      Non-proficient |     20,517       65.76      100.00
---------------------+-----------------------------------
               Total |     31,200      100.00

    Variable |        Obs        Mean    Std. Dev.       Min        Max
-------------+---------------------------------------------------------
fgt1_math_05 |     20,517    .0836017     .051931   .0000225   .3786218

    Variable |        Obs        Mean    Std. Dev.       Min        Max
-------------+---------------------------------------------------------
fgt2_math_05 |     20,517    .0096859    .0106716   5.05e-10   .1433545



     +-----------------------------------------------------------+
     | idgrade   prefix                  harmonization_condition |
     |-----------------------------------------------------------|
  1. |       5     lp01   read_01 = (score_saplm_read_01 >= 317) |
  2. |       5     lp02   read_02 = (score_saplm_read_02 >= 317) |
  3. |       5     lp03   read_03 = (score_saplm_read_03 >= 317) |
  4. |       5     lp04   read_04 = (score_saplm_read_04 >= 317) |
  5. |       5     lp05   read_05 = (score_saplm_read_05 >= 317) |
     |-----------------------------------------------------------|
  6. |       5     lp06   math_01 = (score_saplm_math_01 >= 308) |
  7. |       5     lp07   math_02 = (score_saplm_math_02 >= 308) |
  8. |       5     lp08   math_03 = (score_saplm_math_03 >= 308) |
  9. |       5     lp09   math_04 = (score_saplm_math_04 >= 308) |
 10. |       5     lp10   math_05 = (score_saplm_math_05 >= 308) |
     +-----------------------------------------------------------+

~~~~
      - local error = _rc
      - qui log close `mlogname'
      = qui log close __000000
