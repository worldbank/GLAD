Documentation of GLAD dataset
=====================================================================


[back to list of assessments](https://github.com/worldbank/GLAD/blob/master/README.md#harmonization)

This dataset is part of the Global Learning Assessment Database (GLAD). It contains microdata from PIRLS 2001. Each observation corresponds to one learner (student or pupil), and the variables have been harmonized.

**Metadata** stored in this dataset:

~~~~
region:      WLD
year:        2001
assessment:  PIRLS
master:      v01_M
adaptation:  wrk_A_GLAD
module:      ALL
ttl_info:    Joao Pedro de Azevedo [eduanalytics@worldbank.org]
dofile_info: last modified by Joao Pedro Azevedo in Feb 05, 2022
lastsave:    12 Feb 2022 08:18:18 by wb255520
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
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
idcntry_raw   160014     38  1012.198         32      9133  Country ID, as coded in rawdata
idschool      160014    876  210.5318          1      2156  School ID
idgrade       160014      3  3.985314          3         5  Grade ID
idclass       160014   2303  21056.86        101    215601  Class ID
idlearner     160014  59845   2105699      10101  2.16e+07  Learner ID
surveyid      160014      1         .          .         .  Survey ID (Region_Year_Assessment)
countrycode   160014     34         .          .         .  WB country code (3 letters)
national_l~l  160014      2  .9484233          0         1  Idcntry_raw is a national level
score_pir~01  160014 156032  502.8602   9.729022  820.6267  Plausible value 01: PIRLS score for read
score_pir~02  160014 156054   503.138          5  829.9983  Plausible value 02: PIRLS score for read
score_pir~03  160014 156008  503.0705   22.57181  847.9662  Plausible value 03: PIRLS score for read
score_pir~04  160014 156139  502.9849          5  898.3955  Plausible value 04: PIRLS score for read
score_pir~05  160014 156036  503.0964          5  818.6002  Plausible value 05: PIRLS score for read
level_pir~01  160014      5  2.939005          1         5  Plausible value 01: PIRLS level for read
level_pir~02  160014      5  2.941836          1         5  Plausible value 02: PIRLS level for read
level_pir~03  160014      5   2.94103          1         5  Plausible value 03: PIRLS level for read
level_pir~04  160014      5  2.938955          1         5  Plausible value 04: PIRLS level for read
level_pir~05  160014      5  2.940643          1         5  Plausible value 05: PIRLS level for read
age           159143    104  10.27272      6.083    14.917  Learner age at time of assessment
urban         120662      2   .920182          0         1  School is located in urban/rural area
urban_o1      150145      6         .          .         .  Original variable of urban: population size of the school area
urban_o2      152790      4         .          .         .  Original variable of urban: school is located in urban/rural area
male          160014      2  .4988813          0         1  Learner gender is male/female
escs          145972  65147  -.081518  -3.374558  1.982788  
qescs         145972      5  3.069006          1         5  Quintiles of Socio-Economic Status
has_qescs     160014      2  .9122452          0         1  Dummy variable for observations with a valid QESCS
learner_we~t  160014   5605  98.25247          1  6000.819  Total learner weight
jkzone        160014     75  34.75669          1        75  Jackknife zone
jkrep         160014      2  .4989626          0         1  Jackknife replicate code
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


Plus the variables merged-on-the-fly, which are:

traitvars:  lp01_threshold_var lp02_threshold_var lp03_threshold_var lp04_threshold_var lp05_threshold_var lp01_threshold_val lp02_threshold_val lp03_threshold_val lp04_threshold_val lp05_threshold_val lp01_threshold_res lp02_threshold_res lp03_threshold_res lp04_threshold_res lp05_threshold_res
valuevars:  sdg411_read_01 bmp_read_01 fgt1_read_01 fgt2_read_01 sdg411_read_02 bmp_read_02 fgt1_read_02 fgt2_read_02 sdg411_read_03 bmp_read_03 fgt1_read_03 fgt2_read_03 sdg411_read_04 bmp_read_04 fgt1_read_04 fgt2_read_04 sdg411_read_05 bmp_read_05 fgt1_read_05 fgt2_read_05
~~~~

About the **160,014 observations** in this dataset:

~~~~
. tab countrycode idgrade if national_level==1

WB country |
   code (3 |             Grade ID
  letters) |         3          4          5 |     Total
-----------+---------------------------------+----------
       ARG |         0      3,300          0 |     3,300 
       BGR |         0      3,460          0 |     3,460 
       BLZ |         0      2,909          0 |     2,909 
       CAN |         0      8,253          0 |     8,253 
       COL |         0      5,131          0 |     5,131 
       CYP |         0      3,001          0 |     3,001 
       CZE |         0      3,022          0 |     3,022 
       DEU |         0      7,633          0 |     7,633 
       FRA |         0      3,538          0 |     3,538 
       GBR |         0          0      5,873 |     5,873 
       GRC |         0      2,494          0 |     2,494 
       HKG |         0      5,050          0 |     5,050 
       HUN |         0      4,666          0 |     4,666 
       IRN |         0      7,430          0 |     7,430 
       ISL |         0      3,676          0 |     3,676 
       ISR |         0      3,973          0 |     3,973 
       ITA |         0      3,502          0 |     3,502 
       KWT |         0      7,126          0 |     7,126 
       LTU |         0      2,567          0 |     2,567 
       LVA |         0      3,019          0 |     3,019 
       MAR |         0      3,153          0 |     3,153 
       MDA |         0      3,533          0 |     3,533 
       MKD |         0      3,711          0 |     3,711 
       NLD |         0      4,112          0 |     4,112 
       NOR |         0      3,459          0 |     3,459 
       NZL |         0      2,488          0 |     2,488 
       ROU |         0      3,625          0 |     3,625 
       RUS |         0      4,093          0 |     4,093 
       SGP |         0      7,002          0 |     7,002 
       SVK |         0      3,807          0 |     3,807 
       SVN |     2,952          0          0 |     2,952 
       SWE |     5,271      6,044          0 |    11,315 
       TUR |         0      5,125          0 |     5,125 
       USA |         0      3,763          0 |     3,763 
-----------+---------------------------------+----------
     Total |     8,223    137,665      5,873 |   151,761 

. 
. tab countrycode idgrade if national_level==0

WB country |
   code (3 |  Grade ID
  letters) |         4 |     Total
-----------+-----------+----------
       CAN |     8,253 |     8,253 
-----------+-----------+----------
     Total |     8,253 |     8,253 

~~~~

**Harmonization** of proficiency (done on-the-fly):

~~~~

      sdg411_read_01 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
      Non-proficient |     22,992       14.37       14.37
          Proficient |    137,022       85.63      100.00
---------------------+-----------------------------------
               Total |    160,014      100.00

         bmp_read_01 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
          Proficient |    137,022       85.63       85.63
      Non-proficient |     22,992       14.37      100.00
---------------------+-----------------------------------
               Total |    160,014      100.00

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
fgt1_read_01 |     22,992    .1748002    .1476364     .00001   .9756774

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
fgt2_read_01 |     22,992    .0523507    .0826597   1.00e-10   .9519464

      sdg411_read_02 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
      Non-proficient |     22,796       14.25       14.25
          Proficient |    137,218       85.75      100.00
---------------------+-----------------------------------
               Total |    160,014      100.00

         bmp_read_02 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
          Proficient |    137,218       85.75       85.75
      Non-proficient |     22,796       14.25      100.00
---------------------+-----------------------------------
               Total |    160,014      100.00

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
fgt1_read_02 |     22,796     .175221    .1490042   .0000182      .9875

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
fgt2_read_02 |     22,796    .0529037    .0853483   3.31e-10   .9751562

      sdg411_read_03 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
      Non-proficient |     23,101       14.44       14.44
          Proficient |    136,913       85.56      100.00
---------------------+-----------------------------------
               Total |    160,014      100.00

         bmp_read_03 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
          Proficient |    136,913       85.56       85.56
      Non-proficient |     23,101       14.44      100.00
---------------------+-----------------------------------
               Total |    160,014      100.00

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
fgt1_read_03 |     23,101    .1735904    .1466285   .0000194   .9435705

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
fgt2_read_03 |     23,101    .0516326    .0829105   3.76e-10   .8903253

      sdg411_read_04 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
      Non-proficient |     22,916       14.32       14.32
          Proficient |    137,098       85.68      100.00
---------------------+-----------------------------------
               Total |    160,014      100.00

         bmp_read_04 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
          Proficient |    137,098       85.68       85.68
      Non-proficient |     22,916       14.32      100.00
---------------------+-----------------------------------
               Total |    160,014      100.00

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
fgt1_read_04 |     22,916    .1749671    .1473278   8.55e-07      .9875

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
fgt2_read_04 |     22,916     .052318    .0831981   7.31e-13   .9751562

      sdg411_read_05 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
      Non-proficient |     22,875       14.30       14.30
          Proficient |    137,139       85.70      100.00
---------------------+-----------------------------------
               Total |    160,014      100.00

         bmp_read_05 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
          Proficient |    137,139       85.70       85.70
      Non-proficient |     22,875       14.30      100.00
---------------------+-----------------------------------
               Total |    160,014      100.00

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
fgt1_read_05 |     22,875    .1745458    .1481727   1.41e-06      .9875

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
fgt2_read_05 |     22,875    .0524204     .084656   2.00e-12   .9751562



     +-----------------------------------------------------------+
     | idgrade   prefix                  harmonization_condition |
     |-----------------------------------------------------------|
  1. |       3     lp01   read_01 = (score_pirls_read_01 >= 400) |
  2. |       3     lp02   read_02 = (score_pirls_read_02 >= 400) |
  3. |       3     lp03   read_03 = (score_pirls_read_03 >= 400) |
  4. |       3     lp04   read_04 = (score_pirls_read_04 >= 400) |
  5. |       3     lp05   read_05 = (score_pirls_read_05 >= 400) |
     |-----------------------------------------------------------|
  6. |       4     lp01   read_01 = (score_pirls_read_01 >= 400) |
  7. |       4     lp02   read_02 = (score_pirls_read_02 >= 400) |
  8. |       4     lp03   read_03 = (score_pirls_read_03 >= 400) |
  9. |       4     lp04   read_04 = (score_pirls_read_04 >= 400) |
 10. |       4     lp05   read_05 = (score_pirls_read_05 >= 400) |
     |-----------------------------------------------------------|
 11. |       5     lp01   read_01 = (score_pirls_read_01 >= 400) |
 12. |       5     lp02   read_02 = (score_pirls_read_02 >= 400) |
 13. |       5     lp03   read_03 = (score_pirls_read_03 >= 400) |
 14. |       5     lp04   read_04 = (score_pirls_read_04 >= 400) |
 15. |       5     lp05   read_05 = (score_pirls_read_05 >= 400) |
     +-----------------------------------------------------------+

~~~~
