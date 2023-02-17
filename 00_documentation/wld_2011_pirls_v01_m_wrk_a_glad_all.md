Documentation of GLAD dataset
=====================================================================


[back to list of assessments](https://github.com/worldbank/GLAD/blob/master/README.md#harmonization)

This dataset is part of the Global Learning Assessment Database (GLAD). It contains microdata from PIRLS 2011. Each observation corresponds to one learner (student or pupil), and the variables have been harmonized.

**Metadata** stored in this dataset:

~~~~
region:      WLD
year:        2011
assessment:  PIRLS
master:      v01_M
adaptation:  wrk_A_GLAD
module:      ALL
ttl_info:    Joao Pedro de Azevedo [eduanalytics@worldbank.org]
dofile_info: last modified by Joao Pedro Azevedo in Feb 05, 2022
lastsave:    11 Feb 2022 19:10:05 by wb255520
~~~~


About the **64 variables** in this dataset:

~~~~
The variables belong to the following variable classifications:
    idvars keyvars valuevars traitvars samplevars

idvars:     idcntry_raw idschool idgrade idclass idlearner
keyvars:    surveyid countrycode national_level
valuevars:  score_pirls_read_01 score_pirls_read_02 score_pirls_read_03 score_pirls_read_04 score_pirls_read_05 level_pirls_read_01 level_pirls_read_02 level_pirls_read_03 level_pirls_read_04 level_pirls_read_05
traitvars:  age urban urban_o1 urban_o2 male escs qescs has_qescs
samplevars: learner_weight jkzone jkrep


Variable         Obs Unique      Mean        Min       Max  Label
---------------------------------------------------------------------------------------------------------------------------------------
idcntry_raw   307747     57  2318.225         31     72401  Country ID, as coded in rawdata
idschool      307747   2037  595.7541          1      9004  School ID
idgrade       307747      3  4.186855          4         6  Grade ID
idclass       307747   4519   59577.7        101    900402  Class ID
idlearner     307747 100520   5957782      10101  9.00e+07  Learner ID
surveyid      307747      1         .          .         .  Survey ID (Region_Year_Assessment)
countrycode   307747     48         .          .         .  WB country code (3 letters)
national_l~l  307747      2  .8863515          0         1  Idcntry_raw is a national level
score_pir~01  307747 270740  503.4933    5.26092  817.3529  Plausible value 01: PIRLS score for read
score_pir~02  307747 270770  502.8786          5   826.471  Plausible value 02: PIRLS score for read
score_pir~03  307747 270673  502.6603          5  845.3605  Plausible value 03: PIRLS score for read
score_pir~04  307747 270521  502.7377          5  862.3774  Plausible value 04: PIRLS score for read
score_pir~05  307747 270767   502.821          5  848.0583  Plausible value 05: PIRLS score for read
level_pir~01  307747      5  2.948724          1         5  Plausible value 01: PIRLS level for read
level_pir~02  307747      5  2.942303          1         5  Plausible value 02: PIRLS level for read
level_pir~03  307747      5  2.939609          1         5  Plausible value 03: PIRLS level for read
level_pir~04  307747      5   2.94164          1         5  Plausible value 04: PIRLS level for read
level_pir~05  307747      5  2.941302          1         5  Plausible value 05: PIRLS level for read
age           306919    142  10.32124          6  17.91667  Learner age at time of assessment
urban         287004      2  .8600124          0         1  School is located in urban/rural area
urban_o1      294550      7         .          .         .  Original variable of urban: population size of the school area
urban_o2      294566      6         .          .         .  Original variable of urban: school is located in urban/rural area
male          307747      2  .5048985          0         1  Learner gender is male/female
escs          291094 109114  .3875538  -3.661336  2.125801  
qescs         291094      5  3.067679          1         5  Quintiles of Socio-Economic Status
has_qescs     307747      2  .9458874          0         1  Dummy variable for observations with a valid QESCS
learner_we~t  307747  10409  65.49117          1  4916.817  Total learner weight
jkzone        307747     75  35.81449          1        75  Jackknife zone
jkrep         307747      2  .4998067          0         1  Jackknife replicate code
---------------------------------------------------------------------------------------------------------------------------------------


Plus the variables merged-on-the-fly, which are:

traitvars:  lp01_threshold_var lp02_threshold_var lp03_threshold_var lp04_threshold_var lp05_threshold_var lp01_threshold_val lp02_threshold_val lp03_threshold_val lp04_threshold_val lp05_threshold_val lp01_threshold_res lp02_threshold_res lp03_threshold_res lp04_threshold_res lp05_threshold_res
valuevars:  sdg411_read_01 bmp_read_01 fgt1_read_01 fgt2_read_01 sdg411_read_02 bmp_read_02 fgt1_read_02 fgt2_read_02 sdg411_read_03 bmp_read_03 fgt1_read_03 fgt2_read_03 sdg411_read_04 bmp_read_04 fgt1_read_04 fgt2_read_04 sdg411_read_05 bmp_read_05 fgt1_read_05 fgt2_read_05
~~~~

About the **307,747 observations** in this dataset:

~~~~
. tab countrycode idgrade if national_level==1

WB country |
   code (3 |             Grade ID
  letters) |         4          5          6 |     Total
-----------+---------------------------------+----------
       ARE |    14,618          0          0 |    14,618 
       AUS |     6,126          0          0 |     6,126 
       AUT |     4,670          0          0 |     4,670 
       AZE |     4,881          0          0 |     4,881 
       BEL |     3,727          0          0 |     3,727 
       BGR |     5,261          0          0 |     5,261 
       BWA |         0          0      4,197 |     4,197 
       CAN |    23,206          0          0 |    23,206 
       COL |     3,966          0          0 |     3,966 
       CZE |     4,556          0          0 |     4,556 
       DEU |     4,000          0          0 |     4,000 
       DNK |     4,594          0          0 |     4,594 
       ESP |     8,580          0          0 |     8,580 
       FIN |     4,640          0          0 |     4,640 
       FRA |     4,438          0          0 |     4,438 
       GBR |     3,586      3,927          0 |     7,513 
       GEO |     4,796          0          0 |     4,796 
       HKG |     3,875          0          0 |     3,875 
       HND |         0          0      3,893 |     3,893 
       HRV |     4,587          0          0 |     4,587 
       HUN |     5,204          0          0 |     5,204 
       IDN |     4,791          0          0 |     4,791 
       IRL |     4,524          0          0 |     4,524 
       IRN |     5,758          0          0 |     5,758 
       ISR |     4,186          0          0 |     4,186 
       ITA |     4,189          0          0 |     4,189 
       KWT |         0          0      3,363 |     3,363 
       LTU |     4,661          0          0 |     4,661 
       MAR |     7,805          0      7,183 |    14,988 
       MLT |         0      3,598          0 |     3,598 
       NLD |     3,995          0          0 |     3,995 
       NOR |     3,190          0          0 |     3,190 
       NZL |         0      5,644          0 |     5,644 
       OMN |    10,394          0          0 |    10,394 
       POL |     5,005          0          0 |     5,005 
       PRT |     4,085          0          0 |     4,085 
       QAT |     4,120          0          0 |     4,120 
       ROU |     4,665          0          0 |     4,665 
       RUS |     4,461          0          0 |     4,461 
       SAU |     4,507          0          0 |     4,507 
       SGP |     6,367          0          0 |     6,367 
       SVK |     5,630          0          0 |     5,630 
       SVN |     4,512          0          0 |     4,512 
       SWE |     4,622          0          0 |     4,622 
       TTO |     3,948          0          0 |     3,948 
       USA |    12,726          0          0 |    12,726 
       ZAF |         0      3,515          0 |     3,515 
-----------+---------------------------------+----------
     Total |   237,452     16,684     18,636 |   272,772 

. 
. tab countrycode idgrade if national_level==0

WB country |
   code (3 |       Grade ID
  letters) |         4          5 |     Total
-----------+----------------------+----------
       ARE |    10,207          0 |    10,207 
       CAN |    12,594          0 |    12,594 
       ESP |     4,333          0 |     4,333 
       MLT |         0      3,548 |     3,548 
       TWN |     4,293          0 |     4,293 
-----------+----------------------+----------
     Total |    31,427      3,548 |    34,975 

~~~~

**Harmonization** of proficiency (done on-the-fly):

~~~~

      sdg411_read_01 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
      Non-proficient |     45,701       14.85       14.85
          Proficient |    262,046       85.15      100.00
---------------------+-----------------------------------
               Total |    307,747      100.00

         bmp_read_01 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
          Proficient |    262,046       85.15       85.15
      Non-proficient |     45,701       14.85      100.00
---------------------+-----------------------------------
               Total |    307,747      100.00

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
fgt1_read_01 |     45,701     .173916    .1456214   3.87e-06   .9868477

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
fgt2_read_01 |     45,701    .0514519    .0816741   1.50e-11   .9738684

      sdg411_read_02 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
      Non-proficient |     46,399       15.08       15.08
          Proficient |    261,348       84.92      100.00
---------------------+-----------------------------------
               Total |    307,747      100.00

         bmp_read_02 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
          Proficient |    261,348       84.92       84.92
      Non-proficient |     46,399       15.08      100.00
---------------------+-----------------------------------
               Total |    307,747      100.00

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
fgt1_read_02 |     46,399    .1767747    .1479537   2.75e-07      .9875

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
fgt2_read_02 |     46,399    .0531391    .0844526   7.56e-14   .9751562

      sdg411_read_03 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
      Non-proficient |     46,364       15.07       15.07
          Proficient |    261,383       84.93      100.00
---------------------+-----------------------------------
               Total |    307,747      100.00

         bmp_read_03 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
          Proficient |    261,383       84.93       84.93
      Non-proficient |     46,364       15.07      100.00
---------------------+-----------------------------------
               Total |    307,747      100.00

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
fgt1_read_03 |     46,364    .1765039    .1483677   4.10e-06      .9875

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
fgt2_read_03 |     46,364    .0531661    .0846056   1.68e-11   .9751562

      sdg411_read_04 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
      Non-proficient |     46,058       14.97       14.97
          Proficient |    261,689       85.03      100.00
---------------------+-----------------------------------
               Total |    307,747      100.00

         bmp_read_04 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
          Proficient |    261,689       85.03       85.03
      Non-proficient |     46,058       14.97      100.00
---------------------+-----------------------------------
               Total |    307,747      100.00

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
fgt1_read_04 |     46,058    .1779764    .1487824   1.08e-06      .9875

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
fgt2_read_04 |     46,058    .0538113    .0855046   1.16e-12   .9751562

      sdg411_read_05 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
      Non-proficient |     46,107       14.98       14.98
          Proficient |    261,640       85.02      100.00
---------------------+-----------------------------------
               Total |    307,747      100.00

         bmp_read_05 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
          Proficient |    261,640       85.02       85.02
      Non-proficient |     46,107       14.98      100.00
---------------------+-----------------------------------
               Total |    307,747      100.00

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
fgt1_read_05 |     46,107    .1766971    .1479964   5.40e-06      .9875

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
fgt2_read_05 |     46,107    .0531243    .0847084   2.92e-11   .9751562



     +-----------------------------------------------------------+
     | idgrade   prefix                  harmonization_condition |
     |-----------------------------------------------------------|
  1. |       4     lp01   read_01 = (score_pirls_read_01 >= 400) |
  2. |       4     lp02   read_02 = (score_pirls_read_02 >= 400) |
  3. |       4     lp03   read_03 = (score_pirls_read_03 >= 400) |
  4. |       4     lp04   read_04 = (score_pirls_read_04 >= 400) |
  5. |       4     lp05   read_05 = (score_pirls_read_05 >= 400) |
     |-----------------------------------------------------------|
  6. |       5     lp01   read_01 = (score_pirls_read_01 >= 400) |
  7. |       5     lp02   read_02 = (score_pirls_read_02 >= 400) |
  8. |       5     lp03   read_03 = (score_pirls_read_03 >= 400) |
  9. |       5     lp04   read_04 = (score_pirls_read_04 >= 400) |
 10. |       5     lp05   read_05 = (score_pirls_read_05 >= 400) |
     |-----------------------------------------------------------|
 11. |       6     lp01   read_01 = (score_pirls_read_01 >= 400) |
 12. |       6     lp02   read_02 = (score_pirls_read_02 >= 400) |
 13. |       6     lp03   read_03 = (score_pirls_read_03 >= 400) |
 14. |       6     lp04   read_04 = (score_pirls_read_04 >= 400) |
 15. |       6     lp05   read_05 = (score_pirls_read_05 >= 400) |
     +-----------------------------------------------------------+

~~~~
