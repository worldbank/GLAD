Documentation of GLAD dataset
=====================================================================


[back to list of assessments](https://github.com/worldbank/GLAD/blob/master/README.md#harmonization)

This dataset is part of the Global Learning Assessment Database (GLAD). It contains microdata from TIMSS 2007. Each observation corresponds to one learner (student or pupil), and the variables have been harmonized.

**Metadata** stored in this dataset:

~~~~
region:      WLD
year:        2007
assessment:  TIMSS
master:      v01_M
adaptation:  wrk_A_GLAD
module:      ALL
ttl_info:    Joao Pedro de Azevedo [eduanalytics@worldbank.org]
dofile_info: last modified by Diana Goldemberg in October 8, 2019
lastsave:    9 Oct 2019 20:58:44 by wb552057
~~~~


About the **76 variables** in this dataset:

~~~~
The variables belong to the following variable classifications:
    idvars keyvars valuevars traitvars samplevars

idvars:     idcntry_raw idschool idgrade idclass idlearner
keyvars:    surveyid countrycode national_level
valuevars:  score_timss_math_01 score_timss_science_01 score_timss_math_02 score_timss_science_02 score_timss_math_03 score_timss_science_03 score_timss_math_04 score_timss_science_04 score_timss_math_05 score_timss_science_05 level_timss_math_01 level_timss_science_01 level_timss_math_02 level_timss_science_02 level_timss_math_03 level_timss_science_03 level_timss_math_04 level_timss_science_04 level_timss_math_05 level_timss_science_05
traitvars:  age urban urban_o male escs
samplevars: learner_weight jkzone jkrep


Variable         Obs Unique      Mean        Min       Max  Label
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
idcntry_raw   433785     67  1343.876         12     12700  Country ID, as coded in rawdata
idschool      433785   1688  319.7172          1      5192  School ID
idgrade       433785      3  6.280203          4         9  Grade ID
idclass       433785   5586   31974.4        101    519202  Class ID
idlearner     433785 135175   3197455      10101  5.19e+07  Learner ID
surveyid      433785      1         .          .         .  Survey ID (Region_Year_Assessment)
countrycode   433785     61         .          .         .  WB country code (3 letters)
national_l~l  433785      2     .8819          0         1  Idcntry_raw is a national level
score_t~h_01  433785  57729  463.8155          5    898.42  Plausible value 01: TIMSS score for math
score_t~e_01  432845  57869   474.171          5     979.5  Plausible value 01: TIMSS score for science
score_t~h_02  433785  57933  463.8907          5     918.6  Plausible value 02: TIMSS score for math
score_t~e_02  432845  57977  473.4773          5       995  Plausible value 02: TIMSS score for science
score_t~h_03  433785  57976  463.9655          5    904.31  Plausible value 03: TIMSS score for math
score_t~e_03  432845  57932  473.6868          5       995  Plausible value 03: TIMSS score for science
score_t~h_04  433785  58009  463.5464          5    939.95  Plausible value 04: TIMSS score for math
score_t~e_04  432845  57940  473.1772          5    955.53  Plausible value 04: TIMSS score for science
score_t~h_05  433785  57822  464.3186          5    939.03  Plausible value 05: TIMSS score for math
score_t~e_05  432845  57725  474.5186          5    942.87  Plausible value 05: TIMSS score for science
level_t~h_01  433785      5  2.522307          1         5  Plausible value 01: TIMSS level for math
level_t~e_01  432845      5  2.651025          1         5  Plausible value 01: TIMSS level for science
level_t~h_02  433785      5  2.524218          1         5  Plausible value 02: TIMSS level for math
level_t~e_02  432845      5  2.644127          1         5  Plausible value 02: TIMSS level for science
level_t~h_03  433785      5  2.526049          1         5  Plausible value 03: TIMSS level for math
level_t~e_03  432845      5   2.64628          1         5  Plausible value 03: TIMSS level for science
level_t~h_04  433785      5   2.52151          1         5  Plausible value 04: TIMSS level for math
level_t~e_04  432845      5  2.640791          1         5  Plausible value 04: TIMSS level for science
level_t~h_05  433785      5  2.527326          1         5  Plausible value 05: TIMSS level for math
level_t~e_05  432845      5  2.654414          1         5  Plausible value 05: TIMSS level for science
age           432622     14  12.13375          6        19  Learner age at time of assessment
urban         410413      2  .8919844          0         1  School is located in urban/rural area
urban_o       421040      7         .          .         .  Original variable of urban: population size of the school area
male          433785      2  .5009348          0         1  Learner gender is male/female
escs          235721  29210  .2021731  -3.124273  2.240808  
learner_we~t  433785  19100  82.42143          1  2077.113  Total learner weight
jkzone        433785     75  34.93851          1        75  Jackknife zone
jkrep         433785      2  .4995816          0         1  Jackknife replicate code
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


Plus the variables merged-on-the-fly, which are:

traitvars:  lp01_threshold_var lp02_threshold_var lp03_threshold_var lp04_threshold_var lp05_threshold_var lp06_threshold_var lp07_threshold_var lp08_threshold_var lp09_threshold_var lp10_threshold_var lp01_threshold_val lp02_threshold_val lp03_threshold_val lp04_threshold_val lp05_threshold_val lp06_threshold_val lp07_threshold_val lp08_threshold_val lp09_threshold_val lp10_threshold_val lp01_threshold_res lp02_threshold_res lp03_threshold_res lp04_threshold_res lp05_threshold_res lp06_threshold_res lp07_threshold_res lp08_threshold_res lp09_threshold_res lp10_threshold_res
valuevars:  hpro_science_01 hpro_science_02 hpro_science_03 hpro_science_04 hpro_science_05 hpro_math_01 hpro_math_02 hpro_math_03 hpro_math_04 hpro_math_05
~~~~

About the **433,785 observations** in this dataset:

~~~~
. tab countrycode idgrade if national_level==1

WB country |
   code (3 |             Grade ID
  letters) |         4          8          9 |     Total
-----------+---------------------------------+----------
       ARM |     4,079      4,689          0 |     8,768 
       AUS |     4,108      4,069          0 |     8,177 
       AUT |     4,859          0          0 |     4,859 
       BGR |         0      4,019          0 |     4,019 
       BHR |         0      4,230          0 |     4,230 
       BIH |         0      4,220          0 |     4,220 
       BWA |         0      4,208          0 |     4,208 
       COL |     4,801      4,873          0 |     9,674 
       CYP |         0      4,399          0 |     4,399 
       CZE |     4,235      4,845          0 |     9,080 
       DEU |     5,200          0          0 |     5,200 
       DNK |     3,519          0          0 |     3,519 
       DZA |     4,223      5,447          0 |     9,670 
       EGY |         0      6,582          0 |     6,582 
       GBR |     8,245      8,095          0 |    16,340 
       GEO |     4,108      4,178          0 |     8,286 
       GHA |         0      5,294          0 |     5,294 
       HKG |     3,791      3,470          0 |     7,261 
       HUN |     4,048      4,111          0 |     8,159 
       IDN |         0      4,203          0 |     4,203 
       IRN |     3,833      3,981          0 |     7,814 
       ISR |         0      3,294          0 |     3,294 
       ITA |     4,470      4,408          0 |     8,878 
       JOR |         0      5,251          0 |     5,251 
       JPN |     4,487      4,312          0 |     8,799 
       KAZ |     3,990          0          0 |     3,990 
       KOR |         0      4,240          0 |     4,240 
       KWT |     3,803      4,091          0 |     7,894 
       LBN |         0      3,786          0 |     3,786 
       LTU |     3,980      3,991          0 |     7,971 
       LVA |     3,908          0          0 |     3,908 
       MAR |     3,894      3,060          0 |     6,954 
       MLT |         0          0      4,670 |     4,670 
       MNG |     4,523      4,499          0 |     9,022 
       MYS |         0      4,466          0 |     4,466 
       NLD |     3,349          0          0 |     3,349 
       NOR |     4,108      4,627          0 |     8,735 
       NZL |     4,940          0          0 |     4,940 
       OMN |         0      4,752          0 |     4,752 
       PSE |         0      4,378          0 |     4,378 
       QAT |     7,019      7,184          0 |    14,203 
       ROU |         0      4,198          0 |     4,198 
       RUS |     4,464      4,472          0 |     8,936 
       SAU |         0      4,243          0 |     4,243 
       SGP |     5,041      4,599          0 |     9,640 
       SLV |     4,166      4,063          0 |     8,229 
       SRB |         0      4,045          0 |     4,045 
       SVK |     4,963          0          0 |     4,963 
       SVN |     4,351      4,043          0 |     8,394 
       SWE |     4,676      5,215          0 |     9,891 
       SYR |         0      4,650          0 |     4,650 
       THA |         0      5,412          0 |     5,412 
       TUN |     4,134      4,080          0 |     8,214 
       TUR |         0      4,498          0 |     4,498 
       UKR |     4,292      4,424          0 |     8,716 
       USA |     7,896      7,377          0 |    15,273 
       YEM |     5,811          0          0 |     5,811 
-----------+---------------------------------+----------
     Total |   161,314    216,571      4,670 |   382,555 

. 
. tab countrycode idgrade if national_level==0

WB country |
   code (3 |       Grade ID
  letters) |         4          8 |     Total
-----------+----------------------+----------
       ARE |     3,064      3,195 |     6,259 
       CAN |    15,571     11,660 |    27,231 
       ESP |         0      2,296 |     2,296 
       TWN |     4,131      4,046 |     8,177 
       USA |     3,593      3,674 |     7,267 
-----------+----------------------+----------
     Total |    26,359     24,871 |    51,230 

~~~~

**Harmonization** of proficiency (done on-the-fly):

~~~~

     hpro_science_01 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
      Non-proficient |     39,704        9.15        9.15
          Proficient |    147,969       34.11       43.26
Non-harmonized grade |    246,112       56.74      100.00
---------------------+-----------------------------------
               Total |    433,785      100.00

     hpro_science_02 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
      Non-proficient |     40,425        9.32        9.32
          Proficient |    147,248       33.94       43.26
Non-harmonized grade |    246,112       56.74      100.00
---------------------+-----------------------------------
               Total |    433,785      100.00

     hpro_science_03 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
      Non-proficient |     40,747        9.39        9.39
          Proficient |    146,926       33.87       43.26
Non-harmonized grade |    246,112       56.74      100.00
---------------------+-----------------------------------
               Total |    433,785      100.00

     hpro_science_04 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
      Non-proficient |     40,532        9.34        9.34
          Proficient |    147,141       33.92       43.26
Non-harmonized grade |    246,112       56.74      100.00
---------------------+-----------------------------------
               Total |    433,785      100.00

     hpro_science_05 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
      Non-proficient |     39,890        9.20        9.20
          Proficient |    147,783       34.07       43.26
Non-harmonized grade |    246,112       56.74      100.00
---------------------+-----------------------------------
               Total |    433,785      100.00

        hpro_math_01 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
      Non-proficient |     44,009       10.15       10.15
          Proficient |    143,664       33.12       43.26
Non-harmonized grade |    246,112       56.74      100.00
---------------------+-----------------------------------
               Total |    433,785      100.00

        hpro_math_02 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
      Non-proficient |     44,065       10.16       10.16
          Proficient |    143,608       33.11       43.26
Non-harmonized grade |    246,112       56.74      100.00
---------------------+-----------------------------------
               Total |    433,785      100.00

        hpro_math_03 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
      Non-proficient |     43,430       10.01       10.01
          Proficient |    144,243       33.25       43.26
Non-harmonized grade |    246,112       56.74      100.00
---------------------+-----------------------------------
               Total |    433,785      100.00

        hpro_math_04 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
      Non-proficient |     44,183       10.19       10.19
          Proficient |    143,490       33.08       43.26
Non-harmonized grade |    246,112       56.74      100.00
---------------------+-----------------------------------
               Total |    433,785      100.00

        hpro_math_05 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
      Non-proficient |     43,718       10.08       10.08
          Proficient |    143,955       33.19       43.26
Non-harmonized grade |    246,112       56.74      100.00
---------------------+-----------------------------------
               Total |    433,785      100.00



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
 11. |       8     lp01                                    no harmonization |
 12. |       8     lp02                                    no harmonization |
 13. |       8     lp03                                    no harmonization |
 14. |       8     lp04                                    no harmonization |
 15. |       8     lp05                                    no harmonization |
     |----------------------------------------------------------------------|
 16. |       8     lp06                                    no harmonization |
 17. |       8     lp07                                    no harmonization |
 18. |       8     lp08                                    no harmonization |
 19. |       8     lp09                                    no harmonization |
 20. |       8     lp10                                    no harmonization |
     |----------------------------------------------------------------------|
 21. |       9     lp01                                    no harmonization |
 22. |       9     lp02                                    no harmonization |
 23. |       9     lp03                                    no harmonization |
 24. |       9     lp04                                    no harmonization |
 25. |       9     lp05                                    no harmonization |
     |----------------------------------------------------------------------|
 26. |       9     lp06                                    no harmonization |
 27. |       9     lp07                                    no harmonization |
 28. |       9     lp08                                    no harmonization |
 29. |       9     lp09                                    no harmonization |
 30. |       9     lp10                                    no harmonization |
     +----------------------------------------------------------------------+

~~~~
