Documentation of GLAD dataset
=====================================================================


[back to list of assessments](https://github.com/worldbank/GLAD/blob/master/README.md#harmonization)

This dataset is part of the Global Learning Assessment Database (GLAD). It contains microdata from PISA 2015. Each observation corresponds to one learner (student or pupil), and the variables have been harmonized.'

**Metadata** stored in this dataset:

~~~~
region:      WLD
year:        2015
assessment:  PISA
master:      v01_M
adaptation:  wrk_A_GLAD
module:      ALL
ttl_info:    Joao Pedro de Azevedo [eduanalytics@worldbank.org]
dofile_info: created by Aishwarya, last modified by Joao Pedro Azevedo on February 5, 2022
lastsave:    6 Feb 2022 11:11:13 by wb255520
~~~~


About the **252 variables** in this dataset:

~~~~
The variables belong to the following variable classifications:
    idvars keyvars valuevars traitvars pisavars samplevars

idvars:     idcntry_raw idschool idlearner
keyvars:    surveyid countrycode national_level
valuevars:  score_pisa_read_01 score_pisa_math_01 score_pisa_science_01 score_pisa_flit_01 score_pisa_read_02 score_pisa_math_02 score_pisa_science_02 score_pisa_flit_02 score_pisa_read_03 score_pisa_math_03 score_pisa_science_03 score_pisa_flit_03 score_pisa_read_04 score_pisa_math_04 score_pisa_science_04 score_pisa_flit_04 score_pisa_read_05 score_pisa_math_05 score_pisa_science_05 score_pisa_flit_05 score_pisa_read_06 score_pisa_math_06 score_pisa_science_06 score_pisa_flit_06 score_pisa_read_07 score_pisa_math_07 score_pisa_science_07 score_pisa_flit_07 score_pisa_read_08 score_pisa_math_08 score_pisa_science_08 score_pisa_flit_08 score_pisa_read_09 score_pisa_math_09 score_pisa_science_09 score_pisa_flit_09 score_pisa_read_10 score_pisa_math_10 score_pisa_science_10 score_pisa_flit_10 level_pisa_read_01 level_pisa_math_01 level_pisa_science_01 level_pisa_flit_01 level_pisa_read_02 level_pisa_math_02 level_pisa_science_02 level_pisa_flit_02 level_pisa_read_03 level_pisa_math_03 level_pisa_science_03 level_pisa_flit_03 level_pisa_read_04 level_pisa_math_04 level_pisa_science_04 level_pisa_flit_04 level_pisa_read_05 level_pisa_math_05 level_pisa_science_05 level_pisa_flit_05 level_pisa_read_06 level_pisa_math_06 level_pisa_science_06 level_pisa_flit_06 level_pisa_read_07 level_pisa_math_07 level_pisa_science_07 level_pisa_flit_07 level_pisa_read_08 level_pisa_math_08 level_pisa_science_08 level_pisa_flit_08 level_pisa_read_09 level_pisa_math_09 level_pisa_science_09 level_pisa_flit_09 level_pisa_read_10 level_pisa_math_10 level_pisa_science_10 level_pisa_flit_10
traitvars:  idgrade age urban urban_o male escs escs_quintile qescs has_qescs
pisavars: city native language ece school_type school_type_o


Variable         Obs Unique       Mean      Min       Max  Label
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
idcntry_raw   512846     70          .        .         .  Country ID, as coded in rawdata
idschool      512846  17859   4.63e+07   800001  9.74e+07  School ID
idlearner     512846 512846   4.63e+07   800001  9.74e+07  Learner ID
surveyid      512846      1          .        .         .  Survey ID (Region_Year_Assessment)
countrycode   512846     69          .        .         .  WB country code (3 letters)
national_l~l  512846      2   .9145396        0         1  Idcntry_raw is a national level
score_p~d_01  512846 252928   465.6299        0    882.12  Plausible value 1: PISA score for read
score_p~h_01  512846 244673    463.317        0   870.509  Plausible value 1: PISA score for math
score_p~e_01  512846 213422   469.4707   25.103   888.359  Plausible value 1: PISA score for science
score_p~t_01  119502  99720   472.7152        0   972.953  Plausible value 1: PISA score for financial literacy
score_p~d_02  512846 253051   465.6096        0   881.433  Plausible value 2: PISA score for read
score_p~h_02  512846 245017    463.277        0   912.205  Plausible value 2: PISA score for math
score_p~e_02  512846 213623   469.5635   44.591   880.436  Plausible value 2: PISA score for science
score_p~t_02  119502  99579   472.7118        0      1000  Plausible value 2: PISA score for financial literacy
score_p~d_03  512846 252914   465.7671        0   874.013  Plausible value 3: PISA score for read
score_p~h_03  512846 244882   463.4453        0   892.346  Plausible value 3: PISA score for math
score_p~e_03  512846 213639   469.5108   26.401    882.55  Plausible value 3: PISA score for science
score_p~t_03  119502  99588   473.0708        0   963.706  Plausible value 3: PISA score for financial literacy
score_p~d_04  512846 252758   465.3726        0   854.437  Plausible value 4: PISA score for read
score_p~h_04  512846 244751   463.5647    25.45   884.822  Plausible value 4: PISA score for math
score_p~e_04  512846 213323   469.5532   63.712   870.109  Plausible value 4: PISA score for science
score_p~t_04  119502  99644   472.2645        0    955.95  Plausible value 4: PISA score for financial literacy
score_p~d_05  512846 252682   465.6362        0   865.085  Plausible value 5: PISA score for read
score_p~h_05  512846 245361    463.315        0    901.83  Plausible value 5: PISA score for math
score_p~e_05  512846 213692   469.5472   78.805   894.051  Plausible value 5: PISA score for science
score_p~t_05  119502  99726   472.2486        0      1000  Plausible value 5: PISA score for financial literacy
score_p~d_06  512846 252626   465.6887        0   870.747  Plausible value 6: PISA score for read
score_p~h_06  512846 245444   463.5372    3.305   893.694  Plausible value 6: PISA score for math
score_p~e_06  512846 213597   469.5742   57.536   937.387  Plausible value 6: PISA score for science
score_p~t_06  119502  99390   472.6177        0   942.939  Plausible value 6: PISA score for financial literacy
score_p~d_07  512846 252808   465.6346        0   898.018  Plausible value 7: PISA score for read
score_p~h_07  512846 244905   463.5427        0   876.593  Plausible value 7: PISA score for math
score_p~e_07  512846 213659   469.3643        0   911.915  Plausible value 7: PISA score for science
score_p~t_07  119502  99626   472.2676        0   954.882  Plausible value 7: PISA score for financial literacy
score_p~d_08  512846 252769   465.6595        0   863.844  Plausible value 8: PISA score for read
score_p~h_08  512846 245064   463.5115   24.846    871.61  Plausible value 8: PISA score for math
score_p~e_08  512846 213388   469.4221   81.855   873.018  Plausible value 8: PISA score for science
score_p~t_08  119502  99596   474.1564        0      1000  Plausible value 8: PISA score for financial literacy
score_p~d_09  512846 252804    465.852        0   864.958  Plausible value 9: PISA score for read
score_p~h_09  512846 245310   463.5567        0   889.142  Plausible value 9: PISA score for math
score_p~e_09  512846 213401   469.3911   66.932   907.234  Plausible value 9: PISA score for science
score_p~t_09  119502  99661   472.4984        0    929.16  Plausible value 9: PISA score for financial literacy
score_p~d_10  512846 253180    465.748        0   884.906  Plausible value 10: PISA score for read
score_p~h_10  512846 245094   463.3564        0    869.23  Plausible value 10: PISA score for math
score_p~e_10  512846 213583    469.581   34.169   882.745  Plausible value 10: PISA score for science
score_p~t_10  119502  99725   472.5845        0    935.31  Plausible value 10: PISA score for financial literacy
level_p~d_01  512846      8   2.305735       -1         6  Plausible value 1: PISA level for read
level_p~h_01  512846      7   2.255258        0         6  Plausible value 1: PISA level for math
level_p~e_01  512846      8   2.301968       -1         6  Plausible value 1: PISA level for science
level_p~t_01  119502      6   2.480787        0         5  Plausible value 1: PISA level for financial literacy
level_p~d_02  512846      8   2.305045       -1         6  Plausible value 2: PISA level for read
level_p~h_02  512846      7   2.255022        0         6  Plausible value 2: PISA level for math
level_p~e_02  512846      8   2.303549       -1         6  Plausible value 2: PISA level for science
level_p~t_02  119502      6   2.479565        0         5  Plausible value 2: PISA level for financial literacy
level_p~d_03  512846      8   2.308342       -1         6  Plausible value 3: PISA level for read
level_p~h_03  512846      7   2.256227        0         6  Plausible value 3: PISA level for math
level_p~e_03  512846      8   2.302488       -1         6  Plausible value 3: PISA level for science
level_p~t_03  119502      6   2.483415        0         5  Plausible value 3: PISA level for financial literacy
level_p~d_04  512846      8   2.303165       -1         6  Plausible value 4: PISA level for read
level_p~h_04  512846      7   2.258417        0         6  Plausible value 4: PISA level for math
level_p~e_04  512846      8   2.302956       -1         6  Plausible value 4: PISA level for science
level_p~t_04  119502      6   2.476636        0         5  Plausible value 4: PISA level for financial literacy
level_p~d_05  512846      8   2.305298       -1         6  Plausible value 5: PISA level for read
level_p~h_05  512846      7   2.255845        0         6  Plausible value 5: PISA level for math
level_p~e_05  512846      8   2.303101       -1         6  Plausible value 5: PISA level for science
level_p~t_05  119502      6   2.475072        0         5  Plausible value 5: PISA level for financial literacy
level_p~d_06  512846      8   2.306817       -1         6  Plausible value 6: PISA level for read
level_p~h_06  512846      7   2.258678        0         6  Plausible value 6: PISA level for math
level_p~e_06  512846      8   2.303506       -1         6  Plausible value 6: PISA level for science
level_p~t_06  119502      6   2.478661        0         5  Plausible value 6: PISA level for financial literacy
level_p~d_07  512846      8   2.306536       -1         6  Plausible value 7: PISA level for read
level_p~h_07  512846      7   2.257678        0         6  Plausible value 7: PISA level for math
level_p~e_07  512846      8   2.300979       -1         6  Plausible value 7: PISA level for science
level_p~t_07  119502      6   2.476804        0         5  Plausible value 7: PISA level for financial literacy
level_p~d_08  512846      8   2.306751       -1         6  Plausible value 8: PISA level for read
level_p~h_08  512846      7   2.258068        0         6  Plausible value 8: PISA level for math
level_p~e_08  512846      8   2.301469       -1         6  Plausible value 8: PISA level for science
level_p~t_08  119502      6   2.495004        0         5  Plausible value 8: PISA level for financial literacy
level_p~d_09  512846      8   2.308545       -1         6  Plausible value 9: PISA level for read
level_p~h_09  512846      7   2.259807        0         6  Plausible value 9: PISA level for math
level_p~e_09  512846      8   2.300402       -1         6  Plausible value 9: PISA level for science
level_p~t_09  119502      6    2.47872        0         5  Plausible value 9: PISA level for financial literacy
level_p~d_10  512846      8     2.3085       -1         6  Plausible value 10: PISA level for read
level_p~h_10  512846      7   2.256878        0         6  Plausible value 10: PISA level for math
level_p~e_10  512846      8   2.303524       -1         6  Plausible value 10: PISA level for science
level_p~t_10  119502      6   2.479716        0         5  Plausible value 10: PISA level for financial literacy
idgrade       512846      7   9.656435        7        13  Grade ID
age           512846     16   15.79287    15.17     16.42  Learner age at time of assessment
urban         474061      2    .904487        0         1  School is located in urban/rural area
urban_o       488008      7          .        .         .  Original variable of urban: population size of the school area
male          512846      2     .49852        0         1  Learner gender is male/female
escs          496962  53523  -.2558272  -7.2602    4.1828  Index of economic, social and cultural status (WLE)
escs_quint~e  496962      5   3.024863        1         5  Income quintile
qescs         496910      5   3.012381        1         5  Quintiles of Socio-Economic Status
has_qescs     512846      2   .9689263        0         1  Dummy variable for observations with a valid QESCS
city          474061      3   1.699167        1         3  School is located in city (1), town (2), village (3)
native        488252      3   1.179809        1         3  Learner is native (1), second-generation (2), first-generation (3)
language      496744      2   1.133894        1         2  Language of test (1), other language (2)
ece            63536      3   2.246474        1         3  Attended early childhood education
school_type   449872      3   2.715072        1         3  Type of ownership and decision-making power of schools
school_typ~o  459344      2   1.211874        1         2  Type of school - Public or Private
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


Plus the variables merged-on-the-fly, which are:

traitvars:  lp01_threshold_var lp02_threshold_var lp03_threshold_var lp04_threshold_var lp05_threshold_var lp06_threshold_var lp07_threshold_var lp08_threshold_var lp09_threshold_var lp10_threshold_var lp01_threshold_val lp02_threshold_val lp03_threshold_val lp04_threshold_val lp05_threshold_val lp06_threshold_val lp07_threshold_val lp08_threshold_val lp09_threshold_val lp10_threshold_val lp01_threshold_res lp02_threshold_res lp03_threshold_res lp04_threshold_res lp05_threshold_res lp06_threshold_res lp07_threshold_res lp08_threshold_res lp09_threshold_res lp10_threshold_res
valuevars:  sdg411_read_01 bmp_read_01 fgt1_read_01 fgt2_read_01 sdg411_read_02 bmp_read_02 fgt1_read_02 fgt2_read_02 sdg411_read_03 bmp_read_03 fgt1_read_03 fgt2_read_03 sdg411_read_04 bmp_read_04 fgt1_read_04 fgt2_read_04 sdg411_read_05 bmp_read_05 fgt1_read_05 fgt2_read_05 sdg411_read_06 bmp_read_06 fgt1_read_06 fgt2_read_06 sdg411_read_07 bmp_read_07 fgt1_read_07 fgt2_read_07 sdg411_read_08 bmp_read_08 fgt1_read_08 fgt2_read_08 sdg411_read_09 bmp_read_09 fgt1_read_09 fgt2_read_09 sdg411_read_10 bmp_read_10 fgt1_read_10 fgt2_read_10
~~~~

About the **512,846 observations** in this dataset:

~~~~
. tab countrycode idgrade if national_level==1

WB country |
   code (3 |                                   Grade ID
  letters) |   Grade 7    Grade 8    Grade 9   Grade 10   Grade 11   Grade 12   Grade 13 |     Total
-----------+-----------------------------------------------------------------------------+----------
       ALB |         7         48      1,633      3,469         52          6          0 |     5,215 
       ARE |        84        325      1,596      7,691      4,289        182          0 |    14,167 
       AUS |         2         18      1,605     10,844      2,055          6          0 |    14,530 
       AUT |         3         64      1,441      5,052        443          3          0 |     7,006 
       BEL |        48        517      2,741      6,102        123          1          0 |     9,532 
       BGR |        17        120      5,536        255          0          0          0 |     5,928 
       BRA |       846      1,494      2,871      8,557      8,616        757          0 |    23,141 
       CAN |        13         82      2,072     17,687        186          3          0 |    20,043 
       CHE |        31        586      3,346      1,853         23          1          0 |     5,840 
       CHL |        57        172      1,705      4,985        132          2          0 |     7,053 
       COL |       540      1,344      2,612      5,148      2,151          0          0 |    11,795 
       CRI |       360        907      2,320      3,264         12          3          0 |     6,866 
       CZE |        28        192      2,830      3,841          3          0          0 |     6,894 
       DEU |        27        486      3,063      2,827        100          1          0 |     6,504 
       DNK |        23      1,313      5,752         73          0          0          0 |     7,161 
       DOM |       269        513      1,029      2,057        748        124          0 |     4,740 
       DZA |     1,015      1,306      2,024      1,016        146          0          0 |     5,507 
       ESP |         4        496      1,336      4,896          4          0          0 |     6,736 
       EST |        32      1,148      4,343         63          0          1          0 |     5,587 
       FIN |        26        749      5,100          1          6          0          0 |     5,882 
       FRA |         2         54      1,353      4,487        206          6          0 |     6,108 
       GBR |         0          0          0        576     13,307        272          2 |    14,157 
       GEO |         5         43      1,156      3,961         56          0          0 |     5,221 
       GRC |        10         24        116      5,382          0          0          0 |     5,532 
       HKG |        59        286      1,384      3,612         18          0          0 |     5,359 
       HRV |         0          8      4,645      1,156          0          0          0 |     5,809 
       HUN |        40        209      4,542        867          0          0          0 |     5,658 
       IDN |       110        425      2,581      3,245        151          1          0 |     6,513 
       IRL |         1        102      3,594      1,442        602          0          0 |     5,741 
       ISL |         0          0          0      3,371          0          0          0 |     3,371 
       ISR |         0          6      1,014      5,539         39          0          0 |     6,598 
       ITA |         7         97      1,752      9,115        612          0          0 |    11,583 
       JOR |         9         47        457      6,754          0          0          0 |     7,267 
       JPN |         0          0          0      6,647          0          0          0 |     6,647 
       KOR |         0          0        523      5,032         26          0          0 |     5,581 
       LBN |       155        353        716      2,892        421          9          0 |     4,546 
       LTU |         7        174      5,423        916          5          0          0 |     6,525 
       LUX |        14        418      2,680      2,154         33          0          0 |     5,299 
       LVA |        34        536      4,141        137          1          0          0 |     4,849 
       MAC |       131        545      1,330      2,442         28          0          0 |     4,476 
       MDA |        11        405      4,498        409          2          0          0 |     5,325 
       MEX |       129        281      1,916      5,184         43         15          0 |     7,568 
       MKD |         1          1      3,687      1,635          0          0          0 |     5,324 
       MLT |         0          0         10        200      3,422          2          0 |     3,634 
       MNE |         0          0      4,724        941          0          0          0 |     5,665 
       NLD |         3        152      2,242      2,944         43          1          0 |     5,385 
       NOR |         0          0         28      5,425          3          0          0 |     5,456 
       NZL |         0          0          1        270      4,019        227          3 |     4,520 
       PER |       167        448      1,111      3,476      1,769          0          0 |     6,971 
       POL |        22        170      4,274         12          0          0          0 |     4,478 
       PRT |       254        631      1,624      3,818         24          0          0 |     6,351 
       QAT |       108        410      1,962      7,380      2,149         74          0 |    12,083 
       ROU |        45        266      3,810        755          0          0          0 |     4,876 
       RUS |        10        409      4,849        764          4          0          0 |     6,036 
       SGP |         4        109        482      5,508          7          5          0 |     6,115 
       SVK |       128        241      2,486      3,491          4          0          0 |     6,350 
       SVN |         0          9        109      6,269         19          0          0 |     6,406 
       SWE |         7        167      5,244         38          2          0          0 |     5,458 
       THA |        16         51      2,133      5,799        250          0          0 |     8,249 
       TTO |       191        528      1,256      2,636         81          0          0 |     4,692 
       TUN |       233        563      1,034      3,295        250          0          0 |     5,375 
       TUR |        16        105      1,273      4,308        186          7          0 |     5,895 
       TWN |         0          0      3,386      4,322          0          0          0 |     7,708 
       URY |       415        534      1,276      3,783         54          0          0 |     6,062 
       USA |         1         12        529      4,210        953          7          0 |     5,712 
       VNM |        10         58        250      5,212          1          0          0 |     5,531 
       XKX |         1         46      1,834      2,862         83          0          0 |     4,826 
-----------+-----------------------------------------------------------------------------+----------
     Total |     5,788     20,803    148,390    244,354     47,962      1,716          5 |   469,018 

. 
. tab countrycode idgrade if national_level==0

WB country |
   code (3 |                             Grade ID
  letters) |   Grade 7    Grade 8    Grade 9   Grade 10   Grade 11   Grade 12 |     Total
-----------+------------------------------------------------------------------+----------
       ARG |        72        259      1,192        129          5          0 |     1,657 
       CHN |        94        667      4,813      4,072        189          6 |     9,841 
       ESP |        34      2,514      6,994     22,760         28          0 |    32,330 
-----------+------------------------------------------------------------------+----------
     Total |       200      3,440     12,999     26,961        222          6 |    43,828 

~~~~

**Harmonization** of proficiency (done on-the-fly):

~~~~

      sdg411_read_01 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
      Non-proficient |    149,953       29.24       29.24
          Proficient |    362,893       70.76      100.00
---------------------+-----------------------------------
               Total |    512,846      100.00

         bmp_read_01 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
          Proficient |    362,893       70.76       70.76
      Non-proficient |    149,953       29.24      100.00
---------------------+-----------------------------------
               Total |    512,846      100.00

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
fgt1_read_01 |    149,953    .1728606    .1361365   3.00e-09          1

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
fgt2_read_01 |    149,953    .0484138    .0720889   8.97e-18          1

      sdg411_read_02 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
      Non-proficient |    150,609       29.37       29.37
          Proficient |    362,237       70.63      100.00
---------------------+-----------------------------------
               Total |    512,846      100.00

         bmp_read_02 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
          Proficient |    362,237       70.63       70.63
      Non-proficient |    150,609       29.37      100.00
---------------------+-----------------------------------
               Total |    512,846      100.00

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
fgt1_read_02 |    150,609     .171829     .136055   3.00e-09          1

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
fgt2_read_02 |    150,609    .0480361    .0716278   8.97e-18          1

      sdg411_read_03 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
      Non-proficient |    149,663       29.18       29.18
          Proficient |    363,183       70.82      100.00
---------------------+-----------------------------------
               Total |    512,846      100.00

         bmp_read_03 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
          Proficient |    363,183       70.82       70.82
      Non-proficient |    149,663       29.18      100.00
---------------------+-----------------------------------
               Total |    512,846      100.00

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
fgt1_read_03 |    149,663    .1726433    .1362591   3.00e-09          1

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
fgt2_read_03 |    149,663    .0483721    .0723975   8.97e-18          1

      sdg411_read_04 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
      Non-proficient |    150,514       29.35       29.35
          Proficient |    362,332       70.65      100.00
---------------------+-----------------------------------
               Total |    512,846      100.00

         bmp_read_04 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
          Proficient |    362,332       70.65       70.65
      Non-proficient |    150,514       29.35      100.00
---------------------+-----------------------------------
               Total |    512,846      100.00

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
fgt1_read_04 |    150,514    .1731576    .1362775   3.00e-09          1

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
fgt2_read_04 |    150,514     .048555    .0725185   8.97e-18          1

      sdg411_read_05 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
      Non-proficient |    150,462       29.34       29.34
          Proficient |    362,384       70.66      100.00
---------------------+-----------------------------------
               Total |    512,846      100.00

         bmp_read_05 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
          Proficient |    362,384       70.66       70.66
      Non-proficient |    150,462       29.34      100.00
---------------------+-----------------------------------
               Total |    512,846      100.00

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
fgt1_read_05 |    150,462    .1718099    .1354899   3.00e-09          1

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
fgt2_read_05 |    150,462     .047876    .0712796   8.97e-18          1

      sdg411_read_06 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
      Non-proficient |    150,182       29.28       29.28
          Proficient |    362,664       70.72      100.00
---------------------+-----------------------------------
               Total |    512,846      100.00

         bmp_read_06 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
          Proficient |    362,664       70.72       70.72
      Non-proficient |    150,182       29.28      100.00
---------------------+-----------------------------------
               Total |    512,846      100.00

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
fgt1_read_06 |    150,182    .1726085    .1356241   3.00e-09          1

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
fgt2_read_06 |    150,182    .0481875    .0716161   8.97e-18          1

      sdg411_read_07 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
      Non-proficient |    150,147       29.28       29.28
          Proficient |    362,699       70.72      100.00
---------------------+-----------------------------------
               Total |    512,846      100.00

         bmp_read_07 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
          Proficient |    362,699       70.72       70.72
      Non-proficient |    150,147       29.28      100.00
---------------------+-----------------------------------
               Total |    512,846      100.00

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
fgt1_read_07 |    150,147    .1725006    .1359766   3.00e-09          1

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
fgt2_read_07 |    150,147     .048246    .0719115   8.97e-18          1

      sdg411_read_08 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
      Non-proficient |    150,232       29.29       29.29
          Proficient |    362,614       70.71      100.00
---------------------+-----------------------------------
               Total |    512,846      100.00

         bmp_read_08 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
          Proficient |    362,614       70.71       70.71
      Non-proficient |    150,232       29.29      100.00
---------------------+-----------------------------------
               Total |    512,846      100.00

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
fgt1_read_08 |    150,232    .1725193    .1362418   3.00e-09          1

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
fgt2_read_08 |    150,232    .0483246    .0724629   8.97e-18          1

      sdg411_read_09 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
      Non-proficient |    150,015       29.25       29.25
          Proficient |    362,831       70.75      100.00
---------------------+-----------------------------------
               Total |    512,846      100.00

         bmp_read_09 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
          Proficient |    362,831       70.75       70.75
      Non-proficient |    150,015       29.25      100.00
---------------------+-----------------------------------
               Total |    512,846      100.00

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
fgt1_read_09 |    150,015    .1722268    .1361284   3.00e-09          1

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
fgt2_read_09 |    150,015    .0481929    .0720687   8.97e-18          1

      sdg411_read_10 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
      Non-proficient |    150,183       29.28       29.28
          Proficient |    362,663       70.72      100.00
---------------------+-----------------------------------
               Total |    512,846      100.00

         bmp_read_10 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
          Proficient |    362,663       70.72       70.72
      Non-proficient |    150,183       29.28      100.00
---------------------+-----------------------------------
               Total |    512,846      100.00

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
fgt1_read_10 |    150,183    .1725972    .1362014   3.00e-09          1

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
fgt2_read_10 |    150,183    .0483405    .0723288   8.97e-18          1



     +--------------------------------------------------------------+
     |  idgrade   prefix                    harmonization_condition |
     |--------------------------------------------------------------|
  1. |  Grade 7     lp01   read_01 = (score_pisa_read_01 >= 407.47) |
  2. |  Grade 7     lp02   read_02 = (score_pisa_read_02 >= 407.47) |
  3. |  Grade 7     lp03   read_03 = (score_pisa_read_03 >= 407.47) |
  4. |  Grade 7     lp04   read_04 = (score_pisa_read_04 >= 407.47) |
  5. |  Grade 7     lp05   read_05 = (score_pisa_read_05 >= 407.47) |
     |--------------------------------------------------------------|
  6. |  Grade 7     lp06   read_06 = (score_pisa_read_06 >= 407.47) |
  7. |  Grade 7     lp07   read_07 = (score_pisa_read_07 >= 407.47) |
  8. |  Grade 7     lp08   read_08 = (score_pisa_read_08 >= 407.47) |
  9. |  Grade 7     lp09   read_09 = (score_pisa_read_09 >= 407.47) |
 10. |  Grade 7     lp10   read_10 = (score_pisa_read_10 >= 407.47) |
     |--------------------------------------------------------------|
 11. |  Grade 8     lp01   read_01 = (score_pisa_read_01 >= 407.47) |
 12. |  Grade 8     lp02   read_02 = (score_pisa_read_02 >= 407.47) |
 13. |  Grade 8     lp03   read_03 = (score_pisa_read_03 >= 407.47) |
 14. |  Grade 8     lp04   read_04 = (score_pisa_read_04 >= 407.47) |
 15. |  Grade 8     lp05   read_05 = (score_pisa_read_05 >= 407.47) |
     |--------------------------------------------------------------|
 16. |  Grade 8     lp06   read_06 = (score_pisa_read_06 >= 407.47) |
 17. |  Grade 8     lp07   read_07 = (score_pisa_read_07 >= 407.47) |
 18. |  Grade 8     lp08   read_08 = (score_pisa_read_08 >= 407.47) |
 19. |  Grade 8     lp09   read_09 = (score_pisa_read_09 >= 407.47) |
 20. |  Grade 8     lp10   read_10 = (score_pisa_read_10 >= 407.47) |
     |--------------------------------------------------------------|
 21. |  Grade 9     lp01   read_01 = (score_pisa_read_01 >= 407.47) |
 22. |  Grade 9     lp02   read_02 = (score_pisa_read_02 >= 407.47) |
 23. |  Grade 9     lp03   read_03 = (score_pisa_read_03 >= 407.47) |
 24. |  Grade 9     lp04   read_04 = (score_pisa_read_04 >= 407.47) |
 25. |  Grade 9     lp05   read_05 = (score_pisa_read_05 >= 407.47) |
     |--------------------------------------------------------------|
 26. |  Grade 9     lp06   read_06 = (score_pisa_read_06 >= 407.47) |
 27. |  Grade 9     lp07   read_07 = (score_pisa_read_07 >= 407.47) |
 28. |  Grade 9     lp08   read_08 = (score_pisa_read_08 >= 407.47) |
 29. |  Grade 9     lp09   read_09 = (score_pisa_read_09 >= 407.47) |
 30. |  Grade 9     lp10   read_10 = (score_pisa_read_10 >= 407.47) |
     |--------------------------------------------------------------|
 31. | Grade 10     lp01   read_01 = (score_pisa_read_01 >= 407.47) |
 32. | Grade 10     lp02   read_02 = (score_pisa_read_02 >= 407.47) |
 33. | Grade 10     lp03   read_03 = (score_pisa_read_03 >= 407.47) |
 34. | Grade 10     lp04   read_04 = (score_pisa_read_04 >= 407.47) |
 35. | Grade 10     lp05   read_05 = (score_pisa_read_05 >= 407.47) |
     |--------------------------------------------------------------|
 36. | Grade 10     lp06   read_06 = (score_pisa_read_06 >= 407.47) |
 37. | Grade 10     lp07   read_07 = (score_pisa_read_07 >= 407.47) |
 38. | Grade 10     lp08   read_08 = (score_pisa_read_08 >= 407.47) |
 39. | Grade 10     lp09   read_09 = (score_pisa_read_09 >= 407.47) |
 40. | Grade 10     lp10   read_10 = (score_pisa_read_10 >= 407.47) |
     |--------------------------------------------------------------|
 41. | Grade 11     lp01   read_01 = (score_pisa_read_01 >= 407.47) |
 42. | Grade 11     lp02   read_02 = (score_pisa_read_02 >= 407.47) |
 43. | Grade 11     lp03   read_03 = (score_pisa_read_03 >= 407.47) |
 44. | Grade 11     lp04   read_04 = (score_pisa_read_04 >= 407.47) |
 45. | Grade 11     lp05   read_05 = (score_pisa_read_05 >= 407.47) |
     |--------------------------------------------------------------|
 46. | Grade 11     lp06   read_06 = (score_pisa_read_06 >= 407.47) |
 47. | Grade 11     lp07   read_07 = (score_pisa_read_07 >= 407.47) |
 48. | Grade 11     lp08   read_08 = (score_pisa_read_08 >= 407.47) |
 49. | Grade 11     lp09   read_09 = (score_pisa_read_09 >= 407.47) |
 50. | Grade 11     lp10   read_10 = (score_pisa_read_10 >= 407.47) |
     |--------------------------------------------------------------|
 51. | Grade 12     lp01   read_01 = (score_pisa_read_01 >= 407.47) |
 52. | Grade 12     lp02   read_02 = (score_pisa_read_02 >= 407.47) |
 53. | Grade 12     lp03   read_03 = (score_pisa_read_03 >= 407.47) |
 54. | Grade 12     lp04   read_04 = (score_pisa_read_04 >= 407.47) |
 55. | Grade 12     lp05   read_05 = (score_pisa_read_05 >= 407.47) |
     |--------------------------------------------------------------|
 56. | Grade 12     lp06   read_06 = (score_pisa_read_06 >= 407.47) |
 57. | Grade 12     lp07   read_07 = (score_pisa_read_07 >= 407.47) |
 58. | Grade 12     lp08   read_08 = (score_pisa_read_08 >= 407.47) |
 59. | Grade 12     lp09   read_09 = (score_pisa_read_09 >= 407.47) |
 60. | Grade 12     lp10   read_10 = (score_pisa_read_10 >= 407.47) |
     |--------------------------------------------------------------|
 61. | Grade 13     lp01   read_01 = (score_pisa_read_01 >= 407.47) |
 62. | Grade 13     lp02   read_02 = (score_pisa_read_02 >= 407.47) |
 63. | Grade 13     lp03   read_03 = (score_pisa_read_03 >= 407.47) |
 64. | Grade 13     lp04   read_04 = (score_pisa_read_04 >= 407.47) |
 65. | Grade 13     lp05   read_05 = (score_pisa_read_05 >= 407.47) |
     |--------------------------------------------------------------|
 66. | Grade 13     lp06   read_06 = (score_pisa_read_06 >= 407.47) |
 67. | Grade 13     lp07   read_07 = (score_pisa_read_07 >= 407.47) |
 68. | Grade 13     lp08   read_08 = (score_pisa_read_08 >= 407.47) |
 69. | Grade 13     lp09   read_09 = (score_pisa_read_09 >= 407.47) |
 70. | Grade 13     lp10   read_10 = (score_pisa_read_10 >= 407.47) |
     +--------------------------------------------------------------+

~~~~
