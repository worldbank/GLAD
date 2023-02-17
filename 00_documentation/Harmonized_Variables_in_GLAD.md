# Harmonized variable names
<sup>back to the [README](https://github.com/worldbank/GLAD/blob/master/README.md) :leftwards_arrow_with_hook:</sup>

This page list the harmonized variable names that will be used in all GLADs regardless of which assessment, year or country the data comes from. The first table has the variables that are included in all data sets. The second table includes variable names we have harmonized but exist only in some data sets.

varname | varclass | varlabel | vartype | note
-- | -- | -- | -- | -- |
surveyid | key | SurveyID (Region_Year_Assessment) |  String | |
countrycode | key | WB country code (3 letters) |  String | (a) |
national_level | key | Idcntry_raw is a national level | Indicator (1=National) | (a) |
idcntry_raw | id | Country ID, as coded in rawdata | Numerical or String | (b) |  
idschool | id | School ID | Numerical | | 
idgrade | id | Grade ID | Numerical | | 
idclass | id | Class ID | Numerical | (c) |
idlearner | id | Learner ID | Numerical | | 
score_[*assessment*]\_[*subject*]\_[*pv*] | value | [Plausible value *pv*:] *assessment* score for *subject* | Numerical ||  
level_[*assessment*]\_[*subject*]\_[*pv*] | value | [Plausible value *pv*:] *assessment* level for *subject* | Categorical | | 
age | trait | Learner age at time of assessment | Numerical |  |
urban | trait | School is located in urban/rural area | Indicator (1=Urban) | |  
male | trait | Learner gender is male/female | Indicator (1=Male) |  |
escs | trait | Learner socio-economic status _(Purposefully not labeled yet)_ | Numerical | |
learner_weight | sample | Total learner weight | Numerical |  |

**Notes:**

For all assessment-years, the id variables (*idcntry_raw, idschool, idgrade, idclass, idlearner*) compose a unique id.

(a) The full correspondence of *countrycode*, *national_level* and *idcntry_raw* is found in the [master countrycode list](https://github.com/worldbank/GLAD/blob/master/01_harmonization/011_rawdata/master_countrycode_list.csv). Some examples:
* in LLECE 1997 the *countrycode* MEX is linked to both the sample from the country Mexico (idcntry_raw = 21) and for the sample from the subnational unit of Nueva Leon (idntry_raw = 11). However, the first is considered *national_level* of 1, while the later is *national_level* of 0. That means that both samples are found in the GLAD module ALL, but the module CLO for Mexico is calculated using only the first sample, discarding the later.
* in PIRLS 2001 the *countrycode* GBR is linked to both the samples from England (idcntry_raw = 926) and Scotland (idcntry_raw = 927) and both are considered *national_level* of 1. That means that both samples are found in the GLAD module ALL and the module CLO for United Kingdom is calculated pooling both samples without distinction.

(b) The variable *idcntry_raw* is preserved as found in the raw data. Most assesment-years have it as a numerical variable. The only exception so far is PASEC 1996, for which this variable is a string.

(c) Some assessment-years may not have the variable _idclass_.

---

## Variables specific to a single assessment or year

Though the variable _learner_weight_ exist in all assessments, other sample-related variables vary across assessments.

varname | value | varlabel| vartype | note
-- | -- | -- | -- | --
year | key | Year of assessment | Date | PASEC, EGRA only (when multi-year bundles)
urban_o* | trait | Original variable of urban | Categorical | PIRLS, TIMSS, SACMEQ only (whenever available)
learner_weight_subject* | sample | Total learner weight for specific subject | Numerical | LLECE only
strata* | sample | Strata | Numerical | LLECE, PASEC only
jkzone | sample | Jackknife zone | Numerical | PIRLS, TIMSS, PASEC 2014 only
jkrep | sample | Jackknife replicate code | Numerical | PIRLS, TIMSS, PASEC 2014 only
weight_replicate* | sample | Replicate weight # | Numerical | PASEC 2014 only

---

## Variables specific to a single assessment or year

Though the variable _learner_weight_ exist in all assessments, other sample-related variables vary across assessments.

varname | value | varlabel| vartype | note
-- | -- | -- | -- | --
year | key | Year of assessment | Date | PASEC, EGRA only (when multi-year bundles)
urban_o* | trait | Original variable of urban | Categorical | PIRLS, TIMSS, SACMEQ only (whenever available)
learner_weight_subject* | sample | Total learner weight for specific subject | Numerical | LLECE only
strata* | sample | Strata | Numerical | LLECE, PASEC only
jkzone | sample | Jackknife zone | Numerical | PIRLS, TIMSS, PASEC 2014 only
jkrep | sample | Jackknife replicate code | Numerical | PIRLS, TIMSS, PASEC 2014 only
weight_replicate* | sample | Replicate weight # | Numerical | PASEC 2014 only