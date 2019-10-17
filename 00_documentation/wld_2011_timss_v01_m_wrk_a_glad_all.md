Documentation of GLAD dataset
=====================================================================


[back to list of assessments](https://github.com/worldbank/GLAD/blob/master/README.md#harmonization)

This dataset is part of the Global Learning Assessment Database (GLAD). It contains microdata from TIMSS 2011. Each observation corresponds to one learner (student or pupil), and the variables have been harmonized.

**Metadata** stored in this dataset:

~~~~
region:      WLD
year:        2011
assessment:  TIMSS
master:      v01_M
adaptation:  wrk_A_GLAD
module:      ALL
ttl_info:    Joao Pedro de Azevedo [eduanalytics@worldbank.org]
dofile_info: last modified by Diana Goldemberg in October 8, 2019
lastsave:    9 Oct 2019 20:49:04 by wb552057
~~~~


About the **77 variables** in this dataset:

~~~~
The variables belong to the following variable classifications:
    idvars keyvars valuevars traitvars samplevars

idvars:     idcntry_raw idschool idgrade idclass idlearner
keyvars:    surveyid countrycode national_level
valuevars:  score_timss_math_01 score_timss_science_01 score_timss_math_02 score_timss_science_02 score_timss_math_03 score_timss_science_03 score_timss_math_04 score_timss_science_04 score_timss_math_05 score_timss_science_05 level_timss_math_01 level_timss_science_01 level_timss_math_02 level_timss_science_02 level_timss_math_03 level_timss_science_03 level_timss_math_04 level_timss_science_04 level_timss_math_05 level_timss_science_05
traitvars:  age urban urban_o1 urban_o2 male escs
samplevars: learner_weight jkzone jkrep


Variable         Obs Unique      Mean        Min       Max  Label
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
idcntry_raw   584545     69  1228.231         31      9134  Country ID, as coded in rawdata
idschool      584545   1599  285.8582          1      4254  School ID
idgrade       584545      5  6.095748          4         9  Grade ID
idclass       584545   6592  28588.67        101    425402  Class ID
idlearner     584545 178008   2858882      10101  4.25e+07  Learner ID
surveyid      584545      1         .          .         .  Survey ID (Region_Year_Assessment)
countrycode   584545     63         .          .         .  WB country code (3 letters)
national_l~l  584545      2   .901224          0         1  Idcntry_raw is a national level
score_t~h_01  584545 542209  469.1605          5  965.6872  Plausible value 01: TIMSS score for math
score_t~e_01  584545 541157   472.179          5  905.7887  Plausible value 01: TIMSS score for science
score_t~h_02  584545 542017   469.227          5  931.2971  Plausible value 02: TIMSS score for math
score_t~e_02  584545 541503   471.082          5   917.052  Plausible value 02: TIMSS score for science
score_t~h_03  584545 541667  469.4287          5  925.0883  Plausible value 03: TIMSS score for math
score_t~e_03  584545 541568  471.9806          5  863.2424  Plausible value 03: TIMSS score for science
score_t~h_04  584545 542008  468.8999          5  939.4118  Plausible value 04: TIMSS score for math
score_t~e_04  584545 541298  470.7925          5  873.1356  Plausible value 04: TIMSS score for science
score_t~h_05  584545 541860  469.0873          5  958.9602  Plausible value 05: TIMSS score for math
score_t~e_05  584545 541422  472.3404          5  851.9157  Plausible value 05: TIMSS score for science
level_t~h_01  584545      5  2.562164          1         5  Plausible value 01: TIMSS level for math
level_t~e_01  584545      5  2.637222          1         5  Plausible value 01: TIMSS level for science
level_t~h_02  584545      5   2.56604          1         5  Plausible value 02: TIMSS level for math
level_t~e_02  584545      5   2.62732          1         5  Plausible value 02: TIMSS level for science
level_t~h_03  584545      5  2.566244          1         5  Plausible value 03: TIMSS level for math
level_t~e_03  584545      5  2.634565          1         5  Plausible value 03: TIMSS level for science
level_t~h_04  584545      5  2.562037          1         5  Plausible value 04: TIMSS level for math
level_t~e_04  584545      5  2.625028          1         5  Plausible value 04: TIMSS level for science
level_t~h_05  584545      5    2.5635          1         5  Plausible value 05: TIMSS level for math
level_t~e_05  584545      5  2.639024          1         5  Plausible value 05: TIMSS level for science
age           583180     14  11.86868          6        19  Learner age at time of assessment
urban         550334      2  .8736476          0         1  School is located in urban/rural area
urban_o1      564581      7         .          .         .  Original variable of urban: population size of the school area
urban_o2      560889      6         .          .         .  Original variable of urban: school is located in urban/rural area
male          584545      2  .5034582          0         1  Learner gender is male/female
escs          476439  96403  .0167529  -3.453706  1.879487  
learner_we~t  584545  19278  64.83228   .3408881  3467.077  Total learner weight
jkzone        584545     75  35.55715          1        75  Jackknife zone
jkrep         584545      2   .498675          0         1  Jackknife replicate code
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


Plus the variables merged-on-the-fly, which are:

traitvars:  lp01_threshold_var lp02_threshold_var lp03_threshold_var lp04_threshold_var lp05_threshold_var lp06_threshold_var lp07_threshold_var lp08_threshold_var lp09_threshold_var lp10_threshold_var lp01_threshold_val lp02_threshold_val lp03_threshold_val lp04_threshold_val lp05_threshold_val lp06_threshold_val lp07_threshold_val lp08_threshold_val lp09_threshold_val lp10_threshold_val lp01_threshold_res lp02_threshold_res lp03_threshold_res lp04_threshold_res lp05_threshold_res lp06_threshold_res lp07_threshold_res lp08_threshold_res lp09_threshold_res lp10_threshold_res
valuevars:  hpro_science_01 hpro_science_02 hpro_science_03 hpro_science_04 hpro_science_05 hpro_math_01 hpro_math_02 hpro_math_03 hpro_math_04 hpro_math_05
~~~~

About the **584,545 observations** in this dataset:

~~~~
. tab countrycode idgrade if national_level==1

WB country |
   code (3 |                        Grade ID
  letters) |         4          5          6          8          9 |     Total
-----------+-------------------------------------------------------+----------
       ARE |    14,720          0          0     14,089          0 |    28,809 
       ARM |     5,146          0          0          0      5,846 |    10,992 
       AUS |     6,146          0          0      7,556          0 |    13,702 
       AUT |     4,668          0          0          0          0 |     4,668 
       AZE |     4,882          0          0          0          0 |     4,882 
       BEL |     4,849          0          0          0          0 |     4,849 
       BHR |     4,083          0          0      4,640          0 |     8,723 
       BWA |         0          0      4,198          0      5,400 |     9,598 
       CHL |     5,585          0          0      5,835          0 |    11,420 
       CZE |     4,578          0          0          0          0 |     4,578 
       DEU |     3,995          0          0          0          0 |     3,995 
       DNK |     3,987          0          0          0          0 |     3,987 
       ESP |     4,183          0          0          0          0 |     4,183 
       FIN |     4,638          0          0      4,266          0 |     8,904 
       GBR |     3,571      3,397          0          0      3,842 |    10,810 
       GEO |     4,799          0          0      4,563          0 |     9,362 
       GHA |         0          0          0      7,323          0 |     7,323 
       HKG |     3,957          0          0      4,015          0 |     7,972 
       HND |         0          0      3,919          0      4,418 |     8,337 
       HRV |     4,584          0          0          0          0 |     4,584 
       HUN |     5,204          0          0      5,178          0 |    10,382 
       IDN |         0          0          0      5,795          0 |     5,795 
       IRL |     4,560          0          0          0          0 |     4,560 
       IRN |     5,760          0          0      6,029          0 |    11,789 
       ISR |         0          0          0      4,699          0 |     4,699 
       ITA |     4,200          0          0      3,979          0 |     8,179 
       JOR |         0          0          0      7,694          0 |     7,694 
       JPN |     4,411          0          0      4,414          0 |     8,825 
       KAZ |     4,382          0          0      4,390          0 |     8,772 
       KOR |     4,334          0          0      5,166          0 |     9,500 
       KWT |     4,142          0          0          0          0 |     4,142 
       LBN |         0          0          0      3,974          0 |     3,974 
       LTU |     4,688          0          0      4,747          0 |     9,435 
       MAR |     7,841          0          0      8,986          0 |    16,827 
       MKD |         0          0          0      4,062          0 |     4,062 
       MLT |         0      3,607          0          0          0 |     3,607 
       MYS |         0          0          0      5,733          0 |     5,733 
       NLD |     3,229          0          0          0          0 |     3,229 
       NOR |     3,121          0          0      3,862          0 |     6,983 
       NZL |         0      5,572          0          0      5,336 |    10,908 
       OMN |    10,411          0          0      9,542          0 |    19,953 
       POL |     5,027          0          0          0          0 |     5,027 
       PRT |     4,042          0          0          0          0 |     4,042 
       PSE |         0          0          0      7,812          0 |     7,812 
       QAT |     4,117          0          0      4,422          0 |     8,539 
       ROU |     4,673          0          0      5,523          0 |    10,196 
       RUS |     4,467          0          0      4,893          0 |     9,360 
       SAU |     4,515          0          0      4,344          0 |     8,859 
       SGP |     6,368          0          0      5,927          0 |    12,295 
       SRB |     4,379          0          0          0          0 |     4,379 
       SVK |     5,616          0          0          0          0 |     5,616 
       SVN |     4,492          0          0      4,415          0 |     8,907 
       SWE |     4,663          0          0      5,573          0 |    10,236 
       SYR |         0          0          0      4,413          0 |     4,413 
       THA |     4,448          0          0      6,124          0 |    10,572 
       TUN |     4,912          0          0      5,128          0 |    10,040 
       TUR |     7,479          0          0      6,928          0 |    14,407 
       UKR |         0          0          0      3,378          0 |     3,378 
       USA |    12,569          0          0     10,477          0 |    23,046 
       YEM |     8,058          0      4,929          0          0 |    12,987 
       ZAF |         0          0          0          0     11,969 |    11,969 
-----------+-------------------------------------------------------+----------
     Total |   244,479     12,576     13,046    219,894     36,811 |   526,806 

. 
. tab countrycode idgrade if national_level==0

WB country |
   code (3 |       Grade ID
  letters) |         4          8 |     Total
-----------+----------------------+----------
       ARE |    10,315      9,944 |    20,259 
       CAN |    12,450     15,704 |    28,154 
       TWN |     4,284      5,042 |     9,326 
-----------+----------------------+----------
     Total |    27,049     30,690 |    57,739 

~~~~

**Harmonization** of proficiency (done on-the-fly):

~~~~

     hpro_science_01 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
      Non-proficient |     66,045       11.30       11.30
          Proficient |    231,105       39.54       50.83
Non-harmonized grade |    287,395       49.17      100.00
---------------------+-----------------------------------
               Total |    584,545      100.00

     hpro_science_02 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
      Non-proficient |     67,587       11.56       11.56
          Proficient |    229,563       39.27       50.83
Non-harmonized grade |    287,395       49.17      100.00
---------------------+-----------------------------------
               Total |    584,545      100.00

     hpro_science_03 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
      Non-proficient |     67,309       11.51       11.51
          Proficient |    229,841       39.32       50.83
Non-harmonized grade |    287,395       49.17      100.00
---------------------+-----------------------------------
               Total |    584,545      100.00

     hpro_science_04 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
      Non-proficient |     67,604       11.57       11.57
          Proficient |    229,546       39.27       50.83
Non-harmonized grade |    287,395       49.17      100.00
---------------------+-----------------------------------
               Total |    584,545      100.00

     hpro_science_05 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
      Non-proficient |     66,474       11.37       11.37
          Proficient |    230,676       39.46       50.83
Non-harmonized grade |    287,395       49.17      100.00
---------------------+-----------------------------------
               Total |    584,545      100.00

        hpro_math_01 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
      Non-proficient |     65,786       11.25       11.25
          Proficient |    231,364       39.58       50.83
Non-harmonized grade |    287,395       49.17      100.00
---------------------+-----------------------------------
               Total |    584,545      100.00

        hpro_math_02 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
      Non-proficient |     65,850       11.27       11.27
          Proficient |    231,300       39.57       50.83
Non-harmonized grade |    287,395       49.17      100.00
---------------------+-----------------------------------
               Total |    584,545      100.00

        hpro_math_03 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
      Non-proficient |     64,772       11.08       11.08
          Proficient |    232,378       39.75       50.83
Non-harmonized grade |    287,395       49.17      100.00
---------------------+-----------------------------------
               Total |    584,545      100.00

        hpro_math_04 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
      Non-proficient |     65,679       11.24       11.24
          Proficient |    231,471       39.60       50.83
Non-harmonized grade |    287,395       49.17      100.00
---------------------+-----------------------------------
               Total |    584,545      100.00

        hpro_math_05 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
      Non-proficient |     65,916       11.28       11.28
          Proficient |    231,234       39.56       50.83
Non-harmonized grade |    287,395       49.17      100.00
---------------------+-----------------------------------
               Total |    584,545      100.00



     +----------------------------------------------------------------------+
     | idgrade   prefix                             harmonization_condition |
     |----------------------------------------------------------------------|
  1. |       4     lp01   hpro_science_01 = (score_timss_science_01 >= 400) |
  2. |       4     lp02   hpro_science_02 = (score_timss_science_02 >= 400) |
  3. |       4     lp03   hpro_science_03 = (score_timss_science_03 >= 400) |
  4. |       4     lp04   hpro_science_04 = (score_timss_science_04 >= 400) |
  5. |       4     lp05   hpro_science_05 = (score_timss_science_05 >= 400) |
     |----------------------------------------------------------------------|
  6. |       4     lp06         hpro_math_01 = (score_timss_math_01 >= 400) |
  7. |       4     lp07         hpro_math_02 = (score_timss_math_02 >= 400) |
  8. |       4     lp08         hpro_math_03 = (score_timss_math_03 >= 400) |
  9. |       4     lp09         hpro_math_04 = (score_timss_math_04 >= 400) |
 10. |       4     lp10         hpro_math_05 = (score_timss_math_05 >= 400) |
     |----------------------------------------------------------------------|
 11. |       5     lp01   hpro_science_01 = (score_timss_science_01 >= 400) |
 12. |       5     lp02   hpro_science_02 = (score_timss_science_02 >= 400) |
 13. |       5     lp03   hpro_science_03 = (score_timss_science_03 >= 400) |
 14. |       5     lp04   hpro_science_04 = (score_timss_science_04 >= 400) |
 15. |       5     lp05   hpro_science_05 = (score_timss_science_05 >= 400) |
     |----------------------------------------------------------------------|
 16. |       5     lp06         hpro_math_01 = (score_timss_math_01 >= 400) |
 17. |       5     lp07         hpro_math_02 = (score_timss_math_02 >= 400) |
 18. |       5     lp08         hpro_math_03 = (score_timss_math_03 >= 400) |
 19. |       5     lp09         hpro_math_04 = (score_timss_math_04 >= 400) |
 20. |       5     lp10         hpro_math_05 = (score_timss_math_05 >= 400) |
     |----------------------------------------------------------------------|
 21. |       6     lp01   hpro_science_01 = (score_timss_science_01 >= 400) |
 22. |       6     lp02   hpro_science_02 = (score_timss_science_02 >= 400) |
 23. |       6     lp03   hpro_science_03 = (score_timss_science_03 >= 400) |
 24. |       6     lp04   hpro_science_04 = (score_timss_science_04 >= 400) |
 25. |       6     lp05   hpro_science_05 = (score_timss_science_05 >= 400) |
     |----------------------------------------------------------------------|
 26. |       6     lp06         hpro_math_01 = (score_timss_math_01 >= 400) |
 27. |       6     lp07         hpro_math_02 = (score_timss_math_02 >= 400) |
 28. |       6     lp08         hpro_math_03 = (score_timss_math_03 >= 400) |
 29. |       6     lp09         hpro_math_04 = (score_timss_math_04 >= 400) |
 30. |       6     lp10         hpro_math_05 = (score_timss_math_05 >= 400) |
     |----------------------------------------------------------------------|
 31. |       8     lp01                                    no harmonization |
 32. |       8     lp02                                    no harmonization |
 33. |       8     lp03                                    no harmonization |
 34. |       8     lp04                                    no harmonization |
 35. |       8     lp05                                    no harmonization |
     |----------------------------------------------------------------------|
 36. |       8     lp06                                    no harmonization |
 37. |       8     lp07                                    no harmonization |
 38. |       8     lp08                                    no harmonization |
 39. |       8     lp09                                    no harmonization |
 40. |       8     lp10                                    no harmonization |
     |----------------------------------------------------------------------|
 41. |       9     lp01                                    no harmonization |
 42. |       9     lp02                                    no harmonization |
 43. |       9     lp03                                    no harmonization |
 44. |       9     lp04                                    no harmonization |
 45. |       9     lp05                                    no harmonization |
     |----------------------------------------------------------------------|
 46. |       9     lp06                                    no harmonization |
 47. |       9     lp07                                    no harmonization |
 48. |       9     lp08                                    no harmonization |
 49. |       9     lp09                                    no harmonization |
 50. |       9     lp10                                    no harmonization |
     +----------------------------------------------------------------------+

~~~~
