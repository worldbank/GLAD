Documentation of GLAD dataset
=====================================================================


[back to list of assessments](https://github.com/worldbank/GLAD/blob/master/README.md#harmonization)

This dataset is part of the Global Learning Assessment Database (GLAD). It contains microdata from PASEC 2019. Each observation corresponds to one learner (student or pupil), and the variables have been harmonized.

**Metadata** stored in this dataset:

~~~~
region:      SSA
year:        2019
assessment:  PASEC
master:      v01_M
adaptation:  wrk_A_GLAD
module:      ALL
ttl_info:    Joao Pedro de Azevedo [eduanalytics@worldbank.org]
dofile_info: last modified by Alison Gilberto in May 14, 2021
lastsave:    26 Apr 2022 13:54:12 by wb255520
~~~~


About the **198 variables** in this dataset:

~~~~
The variables belong to the following variable classifications:
    idvars keyvars valuevars traitvars samplevars

idvars:     idcntry_raw idschool idgrade idlearner
keyvars:    surveyid countrycode national_level
valuevars:  score_pasec_read_01 score_pasec_math_01 score_pasec_read_02 score_pasec_math_02 score_pasec_read_03 score_pasec_math_03 score_pasec_read_04 score_pasec_math_04 score_pasec_read_05 score_pasec_math_05 level_pasec_read_01 level_pasec_math_01 level_pasec_read_02 level_pasec_math_02 level_pasec_read_03 level_pasec_math_03 level_pasec_read_04 level_pasec_math_04 level_pasec_read_05 level_pasec_math_05
traitvars:  age urban urban_o male escs qescs has_qescs
samplevars: strata learner_weight jkzone jkrep weight_replicate1 weight_replicate2 weight_replicate3 weight_replicate4 weight_replicate5 weight_replicate6 weight_replicate7 weight_replicate8 weight_replicate9 weight_replicate10 weight_replicate11 weight_replicate12 weight_replicate13 weight_replicate14 weight_replicate15 weight_replicate16 weight_replicate17 weight_replicate18 weight_replicate19 weight_replicate20 weight_replicate21 weight_replicate22 weight_replicate23 weight_replicate24 weight_replicate25 weight_replicate26 weight_replicate27 weight_replicate28 weight_replicate29 weight_replicate30 weight_replicate31 weight_replicate32 weight_replicate33 weight_replicate34 weight_replicate35 weight_replicate36 weight_replicate37 weight_replicate38 weight_replicate39 weight_replicate40 weight_replicate41 weight_replicate42 weight_replicate43 weight_replicate44 weight_replicate45 weight_replicate46 weight_replicate47 weight_replicate48 weight_replicate49 weight_replicate50 weight_replicate51 weight_replicate52 weight_replicate53 weight_replicate54 weight_replicate55 weight_replicate56 weight_replicate57 weight_replicate58 weight_replicate59 weight_replicate60 weight_replicate61 weight_replicate62 weight_replicate63 weight_replicate64 weight_replicate65 weight_replicate66 weight_replicate67 weight_replicate68 weight_replicate69 weight_replicate70 weight_replicate71 weight_replicate72 weight_replicate73 weight_replicate74 weight_replicate75 weight_replicate76 weight_replicate77 weight_replicate78 weight_replicate79 weight_replicate80 weight_replicate81 weight_replicate82 weight_replicate83 weight_replicate84 weight_replicate85 weight_replicate86 weight_replicate87 weight_replicate88 weight_replicate89 weight_replicate90


Variable        Obs Unique       Mean        Min       Max  Label
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
idcntry_raw   84867     14   7.551463          1        14  Country ID, as coded in rawdata
idschool      84867   1189   64193.02      11001    231025  School ID
idgrade       84867      2   4.966241          2         6  Grade ID
idlearner     84867     25   10.67402          1        25  Learner ID
surveyid      84867      1          .          .         .  Survey ID (Region_Year_Assessment)
countrycode   84867     14          .          .         .  WB country code (3 letters)
national_l~l  84867      1          1          1         1  Idcntry_raw is a national level
score_p~d_01  84867  84867   518.1002  -46.53038  1011.967  Plausible value 1: PASEC score for read
score_p~h_01  84867  84867   507.5209   38.45406  1093.823  Plausible value 1: PASEC score for math
score_p~d_02  84867  84867   517.9554    -41.377  999.9988  Plausible value 2: PASEC score for read
score_p~h_02  84867  84867   507.3506   13.66036  991.1112  Plausible value 2: PASEC score for math
score_p~d_03  84867  84867   518.0867  -29.79051  986.6333  Plausible value 3: PASEC score for read
score_p~h_03  84867  84867    507.483  -11.35273  1118.433  Plausible value 3: PASEC score for math
score_p~d_04  84867  84867   518.0348   20.22029  1044.381  Plausible value 4: PASEC score for read
score_p~h_04  84867  84867   507.3843     7.5392   1210.51  Plausible value 4: PASEC score for math
score_p~d_05  84867  84867   518.0373  -52.72188  984.9464  Plausible value 5: PASEC score for read
score_p~h_05  84867  84867   507.3315   38.17899  1008.663  Plausible value 5: PASEC score for math
level_p~d_01  84867      5   2.327783          0         4  Plausible value 1: PASEC level for read
level_p~h_01  84867      4    1.41743          0         3  Plausible value 1: PASEC level for math
level_p~d_02  84867      5    2.32545          0         4  Plausible value 2: PASEC level for read
level_p~h_02  84867      4   1.414861          0         3  Plausible value 2: PASEC level for math
level_p~d_03  84867      5   2.327277          0         4  Plausible value 3: PASEC level for read
level_p~h_03  84867      4   1.415049          0         3  Plausible value 3: PASEC level for math
level_p~d_04  84867      5   2.325721          0         4  Plausible value 4: PASEC level for read
level_p~h_04  84867      4   1.416192          0         3  Plausible value 4: PASEC level for math
level_p~d_05  84867      5   2.325097          0         4  Plausible value 5: PASEC level for read
level_p~h_05  84867      4   1.415662          0         3  Plausible value 5: PASEC level for math
age           84867     24   12.09134          4        99  Learner age at time of assessment
urban         82693      2    .403045          0         1  School is located in urban/rural area
urban_o       81538      4          .          .         .  Original variable of urban: school is located in area described as
male          84867      2   .5117773          0         1  Learner gender is male/female
escs          62934   7274  -.0085786  -2.147879  3.086277  Standardized values of SES
qescs         62934      5   2.833381          1         5  Quintiles of Socio-Economic Status
has_qescs     84867      2   .7415603          0         1  Dummy variable for observations with a valid QESCS
strata        84867     23   6.256649          1        23  Strata
learner_we~t  84867   4343   144.3623   1.038651  7101.592  Learner weight
jkzone        84867     90   34.63731          1        90  Jackknife zone
jkrep         84867      2   .9969246          0         2  Jackknife replicate code
weight_re~e1  84867   4310   144.0084          0  7101.592  Replicate weight 1
weight_re~e2  84867   4310   144.2928          0  7101.592  Replicate weight 2
weight_re~e3  84867   4314   144.5781          0  7101.592  Replicate weight 3
weight_re~e4  84867   4309   144.6469          0  7101.592  Replicate weight 4
weight_re~e5  84867   4310   144.0296          0  7101.592  Replicate weight 5
weight_re~e6  84867   4305   144.4622          0  7101.592  Replicate weight 6
weight_re~e7  84867   4310   144.2862          0  7101.592  Replicate weight 7
weight_re~e8  84867   4313   144.6252          0  7101.592  Replicate weight 8
weight_re~e9  84867   4313   144.5321          0  7101.592  Replicate weight 9
weight_re~10  84867   4311   144.4863          0  7101.592  Replicate weight 10
weight_re~11  84867   4307   145.3028          0  14203.18  Replicate weight 11
weight_re~12  84867   4308   145.5008          0  12942.66  Replicate weight 12
weight_re~13  84867   4309   144.2798          0  7101.592  Replicate weight 13
weight_re~14  84867   4311   144.1878          0  7101.592  Replicate weight 14
weight_re~15  84867   4312   143.9718          0  7101.592  Replicate weight 15
weight_re~16  84867   4311   144.4258          0  7101.592  Replicate weight 16
weight_re~17  84867   4315   144.9816          0  7566.315  Replicate weight 17
weight_re~18  84867   4310   144.0917          0  7101.592  Replicate weight 18
weight_re~19  84867   4307   144.7389          0  7101.592  Replicate weight 19
weight_re~20  84867   4312   144.1147          0  7101.592  Replicate weight 20
weight_re~21  84867   4316   144.3861          0  7101.592  Replicate weight 21
weight_re~22  84867   4311   144.3872          0  7101.592  Replicate weight 22
weight_re~23  84867   4315   144.9104          0  8096.806  Replicate weight 23
weight_re~24  84867   4312    144.272          0  7101.592  Replicate weight 24
weight_re~25  84867   4313   144.4211          0  7101.592  Replicate weight 25
weight_re~26  84867   4313    144.291          0  7101.592  Replicate weight 26
weight_re~27  84867   4318   143.6371          0  7101.592  Replicate weight 27
weight_re~28  84867   4318   144.8477          0  7324.824  Replicate weight 28
weight_re~29  84867   4314   144.0737          0  7101.592  Replicate weight 29
weight_re~30  84867   4319   144.3535          0  7101.592  Replicate weight 30
weight_re~31  84867   4324   144.2259          0   7700.27  Replicate weight 31
weight_re~32  84867   4326   144.4155          0  8980.085  Replicate weight 32
weight_re~33  84867   4323   144.2903          0  7101.592  Replicate weight 33
weight_re~34  84867   4320    144.126          0  7101.592  Replicate weight 34
weight_re~35  84867   4320   144.1613          0  7101.592  Replicate weight 35
weight_re~36  84867   4316   144.4706          0  7101.592  Replicate weight 36
weight_re~37  84867   4317   144.1581          0  7101.592  Replicate weight 37
weight_re~38  84867   4315   144.6508          0  7101.592  Replicate weight 38
weight_re~39  84867   4320   143.8925          0  8122.782  Replicate weight 39
weight_re~40  84867   4317   144.3384          0  8138.382  Replicate weight 40
weight_re~41  84867   4321   144.3497          0  7101.592  Replicate weight 41
weight_re~42  84867   4322   144.3873          0  7101.592  Replicate weight 42
weight_re~43  84867   4322   144.2085          0  7101.592  Replicate weight 43
weight_re~44  84867   4322   144.4186          0  7101.592  Replicate weight 44
weight_re~45  84867   4324   144.3705          0  7101.592  Replicate weight 45
weight_re~46  62934   2830      76.63          0  1404.296  Replicate weight 46
weight_re~47  62934   2825   76.40738          0  1404.296  Replicate weight 47
weight_re~48  62934   2826   76.62093          0  1404.296  Replicate weight 48
weight_re~49  62934   2828   76.54534          0  1404.296  Replicate weight 49
weight_re~50  62934   2831    76.5118          0  1404.296  Replicate weight 50
weight_re~51  62934   2829   76.38297          0  1404.296  Replicate weight 51
weight_re~52  62934   2831   76.65565          0  1404.296  Replicate weight 52
weight_re~53  62934   2828    76.6222          0  1404.296  Replicate weight 53
weight_re~54  62934   2830   76.52579          0  1404.296  Replicate weight 54
weight_re~55  62934   2828   76.55851          0  1404.296  Replicate weight 55
weight_re~56  62934   2827   76.50121          0  1404.296  Replicate weight 56
weight_re~57  62934   2834   76.52997          0  1404.296  Replicate weight 57
weight_re~58  62934   2831   76.58195          0  1404.296  Replicate weight 58
weight_re~59  62934   2829   76.54309          0  1404.296  Replicate weight 59
weight_re~60  62934   2825   76.40014          0  1404.296  Replicate weight 60
weight_re~61  62934   2829   76.53906          0  1404.296  Replicate weight 61
weight_re~62  62934   2829   76.50975          0  1404.296  Replicate weight 62
weight_re~63  62934   2832   76.46342          0  1404.296  Replicate weight 63
weight_re~64  62934   2830   76.46532          0  1404.296  Replicate weight 64
weight_re~65  62934   2825   76.50599          0  1404.296  Replicate weight 65
weight_re~66  62934   2829   76.60224          0  1404.296  Replicate weight 66
weight_re~67  62934   2828   76.48577          0  1404.296  Replicate weight 67
weight_re~68  62934   2830   76.56059          0  1404.296  Replicate weight 68
weight_re~69  62934   2834   76.54406          0  1404.296  Replicate weight 69
weight_re~70  62934   2830    76.3341          0  1404.296  Replicate weight 70
weight_re~71  62934   2830   76.42599          0  1404.296  Replicate weight 71
weight_re~72  62934   2828   76.56741          0  1404.296  Replicate weight 72
weight_re~73  62934   2833      76.42          0  1404.296  Replicate weight 73
weight_re~74  62934   2831   76.44008          0  1404.296  Replicate weight 74
weight_re~75  62934   2832   76.57247          0  1404.296  Replicate weight 75
weight_re~76  62934   2831   76.47811          0  1404.296  Replicate weight 76
weight_re~77  62934   2831   76.42441          0  1404.296  Replicate weight 77
weight_re~78  62934   2830   76.40365          0  1404.296  Replicate weight 78
weight_re~79  62934   2829   76.68402          0  1404.296  Replicate weight 79
weight_re~80  62934   2830   76.55177          0  1404.296  Replicate weight 80
weight_re~81  62934   2831   76.49485          0  1404.296  Replicate weight 81
weight_re~82  62934   2826   76.42129          0  1697.638  Replicate weight 82
weight_re~83  62934   2831   76.89775          0  2808.592  Replicate weight 83
weight_re~84  62934   2830   75.98109          0  1426.587  Replicate weight 84
weight_re~85  62934   2829   76.42027          0  1404.296  Replicate weight 85
weight_re~86  62934   2834   76.67045          0  1404.296  Replicate weight 86
weight_re~87  62934   2830   76.77818          0  2496.526  Replicate weight 87
weight_re~88  62934   2831   76.59672          0  2196.943  Replicate weight 88
weight_re~89  62934   2832    76.6852          0  1404.296  Replicate weight 89
weight_re~90  62934   2829   76.25764          0  1404.296  Replicate weight 90
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


Plus the variables merged-on-the-fly, which are:

traitvars:  lp01_threshold_var lp02_threshold_var lp03_threshold_var lp04_threshold_var lp05_threshold_var lp06_threshold_var lp07_threshold_var lp08_threshold_var lp09_threshold_var lp10_threshold_var lp01_threshold_val lp02_threshold_val lp03_threshold_val lp04_threshold_val lp05_threshold_val lp06_threshold_val lp07_threshold_val lp08_threshold_val lp09_threshold_val lp10_threshold_val lp01_threshold_res lp02_threshold_res lp03_threshold_res lp04_threshold_res lp05_threshold_res lp06_threshold_res lp07_threshold_res lp08_threshold_res lp09_threshold_res lp10_threshold_res
valuevars:  sdg411_read_01 bmp_read_01 fgt1_read_01 fgt2_read_01 sdg411_read_02 bmp_read_02 fgt1_read_02 fgt2_read_02 sdg411_read_03 bmp_read_03 fgt1_read_03 fgt2_read_03 sdg411_read_04 bmp_read_04 fgt1_read_04 fgt2_read_04 sdg411_read_05 bmp_read_05 fgt1_read_05 fgt2_read_05 sdg411_math_01 bmp_math_01 fgt1_math_01 fgt2_math_01 sdg411_math_02 bmp_math_02 fgt1_math_02 fgt2_math_02 sdg411_math_03 bmp_math_03 fgt1_math_03 fgt2_math_03 sdg411_math_04 bmp_math_04 fgt1_math_04 fgt2_math_04 sdg411_math_05 bmp_math_05 fgt1_math_05 fgt2_math_05
~~~~

About the **84,867  observations** in this dataset:

~~~~
. tab countrycode idgrade if national_level==1

WB country |
   code (3 |       Grade ID
  letters) |         2          6 |     Total
-----------+----------------------+----------
       BDI |     1,664      4,908 |     6,572 
       BEN |     1,654      3,823 |     5,477 
       BFA |     1,884      6,499 |     8,383 
       CIV |     1,332      3,811 |     5,143 
       CMR |     1,780      4,723 |     6,503 
       COD |     1,050      4,380 |     5,430 
       COG |     1,553      3,925 |     5,478 
       GAB |     1,157      2,930 |     4,087 
       GIN |     1,086      2,825 |     3,911 
       MDG |     1,883      4,758 |     6,641 
       NER |     1,730      5,579 |     7,309 
       SEN |     1,341      3,832 |     5,173 
       TCD |     1,727      4,824 |     6,551 
       TGO |     2,092      6,117 |     8,209 
-----------+----------------------+----------
     Total |    21,933     62,934 |    84,867 

. 
. tab countrycode idgrade if national_level==0
no observations

~~~~

**Harmonization** of proficiency (done on-the-fly):

~~~~

      sdg411_read_01 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
      Non-proficient |     60,903       71.76       71.76
          Proficient |     23,964       28.24      100.00
---------------------+-----------------------------------
               Total |     84,867      100.00

         bmp_read_01 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
          Proficient |     23,964       28.24       28.24
      Non-proficient |     60,903       71.76      100.00
---------------------+-----------------------------------
               Total |     84,867      100.00

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
fgt1_read_01 |     60,903    .2006037    .1251177   8.19e-06   1.086167

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
fgt2_read_01 |     60,903     .055896    .0631243   6.70e-11    1.17976

      sdg411_read_02 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
      Non-proficient |     60,911       71.77       71.77
          Proficient |     23,956       28.23      100.00
---------------------+-----------------------------------
               Total |     84,867      100.00

         bmp_read_02 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
          Proficient |     23,956       28.23       28.23
      Non-proficient |     60,911       71.77      100.00
---------------------+-----------------------------------
               Total |     84,867      100.00

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
fgt1_read_02 |     60,911    .2007569    .1250677   4.49e-06   1.076624

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
fgt2_read_02 |     60,911     .055945    .0634622   2.01e-11   1.159119

      sdg411_read_03 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
      Non-proficient |     60,875       71.73       71.73
          Proficient |     23,992       28.27      100.00
---------------------+-----------------------------------
               Total |     84,867      100.00

         bmp_read_03 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
          Proficient |     23,992       28.27       28.27
      Non-proficient |     60,875       71.73      100.00
---------------------+-----------------------------------
               Total |     84,867      100.00

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
fgt1_read_03 |     60,875    .2006298    .1252908   3.34e-06   1.055168

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
fgt2_read_03 |     60,875    .0559499    .0634382   1.12e-11   1.113379

      sdg411_read_04 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
      Non-proficient |     60,981       71.85       71.85
          Proficient |     23,886       28.15      100.00
---------------------+-----------------------------------
               Total |     84,867      100.00

         bmp_read_04 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
          Proficient |     23,886       28.15       28.15
      Non-proficient |     60,981       71.85      100.00
---------------------+-----------------------------------
               Total |     84,867      100.00

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
fgt1_read_04 |     60,981    .2003715    .1254746   3.28e-06   .9635969

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
fgt2_read_04 |     60,981    .0558924    .0634149   1.07e-11   .9285191

      sdg411_read_05 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
      Non-proficient |     60,859       71.71       71.71
          Proficient |     24,008       28.29      100.00
---------------------+-----------------------------------
               Total |     84,867      100.00

         bmp_read_05 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
          Proficient |     24,008       28.29       28.29
      Non-proficient |     60,859       71.71      100.00
---------------------+-----------------------------------
               Total |     84,867      100.00

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
fgt1_read_05 |     60,859     .200886    .1254292   5.59e-06   1.097633

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
fgt2_read_05 |     60,859    .0560874    .0636298   3.13e-11   1.204798

      sdg411_math_01 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
      Non-proficient |     62,083       73.15       73.15
          Proficient |     22,784       26.85      100.00
---------------------+-----------------------------------
               Total |     84,867      100.00

         bmp_math_01 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
          Proficient |     22,784       26.85       26.85
      Non-proficient |     62,083       73.15      100.00
---------------------+-----------------------------------
               Total |     84,867      100.00

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
fgt1_math_01 |     62,083    .2127083    .1208882   7.02e-06   .9213619

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
fgt2_math_01 |     62,083    .0598586    .0591309   4.93e-11   .8489077

      sdg411_math_02 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
      Non-proficient |     62,166       73.25       73.25
          Proficient |     22,701       26.75      100.00
---------------------+-----------------------------------
               Total |     84,867      100.00

         bmp_math_02 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
          Proficient |     22,701       26.75       26.75
      Non-proficient |     62,166       73.25      100.00
---------------------+-----------------------------------
               Total |     84,867      100.00

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
fgt1_math_02 |     62,166    .2127529    .1212609   .0000243   .9720647

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
fgt2_math_02 |     62,166    .0599677    .0593414   5.89e-10   .9449099

      sdg411_math_03 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
      Non-proficient |     62,233       73.33       73.33
          Proficient |     22,634       26.67      100.00
---------------------+-----------------------------------
               Total |     84,867      100.00

         bmp_math_03 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
          Proficient |     22,634       26.67       26.67
      Non-proficient |     62,233       73.33      100.00
---------------------+-----------------------------------
               Total |     84,867      100.00

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
fgt1_math_03 |     62,233    .2123356    .1212464   .0000154   1.023216

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
fgt2_math_03 |     62,233    .0597869    .0594572   2.37e-10   1.046971

      sdg411_math_04 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
      Non-proficient |     62,156       73.24       73.24
          Proficient |     22,711       26.76      100.00
---------------------+-----------------------------------
               Total |     84,867      100.00

         bmp_math_04 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
          Proficient |     22,711       26.76       26.76
      Non-proficient |     62,156       73.24      100.00
---------------------+-----------------------------------
               Total |     84,867      100.00

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
fgt1_math_04 |     62,156    .2128772    .1211768   .0000114   .9845824

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
fgt2_math_04 |     62,156    .0600003    .0594351   1.30e-10   .9694026

      sdg411_math_05 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
      Non-proficient |     62,152       73.23       73.23
          Proficient |     22,715       26.77      100.00
---------------------+-----------------------------------
               Total |     84,867      100.00

         bmp_math_05 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
          Proficient |     22,715       26.77       26.77
      Non-proficient |     62,152       73.23      100.00
---------------------+-----------------------------------
               Total |     84,867      100.00

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
fgt1_math_05 |     62,152    .2128959    .1211935   3.25e-06   .9219244

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
fgt2_math_05 |     62,152    .0600123    .0592644   1.06e-11   .8499445



     +-------------------------------------------------------------+
     | idgrade   prefix                    harmonization_condition |
     |-------------------------------------------------------------|
  1. |       2     lp01     read_01 = (score_pasec_read_01 >= 540) |
  2. |       2     lp02     read_02 = (score_pasec_read_02 >= 540) |
  3. |       2     lp03     read_03 = (score_pasec_read_03 >= 540) |
  4. |       2     lp04     read_04 = (score_pasec_read_04 >= 540) |
  5. |       2     lp05     read_05 = (score_pasec_read_05 >= 540) |
     |-------------------------------------------------------------|
  6. |       2     lp06     math_01 = (score_pasec_math_01 >= 489) |
  7. |       2     lp07     math_02 = (score_pasec_math_02 >= 489) |
  8. |       2     lp08     math_03 = (score_pasec_math_03 >= 489) |
  9. |       2     lp09     math_04 = (score_pasec_math_04 >= 489) |
 10. |       2     lp10     math_05 = (score_pasec_math_05 >= 489) |
     |-------------------------------------------------------------|
 11. |       6     lp01   read_01 = (score_pasec_read_01 >= 595.1) |
 12. |       6     lp02   read_02 = (score_pasec_read_02 >= 595.1) |
 13. |       6     lp03   read_03 = (score_pasec_read_03 >= 595.1) |
 14. |       6     lp04   read_04 = (score_pasec_read_04 >= 595.1) |
 15. |       6     lp05   read_05 = (score_pasec_read_05 >= 595.1) |
     |-------------------------------------------------------------|
 16. |       6     lp06   math_01 = (score_pasec_math_01 >= 609.6) |
 17. |       6     lp07   math_02 = (score_pasec_math_02 >= 609.6) |
 18. |       6     lp08   math_03 = (score_pasec_math_03 >= 609.6) |
 19. |       6     lp09   math_04 = (score_pasec_math_04 >= 609.6) |
 20. |       6     lp10   math_05 = (score_pasec_math_05 >= 609.6) |
     +-------------------------------------------------------------+

~~~~
