# GLAD

This repository contains the **Global Learning Assessment Database (GLAD)**, a collection of harmonized learning assessments datasets at the student and country level.

All the code required to create this collection, starting from the raw microdata of each assessment, are available in this repository. Our intention in doing so is to incentivize others to [contribute to growing this collection](#Contribution-and-Replication).

For an example of analysis enabled by this collection, please check the [**Learning Poverty repo**](https://github.com/worldbank/LearningPoverty) and its corresponding technical paper [1].

<sup>[1] Azevedo, J.P., and others. 2019. _“Will Every Child Be Able to Read by 2030? Why Eliminating Learning Poverty Will Be Harder Than You Think, and What to Do About It.”_ World Bank Policy Research Working Paper series. Washington, DC: World Bank.</sup>

***

## Tasks in this project
1. [Harmonization](#harmonization): harmonizes raw microdata of learning assessments into student-level datasets
1. [Indicators](#indicators): consolidate harmonized data by subgroups into country-level outcomes

### Harmonization

Starts from the original datasets of each assessment (pulled from _eduraw_ collection in _datalibweb_ or from a local copy, directly downloaded from the data publishers)
and ends with the creation of the dataset GLAD_ALL and GLAD_ALL-BASE. Files receive a master vintage that reflects any possible updates of a surveyid (_region_year_assessment_).

Those two modules of GLAD (ALL and ALL-BASE) are at the learner level, that is, one observation corresponds to one learner or student or pupil. Both modules contain the [harmonized variables](https://github.com/worldbank/GLAD/wiki/Agreed-variables-to-include-in-GLAD-datasets), but the module ALL-BASE additionally includes all the original variables from the raw data. Since the ALL-BASE file may be very large, we recommend using the module ALL whenever possible.

The output files are saved in the clone with adaptation vintage _wrk_A_, and corresponding markdown documents are generated with the same name. The assessments currently in the loop are (click on the links for each file's markdown documentation):

- **GLAD_ALL** for **PIRLS**: [2001](https://github.com/worldbank/GLAD/blob/master/00_documentation/wld_2001_pirls_v01_m_wrk_a_glad_all.md) [2006](https://github.com/worldbank/GLAD/blob/master/00_documentation/wld_2006_pirls_v01_m_wrk_a_glad_all.md) [2011](https://github.com/worldbank/GLAD/blob/master/00_documentation/wld_2011_pirls_v01_m_wrk_a_glad_all.md) [2016](https://github.com/worldbank/GLAD/blob/master/00_documentation/wld_2016_pirls_v01_m_wrk_a_glad_all.md)
- **GLAD_ALL** for **TIMSS**: [2003](https://github.com/worldbank/GLAD/blob/master/00_documentation/wld_2003_timss_v01_m_wrk_a_glad_all.md) [2007](https://github.com/worldbank/GLAD/blob/master/00_documentation/wld_2007_timss_v01_m_wrk_a_glad_all.md) [2011](https://github.com/worldbank/GLAD/blob/master/00_documentation/wld_2011_timss_v01_m_wrk_a_glad_all.md) [2015](https://github.com/worldbank/GLAD/blob/master/00_documentation/wld_2015_timss_v01_m_wrk_a_glad_all.md)
- **GLAD_ALL** for **LLECE**: [2006](https://github.com/worldbank/GLAD/blob/master/00_documentation/lac_2006_llece_v01_m_wrk_a_glad_all.md) [2013](https://github.com/worldbank/GLAD/blob/master/00_documentation/lac_2013_llece_v01_m_wrk_a_glad_all.md)
- **GLAD_ALL** for **PASEC**: [2014](https://github.com/worldbank/GLAD/blob/master/00_documentation/ssa_2014_pasec_v01_m_wrk_a_glad_all.md)
- **GLAD_ALL** for **SACMEQ**: [2000](https://github.com/worldbank/GLAD/blob/master/00_documentation/ssa_2000_sacmeq_v01_m_wrk_a_glad_all.md) [2007](https://github.com/worldbank/GLAD/blob/master/00_documentation/ssa_2007_sacmeq_v01_m_wrk_a_glad_all.md)

### Indicators

Starts from the GLAD_ALL datasets (flexibly pulled from _GLAD_ collection in _datalibweb_ or from the clone) and ends with the creation of the dataset GLAD_CLO for all the surveys specified in the loop. In the resulting CLO file, each country-grade has several observations, corresponding to the subgroups all / male / female / urban / rural. There is flexibility in the code to add other subgroups as needed.

The output files are saved in the clone with adaptation vintage _wrk_A_, and corresponding markdown documents are generated with the same name. The assessments currently in the loop are (click on the links for each file's markdown documentation):

- **GLAD_CLO** for **PIRLS**: [2001](https://github.com/worldbank/GLAD/blob/master/00_documentation/wld_2001_pirls_v01_m_wrk_a_glad_clo.md) [2006](https://github.com/worldbank/GLAD/blob/master/00_documentation/wld_2006_pirls_v01_m_wrk_a_glad_clo.md) [2011](https://github.com/worldbank/GLAD/blob/master/00_documentation/wld_2011_pirls_v01_m_wrk_a_glad_clo.md) [2016](https://github.com/worldbank/GLAD/blob/master/00_documentation/wld_2016_pirls_v01_m_wrk_a_glad_clo.md)
- **GLAD_CLO** for **TIMSS**: [2003](https://github.com/worldbank/GLAD/blob/master/00_documentation/wld_2003_timss_v01_m_wrk_a_glad_clo.md) [2007](https://github.com/worldbank/GLAD/blob/master/00_documentation/wld_2007_timss_v01_m_wrk_a_glad_clo.md) [2011](https://github.com/worldbank/GLAD/blob/master/00_documentation/wld_2011_timss_v01_m_wrk_a_glad_clo.md) [2015](https://github.com/worldbank/GLAD/blob/master/00_documentation/wld_2015_timss_v01_m_wrk_a_glad_clo.md)
- **GLAD_CLO** for **LLECE**: [2006](https://github.com/worldbank/GLAD/blob/master/00_documentation/lac_2006_llece_v01_m_wrk_a_glad_clo.md) [2013](https://github.com/worldbank/GLAD/blob/master/00_documentation/lac_2013_llece_v01_m_wrk_a_glad_clo.md)
- **GLAD_CLO** for **PASEC**: [2014](https://github.com/worldbank/GLAD/blob/master/00_documentation/ssa_2014_pasec_v01_m_wrk_a_glad_clo.md)
- **GLAD_CLO** for **SACMEQ**: [2000](https://github.com/worldbank/GLAD/blob/master/00_documentation/ssa_2000_sacmeq_v01_m_wrk_a_glad_clo.md) [2007](https://github.com/worldbank/GLAD/blob/master/00_documentation/ssa_2007_sacmeq_v01_m_wrk_a_glad_clo.md)

### Technical notes

The GLAD programs by default use data from _datalibweb_. Please see [guidelines to retrieve data from datalibweb](#--Guidelines-to-Retrieve-Data-from-datalibweb). Note that _datalibweb_ requires access and authentication to the WorldBank network.

The GLAD programs also make use of the _edukit_ package. The latest version of _edukit_ and installation instructions can be found in the [EduAnalyticsToolkit repo](https://github.com/worldbank/EduAnalyticsToolkit).

The programs are set up to automatically generate a documentation .md file for each GLAD.dta created. This will only run from Stata versions 15 or above, for it uses the _dyntext_ command.

***

## Contribution and Replication

See the [Contribution and Replication note](https://github.com/worldbank/GLAD/blob/master/00_documentation/Contribution_and_Replication.md) for information on how to navigate this repository, how to contribute to the code and how to replicate the numbers.

In short, external researchers wanting to reproduce the collection can do so, provided they download the raw microdata from the assessments, and change the default source from _datalibweb_ to their local download copy of the raw microdata.

For the internal World Bank audience, all the datasets in this collection are readily accessible in [_datalibweb_](https://github.com/worldbank/GLAD/blob/master/00_documentation/Datalibweb_Guidelines.md) and [Statistics On-Line (SOL)](http://wbgmssol1001.worldbank.org/).

***

## Contact
<img align="left" src="https://user-images.githubusercontent.com/43160181/66895172-211fc400-efc0-11e9-998e-c5090e51730d.png" width="120">

This Repository is maintained by the **EduAnalytics** team at the World Bank Education Global Practice.

The **EduAnalytics** team aims to provide internal and external clients timely access to high quality data, tools, and analytics that can be used to measure, monitor, and understand the education sector across regions.

The team can be reached at [eduanalytics@worldbank.org](mailto:eduanalytics@worldbank.org).
