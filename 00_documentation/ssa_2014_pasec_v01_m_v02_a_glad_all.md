      - cap noi _dyntext `"`srcfile'"' `opargs', `stop' `embedimage' basedir("`destfile'")
      = cap noi _dyntext `"dyntext_GLAD.txt"' ,   basedir("C:/Users/wb576911/Github/GLAD-Production/00_docu
> mentation/ssa_2014_pasec_v01_m_v02_a_glad_all.md")
Documentation of GLAD dataset
=====================================================================


[back to list of assessments](https://github.com/worldbank/GLAD/blob/master/README.md#harmonization)

This dataset is part of the Global Learning Assessment Database (GLAD). It contains microdata from PASEC 2014. Each observation corresponds to one learner (student or pupil), and the variables have been harmonized.

**Metadata** stored in this dataset:

~~~~
region:      SSA
year:        2014
assessment:  PASEC
master:      v01_M
adaptation:  v02_A_GLAD
module:      ALL
ttl_info:    Joao Pedro de Azevedo [eduanalytics@worldbank.org]
dofile_info: last modified by Alison Gilberto in July 29, 2021
lastsave:    29 Jul 2021 15:00:47 by wb576911
~~~~


About the **161 variables** in this dataset:

~~~~
The variables belong to the following variable classifications:
    idvars keyvars valuevars traitvars samplevars

idvars:     idcntry_raw idschool idgrade idlearner
keyvars:    surveyid countrycode national_level
valuevars:  score_pasec_read_01 score_pasec_math_01 score_pasec_read_02 score_pasec_math_02 score_pasec_read_03 score_pasec_math_03 score_pasec_read_04 score_pasec_math_04 score_pasec_read_05 score_pasec_math_05 level_pasec_read_01 level_pasec_math_01 level_pasec_read_02 level_pasec_math_02 level_pasec_read_03 level_pasec_math_03 level_pasec_read_04 level_pasec_math_04 level_pasec_read_05 level_pasec_math_05
traitvars:  age urban urban_o male escs
samplevars: strata learner_weight jkzone jkrep weight_replicate1 weight_replicate2 weight_replicate3 weight_replicate4 weight_replicate5 weight_replicate6 weight_replicate7 weight_replicate8 weight_replicate9 weight_replicate10 weight_replicate11 weight_replicate12 weight_replicate13 weight_replicate14 weight_replicate15 weight_replicate16 weight_replicate17 weight_replicate18 weight_replicate19 weight_replicate20 weight_replicate21 weight_replicate22 weight_replicate23 weight_replicate24 weight_replicate25 weight_replicate26 weight_replicate27 weight_replicate28 weight_replicate29 weight_replicate30 weight_replicate31 weight_replicate32 weight_replicate33 weight_replicate34 weight_replicate35 weight_replicate36 weight_replicate37 weight_replicate38 weight_replicate39 weight_replicate40 weight_replicate41 weight_replicate42 weight_replicate43 weight_replicate44 weight_replicate45 weight_replicate46 weight_replicate47 weight_replicate48 weight_replicate49 weight_replicate50 weight_replicate51 weight_replicate52 weight_replicate53 weight_replicate54 weight_replicate55 weight_replicate56 weight_replicate57 weight_replicate58 weight_replicate59 weight_replicate60 weight_replicate61 weight_replicate62 weight_replicate63 weight_replicate64 weight_replicate65 weight_replicate66 weight_replicate67 weight_replicate68 weight_replicate69 weight_replicate70 weight_replicate71 weight_replicate72 weight_replicate73 weight_replicate74 weight_replicate75 weight_replicate76 weight_replicate77 weight_replicate78 weight_replicate79 weight_replicate80 weight_replicate81 weight_replicate82 weight_replicate83 weight_replicate84 weight_replicate85 weight_replicate86 weight_replicate87 weight_replicate88 weight_replicate89 weight_replicate90


Variable        Obs Unique      Mean        Min       Max  Label
-----------------------------------------------------------------------------------------------------------
idcntry_raw   39895     10  5.382354          1        10  Country ID, as coded in rawdata
idschool      39895    684  38451.26      11001    112004  School ID
idgrade       39895      2  5.129515          2         6  Grade ID
idlearner     39895     20  9.074796          1        20  Learner ID
surveyid      39895      1         .          .         .  Survey ID (Region_Year_Assessment)
countrycode   39895     10         .          .         .  WB country code (3 letters)
national_l~l  39895      1         1          1         1  (mean) national_level
score_p~d_01  39895  39806  498.5132   79.72506  943.2535  Plausible value 1: PASEC score for read
score_p~h_01  39895  39793  499.1197   90.90057  912.2094  Plausible value 1: PASEC score for math
score_p~d_02  39895  39808  498.7875   68.18935  922.0192  Plausible value 2: PASEC score for read
score_p~h_02  39895  39801  499.2379   48.34532  888.8068  Plausible value 2: PASEC score for math
score_p~d_03  39895  39811  498.5384   79.35478   925.507  Plausible value 3: PASEC score for read
score_p~h_03  39895  39795  498.9565   45.52919  922.1635  Plausible value 3: PASEC score for math
score_p~d_04  39895  39795  498.5344   90.68453  959.8092  Plausible value 4: PASEC score for read
score_p~h_04  39895  39806  498.8704   81.24384  940.2364  Plausible value 4: PASEC score for math
score_p~d_05  39895  39763  498.6054   42.61094  922.0192  Plausible value 5: PASEC score for read
score_p~h_05  39895  39807  499.0767   5.896903  921.0458  Plausible value 5: PASEC score for math
level_p~d_01  39895      5  2.128086          0         4  Plausible value 1: PASEC level for read
level_p~h_01  39895      4  1.343828          0         3  Plausible value 1: PASEC level for math
level_p~d_02  39895      5  2.132272          0         4  Plausible value 2: PASEC level for read
level_p~h_02  39895      4  1.346535          0         3  Plausible value 2: PASEC level for math
level_p~d_03  39895      5  2.127936          0         4  Plausible value 3: PASEC level for read
level_p~h_03  39895      4  1.344053          0         3  Plausible value 3: PASEC level for math
level_p~d_04  39895      5  2.126783          0         4  Plausible value 4: PASEC level for read
level_p~h_04  39895      4  1.342424          0         3  Plausible value 4: PASEC level for math
level_p~d_05  39895      5  2.129465          0         4  Plausible value 5: PASEC level for read
level_p~h_05  39895      4  1.342599          0         3  Plausible value 5: PASEC level for math
age           39033     22  11.76184          4        25  Learner age at time of assessment
urban         39535      2  .3543443          0         1  School is located in urban/rural area
urban_o       39535      4         .          .         .  Original variable of urban: school is located...
male          39895      2  .5262314          0         1  Learner gender is male/female
escs          31213   2603  .0002684  -3.193398  3.889004  Standardized values of SES
strata        39895     59  5385.764       1001     10006  Strata
learner_we~t  39895   2635  120.5579      1.125  3515.099  Learner weight
jkzone        39895     90  37.52593          1        90  Jackknife zone
jkrep         39895      2  .4994611          0         1  Jackknife replicate code
weight_re~e1  39895   2612  121.4398          0  7030.198  Replicate weight 1
weight_re~e2  39895   2613  120.5665          0  3515.099  Replicate weight 2
weight_re~e3  39895   2612  120.7626          0  3515.099  Replicate weight 3
weight_re~e4  39895   2612   120.626          0  3515.099  Replicate weight 4
weight_re~e5  39895   2612    120.33          0  3515.099  Replicate weight 5
weight_re~e6  39895   2615  120.5665          0  3515.099  Replicate weight 6
weight_re~e7  39895   2616  120.8301          0  3515.099  Replicate weight 7
weight_re~e8  39895   2615  120.9724          0  3631.684  Replicate weight 8
weight_re~e9  39895   2614  120.8031          0  3515.099  Replicate weight 9
weight_re~10  39895   2617  120.5693          0  3515.099  Replicate weight 10
weight_re~11  39895   2616  120.4614          0  3515.099  Replicate weight 11
weight_re~12  39895   2615  120.7386          0  3515.099  Replicate weight 12
weight_re~13  39895   2617  120.6656          0  3515.099  Replicate weight 13
weight_re~14  39895   2617   120.546          0  3909.888  Replicate weight 14
weight_re~15  39895   2614  120.3627          0  3515.099  Replicate weight 15
weight_re~16  39895   2616  120.7281          0  3515.099  Replicate weight 16
weight_re~17  39895   2616  120.3477          0  3515.099  Replicate weight 17
weight_re~18  39895   2618  120.7391          0  3515.099  Replicate weight 18
weight_re~19  39895   2614  120.4916          0  3515.099  Replicate weight 19
weight_re~20  39895   2618    120.45          0  3515.099  Replicate weight 20
weight_re~21  39895   2617  120.9627          0  3515.099  Replicate weight 21
weight_re~22  39895   2615  120.6498          0  3515.099  Replicate weight 22
weight_re~23  39895   2617  120.7283          0  3515.099  Replicate weight 23
weight_re~24  39895   2617   120.674          0  3764.909  Replicate weight 24
weight_re~25  39895   2616  120.6993          0  3515.099  Replicate weight 25
weight_re~26  39895   2616  120.5172          0  3515.099  Replicate weight 26
weight_re~27  39895   2618   120.658          0  3515.099  Replicate weight 27
weight_re~28  39895   2617  120.9934          0  3515.099  Replicate weight 28
weight_re~29  39895   2618  120.6669          0  3515.099  Replicate weight 29
weight_re~30  39895   2618  120.3045          0  3515.099  Replicate weight 30
weight_re~31  39895   2616  120.6034          0  4781.817  Replicate weight 31
weight_re~32  39895   2617  120.3142          0  3515.099  Replicate weight 32
weight_re~33  39895   2616  120.4503          0  3515.099  Replicate weight 33
weight_re~34  39895   2620  120.0238          0  3515.099  Replicate weight 34
weight_re~35  39895   2620  120.8161          0  3515.099  Replicate weight 35
weight_re~36  39895   2617  120.4082          0  3515.099  Replicate weight 36
weight_re~37  39895   2618  120.2819          0  3515.099  Replicate weight 37
weight_re~38  39895   2616   120.595          0  3515.099  Replicate weight 38
weight_re~39  39895   2616  120.9336          0  3515.099  Replicate weight 39
weight_re~40  39895   2620  120.3157          0  3515.099  Replicate weight 40
weight_re~41  39895   2617  120.5023          0  3515.099  Replicate weight 41
weight_re~42  39895   2619  120.4553          0  3515.099  Replicate weight 42
weight_re~43  39895   2619  120.8134          0  3515.099  Replicate weight 43
weight_re~44  39895   2620  120.2635          0  3515.099  Replicate weight 44
weight_re~45  39895   2623  120.5162          0  3515.099  Replicate weight 45
weight_re~46  31213   1698  64.99127          0  752.7745  Replicate weight 46
weight_re~47  31213   1698  64.98604          0  752.7745  Replicate weight 47
weight_re~48  31213   1698  65.06481          0  752.7745  Replicate weight 48
weight_re~49  31213   1698  65.04379          0  752.7745  Replicate weight 49
weight_re~50  31213   1697  65.08591          0  752.7745  Replicate weight 50
weight_re~51  31213   1699  65.08008          0  752.7745  Replicate weight 51
weight_re~52  31213   1699  65.12453          0  752.7745  Replicate weight 52
weight_re~53  31213   1697  64.99841          0  752.7745  Replicate weight 53
weight_re~54  31213   1696  65.09675          0  752.7745  Replicate weight 54
weight_re~55  31213   1699  65.15465          0  752.7745  Replicate weight 55
weight_re~56  31213   1701  65.11128          0  752.7745  Replicate weight 56
weight_re~57  31213   1703  65.05097          0  752.7745  Replicate weight 57
weight_re~58  31213   1698  65.15374          0  752.7745  Replicate weight 58
weight_re~59  31213   1696  65.00416          0  652.5101  Replicate weight 59
weight_re~60  31213   1698  65.24318          0  808.8774  Replicate weight 60
weight_re~61  31213   1696  65.23712          0  752.7745  Replicate weight 61
weight_re~62  31213   1697  64.98736          0  752.7745  Replicate weight 62
weight_re~63  31213   1699  65.19205          0  752.7745  Replicate weight 63
weight_re~64  31213   1698  64.86976          0  752.7745  Replicate weight 64
weight_re~65  31213   1696  64.96724          0  752.7745  Replicate weight 65
weight_re~66  31213   1698  64.93501          0  752.7745  Replicate weight 66
weight_re~67  31213   1697   65.2316          0  752.7745  Replicate weight 67
weight_re~68  31213   1699  65.24297          0  752.7745  Replicate weight 68
weight_re~69  31213   1695  65.10563          0  752.7745  Replicate weight 69
weight_re~70  31213   1699  65.12906          0  752.7745  Replicate weight 70
weight_re~71  31213   1699  65.14721          0  752.7745  Replicate weight 71
weight_re~72  31213   1699  65.10723          0  752.7745  Replicate weight 72
weight_re~73  31213   1699  65.10414          0  752.7745  Replicate weight 73
weight_re~74  31213   1699  65.11845          0  752.7745  Replicate weight 74
weight_re~75  31213   1698  65.07049          0  752.7745  Replicate weight 75
weight_re~76  31213   1697  65.12548          0  752.7745  Replicate weight 76
weight_re~77  31213   1698  65.08786          0  752.7745  Replicate weight 77
weight_re~78  31213   1698  65.13252          0  752.7745  Replicate weight 78
weight_re~79  31213   1700  65.13032          0  752.7745  Replicate weight 79
weight_re~80  31213   1697  65.04563          0  752.7745  Replicate weight 80
weight_re~81  31213   1698  64.91453          0  752.7745  Replicate weight 81
weight_re~82  31213   1700  65.01449          0  752.7745  Replicate weight 82
weight_re~83  31213   1702  65.07443          0  752.7745  Replicate weight 83
weight_re~84  31213   1701   65.0869          0  752.7745  Replicate weight 84
weight_re~85  31213   1700   65.0628          0  752.7745  Replicate weight 85
weight_re~86  31213   1701  65.07496          0  752.7745  Replicate weight 86
weight_re~87  31213   1702   65.0471          0  752.7745  Replicate weight 87
weight_re~88  31213   1702  65.06486          0  752.7745  Replicate weight 88
weight_re~89  31213   1702  65.07493          0  752.7745  Replicate weight 89
weight_re~90  31213   1703  65.09557          0  752.7745  Replicate weight 90
-----------------------------------------------------------------------------------------------------------


Plus the variables merged-on-the-fly, which are:

traitvars:  lp01_threshold_var lp02_threshold_var lp03_threshold_var lp04_threshold_var lp05_threshold_var lp01_threshold_val lp02_threshold_val lp03_threshold_val lp04_threshold_val lp05_threshold_val lp01_threshold_res lp02_threshold_res lp03_threshold_res lp04_threshold_res lp05_threshold_res
valuevars:  sdg411_read_01 bmp_read_01 fgt1_read_01 fgt2_read_01 sdg411_read_02 bmp_read_02 fgt1_read_02 fgt2_read_02 sdg411_read_03 bmp_read_03 fgt1_read_03 fgt2_read_03 sdg411_read_04 bmp_read_04 fgt1_read_04 fgt2_read_04 sdg411_read_05 bmp_read_05 fgt1_read_05 fgt2_read_05
~~~~

About the **39,895  observations** in this dataset:

~~~~
. tab countrycode idgrade if national_level==1

WB country |
   code (3 |       Grade ID
  letters) |         2          6 |     Total
-----------+----------------------+----------
       BDI |       855      3,461 |     4,316 
       BEN |       732      3,033 |     3,765 
       BFA |       969      3,416 |     4,385 
       CIV |       840      2,972 |     3,812 
       CMR |     1,071      3,817 |     4,888 
       COG |       871      2,673 |     3,544 
       NER |       813      3,196 |     4,009 
       SEN |       807      2,905 |     3,712 
       TCD |       813      2,484 |     3,297 
       TGO |       911      3,256 |     4,167 
-----------+----------------------+----------
     Total |     8,682     31,213 |    39,895 

. 
. tab countrycode idgrade if national_level==0
no observations

~~~~

**Harmonization** of proficiency (done on-the-fly):

~~~~

      sdg411_read_01 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
      Non-proficient |     26,185       65.63       65.63
          Proficient |      5,028       12.60       78.24
Non-harmonized grade |      8,682       21.76      100.00
---------------------+-----------------------------------
               Total |     39,895      100.00

         bmp_read_01 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
          Proficient |      5,028       12.60       12.60
      Non-proficient |     26,185       65.63       78.24
Non-harmonized grade |      8,682       21.76      100.00
---------------------+-----------------------------------
               Total |     39,895      100.00

    Variable |        Obs        Mean    Std. Dev.       Min        Max
-------------+---------------------------------------------------------
fgt1_read_01 |     26,185    .2122246    .1283883   .0000353   .8660308

    Variable |        Obs        Mean    Std. Dev.       Min        Max
-------------+---------------------------------------------------------
fgt2_read_01 |     26,185    .0615222    .0651951   1.24e-09   .7500094

      sdg411_read_02 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
      Non-proficient |     26,175       65.61       65.61
          Proficient |      5,038       12.63       78.24
Non-harmonized grade |      8,682       21.76      100.00
---------------------+-----------------------------------
               Total |     39,895      100.00

         bmp_read_02 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
          Proficient |      5,038       12.63       12.63
      Non-proficient |     26,175       65.61       78.24
Non-harmonized grade |      8,682       21.76      100.00
---------------------+-----------------------------------
               Total |     39,895      100.00

    Variable |        Obs        Mean    Std. Dev.       Min        Max
-------------+---------------------------------------------------------
fgt1_read_02 |     26,175    .2118102    .1273219   7.18e-06   .8854153

    Variable |        Obs        Mean    Std. Dev.       Min        Max
-------------+---------------------------------------------------------
fgt2_read_02 |     26,175    .0610738    .0644205   5.15e-11   .7839603

      sdg411_read_03 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
      Non-proficient |     26,178       65.62       65.62
          Proficient |      5,035       12.62       78.24
Non-harmonized grade |      8,682       21.76      100.00
---------------------+-----------------------------------
               Total |     39,895      100.00

         bmp_read_03 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
          Proficient |      5,035       12.62       12.62
      Non-proficient |     26,178       65.62       78.24
Non-harmonized grade |      8,682       21.76      100.00
---------------------+-----------------------------------
               Total |     39,895      100.00

    Variable |        Obs        Mean    Std. Dev.       Min        Max
-------------+---------------------------------------------------------
fgt1_read_03 |     26,178     .212248    .1282336   .0000145    .866653

    Variable |        Obs        Mean    Std. Dev.       Min        Max
-------------+---------------------------------------------------------
fgt2_read_03 |     26,178    .0614924    .0651112   2.09e-10   .7510875

      sdg411_read_04 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
      Non-proficient |     26,155       65.56       65.56
          Proficient |      5,058       12.68       78.24
Non-harmonized grade |      8,682       21.76      100.00
---------------------+-----------------------------------
               Total |     39,895      100.00

         bmp_read_04 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
          Proficient |      5,058       12.68       12.68
      Non-proficient |     26,155       65.56       78.24
Non-harmonized grade |      8,682       21.76      100.00
---------------------+-----------------------------------
               Total |     39,895      100.00

    Variable |        Obs        Mean    Std. Dev.       Min        Max
-------------+---------------------------------------------------------
fgt1_read_04 |     26,155    .2124962     .128235   .0000411   .8476146

    Variable |        Obs        Mean    Std. Dev.       Min        Max
-------------+---------------------------------------------------------
fgt2_read_04 |     26,155    .0615982    .0652547   1.69e-09   .7184506

      sdg411_read_05 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
      Non-proficient |     26,138       65.52       65.52
          Proficient |      5,075       12.72       78.24
Non-harmonized grade |      8,682       21.76      100.00
---------------------+-----------------------------------
               Total |     39,895      100.00

         bmp_read_05 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
          Proficient |      5,075       12.72       12.72
      Non-proficient |     26,138       65.52       78.24
Non-harmonized grade |      8,682       21.76      100.00
---------------------+-----------------------------------
               Total |     39,895      100.00

    Variable |        Obs        Mean    Std. Dev.       Min        Max
-------------+---------------------------------------------------------
fgt1_read_05 |     26,138    .2125972    .1278038   4.92e-06    .928397

    Variable |        Obs        Mean    Std. Dev.       Min        Max
-------------+---------------------------------------------------------
fgt2_read_05 |     26,138    .0615308    .0649609   2.42e-11    .861921



     +-------------------------------------------------------------+
     | idgrade   prefix                    harmonization_condition |
     |-------------------------------------------------------------|
  1. |       2     lp01                           no harmonization |
  2. |       2     lp02                           no harmonization |
  3. |       2     lp03                           no harmonization |
  4. |       2     lp04                           no harmonization |
  5. |       2     lp05                           no harmonization |
     |-------------------------------------------------------------|
  6. |       6     lp01   read_01 = (score_pasec_read_01 >= 595.1) |
  7. |       6     lp02   read_02 = (score_pasec_read_02 >= 595.1) |
  8. |       6     lp03   read_03 = (score_pasec_read_03 >= 595.1) |
  9. |       6     lp04   read_04 = (score_pasec_read_04 >= 595.1) |
 10. |       6     lp05   read_05 = (score_pasec_read_05 >= 595.1) |
     +-------------------------------------------------------------+

~~~~
      - local error = _rc
      - qui log close `mlogname'
      = qui log close __000000
