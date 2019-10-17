# Guidelines to Retrieve Data from datalibweb
<sup>back to the [README](https://github.com/worldbank/GLAD/blob/master/README.md) :leftwards_arrow_with_hook:</sup>

Note that _datalibweb_ requires access and authentication to the World Bank network. External researchers wishing to replicate this repo are still able to, provided they download the raw microdata from all the assessments and change the default from using _datalibweb_ to using their local copy in each run do file.



## Installation of datalibweb

a) **Directly from Stata**: In order to get install to Datalibweb command in Stata, type the following code, and click on the datalibweb (hyperlink) to install in your computer.
```stata
net from http://eca/povdata/datalibweb/_ado
```

b) **Manual installation**: In addition, users can install the package the manual way, by getting the file from this link: http://eca/povdata/datalibweb/_ado/datalibweb.zip and extracting all files into c:/ado (or whatever your Stata ado dir is), without changing the folder structure.

## Retrieving data

The _datalibweb_ command has no required parameters. If you simply type in Stata
```stata
datalibweb
```
you will be able to navigate countries and collections of data by clicking in your Stata result window.

If you know the specific file you want to query, you can preclude this navigation and directly specify a file through the option filename in the _datalibweb_ command.
For example, to load “ALB_2015_CM2_STU_QQQ.dta” from the ALB 2015 PISA survey, you should type:
```stata
datalibweb, country(ALB) year(2015) type(EDURAW) surveyid(ALB_2015_PISA_v01_M) filename(ALB_2015_CM2_STU_QQQ.dta)
```

## Retriving GLAD files

Once the **EduAnalytics** team receives and harmonize the raw data for a new assessment-year, it includes all the GLAD modules for that assessment-year in the GLAD collection in _datalibweb_, so that anyone with access to _datalibweb_ may access that file. Currently, the modules being generated are ALL, ALL-BASE and CLO.

For example, for the PASEC 2014, the available files are:
```stata
datalibweb, country(SSA) year(2014) type(GLAD) surveyid(SSA_2014_PASEC_v01_M_v01_A_GLAD) filename(SSA_2014_PASEC_v01_M_v01_A_GLAD_ALL.dta)
datalibweb, country(SSA) year(2014) type(GLAD) surveyid(SSA_2014_PASEC_v01_M_v01_A_GLAD) filename(SSA_2014_PASEC_v01_M_v01_A_GLAD_ALL-BASE.dta)
datalibweb, country(SSA) year(2014) type(GLAD) surveyid(SSA_2014_PASEC_v01_M_v01_A_GLAD) filename(SSA_2014_PASEC_v01_M_v01_A_GLAD_CLO.dta)
```
