Documentation of GLAD dataset
=====================================================================


[back to list of assessments](https://github.com/worldbank/GLAD/blob/master/README.md#harmonization)

This dataset is part of the Global Learning Assessment Database (GLAD). It contains microdata from PISA 2018. Each observation corresponds to one learner (student or pupil), and the variables have been harmonized.

**Metadata** stored in this dataset:

~~~~
region:      WLD
year:        2018
assessment:  PISA
master:      v01_M
adaptation:  wrk_A_GLAD
module:      ALL
ttl_info:    Joao Pedro de Azevedo [eduanalytics@worldbank.org]
dofile_info: created by Aishwarya, last modified by Joao Pedro Azevedo on February 5, 2022
lastsave:    26 Apr 2022 15:27:18 by wb255520
~~~~


About the **252 variables** in this dataset:

~~~~
The variables belong to the following variable classifications:
    idvars keyvars valuevars traitvars pisavars samplevars

idvars:     idcntry_raw idschool idlearner
keyvars:    surveyid countrycode national_level
valuevars:  score_pisa_read_01 score_pisa_math_01 score_pisa_scie_01 score_pisa_glcm_01 score_pisa_read_02 score_pisa_math_02 score_pisa_scie_02 score_pisa_glcm_02 score_pisa_read_03 score_pisa_math_03 score_pisa_scie_03 score_pisa_glcm_03 score_pisa_read_04 score_pisa_math_04 score_pisa_scie_04 score_pisa_glcm_04 score_pisa_read_05 score_pisa_math_05 score_pisa_scie_05 score_pisa_glcm_05 score_pisa_read_06 score_pisa_math_06 score_pisa_scie_06 score_pisa_glcm_06 score_pisa_read_07 score_pisa_math_07 score_pisa_scie_07 score_pisa_glcm_07 score_pisa_read_08 score_pisa_math_08 score_pisa_scie_08 score_pisa_glcm_08 score_pisa_read_09 score_pisa_math_09 score_pisa_scie_09 score_pisa_glcm_09 score_pisa_read_10 score_pisa_math_10 score_pisa_scie_10 score_pisa_glcm_10 level_pisa_read_01 level_pisa_math_01 level_pisa_scie_01 level_pisa_glcm_01 level_pisa_read_02 level_pisa_math_02 level_pisa_scie_02 level_pisa_glcm_02 level_pisa_read_03 level_pisa_math_03 level_pisa_scie_03 level_pisa_glcm_03 level_pisa_read_04 level_pisa_math_04 level_pisa_scie_04 level_pisa_glcm_04 level_pisa_read_05 level_pisa_math_05 level_pisa_scie_05 level_pisa_glcm_05 level_pisa_read_06 level_pisa_math_06 level_pisa_scie_06 level_pisa_glcm_06 level_pisa_read_07 level_pisa_math_07 level_pisa_scie_07 level_pisa_glcm_07 level_pisa_read_08 level_pisa_math_08 level_pisa_scie_08 level_pisa_glcm_08 level_pisa_read_09 level_pisa_math_09 level_pisa_scie_09 level_pisa_glcm_09 level_pisa_read_10 level_pisa_math_10 level_pisa_scie_10 level_pisa_glcm_10
traitvars:  idgrade age urban urban_o male escs escs_quintile qescs has_qescs
pisavars: city native language ece school_type school_type_o


Variable         Obs Unique       Mean      Min       Max  Label
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
idcntry_raw   602183     79          .        .         .  Country ID, as coded in rawdata
idschool      602183  21511   4.52e+07   800002  9.83e+07  School ID
idlearner     602183 602183   4.52e+07   800001  9.83e+07  Learner ID
surveyid      602183      1          .        .         .  Survey ID (Region_Year_Assessment)
countrycode   602183     77          .        .         .  WB country code (3 letters)
national_l~l  602183      2   .9556331        0         1  Idcntry_raw is a national level
score_p~d_01  560981 310007    454.154        0   887.692  Plausible value 1: PISA score for read
score_p~h_01  596924 312368   460.8834   24.743   888.064  Plausible value 1: PISA score for math
score_p~e_01  596924 310049   460.4373   58.736   886.081  Plausible value 1: PISA score for science
score_p~m_01       0      0          .        .         .  Plausible value 1: PISA score for global competences
score_p~d_02  560981 310135   454.1809   28.726   898.478  Plausible value 2: PISA score for read
score_p~h_02  596924 312662   460.7359   25.561   916.276  Plausible value 2: PISA score for math
score_p~e_02  596924 309838   460.4848   25.972   881.367  Plausible value 2: PISA score for science
score_p~m_02       0      0          .        .         .  Plausible value 2: PISA score for global competences
score_p~d_03  560981 309438   454.1279     .341   888.223  Plausible value 3: PISA score for read
score_p~h_03  596924 312942   460.7728        0   910.443  Plausible value 3: PISA score for math
score_p~e_03  596924 309867   460.3862   21.188   883.583  Plausible value 3: PISA score for science
score_p~m_03       0      0          .        .         .  Plausible value 3: PISA score for global competences
score_p~d_04  560981 309615   454.1259        0   885.259  Plausible value 4: PISA score for read
score_p~h_04  596924 312414   460.8547   29.973   878.031  Plausible value 4: PISA score for math
score_p~e_04  596924 309611   460.5487   34.649   863.943  Plausible value 4: PISA score for science
score_p~m_04       0      0          .        .         .  Plausible value 4: PISA score for global competences
score_p~d_05  560981 309784   454.2005   16.891   885.244  Plausible value 5: PISA score for read
score_p~h_05  596924 312800   460.6189    8.269   915.101  Plausible value 5: PISA score for math
score_p~e_05  596924 309719   460.5572   28.601   874.875  Plausible value 5: PISA score for science
score_p~m_05       0      0          .        .         .  Plausible value 5: PISA score for global competences
score_p~d_06  560981 310073   454.2516   31.955   873.895  Plausible value 6: PISA score for read
score_p~h_06  596924 312548   460.8234    5.215   870.202  Plausible value 6: PISA score for math
score_p~e_06  596924 309414   460.4666   53.253   891.497  Plausible value 6: PISA score for science
score_p~m_06       0      0          .        .         .  Plausible value 6: PISA score for global competences
score_p~d_07  560981 309917   454.1527   14.165   890.932  Plausible value 7: PISA score for read
score_p~h_07  596924 312822   461.0387     3.21   890.587  Plausible value 7: PISA score for math
score_p~e_07  596924 309744   460.5889    7.981   877.496  Plausible value 7: PISA score for science
score_p~m_07       0      0          .        .         .  Plausible value 7: PISA score for global competences
score_p~d_08  560981 309843   454.1176        0   928.687  Plausible value 8: PISA score for read
score_p~h_08  596924 312460   460.7842        0     889.8  Plausible value 8: PISA score for math
score_p~e_08  596924 309921   460.4995   25.047   891.394  Plausible value 8: PISA score for science
score_p~m_08       0      0          .        .         .  Plausible value 8: PISA score for global competences
score_p~d_09  560981 309866   454.0958        0   862.252  Plausible value 9: PISA score for read
score_p~h_09  596924 312427   460.5757   26.576   899.891  Plausible value 9: PISA score for math
score_p~e_09  596924 309701   460.5079   58.448   883.038  Plausible value 9: PISA score for science
score_p~m_09       0      0          .        .         .  Plausible value 9: PISA score for global competences
score_p~d_10  560981 309914   454.1023        0   884.019  Plausible value 10: PISA score for read
score_p~h_10  596924 312628   460.7051   24.916    894.59  Plausible value 10: PISA score for math
score_p~e_10  596924 309965    460.493     7.07   906.009  Plausible value 10: PISA score for science
score_p~m_10       0      0          .        .         .  Plausible value 10: PISA score for global competences
level_p~d_01  560981      9   2.143023       -2         6  Plausible value 1: PISA level for read
level_p~h_01  596924      7   2.219063        0         6  Plausible value 1: PISA level for math
level_p~e_01  596924      8   2.181191       -1         6  Plausible value 1: PISA level for science
level_p~m_01       0      0          .        .         .  Plausible value 1: PISA level for global competences
level_p~d_02  560981      9   2.143131       -2         6  Plausible value 2: PISA level for read
level_p~h_02  596924      7    2.21755        0         6  Plausible value 2: PISA level for math
level_p~e_02  596924      8   2.181854       -1         6  Plausible value 2: PISA level for science
level_p~m_02       0      0          .        .         .  Plausible value 2: PISA level for global competences
level_p~d_03  560981      9    2.14144       -2         6  Plausible value 3: PISA level for read
level_p~h_03  596924      7   2.217977        0         6  Plausible value 3: PISA level for math
level_p~e_03  596924      8   2.180909       -1         6  Plausible value 3: PISA level for science
level_p~m_03       0      0          .        .         .  Plausible value 3: PISA level for global competences
level_p~d_04  560981      9   2.142534       -2         6  Plausible value 4: PISA level for read
level_p~h_04  596924      7   2.219748        0         6  Plausible value 4: PISA level for math
level_p~e_04  596924      8   2.183182       -1         6  Plausible value 4: PISA level for science
level_p~m_04       0      0          .        .         .  Plausible value 4: PISA level for global competences
level_p~d_05  560981      9   2.142463       -2         6  Plausible value 5: PISA level for read
level_p~h_05  596924      7   2.216296        0         6  Plausible value 5: PISA level for math
level_p~e_05  596924      8   2.183191       -1         6  Plausible value 5: PISA level for science
level_p~m_05       0      0          .        .         .  Plausible value 5: PISA level for global competences
level_p~d_06  560981      9   2.144039       -2         6  Plausible value 6: PISA level for read
level_p~h_06  596924      7   2.218612        0         6  Plausible value 6: PISA level for math
level_p~e_06  596924      8   2.182295       -1         6  Plausible value 6: PISA level for science
level_p~m_06       0      0          .        .         .  Plausible value 6: PISA level for global competences
level_p~d_07  560981      9   2.141985       -2         6  Plausible value 7: PISA level for read
level_p~h_07  596924      7   2.222558        0         6  Plausible value 7: PISA level for math
level_p~e_07  596924      8   2.183358       -1         6  Plausible value 7: PISA level for science
level_p~m_07       0      0          .        .         .  Plausible value 7: PISA level for global competences
level_p~d_08  560981      9    2.14193       -2         6  Plausible value 8: PISA level for read
level_p~h_08  596924      7   2.217889        0         6  Plausible value 8: PISA level for math
level_p~e_08  596924      8   2.182125       -1         6  Plausible value 8: PISA level for science
level_p~m_08       0      0          .        .         .  Plausible value 8: PISA level for global competences
level_p~d_09  560981      9   2.141718       -2         6  Plausible value 9: PISA level for read
level_p~h_09  596924      7   2.214562        0         6  Plausible value 9: PISA level for math
level_p~e_09  596924      8   2.182368       -1         6  Plausible value 9: PISA level for science
level_p~m_09       0      0          .        .         .  Plausible value 9: PISA level for global competences
level_p~d_10  560981      9    2.14172       -2         6  Plausible value 10: PISA level for read
level_p~h_10  596924      7   2.217314        0         6  Plausible value 10: PISA level for math
level_p~e_10  596924      8   2.182207       -1         6  Plausible value 10: PISA level for science
level_p~m_10       0      0          .        .         .  Plausible value 10: PISA level for global competences
idgrade       602183      7   9.670278        7        13  Grade ID
age           602183     16   15.78959    15.08     16.33  Learner age at time of assessment
urban         568890      2   .9052471        0         1  School is located in urban/rural area
urban_o       586885      7          .        .         .  Original variable of urban: population size of the school area
male          602181      2   .5010819        0         1  Learner gender is male/female
escs          587979  56309  -.2828029  -8.1734    4.2051  Index of economic, social and cultural status
escs_quint~e  587979      5   3.037865        1         5  Income quintile
qescs         587926      5    3.02632        1         5  Quintiles of Socio-Economic Status
has_qescs     602183      2   .9763245        0         1  Dummy variable for observations with a valid QESCS
city          568890      3   1.665802        1         3  School is located in city (1), town (2), village (3)
native        569841      3   1.184578        1         3  Learner is native (1), second-generation (2), first-generation (3)
language      587449      2   1.172694        1         2  Language of test (1), other language (2)
ece           488945      3   2.803164        1         3  Attended early childhood education
school_type   561018      3   2.720009        1         3  Type of ownership and decision-making power of schools
school_typ~o  543181      2   1.197768        1         2  Type of school - Public or Private
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


Plus the variables merged-on-the-fly, which are:

traitvars:  lp01_threshold_var lp02_threshold_var lp03_threshold_var lp04_threshold_var lp05_threshold_var lp06_threshold_var lp07_threshold_var lp08_threshold_var lp09_threshold_var lp10_threshold_var lp01_threshold_val lp02_threshold_val lp03_threshold_val lp04_threshold_val lp05_threshold_val lp06_threshold_val lp07_threshold_val lp08_threshold_val lp09_threshold_val lp10_threshold_val lp01_threshold_res lp02_threshold_res lp03_threshold_res lp04_threshold_res lp05_threshold_res lp06_threshold_res lp07_threshold_res lp08_threshold_res lp09_threshold_res lp10_threshold_res
valuevars:  sdg411_read_01 bmp_read_01 fgt1_read_01 fgt2_read_01 sdg411_read_02 bmp_read_02 fgt1_read_02 fgt2_read_02 sdg411_read_03 bmp_read_03 fgt1_read_03 fgt2_read_03 sdg411_read_04 bmp_read_04 fgt1_read_04 fgt2_read_04 sdg411_read_05 bmp_read_05 fgt1_read_05 fgt2_read_05 sdg411_read_06 bmp_read_06 fgt1_read_06 fgt2_read_06 sdg411_read_07 bmp_read_07 fgt1_read_07 fgt2_read_07 sdg411_read_08 bmp_read_08 fgt1_read_08 fgt2_read_08 sdg411_read_09 bmp_read_09 fgt1_read_09 fgt2_read_09 sdg411_read_10 bmp_read_10 fgt1_read_10 fgt2_read_10
~~~~

About the **602,183 observations** in this dataset:

~~~~
. tab countrycode idgrade if national_level==1

WB country |
   code (3 |                                   Grade ID
  letters) |   Grade 7    Grade 8    Grade 9   Grade 10   Grade 11   Grade 12   Grade 13 |     Total
-----------+-----------------------------------------------------------------------------+----------
       ALB |        11         55      2,204      4,051         37          1          0 |     6,359 
       ARE |       111        427      2,460     10,753      5,231        295          0 |    19,277 
       ARG |       131        781      2,233      8,635        167          1          0 |    11,948 
       AUS |         0          9      1,588     11,661      1,010          5          0 |    14,273 
       BEL |        26        491      2,154      5,533        105          0          0 |     8,309 
       BGR |         9        132      4,934        218          1          0          0 |     5,294 
       BIH |         1         13        976      5,482          8          0          0 |     6,480 
       BLR |         4         53      2,456      3,290          0          0          0 |     5,803 
       BRA |       378        744      1,312      3,430      4,608        219          0 |    10,691 
       BRN |         2         32        442      4,076      1,996        272          8 |     6,828 
       CAN |        72        201      2,541     19,600        230          9          0 |    22,653 
       CHE |        23        528      3,263      1,966         40          2          0 |     5,822 
       CHL |        37        180      1,496      5,505        403          0          0 |     7,621 
       COL |       293        734      1,614      3,428      1,453          0          0 |     7,522 
       CRI |       315        979      2,826      3,092          9          0          0 |     7,221 
       CZE |        25        142      2,920      3,932          0          0          0 |     7,019 
       DEU |        23        426      2,497      2,412         91          2          0 |     5,451 
       DNK |        15      1,306      6,267         68          0          1          0 |     7,657 
       DOM |       307        635      1,340      2,604        721         67          0 |     5,674 
       ESP |        13      1,785      7,591     26,537         17          0          0 |    35,943 
       EST |        18      1,114      4,123         60          1          0          0 |     5,316 
       FIN |        18        734      4,893          4          0          0          0 |     5,649 
       FRA |         4         59      1,137      4,912        190          6          0 |     6,308 
       GBR |         0          0          1         98     11,882      1,837          0 |    13,818 
       GEO |         5         27        760      4,723         57          0          0 |     5,572 
       GRC |         3         24        124      6,252          0          0          0 |     6,403 
       HKG |        56        315      1,507      4,108         51          0          0 |     6,037 
       HRV |         2         13      5,269      1,325          0          0          0 |     6,609 
       HUN |        47        277      3,800      1,006          2          0          0 |     5,132 
       IDN |       209        921      5,178      5,382        349         59          0 |    12,098 
       IRL |         1        115      3,533      1,479        449          0          0 |     5,577 
       ISL |         0          0          0      3,274         22          0          0 |     3,296 
       ISR |         1          6      1,052      5,516         46          2          0 |     6,623 
       ITA |         0         75      1,716      9,382        612          0          0 |    11,785 
       JOR |        32        212      1,064      7,655          0          0          0 |     8,963 
       JPN |         0          0          0      6,109          0          0          0 |     6,109 
       KAZ |        18        339      8,738     10,245        162          5          0 |    19,507 
       KOR |         0          0        886      5,759          5          0          0 |     6,650 
       LBN |       266        428        829      3,406        680          5          0 |     5,614 
       LTU |         2        135      6,155        593          0          0          0 |     6,885 
       LUX |        18        519      2,515      2,121         57          0          0 |     5,230 
       LVA |        33        494      4,597        134          1          0          0 |     5,259 
       MAC |        71        356      1,121      2,187         39          1          0 |     3,775 
       MAR |       557        963      2,221      2,559        514          0          0 |     6,814 
       MDA |        10        331      4,437        588          1          0          0 |     5,367 
       MEX |        47        128        890      6,180         44         10          0 |     7,299 
       MKD |         0         10      5,368        191          0          0          0 |     5,569 
       MLT |         0          0          4        169      3,186          4          0 |     3,363 
       MNE |         0          0         55      6,420        191          0          0 |     6,666 
       MYS |         0          0        273      5,821         17          0          0 |     6,111 
       NLD |         4        136      1,857      2,716         51          1          0 |     4,765 
       NOR |         0          0         19      5,787          7          0          0 |     5,813 
       NZL |         0          0          6        385      5,521        260          1 |     6,173 
       PAN |       164        390      1,314      4,170        230          2          0 |     6,270 
       PER |       105        316        821      3,361      1,483          0          0 |     6,086 
       PHL |       316        913      3,693      2,278         30          3          0 |     7,233 
       POL |         3        119      5,482         21          0          0          0 |     5,625 
       PRT |       118        398        934      3,586         14          0          0 |     5,050 
       QAT |       167        593      2,525      8,774      1,764          5          0 |    13,828 
       ROU |        23        138      4,124        789          1          0          0 |     5,075 
       RUS |        23        591      6,178        809          7          0          0 |     7,608 
       SAU |        54        165        635      5,041        233          8          0 |     6,136 
       SGP |         2         75        476      6,098         25          0          0 |     6,676 
       SRB |         2         13      5,853        741          0          0          0 |     6,609 
       SVK |       117        231      2,259      3,251        107          0          0 |     5,965 
       SVN |         9         18        140      6,214         20          0          0 |     6,401 
       SWE |         0        108      5,334         62          0          0          0 |     5,504 
       THA |        13         67      1,806      6,485        262          0          0 |     8,633 
       TUR |         3         19      1,295      5,360        207          6          0 |     6,890 
       TWN |         0          7      2,335      4,899          2          0          0 |     7,243 
       UKR |         0         21      1,703      2,467         25          0          0 |     4,216 
       URY |       206        556      1,104      3,363         34          0          0 |     5,263 
       USA |         0          8        401      3,598        826          5          0 |     4,838 
       VNM |        11         37        214      4,996          1          0          0 |     5,259 
       XKX |         0         26      1,376      3,572         83          1          0 |     5,058 
-----------+-----------------------------------------------------------------------------+----------
     Total |     4,554     22,193    177,244    322,754     45,618      3,094          9 |   575,466 

. 
. tab countrycode idgrade if national_level==0

WB country |
   code (3 |                             Grade ID
  letters) |   Grade 7    Grade 8    Grade 9   Grade 10   Grade 11   Grade 12 |     Total
-----------+------------------------------------------------------------------+----------
       AZE |        12        134      2,313      4,317         51          0 |     6,827 
       CHN |        26        190      4,102      7,601        132          7 |    12,058 
       RUS |         6        683      6,732        409          2          0 |     7,832 
-----------+------------------------------------------------------------------+----------
     Total |        44      1,007     13,147     12,327        185          7 |    26,717 

~~~~

**Harmonization** of proficiency (done on-the-fly):

~~~~

      sdg411_read_01 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
      Non-proficient |    195,410       32.45       32.45
          Proficient |    365,571       60.71       93.16
 Missing score/level |     41,202        6.84      100.00
---------------------+-----------------------------------
               Total |    602,183      100.00

         bmp_read_01 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
          Proficient |    365,571       60.71       60.71
      Non-proficient |    195,410       32.45       93.16
Non-harmonized grade |     41,202        6.84      100.00
---------------------+-----------------------------------
               Total |    602,183      100.00

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
fgt1_read_01 |    195,410    .1732223    .1272127   3.00e-09          1

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
fgt2_read_01 |    195,410     .046189    .0612786   8.97e-18          1

      sdg411_read_02 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
      Non-proficient |    195,401       32.45       32.45
          Proficient |    365,580       60.71       93.16
 Missing score/level |     41,202        6.84      100.00
---------------------+-----------------------------------
               Total |    602,183      100.00

         bmp_read_02 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
          Proficient |    365,580       60.71       60.71
      Non-proficient |    195,401       32.45       93.16
Non-harmonized grade |     41,202        6.84      100.00
---------------------+-----------------------------------
               Total |    602,183      100.00

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
fgt1_read_02 |    195,401    .1731785    .1270817   3.00e-09   .9295015

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
fgt2_read_02 |    195,401    .0461405    .0611553   8.97e-18   .8639731

      sdg411_read_03 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
      Non-proficient |    195,425       32.45       32.45
          Proficient |    365,556       60.71       93.16
 Missing score/level |     41,202        6.84      100.00
---------------------+-----------------------------------
               Total |    602,183      100.00

         bmp_read_03 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
          Proficient |    365,556       60.71       60.71
      Non-proficient |    195,425       32.45       93.16
Non-harmonized grade |     41,202        6.84      100.00
---------------------+-----------------------------------
               Total |    602,183      100.00

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
fgt1_read_03 |    195,425    .1732797    .1275352   3.00e-09   .9991632

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
fgt2_read_03 |    195,425     .046291    .0614832   8.97e-18    .998327

      sdg411_read_04 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
      Non-proficient |    195,558       32.47       32.47
          Proficient |    365,423       60.68       93.16
 Missing score/level |     41,202        6.84      100.00
---------------------+-----------------------------------
               Total |    602,183      100.00

         bmp_read_04 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
          Proficient |    365,423       60.68       60.68
      Non-proficient |    195,558       32.47       93.16
Non-harmonized grade |     41,202        6.84      100.00
---------------------+-----------------------------------
               Total |    602,183      100.00

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
fgt1_read_04 |    195,558    .1729276    .1275345   3.00e-09          1

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
fgt2_read_04 |    195,558    .0461689    .0615171   8.97e-18          1

      sdg411_read_05 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
      Non-proficient |    195,428       32.45       32.45
          Proficient |    365,553       60.70       93.16
 Missing score/level |     41,202        6.84      100.00
---------------------+-----------------------------------
               Total |    602,183      100.00

         bmp_read_05 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
          Proficient |    365,553       60.70       60.70
      Non-proficient |    195,428       32.45       93.16
Non-harmonized grade |     41,202        6.84      100.00
---------------------+-----------------------------------
               Total |    602,183      100.00

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
fgt1_read_05 |    195,428    .1726981    .1270821   2.46e-06   .9585466

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
fgt2_read_05 |    195,428    .0459744    .0609474   6.04e-12   .9188117

      sdg411_read_06 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
      Non-proficient |    195,239       32.42       32.42
          Proficient |    365,742       60.74       93.16
 Missing score/level |     41,202        6.84      100.00
---------------------+-----------------------------------
               Total |    602,183      100.00

         bmp_read_06 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
          Proficient |    365,742       60.74       60.74
      Non-proficient |    195,239       32.42       93.16
Non-harmonized grade |     41,202        6.84      100.00
---------------------+-----------------------------------
               Total |    602,183      100.00

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
fgt1_read_06 |    195,239     .172977    .1268442   3.00e-09    .921577

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
fgt2_read_06 |    195,239    .0460104    .0609013   8.97e-18   .8493043

      sdg411_read_07 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
      Non-proficient |    195,299       32.43       32.43
          Proficient |    365,682       60.73       93.16
 Missing score/level |     41,202        6.84      100.00
---------------------+-----------------------------------
               Total |    602,183      100.00

         bmp_read_07 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
          Proficient |    365,682       60.73       60.73
      Non-proficient |    195,299       32.43       93.16
Non-harmonized grade |     41,202        6.84      100.00
---------------------+-----------------------------------
               Total |    602,183      100.00

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
fgt1_read_07 |    195,299    .1733132    .1273899   3.00e-09   .9652367

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
fgt2_read_07 |    195,299    .0462656    .0612994   8.97e-18   .9316819

      sdg411_read_08 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
      Non-proficient |    195,506       32.47       32.47
          Proficient |    365,475       60.69       93.16
 Missing score/level |     41,202        6.84      100.00
---------------------+-----------------------------------
               Total |    602,183      100.00

         bmp_read_08 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
          Proficient |    365,475       60.69       60.69
      Non-proficient |    195,506       32.47       93.16
Non-harmonized grade |     41,202        6.84      100.00
---------------------+-----------------------------------
               Total |    602,183      100.00

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
fgt1_read_08 |    195,506    .1729593    .1272123   3.00e-09          1

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
fgt2_read_08 |    195,506    .0460978    .0611939   8.97e-18          1

      sdg411_read_09 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
      Non-proficient |    195,371       32.44       32.44
          Proficient |    365,610       60.71       93.16
 Missing score/level |     41,202        6.84      100.00
---------------------+-----------------------------------
               Total |    602,183      100.00

         bmp_read_09 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
          Proficient |    365,610       60.71       60.71
      Non-proficient |    195,371       32.44       93.16
Non-harmonized grade |     41,202        6.84      100.00
---------------------+-----------------------------------
               Total |    602,183      100.00

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
fgt1_read_09 |    195,371    .1734006    .1275355   3.00e-09          1

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
fgt2_read_09 |    195,371     .046333    .0615337   8.97e-18          1

      sdg411_read_10 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
      Non-proficient |    195,390       32.45       32.45
          Proficient |    365,591       60.71       93.16
 Missing score/level |     41,202        6.84      100.00
---------------------+-----------------------------------
               Total |    602,183      100.00

         bmp_read_10 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
          Proficient |    365,591       60.71       60.71
      Non-proficient |    195,390       32.45       93.16
Non-harmonized grade |     41,202        6.84      100.00
---------------------+-----------------------------------
               Total |    602,183      100.00

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
fgt1_read_10 |    195,390    .1732282    .1273669   3.00e-09          1

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
fgt2_read_10 |    195,390    .0462302    .0613376   8.97e-18          1



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
