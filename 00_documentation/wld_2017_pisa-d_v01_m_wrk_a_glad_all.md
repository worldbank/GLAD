Documentation of GLAD dataset
=====================================================================


[back to list of assessments](https://github.com/worldbank/GLAD/blob/master/README.md#harmonization)

This dataset is part of the Global Learning Assessment Database (GLAD). It contains microdata from PISA-D 2017. Each observation corresponds to one learner (student or pupil), and the variables have been harmonized.

**Metadata** stored in this dataset:

~~~~
region:      WLD
year:        2017
assessment:  PISA-D
master:      v01_M
adaptation:  wrk_A_GLAD
module:      ALL
ttl_info:    Joao Pedro de Azevedo [eduanalytics@worldbank.org]
dofile_info: created by Aroob, last modified by Diana on Sep 3, 2020
lastsave:    3 Sep 2020 17:50:18 by wb552057
~~~~


About the **213 variables** in this dataset:

~~~~
The variables belong to the following variable classifications:
    idvars keyvars valuevars traitvars samplevars

idvars:     idcntry_raw idschool idlearner
keyvars:    surveyid countrycode national_level
valuevars:  score_pisa_read_01 score_pisa_math_01 score_pisa_science_01 score_pisa_read_02 score_pisa_math_02 score_pisa_science_02 score_pisa_read_03 score_pisa_math_03 score_pisa_science_03 score_pisa_read_04 score_pisa_math_04 score_pisa_science_04 score_pisa_read_05 score_pisa_math_05 score_pisa_science_05 score_pisa_read_06 score_pisa_math_06 score_pisa_science_06 score_pisa_read_07 score_pisa_math_07 score_pisa_science_07 score_pisa_read_08 score_pisa_math_08 score_pisa_science_08 score_pisa_read_09 score_pisa_math_09 score_pisa_science_09 score_pisa_read_10 score_pisa_math_10 score_pisa_science_10 level_pisa_read_01 level_pisa_math_01 level_pisa_science_01 level_pisa_read_02 level_pisa_math_02 level_pisa_science_02 level_pisa_read_03 level_pisa_math_03 level_pisa_science_03 level_pisa_read_04 level_pisa_math_04 level_pisa_science_04 level_pisa_read_05 level_pisa_math_05 level_pisa_science_05 level_pisa_read_06 level_pisa_math_06 level_pisa_science_06 level_pisa_read_07 level_pisa_math_07 level_pisa_science_07 level_pisa_read_08 level_pisa_math_08 level_pisa_science_08 level_pisa_read_09 level_pisa_math_09 level_pisa_science_09 level_pisa_read_10 level_pisa_math_10 level_pisa_science_10
traitvars:  idgrade age urban male escs15 escs
samplevars: learner_weight weight_replicate1 weight_replicate2 weight_replicate3 weight_replicate4 weight_replicate5 weight_replicate6 weight_replicate7 weight_replicate8 weight_replicate9 weight_replicate10 weight_replicate11 weight_replicate12 weight_replicate13 weight_replicate14 weight_replicate15 weight_replicate16 weight_replicate17 weight_replicate18 weight_replicate19 weight_replicate20 weight_replicate21 weight_replicate22 weight_replicate23 weight_replicate24 weight_replicate25 weight_replicate26 weight_replicate27 weight_replicate28 weight_replicate29 weight_replicate30 weight_replicate31 weight_replicate32 weight_replicate33 weight_replicate34 weight_replicate35 weight_replicate36 weight_replicate37 weight_replicate38 weight_replicate39 weight_replicate40 weight_replicate41 weight_replicate42 weight_replicate43 weight_replicate44 weight_replicate45 weight_replicate46 weight_replicate47 weight_replicate48 weight_replicate49 weight_replicate50 weight_replicate51 weight_replicate52 weight_replicate53 weight_replicate54 weight_replicate55 weight_replicate56 weight_replicate57 weight_replicate58 weight_replicate59 weight_replicate60 weight_replicate61 weight_replicate62 weight_replicate63 weight_replicate64 weight_replicate65 weight_replicate66 weight_replicate67 weight_replicate68 weight_replicate69 weight_replicate70 weight_replicate71 weight_replicate72 weight_replicate73 weight_replicate74 weight_replicate75 weight_replicate76 weight_replicate77 weight_replicate78 weight_replicate79 weight_replicate80


Variable        Obs Unique       Mean       Min       Max  Label
----------------------------------------------------------------------------------------------------------------------------------------------------
idcntry_raw   37092      8          .         .         .  Country ID, as coded in rawdata
idschool      37092   1352   4.08e+07         6  8.94e+07  School ID
idlearner     37092  37092   4.08e+07         1  8.94e+07  Learner ID
surveyid      37092      1          .         .         .  Survey ID (Region_Year_Assessment)
countrycode   37092      8          .         .         .  WB country code (3 letters)
national_l~l  37092      2   .9329235         0         1  Idcntry_raw is a national level
score_p~d_01  34604  32689   351.2767     24.32   665.696  Plausible value 1: PISA-D score for read
score_p~h_01  34604  32603   329.6907    38.771    702.48  Plausible value 1: PISA-D score for math
score_p~e_01  34604  32161   352.4546    58.649   648.308  Plausible value 1: PISA-D score for science
score_p~d_02  34604  32657   350.8391     51.92   690.697  Plausible value 2: PISA-D score for read
score_p~h_02  34604  32640   329.3995    24.104   672.294  Plausible value 2: PISA-D score for math
score_p~e_02  34604  32236   352.6311    64.426   647.089  Plausible value 2: PISA-D score for science
score_p~d_03  34604  32666   350.9251    50.013    680.66  Plausible value 3: PISA-D score for read
score_p~h_03  34604  32576   329.0145     3.885    700.14  Plausible value 3: PISA-D score for math
score_p~e_03  34604  32189   352.2858    59.099   651.802  Plausible value 3: PISA-D score for science
score_p~d_04  34604  32676   351.1154    29.125   660.396  Plausible value 4: PISA-D score for read
score_p~h_04  34604  32530     329.22         0   627.164  Plausible value 4: PISA-D score for math
score_p~e_04  34604  32232    352.444    53.649   625.031  Plausible value 4: PISA-D score for science
score_p~d_05  34604  32655   351.2277    62.648   669.077  Plausible value 5: PISA-D score for read
score_p~h_05  34604  32592   328.8765         0   651.157  Plausible value 5: PISA-D score for math
score_p~e_05  34604  32291    352.286    54.295   641.973  Plausible value 5: PISA-D score for science
score_p~d_06  34604  32721   351.1306    29.671   688.611  Plausible value 6: PISA-D score for read
score_p~h_06  34604  32599   328.9682      1.95   669.004  Plausible value 6: PISA-D score for math
score_p~e_06  34604  32300   352.7474    79.968   655.967  Plausible value 6: PISA-D score for science
score_p~d_07  34604  32701   351.2614    10.484   677.256  Plausible value 7: PISA-D score for read
score_p~h_07  34604  32508   329.3065         0   686.664  Plausible value 7: PISA-D score for math
score_p~e_07  34604  32230   352.7836    66.875   648.345  Plausible value 7: PISA-D score for science
score_p~d_08  34604  32693   351.0512    21.757    689.24  Plausible value 8: PISA-D score for read
score_p~h_08  34604  32630   329.3249         0   637.339  Plausible value 8: PISA-D score for math
score_p~e_08  34604  32200   352.8411    35.703   643.735  Plausible value 8: PISA-D score for science
score_p~d_09  34604  32696   350.6991    57.877   656.504  Plausible value 9: PISA-D score for read
score_p~h_09  34604  32591   329.2541         0   622.162  Plausible value 9: PISA-D score for math
score_p~e_09  34604  32152   352.5182    63.462   666.268  Plausible value 9: PISA-D score for science
score_p~d_10  34604  32719   351.0218    45.651   700.429  Plausible value 10: PISA-D score for read
score_p~h_10  34604  32556   329.3303    10.069   680.795  Plausible value 10: PISA-D score for math
score_p~e_10  34604  32211   352.9185    84.527   648.119  Plausible value 10: PISA-D score for science
level_p~d_01  34604      8   .7310716        -2         5  Plausible value 1: PISA level for read
level_p~h_01  34604      7   .5212692         0         6  Plausible value 1: PISA level for math
level_p~e_01  34604      7   .7358687        -1         5  Plausible value 1: PISA level for science
level_p~d_02  34604      8   .7211016        -2         5  Plausible value 2: PISA level for read
level_p~h_02  34604      7   .5216449         0         6  Plausible value 2: PISA level for math
level_p~e_02  34604      7   .7387007        -1         5  Plausible value 2: PISA level for science
level_p~d_03  34604      8   .7239048        -2         5  Plausible value 3: PISA level for read
level_p~h_03  34604      7   .5162987         0         6  Plausible value 3: PISA level for math
level_p~e_03  34604      7    .731505        -1         5  Plausible value 3: PISA level for science
level_p~d_04  34604      8   .7243093        -2         5  Plausible value 4: PISA level for read
level_p~h_04  34604      6   .5161542         0         5  Plausible value 4: PISA level for math
level_p~e_04  34604      6   .7345972        -1         4  Plausible value 4: PISA level for science
level_p~d_05  34604      8   .7256676        -2         5  Plausible value 5: PISA level for read
level_p~h_05  34604      6   .5127153         0         5  Plausible value 5: PISA level for math
level_p~e_05  34604      7   .7348861        -1         5  Plausible value 5: PISA level for science
level_p~d_06  34604      8   .7262455        -2         5  Plausible value 6: PISA level for read
level_p~h_06  34604      7   .5167033         0         6  Plausible value 6: PISA level for math
level_p~e_06  34604      7   .7388163        -1         5  Plausible value 6: PISA level for science
level_p~d_07  34604      8   .7257253        -2         5  Plausible value 7: PISA level for read
level_p~h_07  34604      7   .5229742         0         6  Plausible value 7: PISA level for math
level_p~e_07  34604      7    .738614        -1         5  Plausible value 7: PISA level for science
level_p~d_08  34604      8   .7244827        -2         5  Plausible value 8: PISA level for read
level_p~h_08  34604      6   .5183216         0         5  Plausible value 8: PISA level for math
level_p~e_08  34604      7   .7410704        -1         5  Plausible value 8: PISA level for science
level_p~d_09  34604      8   .7208126        -2         5  Plausible value 9: PISA level for read
level_p~h_09  34604      6   .5195064         0         5  Plausible value 9: PISA level for math
level_p~e_09  34604      7   .7360999        -1         5  Plausible value 9: PISA level for science
level_p~d_10  34604      9   .7259854        -2         6  Plausible value 10: PISA level for read
level_p~h_10  34604      7   .5202867         0         6  Plausible value 10: PISA level for math
level_p~e_10  34604      7   .7416484        -1         5  Plausible value 10: PISA level for science
idgrade       37092      7   679.3584         7      9999  Grade ID
age           37061     22   15.76062     15.25     16.33  Learner age at time of assessment
urban         34604      2   .6259103         0         1  School is located in urban/rural area
male          37092      2   .4845519         0         1  Learner gender is male/female
escs15        31992  22826  -1.359723   -6.4315    3.4286  Index of economic social and cultural status linked to PISA 2015
escs          31992  22826  -1.359723   -6.4315    3.4286  Index for socio-economic status
learner_we~t  37061   2872   24.10794         1  192.4937  Total learner weight
weight_re~e1  37061   3200   23.94005  .4796768  329.4583  Replicate weight 1
weight_re~e2  37061   3191   23.99883    .29289  329.4583  Replicate weight 2
weight_re~e3  37061   3186   24.04942    .29289  296.3953  Replicate weight 3
weight_re~e4  37061   3189    24.2735  .4287377  249.7881  Replicate weight 4
weight_re~e5  37061   3193   24.13561    .29289  266.3578  Replicate weight 5
weight_re~e6  37061   3192   24.10703  .4287377  278.4512  Replicate weight 6
weight_re~e7  37061   3178   24.05575    .29289  280.9542  Replicate weight 7
weight_re~e8  37061   3187   24.10016  .4287377  296.3953  Replicate weight 8
weight_re~e9  37061   3186   24.02503  .4287377  254.7678  Replicate weight 9
weight_re~10  37061   3186   23.99958  .4287377  296.3953  Replicate weight 10
weight_re~11  37061   3179   24.02864  .4287377  245.8869  Replicate weight 11
weight_re~12  37061   3186   24.22139    .29289  329.4583  Replicate weight 12
weight_re~13  37061   3185   24.18642    .29289  329.4583  Replicate weight 13
weight_re~14  37061   3188   24.28442  .4287377  329.4583  Replicate weight 14
weight_re~15  37061   3184   24.33076    .29289  296.3953  Replicate weight 15
weight_re~16  37061   3190   24.04354    .29289  279.5058  Replicate weight 16
weight_re~17  37061   3202   24.06581  .4287377  252.7399  Replicate weight 17
weight_re~18  37061   3185   24.01307  .4287377  296.3953  Replicate weight 18
weight_re~19  37061   3197   23.92981    .29289  252.6795  Replicate weight 19
weight_re~20  37061   3190   24.07289    .29289  251.1326  Replicate weight 20
weight_re~21  37061   3200   24.25561  .4796768  329.4583  Replicate weight 21
weight_re~22  37061   3191   23.89186    .29289  329.4583  Replicate weight 22
weight_re~23  37061   3186   23.93541    .29289  296.3953  Replicate weight 23
weight_re~24  37061   3186   24.14358  .4287377   273.292  Replicate weight 24
weight_re~25  37061   3189   24.00156    .29289  251.9105  Replicate weight 25
weight_re~26  37061   3195   24.11591  .4287377  262.3455  Replicate weight 26
weight_re~27  37061   3179   23.91494    .29289  252.0105  Replicate weight 27
weight_re~28  37061   3190   24.06408  .4287377  296.3953  Replicate weight 28
weight_re~29  37061   3185   24.18154  .4287377  253.7659  Replicate weight 29
weight_re~30  37061   3194   23.96236  .4287377  296.3953  Replicate weight 30
weight_re~31  37061   3184   24.28171  .4287377  277.3083  Replicate weight 31
weight_re~32  37061   3191    24.1702    .29289  329.4583  Replicate weight 32
weight_re~33  37061   3185   23.95033    .29289  329.4583  Replicate weight 33
weight_re~34  37061   3191    24.2416  .4287377  329.4583  Replicate weight 34
weight_re~35  37061   3183   23.97584    .29289  296.3953  Replicate weight 35
weight_re~36  37061   3187   24.14182    .29289  279.5058  Replicate weight 36
weight_re~37  37061   3198   24.17586  .4287377  276.2648  Replicate weight 37
weight_re~38  37061   3187   23.93004  .4287377  296.3953  Replicate weight 38
weight_re~39  37061   3198    24.2993    .29289   260.663  Replicate weight 39
weight_re~40  37061   3188   23.83829    .29289  261.4819  Replicate weight 40
weight_re~41  37061   3201   23.87131    .29289  329.4583  Replicate weight 41
weight_re~42  37061   3191   24.16178  .4287377  329.4583  Replicate weight 42
weight_re~43  37061   3181   24.10682    .47863  296.3953  Replicate weight 43
weight_re~44  37061   3180   24.47193    .29289  263.0283  Replicate weight 44
weight_re~45  37061   3196   24.06832  .4287377  266.3578  Replicate weight 45
weight_re~46  37061   3189   23.95742    .29289  278.4512  Replicate weight 46
weight_re~47  37061   3183   24.12649  .4287377  280.9542  Replicate weight 47
weight_re~48  37061   3185   23.86898    .29289  296.3953  Replicate weight 48
weight_re~49  37061   3184   23.94961    .29289  254.7678  Replicate weight 49
weight_re~50  37061   3189     24.152    .29289  296.3953  Replicate weight 50
weight_re~51  37061   3188   24.17467    .29289  253.1845  Replicate weight 51
weight_re~52  37061   3184   24.19125    .47863  329.4583  Replicate weight 52
weight_re~53  37061   3187   24.41537  .4287377  329.4583  Replicate weight 53
weight_re~54  37061   3185   24.17548    .29289  329.4583  Replicate weight 54
weight_re~55  37061   3181   23.92479  .4287377  296.3953  Replicate weight 55
weight_re~56  37061   3190   24.15741    .47863  275.3521  Replicate weight 56
weight_re~57  37061   3200    24.0323    .29289  252.7399  Replicate weight 57
weight_re~58  37061   3184   24.20566    .29289  296.3953  Replicate weight 58
weight_re~59  37061   3202   24.13492  .4287377  252.4457  Replicate weight 59
weight_re~60  37061   3192   24.15945    .47863  251.1326  Replicate weight 60
weight_re~61  37061   3202   24.11199    .29289  329.4583  Replicate weight 61
weight_re~62  37061   3197   24.06833  .4287377  329.4583  Replicate weight 62
weight_re~63  37061   3189    24.1348    .47863  296.3953  Replicate weight 63
weight_re~64  37061   3186   23.97728    .29289   273.292  Replicate weight 64
weight_re~65  37061   3191   24.09342  .4287377  262.9686  Replicate weight 65
weight_re~66  37061   3193   24.25892    .29289  262.3455  Replicate weight 66
weight_re~67  37061   3176   24.13556  .4287377  261.4933  Replicate weight 67
weight_re~68  37061   3190   24.00492    .29289  296.3953  Replicate weight 68
weight_re~69  37061   3185   24.01822    .29289  253.7659  Replicate weight 69
weight_re~70  37061   3187   24.44336    .29289  296.3953  Replicate weight 70
weight_re~71  37061   3182   23.62074    .29289  277.3083  Replicate weight 71
weight_re~72  37061   3189     24.029    .47863  329.4583  Replicate weight 72
weight_re~73  37061   3183   24.32642  .4287377  329.4583  Replicate weight 73
weight_re~74  37061   3187   24.19182    .29289  329.4583  Replicate weight 74
weight_re~75  37061   3186    24.0762  .4287377  296.3953  Replicate weight 75
weight_re~76  37061   3191   23.82671    .47863   260.945  Replicate weight 76
weight_re~77  37061   3194   24.23402    .29289  276.2648  Replicate weight 77
weight_re~78  37061   3190   24.10677    .29289  296.3953  Replicate weight 78
weight_re~79  37061   3194   24.31324  .4287377   260.663  Replicate weight 79
weight_re~80  37061   3190   23.84666    .47863  258.4904  Replicate weight 80
----------------------------------------------------------------------------------------------------------------------------------------------------


Plus the variables merged-on-the-fly, which are:

traitvars:  lp01_threshold_var lp02_threshold_var lp03_threshold_var lp04_threshold_var lp05_threshold_var lp06_threshold_var lp07_threshold_var lp08_threshold_var lp09_threshold_var lp10_threshold_var lp01_threshold_val lp02_threshold_val lp03_threshold_val lp04_threshold_val lp05_threshold_val lp06_threshold_val lp07_threshold_val lp08_threshold_val lp09_threshold_val lp10_threshold_val lp01_threshold_res lp02_threshold_res lp03_threshold_res lp04_threshold_res lp05_threshold_res lp06_threshold_res lp07_threshold_res lp08_threshold_res lp09_threshold_res lp10_threshold_res
valuevars:  hpro_read_01 fgt1_hpro_read_01 fgt2_hpro_read_01 hpro_read_02 fgt1_hpro_read_02 fgt2_hpro_read_02 hpro_read_03 fgt1_hpro_read_03 fgt2_hpro_read_03 hpro_read_04 fgt1_hpro_read_04 fgt2_hpro_read_04 hpro_read_05 fgt1_hpro_read_05 fgt2_hpro_read_05 hpro_read_06 fgt1_hpro_read_06 fgt2_hpro_read_06 hpro_read_07 fgt1_hpro_read_07 fgt2_hpro_read_07 hpro_read_08 fgt1_hpro_read_08 fgt2_hpro_read_08 hpro_read_09 fgt1_hpro_read_09 fgt2_hpro_read_09 hpro_read_10 fgt1_hpro_read_10 fgt2_hpro_read_10
~~~~

About the **37,092  observations** in this dataset:

~~~~
. tab countrycode idgrade if national_level==1

WB country |
   code (3 |                             Grade ID
  letters) |   Grade 7    Grade 8    Grade 9   Grade 10   Grade 11   Grade 12 |     Total
-----------+------------------------------------------------------------------+----------
       ECU |        62        193        578      3,040      1,755         36 |     5,664 
       GTM |       675      1,215      2,422        758         30          0 |     5,100 
       HND |       350        677      1,806      1,824        115          1 |     4,773 
       KHM |       355        719      1,483      1,641        851        113 |     5,162 
       PRY |       107        319      1,010      2,878        193          3 |     4,510 
       SEN |       222        975      1,862      1,825        238         60 |     5,182 
       ZMB |       910      1,003      1,280        759        236         25 |     4,213 
-----------+------------------------------------------------------------------+----------
     Total |     2,681      5,101     10,441     12,725      3,418        238 |    34,604 

. 
. tab countrycode idgrade if national_level==0

WB country |
   code (3 |  Grade ID
  letters) |      9999 |     Total
-----------+-----------+----------
       BTN |     2,488 |     2,488 
-----------+-----------+----------
     Total |     2,488 |     2,488 

~~~~

**Harmonization** of proficiency (done on-the-fly):

~~~~

        hpro_read_01 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
      Non-proficient |     25,953       69.97       69.97
          Proficient |      8,651       23.32       93.29
 Missing score/level |      2,488        6.71      100.00
---------------------+-----------------------------------
               Total |     37,092      100.00

fgt1_hpro_r |
     ead_01 |      Freq.     Percent        Cum.
------------+-----------------------------------
         .5 |     10,799       29.11       29.11
          1 |     10,088       27.20       56.31
        1.5 |      4,391       11.84       68.15
          2 |        675        1.82       69.97
          . |     11,139       30.03      100.00
------------+-----------------------------------
      Total |     37,092      100.00

fgt2_hpro_r |
     ead_01 |      Freq.     Percent        Cum.
------------+-----------------------------------
        .25 |     10,799       29.11       29.11
          1 |     10,088       27.20       56.31
       2.25 |      4,391       11.84       68.15
          4 |        675        1.82       69.97
          . |     11,139       30.03      100.00
------------+-----------------------------------
      Total |     37,092      100.00

        hpro_read_02 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
      Non-proficient |     26,119       70.42       70.42
          Proficient |      8,485       22.88       93.29
 Missing score/level |      2,488        6.71      100.00
---------------------+-----------------------------------
               Total |     37,092      100.00

fgt1_hpro_r |
     ead_02 |      Freq.     Percent        Cum.
------------+-----------------------------------
         .5 |     10,848       29.25       29.25
          1 |     10,176       27.43       56.68
        1.5 |      4,403       11.87       68.55
          2 |        692        1.87       70.42
          . |     10,973       29.58      100.00
------------+-----------------------------------
      Total |     37,092      100.00

fgt2_hpro_r |
     ead_02 |      Freq.     Percent        Cum.
------------+-----------------------------------
        .25 |     10,848       29.25       29.25
          1 |     10,176       27.43       56.68
       2.25 |      4,403       11.87       68.55
          4 |        692        1.87       70.42
          . |     10,973       29.58      100.00
------------+-----------------------------------
      Total |     37,092      100.00

        hpro_read_03 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
      Non-proficient |     26,017       70.14       70.14
          Proficient |      8,587       23.15       93.29
 Missing score/level |      2,488        6.71      100.00
---------------------+-----------------------------------
               Total |     37,092      100.00

fgt1_hpro_r |
     ead_03 |      Freq.     Percent        Cum.
------------+-----------------------------------
         .5 |     10,880       29.33       29.33
          1 |     10,022       27.02       56.35
        1.5 |      4,360       11.75       68.11
          2 |        755        2.04       70.14
          . |     11,075       29.86      100.00
------------+-----------------------------------
      Total |     37,092      100.00

fgt2_hpro_r |
     ead_03 |      Freq.     Percent        Cum.
------------+-----------------------------------
        .25 |     10,880       29.33       29.33
          1 |     10,022       27.02       56.35
       2.25 |      4,360       11.75       68.11
          4 |        755        2.04       70.14
          . |     11,075       29.86      100.00
------------+-----------------------------------
      Total |     37,092      100.00

        hpro_read_04 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
      Non-proficient |     26,079       70.31       70.31
          Proficient |      8,525       22.98       93.29
 Missing score/level |      2,488        6.71      100.00
---------------------+-----------------------------------
               Total |     37,092      100.00

fgt1_hpro_r |
     ead_04 |      Freq.     Percent        Cum.
------------+-----------------------------------
         .5 |     10,977       29.59       29.59
          1 |     10,011       26.99       56.58
        1.5 |      4,379       11.81       68.39
          2 |        712        1.92       70.31
          . |     11,013       29.69      100.00
------------+-----------------------------------
      Total |     37,092      100.00

fgt2_hpro_r |
     ead_04 |      Freq.     Percent        Cum.
------------+-----------------------------------
        .25 |     10,977       29.59       29.59
          1 |     10,011       26.99       56.58
       2.25 |      4,379       11.81       68.39
          4 |        712        1.92       70.31
          . |     11,013       29.69      100.00
------------+-----------------------------------
      Total |     37,092      100.00

        hpro_read_05 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
      Non-proficient |     26,068       70.28       70.28
          Proficient |      8,536       23.01       93.29
 Missing score/level |      2,488        6.71      100.00
---------------------+-----------------------------------
               Total |     37,092      100.00

fgt1_hpro_r |
     ead_05 |      Freq.     Percent        Cum.
------------+-----------------------------------
         .5 |     10,895       29.37       29.37
          1 |     10,103       27.24       56.61
        1.5 |      4,372       11.79       68.40
          2 |        698        1.88       70.28
          . |     11,024       29.72      100.00
------------+-----------------------------------
      Total |     37,092      100.00

fgt2_hpro_r |
     ead_05 |      Freq.     Percent        Cum.
------------+-----------------------------------
        .25 |     10,895       29.37       29.37
          1 |     10,103       27.24       56.61
       2.25 |      4,372       11.79       68.40
          4 |        698        1.88       70.28
          . |     11,024       29.72      100.00
------------+-----------------------------------
      Total |     37,092      100.00

        hpro_read_06 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
      Non-proficient |     25,946       69.95       69.95
          Proficient |      8,658       23.34       93.29
 Missing score/level |      2,488        6.71      100.00
---------------------+-----------------------------------
               Total |     37,092      100.00

fgt1_hpro_r |
     ead_06 |      Freq.     Percent        Cum.
------------+-----------------------------------
         .5 |     10,792       29.10       29.10
          1 |     10,010       26.99       56.08
        1.5 |      4,399       11.86       67.94
          2 |        745        2.01       69.95
          . |     11,146       30.05      100.00
------------+-----------------------------------
      Total |     37,092      100.00

fgt2_hpro_r |
     ead_06 |      Freq.     Percent        Cum.
------------+-----------------------------------
        .25 |     10,792       29.10       29.10
          1 |     10,010       26.99       56.08
       2.25 |      4,399       11.86       67.94
          4 |        745        2.01       69.95
          . |     11,146       30.05      100.00
------------+-----------------------------------
      Total |     37,092      100.00

        hpro_read_07 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
      Non-proficient |     26,044       70.21       70.21
          Proficient |      8,560       23.08       93.29
 Missing score/level |      2,488        6.71      100.00
---------------------+-----------------------------------
               Total |     37,092      100.00

fgt1_hpro_r |
     ead_07 |      Freq.     Percent        Cum.
------------+-----------------------------------
         .5 |     10,872       29.31       29.31
          1 |     10,094       27.21       56.52
        1.5 |      4,383       11.82       68.34
          2 |        695        1.87       70.21
          . |     11,048       29.79      100.00
------------+-----------------------------------
      Total |     37,092      100.00

fgt2_hpro_r |
     ead_07 |      Freq.     Percent        Cum.
------------+-----------------------------------
        .25 |     10,872       29.31       29.31
          1 |     10,094       27.21       56.52
       2.25 |      4,383       11.82       68.34
          4 |        695        1.87       70.21
          . |     11,048       29.79      100.00
------------+-----------------------------------
      Total |     37,092      100.00

        hpro_read_08 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
      Non-proficient |     26,061       70.26       70.26
          Proficient |      8,543       23.03       93.29
 Missing score/level |      2,488        6.71      100.00
---------------------+-----------------------------------
               Total |     37,092      100.00

fgt1_hpro_r |
     ead_08 |      Freq.     Percent        Cum.
------------+-----------------------------------
         .5 |     10,940       29.49       29.49
          1 |     10,014       27.00       56.49
        1.5 |      4,402       11.87       68.36
          2 |        705        1.90       70.26
          . |     11,031       29.74      100.00
------------+-----------------------------------
      Total |     37,092      100.00

fgt2_hpro_r |
     ead_08 |      Freq.     Percent        Cum.
------------+-----------------------------------
        .25 |     10,940       29.49       29.49
          1 |     10,014       27.00       56.49
       2.25 |      4,402       11.87       68.36
          4 |        705        1.90       70.26
          . |     11,031       29.74      100.00
------------+-----------------------------------
      Total |     37,092      100.00

        hpro_read_09 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
      Non-proficient |     26,105       70.38       70.38
          Proficient |      8,499       22.91       93.29
 Missing score/level |      2,488        6.71      100.00
---------------------+-----------------------------------
               Total |     37,092      100.00

fgt1_hpro_r |
     ead_09 |      Freq.     Percent        Cum.
------------+-----------------------------------
         .5 |     10,839       29.22       29.22
          1 |     10,182       27.45       56.67
        1.5 |      4,381       11.81       68.48
          2 |        703        1.90       70.38
          . |     10,987       29.62      100.00
------------+-----------------------------------
      Total |     37,092      100.00

fgt2_hpro_r |
     ead_09 |      Freq.     Percent        Cum.
------------+-----------------------------------
        .25 |     10,839       29.22       29.22
          1 |     10,182       27.45       56.67
       2.25 |      4,381       11.81       68.48
          4 |        703        1.90       70.38
          . |     10,987       29.62      100.00
------------+-----------------------------------
      Total |     37,092      100.00

        hpro_read_10 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
      Non-proficient |     26,015       70.14       70.14
          Proficient |      8,589       23.16       93.29
 Missing score/level |      2,488        6.71      100.00
---------------------+-----------------------------------
               Total |     37,092      100.00

fgt1_hpro_r |
     ead_10 |      Freq.     Percent        Cum.
------------+-----------------------------------
         .5 |     10,791       29.09       29.09
          1 |     10,112       27.26       56.35
        1.5 |      4,435       11.96       68.31
          2 |        677        1.83       70.14
          . |     11,077       29.86      100.00
------------+-----------------------------------
      Total |     37,092      100.00

fgt2_hpro_r |
     ead_10 |      Freq.     Percent        Cum.
------------+-----------------------------------
        .25 |     10,791       29.09       29.09
          1 |     10,112       27.26       56.35
       2.25 |      4,435       11.96       68.31
          4 |        677        1.83       70.14
          . |     11,077       29.86      100.00
------------+-----------------------------------
      Total |     37,092      100.00



     +--------------------------------------------------------------+
     |  idgrade   prefix                    harmonization_condition |
     |--------------------------------------------------------------|
  1. |  Grade 7     lp01   hpro_read_01 = (level_pisa_read_01 >= 2) |
  2. |  Grade 7     lp02   hpro_read_02 = (level_pisa_read_02 >= 2) |
  3. |  Grade 7     lp03   hpro_read_03 = (level_pisa_read_03 >= 2) |
  4. |  Grade 7     lp04   hpro_read_04 = (level_pisa_read_04 >= 2) |
  5. |  Grade 7     lp05   hpro_read_05 = (level_pisa_read_05 >= 2) |
     |--------------------------------------------------------------|
  6. |  Grade 7     lp06   hpro_read_06 = (level_pisa_read_06 >= 2) |
  7. |  Grade 7     lp07   hpro_read_07 = (level_pisa_read_07 >= 2) |
  8. |  Grade 7     lp08   hpro_read_08 = (level_pisa_read_08 >= 2) |
  9. |  Grade 7     lp09   hpro_read_09 = (level_pisa_read_09 >= 2) |
 10. |  Grade 7     lp10   hpro_read_10 = (level_pisa_read_10 >= 2) |
     |--------------------------------------------------------------|
 11. |  Grade 8     lp01   hpro_read_01 = (level_pisa_read_01 >= 2) |
 12. |  Grade 8     lp02   hpro_read_02 = (level_pisa_read_02 >= 2) |
 13. |  Grade 8     lp03   hpro_read_03 = (level_pisa_read_03 >= 2) |
 14. |  Grade 8     lp04   hpro_read_04 = (level_pisa_read_04 >= 2) |
 15. |  Grade 8     lp05   hpro_read_05 = (level_pisa_read_05 >= 2) |
     |--------------------------------------------------------------|
 16. |  Grade 8     lp06   hpro_read_06 = (level_pisa_read_06 >= 2) |
 17. |  Grade 8     lp07   hpro_read_07 = (level_pisa_read_07 >= 2) |
 18. |  Grade 8     lp08   hpro_read_08 = (level_pisa_read_08 >= 2) |
 19. |  Grade 8     lp09   hpro_read_09 = (level_pisa_read_09 >= 2) |
 20. |  Grade 8     lp10   hpro_read_10 = (level_pisa_read_10 >= 2) |
     |--------------------------------------------------------------|
 21. |  Grade 9     lp01   hpro_read_01 = (level_pisa_read_01 >= 2) |
 22. |  Grade 9     lp02   hpro_read_02 = (level_pisa_read_02 >= 2) |
 23. |  Grade 9     lp03   hpro_read_03 = (level_pisa_read_03 >= 2) |
 24. |  Grade 9     lp04   hpro_read_04 = (level_pisa_read_04 >= 2) |
 25. |  Grade 9     lp05   hpro_read_05 = (level_pisa_read_05 >= 2) |
     |--------------------------------------------------------------|
 26. |  Grade 9     lp06   hpro_read_06 = (level_pisa_read_06 >= 2) |
 27. |  Grade 9     lp07   hpro_read_07 = (level_pisa_read_07 >= 2) |
 28. |  Grade 9     lp08   hpro_read_08 = (level_pisa_read_08 >= 2) |
 29. |  Grade 9     lp09   hpro_read_09 = (level_pisa_read_09 >= 2) |
 30. |  Grade 9     lp10   hpro_read_10 = (level_pisa_read_10 >= 2) |
     |--------------------------------------------------------------|
 31. | Grade 10     lp01   hpro_read_01 = (level_pisa_read_01 >= 2) |
 32. | Grade 10     lp02   hpro_read_02 = (level_pisa_read_02 >= 2) |
 33. | Grade 10     lp03   hpro_read_03 = (level_pisa_read_03 >= 2) |
 34. | Grade 10     lp04   hpro_read_04 = (level_pisa_read_04 >= 2) |
 35. | Grade 10     lp05   hpro_read_05 = (level_pisa_read_05 >= 2) |
     |--------------------------------------------------------------|
 36. | Grade 10     lp06   hpro_read_06 = (level_pisa_read_06 >= 2) |
 37. | Grade 10     lp07   hpro_read_07 = (level_pisa_read_07 >= 2) |
 38. | Grade 10     lp08   hpro_read_08 = (level_pisa_read_08 >= 2) |
 39. | Grade 10     lp09   hpro_read_09 = (level_pisa_read_09 >= 2) |
 40. | Grade 10     lp10   hpro_read_10 = (level_pisa_read_10 >= 2) |
     |--------------------------------------------------------------|
 41. | Grade 11     lp01   hpro_read_01 = (level_pisa_read_01 >= 2) |
 42. | Grade 11     lp02   hpro_read_02 = (level_pisa_read_02 >= 2) |
 43. | Grade 11     lp03   hpro_read_03 = (level_pisa_read_03 >= 2) |
 44. | Grade 11     lp04   hpro_read_04 = (level_pisa_read_04 >= 2) |
 45. | Grade 11     lp05   hpro_read_05 = (level_pisa_read_05 >= 2) |
     |--------------------------------------------------------------|
 46. | Grade 11     lp06   hpro_read_06 = (level_pisa_read_06 >= 2) |
 47. | Grade 11     lp07   hpro_read_07 = (level_pisa_read_07 >= 2) |
 48. | Grade 11     lp08   hpro_read_08 = (level_pisa_read_08 >= 2) |
 49. | Grade 11     lp09   hpro_read_09 = (level_pisa_read_09 >= 2) |
 50. | Grade 11     lp10   hpro_read_10 = (level_pisa_read_10 >= 2) |
     |--------------------------------------------------------------|
 51. | Grade 12     lp01   hpro_read_01 = (level_pisa_read_01 >= 2) |
 52. | Grade 12     lp02   hpro_read_02 = (level_pisa_read_02 >= 2) |
 53. | Grade 12     lp03   hpro_read_03 = (level_pisa_read_03 >= 2) |
 54. | Grade 12     lp04   hpro_read_04 = (level_pisa_read_04 >= 2) |
 55. | Grade 12     lp05   hpro_read_05 = (level_pisa_read_05 >= 2) |
     |--------------------------------------------------------------|
 56. | Grade 12     lp06   hpro_read_06 = (level_pisa_read_06 >= 2) |
 57. | Grade 12     lp07   hpro_read_07 = (level_pisa_read_07 >= 2) |
 58. | Grade 12     lp08   hpro_read_08 = (level_pisa_read_08 >= 2) |
 59. | Grade 12     lp09   hpro_read_09 = (level_pisa_read_09 >= 2) |
 60. | Grade 12     lp10   hpro_read_10 = (level_pisa_read_10 >= 2) |
     |--------------------------------------------------------------|
 61. |     9999     lp01   hpro_read_01 = (level_pisa_read_01 >= 2) |
 62. |     9999     lp02   hpro_read_02 = (level_pisa_read_02 >= 2) |
 63. |     9999     lp03   hpro_read_03 = (level_pisa_read_03 >= 2) |
 64. |     9999     lp04   hpro_read_04 = (level_pisa_read_04 >= 2) |
 65. |     9999     lp05   hpro_read_05 = (level_pisa_read_05 >= 2) |
     |--------------------------------------------------------------|
 66. |     9999     lp06   hpro_read_06 = (level_pisa_read_06 >= 2) |
 67. |     9999     lp07   hpro_read_07 = (level_pisa_read_07 >= 2) |
 68. |     9999     lp08   hpro_read_08 = (level_pisa_read_08 >= 2) |
 69. |     9999     lp09   hpro_read_09 = (level_pisa_read_09 >= 2) |
 70. |     9999     lp10   hpro_read_10 = (level_pisa_read_10 >= 2) |
     +--------------------------------------------------------------+

~~~~
