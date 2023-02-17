Documentation of GLAD dataset
=====================================================================


[back to list of assessments](https://github.com/worldbank/GLAD/blob/master/README.md#harmonization)

This dataset is part of the Global Learning Assessment Database (GLAD). It contains microdata from AMPLB 2019. Each observation corresponds to one learner (student or pupil), and the variables have been harmonized.

**Metadata** stored in this dataset:

~~~~
region:      SSA
year:        2019
assessment:  AMPLB
master:      v01_M
adaptation:  wrk_A_GLAD
module:      ALL
ttl_info:    Joao Pedro de Azevedo [eduanalytics@worldbank.org]
dofile_info: last modified by Yi Ning Wong in 3/29, 2022
lastsave:    4 Apr 2022 09:41:03 by wb255520
~~~~


About the **415 variables** in this dataset:

~~~~
The variables belong to the following variable classifications:
    idvars keyvars valuevars traitvars samplevars

idvars:     idcntry_raw idschool idgrade idlearner
keyvars:    surveyid countrycode national_level
valuevars:  score_amplb_read_01 score_amplb_math_01 score_amplb_read_02 score_amplb_math_02 score_amplb_read_03 score_amplb_math_03 score_amplb_read_04 score_amplb_math_04 score_amplb_read_05 score_amplb_math_05
traitvars:  age male escs has_qescs qescs urban
samplevars: weight_replicate1 weight_replicate2 weight_replicate3 weight_replicate4 weight_replicate5 weight_replicate6 weight_replicate7 weight_replicate8 weight_replicate9 weight_replicate10 weight_replicate11 weight_replicate12 weight_replicate13 weight_replicate14 weight_replicate15 weight_replicate16 weight_replicate17 weight_replicate18 weight_replicate19 weight_replicate20 weight_replicate21 weight_replicate22 weight_replicate23 weight_replicate24 weight_replicate25 weight_replicate26 weight_replicate27 weight_replicate28 weight_replicate29 weight_replicate30 weight_replicate31 weight_replicate32 weight_replicate33 weight_replicate34 weight_replicate35 weight_replicate36 weight_replicate37 weight_replicate38 weight_replicate39 weight_replicate40 weight_replicate41 weight_replicate42 weight_replicate43 weight_replicate44 weight_replicate45 weight_replicate46 weight_replicate47 weight_replicate48 weight_replicate49 weight_replicate50 weight_replicate51 weight_replicate52 weight_replicate53 weight_replicate54 weight_replicate55 weight_replicate56 weight_replicate57 weight_replicate58 weight_replicate59 weight_replicate60 weight_replicate61 weight_replicate62 weight_replicate63 weight_replicate64 weight_replicate65 weight_replicate66 weight_replicate67 weight_replicate68 weight_replicate69 weight_replicate70 weight_replicate71 weight_replicate72 weight_replicate73 weight_replicate74 weight_replicate75 weight_replicate76 weight_replicate77 weight_replicate78 weight_replicate79 weight_replicate80 weight_replicate81 weight_replicate82 weight_replicate83 weight_replicate84 weight_replicate85 weight_replicate86 weight_replicate87 weight_replicate88 weight_replicate89 weight_replicate90 weight_replicate91 weight_replicate92 weight_replicate93 weight_replicate94 weight_replicate95 weight_replicate96 weight_replicate97 weight_replicate98 weight_replicate99 weight_replicate100 weight_replicate101 weight_replicate102 weight_replicate103 weight_replicate104 weight_replicate105 weight_replicate106 weight_replicate107 weight_replicate108 weight_replicate109 weight_replicate110 weight_replicate111 weight_replicate112 weight_replicate113 weight_replicate114 weight_replicate115 weight_replicate116 weight_replicate117 weight_replicate118 weight_replicate119 weight_replicate120 weight_replicate121 weight_replicate122 weight_replicate123 weight_replicate124 weight_replicate125 weight_replicate126 weight_replicate127 weight_replicate128 weight_replicate129 weight_replicate130 weight_replicate131 weight_replicate132 weight_replicate133 weight_replicate134 weight_replicate135 weight_replicate136 weight_replicate137 weight_replicate138 weight_replicate139 weight_replicate140 weight_replicate141 weight_replicate142 weight_replicate143 weight_replicate144 weight_replicate145 weight_replicate146 weight_replicate147 weight_replicate148 weight_replicate149 weight_replicate150 weight_replicate151 weight_replicate152 weight_replicate153 weight_replicate154 weight_replicate155 weight_replicate156 weight_replicate157 weight_replicate158 weight_replicate159 weight_replicate160 weight_replicate161 weight_replicate162 weight_replicate163 weight_replicate164 weight_replicate165 weight_replicate166 weight_replicate167 weight_replicate168 weight_replicate169 weight_replicate170 weight_replicate171 weight_replicate172 weight_replicate173 weight_replicate174 weight_replicate175 weight_replicate176 weight_replicate177 weight_replicate178 weight_replicate179 weight_replicate180 weight_replicate181 weight_replicate182 weight_replicate183 weight_replicate184 weight_replicate185 weight_replicate186 weight_replicate187 weight_replicate188 weight_replicate189 weight_replicate190 weight_replicate191 weight_replicate192 weight_replicate193 weight_replicate194 weight_replicate195 weight_replicate196 weight_replicate197 weight_replicate198 weight_replicate199 weight_replicate200 weight_replicate201 weight_replicate202 weight_replicate203 weight_replicate204 weight_replicate205 weight_replicate206 weight_replicate207 weight_replicate208 weight_replicate209 weight_replicate210 weight_replicate211 weight_replicate212 weight_replicate213 weight_replicate214 weight_replicate215 weight_replicate216 weight_replicate217 weight_replicate218 weight_replicate219 weight_replicate220 weight_replicate221 weight_replicate222 weight_replicate223 weight_replicate224 weight_replicate225 weight_replicate226 weight_replicate227 weight_replicate228 weight_replicate229 weight_replicate230 weight_replicate231 weight_replicate232 weight_replicate233 weight_replicate234 weight_replicate235 weight_replicate236 weight_replicate237 weight_replicate238 weight_replicate239 weight_replicate240 weight_replicate241 weight_replicate242 weight_replicate243 weight_replicate244 weight_replicate245 weight_replicate246 weight_replicate247 weight_replicate248 weight_replicate249 weight_replicate250 weight_replicate251 weight_replicate252 weight_replicate253 weight_replicate254 weight_replicate255 weight_replicate256 weight_replicate257 weight_replicate258 weight_replicate259 weight_replicate260 weight_replicate261 weight_replicate262 weight_replicate263 weight_replicate264 weight_replicate265 weight_replicate266 weight_replicate267 weight_replicate268 weight_replicate269 weight_replicate270 weight_replicate271 weight_replicate272 weight_replicate273 weight_replicate274 weight_replicate275 weight_replicate276 weight_replicate277 weight_replicate278 weight_replicate279 weight_replicate280 weight_replicate281 weight_replicate282 weight_replicate283 weight_replicate284 weight_replicate285 weight_replicate286 weight_replicate287 weight_replicate288 weight_replicate289 weight_replicate290 weight_replicate291 weight_replicate292 weight_replicate293 weight_replicate294 weight_replicate295 weight_replicate296 weight_replicate297 weight_replicate298 weight_replicate299 weight_replicate300 weight_replicate301 weight_replicate302 weight_replicate303 weight_replicate304 weight_replicate305 weight_replicate306 weight_replicate307 weight_replicate308 weight_replicate309 weight_replicate310 weight_replicate311 weight_replicate312 weight_replicate313 weight_replicate314 weight_replicate315 weight_replicate316 weight_replicate317 weight_replicate318 weight_replicate319 weight_replicate320 learner_weight strata


Variable        Obs Unique       Mean        Min       Max  Label
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
idcntry_raw   29206      6          .          .         .  Country ID, as coded in rawdata
idschool      29206   1102   126472.9          0    818106  School ID
idgrade       29206      1          6          6         6  Grade ID
idlearner     29206    100   14.19113          0        99  Learner ID
surveyid      29206      1          .          .         .  Survey ID (Region_Year_Assessment)
countrycode   29206      6          .          .         .  WB country code (3 letters)
national_l~l  29206      1          1          1         1  Idcntry_raw is a national level
score_a~d_01  23943      2   .0524997          0         1  Plausible value 1: AMPLB score for reading
score_a~h_01  29206      2   .2699445          0         1  Plausible value 1: AMPLB score for math
score_a~d_02  23943      2   .0515391          0         1  Plausible value 2: AMPLB score for reading
score_a~h_02  29206      2   .2699445          0         1  Plausible value 2: AMPLB score for math
score_a~d_03  23943      2    .050662          0         1  Plausible value 3: AMPLB score for reading
score_a~h_03  29206      2   .2678217          0         1  Plausible value 3: AMPLB score for math
score_a~d_04  23943      2   .0505785          0         1  Plausible value 4: AMPLB score for reading
score_a~h_04  29206      2   .2668972          0         1  Plausible value 4: AMPLB score for math
score_a~d_05  23943      2   .0502443          0         1  Plausible value 5: AMPLB score for reading
score_a~h_05  29206      2   .2669657          0         1  Plausible value 5: AMPLB score for math
age           19050     20   13.34756          8        99  Learner age at time of assessment
male          19050      2   .4745407          0         1  Learner gender is male/female
escs          19050   1654  -.0718853  -2.147879  3.086277  Standardized values of SES
has_qescs     29206      2   .6522632          0         1  Dummy variable for observations with a valid QESCS
qescs         19050      5   2.759948          1         5  Quintiles of Socio-Economic Status
urban         18534      2   .3031186          0         1  School is located in urban/rural area
weight_re~e1  29206    942   .2209946          0  4.818388  Replicate weight 1
weight_re~e2  29206    941   .2210269          0  4.818388  Replicate weight 2
weight_re~e3  29206    942   .2209465          0  4.818388  Replicate weight 3
weight_re~e4  29206    942   .2210244          0  4.818388  Replicate weight 4
weight_re~e5  29206    942   .2206377          0  4.818388  Replicate weight 5
weight_re~e6  29206    942   .2209207          0  4.818388  Replicate weight 6
weight_re~e7  29206    941   .2209806          0  4.818388  Replicate weight 7
weight_re~e8  29206    941    .220785          0  4.818388  Replicate weight 8
weight_re~e9  29206    942   .2207689          0  4.818388  Replicate weight 9
weight_r~e10  29206    941    .220194          0  4.818388  Replicate weight 10
weight_r~e11  29206    942   .2206757          0  4.818388  Replicate weight 11
weight_r~e12  29206    942   .2206286          0  4.818388  Replicate weight 12
weight_r~e13  29206    942   .2205076          0  4.818388  Replicate weight 13
weight_r~e14  29206    942    .220757          0  4.818388  Replicate weight 14
weight_r~e15  29206    942   .2205964          0  4.818388  Replicate weight 15
weight_r~e16  29206    941   .2205279          0  4.818388  Replicate weight 16
weight_r~e17  29206    942   .2207954          0  4.818388  Replicate weight 17
weight_r~e18  29206    942   .2205411          0  4.818388  Replicate weight 18
weight_r~e19  29206    942   .2209195          0  4.818388  Replicate weight 19
weight_r~e20  29206    941   .2209537          0  4.818388  Replicate weight 20
weight_r~e21  29206    944   .2210252          0  4.818388  Replicate weight 21
weight_r~e22  29206    942   .2211074          0  4.818388  Replicate weight 22
weight_r~e23  29206    943   .2207798          0  4.818388  Replicate weight 23
weight_r~e24  29206    943   .2208518          0  4.818388  Replicate weight 24
weight_r~e25  29206    942   .2210185          0  4.818388  Replicate weight 25
weight_r~e26  29206    943    .221026          0  4.818388  Replicate weight 26
weight_r~e27  29206    942   .2209766          0  4.818388  Replicate weight 27
weight_r~e28  29206    941   .2209293          0  4.818388  Replicate weight 28
weight_r~e29  29206    943   .2204643          0  4.818388  Replicate weight 29
weight_r~e30  29206    942   .2209156          0  4.818388  Replicate weight 30
weight_r~e31  29206    942   .2205914          0  4.818388  Replicate weight 31
weight_r~e32  29206    943   .2210119          0  4.818388  Replicate weight 32
weight_r~e33  29206    942   .2208197          0  4.818388  Replicate weight 33
weight_r~e34  29206    941   .2209142          0  4.818388  Replicate weight 34
weight_r~e35  29206    941   .2210519          0  4.818388  Replicate weight 35
weight_r~e36  29206    941   .2209708          0  4.818388  Replicate weight 36
weight_r~e37  29206    942   .2209299          0  4.818388  Replicate weight 37
weight_r~e38  29206    943    .220901          0  4.818388  Replicate weight 38
weight_r~e39  29206    943   .2208696          0  4.818388  Replicate weight 39
weight_r~e40  29206    943   .2202205          0  4.818388  Replicate weight 40
weight_r~e41  29206    943    .220447          0  4.818388  Replicate weight 41
weight_r~e42  29206    942   .2203246          0  4.818388  Replicate weight 42
weight_r~e43  29206    942    .220941          0  4.818388  Replicate weight 43
weight_r~e44  29206    942   .2209079          0  4.818388  Replicate weight 44
weight_r~e45  29206    941   .2203738          0  4.818388  Replicate weight 45
weight_r~e46  29206    941    .220852          0  4.818388  Replicate weight 46
weight_r~e47  29206    941   .2205394          0  4.818388  Replicate weight 47
weight_r~e48  29206    943   .2203075          0  4.818388  Replicate weight 48
weight_r~e49  29206    943   .2208575          0  4.818388  Replicate weight 49
weight_r~e50  29206    944   .2208674          0  4.818388  Replicate weight 50
weight_r~e51  29206    943   .2212082          0  4.818388  Replicate weight 51
weight_r~e52  29206    942   .2209178          0  4.818388  Replicate weight 52
weight_r~e53  29206    942   .2209999          0  4.818388  Replicate weight 53
weight_r~e54  29206    942   .2207142          0  4.818388  Replicate weight 54
weight_r~e55  29206    942   .2209738          0  4.818388  Replicate weight 55
weight_r~e56  29206    943   .2206636          0  4.818388  Replicate weight 56
weight_r~e57  29206    943   .2209031          0  4.818388  Replicate weight 57
weight_r~e58  29206    942   .2206822          0  4.818388  Replicate weight 58
weight_r~e59  29206    943   .2206659          0  4.818388  Replicate weight 59
weight_r~e60  29206    942   .2208853          0  4.818388  Replicate weight 60
weight_r~e61  29206    942   .2207045          0  4.818388  Replicate weight 61
weight_r~e62  29206    942   .2205719          0  4.818388  Replicate weight 62
weight_r~e63  29206    942   .2209747          0  4.818388  Replicate weight 63
weight_r~e64  29206    941   .2208098          0  4.818388  Replicate weight 64
weight_r~e65  29206    943   .2204999          0  4.818388  Replicate weight 65
weight_r~e66  29206    941   .2203894          0  4.818388  Replicate weight 66
weight_r~e67  29206    943   .2207432          0  4.818388  Replicate weight 67
weight_r~e68  29206    942   .2209236          0  4.818388  Replicate weight 68
weight_r~e69  29206    943   .2207856          0  4.818388  Replicate weight 69
weight_r~e70  29206    943   .2209632          0  4.818388  Replicate weight 70
weight_r~e71  29206    941   .2207409          0  4.818388  Replicate weight 71
weight_r~e72  29206    941   .2206244          0  4.818388  Replicate weight 72
weight_r~e73  29206    941   .2203801          0  4.818388  Replicate weight 73
weight_r~e74  29206    941    .220073          0  4.818388  Replicate weight 74
weight_r~e75  29206    942   .2207191          0  4.818388  Replicate weight 75
weight_r~e76  29206    942    .220746          0  4.818388  Replicate weight 76
weight_r~e77  29206    942     .22063          0  4.818388  Replicate weight 77
weight_r~e78  29206    942   .2209803          0  4.818388  Replicate weight 78
weight_r~e79  29206    942   .2205128          0  4.818388  Replicate weight 79
weight_r~e80  29206    941   .2205396          0  4.818388  Replicate weight 80
weight_r~e81  29206    942   .2205095          0  4.818388  Replicate weight 81
weight_r~e82  29206    944   .2206105          0  4.818388  Replicate weight 82
weight_r~e83  29206    942   .2208171          0  4.818388  Replicate weight 83
weight_r~e84  29206    944   .2210243          0  4.818388  Replicate weight 84
weight_r~e85  29206    944   .2206421          0  4.818388  Replicate weight 85
weight_r~e86  29206    943    .220781          0  4.818388  Replicate weight 86
weight_r~e87  29206    941    .220784          0  4.818388  Replicate weight 87
weight_r~e88  29206    941   .2192779          0  4.818388  Replicate weight 88
weight_r~e89  29206    941   .2207438          0  4.818388  Replicate weight 89
weight_r~e90  29206    941   .2205079          0  4.818388  Replicate weight 90
weight_r~e91  29206    942   .2203259          0  4.818388  Replicate weight 91
weight_r~e92  29206    942   .2213917          0  4.818388  Replicate weight 92
weight_r~e93  29206    944   .2210998          0  4.818388  Replicate weight 93
weight_r~e94  29206    941   .2210605          0  4.818388  Replicate weight 94
weight_r~e95  29206    941   .2205488          0  4.818388  Replicate weight 95
weight_r~e96  29206    941   .2206957          0  4.818388  Replicate weight 96
weight_r~e97  29206    943   .2209592          0  4.818388  Replicate weight 97
weight_r~e98  29206    941   .2209501          0  4.818388  Replicate weight 98
weight_r~e99  29206    941   .2209608          0  4.818388  Replicate weight 99
weight_r~100  29206    941   .2208048          0  4.818388  Replicate weight 100
weight_r~101  29206    942   .2208376          0  4.818388  Replicate weight 101
weight_r~102  29206    942   .2205687          0  4.818388  Replicate weight 102
weight_r~103  29206    942   .2209447          0  4.818388  Replicate weight 103
weight_r~104  29206    942   .2207648          0  4.818388  Replicate weight 104
weight_r~105  29206    943   .2209199          0  4.818388  Replicate weight 105
weight_r~106  29206    941   .2207308          0  4.818388  Replicate weight 106
weight_r~107  29206    945   .2210697          0  4.818388  Replicate weight 107
weight_r~108  29206    943   .2209607          0  4.818388  Replicate weight 108
weight_r~109  29206    942   .2207891          0  4.818388  Replicate weight 109
weight_r~110  29206    941   .2208741          0  4.818388  Replicate weight 110
weight_r~111  29206    942   .2208858          0  4.818388  Replicate weight 111
weight_r~112  29206    944   .2208894          0  4.818388  Replicate weight 112
weight_r~113  29206    941   .2208256          0  4.818388  Replicate weight 113
weight_r~114  29206    943   .2211796          0  4.818388  Replicate weight 114
weight_r~115  29206    942   .2209625          0  4.818388  Replicate weight 115
weight_r~116  29206    942   .2208768          0  4.818388  Replicate weight 116
weight_r~117  29206    943    .220691          0  4.818388  Replicate weight 117
weight_r~118  29206    943   .2209657          0  4.818388  Replicate weight 118
weight_r~119  29206    942   .2207438          0  4.818388  Replicate weight 119
weight_r~120  29206    941   .2210333          0  4.818388  Replicate weight 120
weight_r~121  29206    942   .2209545          0  4.818388  Replicate weight 121
weight_r~122  29206    942   .2208513          0  4.818388  Replicate weight 122
weight_r~123  29206    941   .2210769          0  4.818388  Replicate weight 123
weight_r~124  29206    941   .2207968          0  4.818388  Replicate weight 124
weight_r~125  29206    941   .2207956          0  4.818388  Replicate weight 125
weight_r~126  29206    942   .2209958          0  4.818388  Replicate weight 126
weight_r~127  29206    943   .2211584          0  4.818388  Replicate weight 127
weight_r~128  29206    942   .2208595          0  4.818388  Replicate weight 128
weight_r~129  29206    942   .2210259          0  4.818388  Replicate weight 129
weight_r~130  29206    942   .2209923          0  4.818388  Replicate weight 130
weight_r~131  29206    941   .2206234          0  4.818388  Replicate weight 131
weight_r~132  29206    942   .2209277          0  4.818388  Replicate weight 132
weight_r~133  29206    942   .2208987          0  4.818388  Replicate weight 133
weight_r~134  29206    942   .2212299          0  4.818388  Replicate weight 134
weight_r~135  29206    942   .2212547          0  4.818388  Replicate weight 135
weight_r~136  29206    943   .2209036          0  4.818388  Replicate weight 136
weight_r~137  29206    943     .22102          0  4.818388  Replicate weight 137
weight_r~138  29206    942   .2209525          0  4.818388  Replicate weight 138
weight_r~139  29206    942    .220729          0  4.818388  Replicate weight 139
weight_r~140  29206    943   .2210111          0  4.818388  Replicate weight 140
weight_r~141  29206    941   .2207259          0  4.818388  Replicate weight 141
weight_r~142  29206    942   .2205046          0  4.818388  Replicate weight 142
weight_r~143  29206    944   .2211123          0  4.818388  Replicate weight 143
weight_r~144  29206    943     .21792          0  2.090916  Replicate weight 144
weight_r~145  29206    943   .2211965          0  4.818388  Replicate weight 145
weight_r~146  29206    941   .2206452          0  4.818388  Replicate weight 146
weight_r~147  29206    943   .2213147          0  4.818388  Replicate weight 147
weight_r~148  29206    942   .2208643          0  4.818388  Replicate weight 148
weight_r~149  29206    943   .2210038          0  4.818388  Replicate weight 149
weight_r~150  29206    943    .221178          0  4.818388  Replicate weight 150
weight_r~151  29206    941   .2210365          0  4.818388  Replicate weight 151
weight_r~152  29206    941   .2210373          0  4.818388  Replicate weight 152
weight_r~153  29206    942    .221055          0  4.818388  Replicate weight 153
weight_r~154  29206    943   .2211718          0  4.818388  Replicate weight 154
weight_r~155  29206    942   .2210668          0  4.818388  Replicate weight 155
weight_r~156  29206    942   .2210966          0  4.818388  Replicate weight 156
weight_r~157  29206    943   .2209365          0  4.818388  Replicate weight 157
weight_r~158  29206    942   .2210796          0  4.818388  Replicate weight 158
weight_r~159  29206    942   .2208116          0  4.818388  Replicate weight 159
weight_r~160  29206    942    .220965          0  4.818388  Replicate weight 160
weight_r~161  29206    942   .2207746          0  4.818388  Replicate weight 161
weight_r~162  29206    942   .2207914          0  4.818388  Replicate weight 162
weight_r~163  29206    943   .2209963          0  4.818388  Replicate weight 163
weight_r~164  29206    943   .2211181          0  4.818388  Replicate weight 164
weight_r~165  29206    942   .2213444          0  4.818388  Replicate weight 165
weight_r~166  29206    942   .2210822          0  4.818388  Replicate weight 166
weight_r~167  29206    942   .2211658          0  4.818388  Replicate weight 167
weight_r~168  29206    943   .2212067          0  4.818388  Replicate weight 168
weight_r~169  29206    942   .2210339          0  4.818388  Replicate weight 169
weight_r~170  29206    942   .2210767          0  4.818388  Replicate weight 170
weight_r~171  29206    943   .2210949          0  4.818388  Replicate weight 171
weight_r~172  29206    944   .2212274          0  4.818388  Replicate weight 172
weight_r~173  29206    942   .2209488          0  4.818388  Replicate weight 173
weight_r~174  29206    942   .2209824          0  4.818388  Replicate weight 174
weight_r~175  29206    942   .2210564          0  4.818388  Replicate weight 175
weight_r~176  25395    804   .2136004          0  4.818388  Replicate weight 176
weight_r~177  25395    804   .2133622          0  4.818388  Replicate weight 177
weight_r~178  25395    804   .2136496          0  4.818388  Replicate weight 178
weight_r~179  21563    660   .2038176          0  4.818388  Replicate weight 179
weight_r~180  21563    661   .2041899          0  4.818388  Replicate weight 180
weight_r~181  21563    660   .2040188          0  4.818388  Replicate weight 181
weight_r~182  21563    660   .2039996          0  4.818388  Replicate weight 182
weight_r~183  21563    661   .2040422          0  4.818388  Replicate weight 183
weight_r~184  21563    661   .2040452          0  4.818388  Replicate weight 184
weight_r~185  21563    661    .203782          0  4.818388  Replicate weight 185
weight_r~186  21563    660   .2042329          0  4.818388  Replicate weight 186
weight_r~187  21563    661   .2040233          0  4.818388  Replicate weight 187
weight_r~188  21563    661   .2041146          0  4.818388  Replicate weight 188
weight_r~189  21563    660   .2017199          0  4.818388  Replicate weight 189
weight_r~190  21563    660   .2040243          0  4.818388  Replicate weight 190
weight_r~191  21563    661    .204172          0  4.818388  Replicate weight 191
weight_r~192  21563    660    .204203          0  4.818388  Replicate weight 192
weight_r~193  21563    660   .2038581          0  4.818388  Replicate weight 193
weight_r~194  21563    660   .2040788          0  4.818388  Replicate weight 194
weight_r~195  21563    661   .2037492          0  4.818388  Replicate weight 195
weight_r~196  21563    661   .2042303          0  4.818388  Replicate weight 196
weight_r~197  21563    660   .2038557          0  4.818388  Replicate weight 197
weight_r~198  21563    660   .2041049          0  4.818388  Replicate weight 198
weight_r~199  21563    662   .2041617          0  4.818388  Replicate weight 199
weight_r~200  21563    661   .2042199          0  4.818388  Replicate weight 200
weight_r~201  21563    661   .2041597          0  4.818388  Replicate weight 201
weight_r~202  21563    662   .2041862          0  4.818388  Replicate weight 202
weight_r~203  21563    661   .2041916          0  4.818388  Replicate weight 203
weight_r~204  21563    661   .2040883          0  4.818388  Replicate weight 204
weight_r~205  21563    661   .2040636          0  4.818388  Replicate weight 205
weight_r~206  21563    661   .2043752          0  4.818388  Replicate weight 206
weight_r~207  21563    661   .2038565          0  4.818388  Replicate weight 207
weight_r~208  21563    662   .2042377          0  4.818388  Replicate weight 208
weight_r~209  21563    660   .2039304          0  4.818388  Replicate weight 209
weight_r~210  21563    662   .2041377          0  4.818388  Replicate weight 210
weight_r~211  21563    661   .2037246          0  4.818388  Replicate weight 211
weight_r~212  21563    660   .2036593          0  4.818388  Replicate weight 212
weight_r~213  21563    661   .2038463          0  4.818388  Replicate weight 213
weight_r~214  21563    660   .2041448          0  4.818388  Replicate weight 214
weight_r~215  21563    661   .2041199          0  4.818388  Replicate weight 215
weight_r~216  21563    661   .2042325          0  4.818388  Replicate weight 216
weight_r~217  16655    452   .1992576          0  4.818388  Replicate weight 217
weight_r~218  16655    451   .1984711          0  4.818388  Replicate weight 218
weight_r~219  16655    452   .1982875          0  4.818388  Replicate weight 219
weight_r~220  16655    452   .1987491          0  4.818388  Replicate weight 220
weight_r~221  16655    451   .1986416          0  4.818388  Replicate weight 221
weight_r~222  16655    451   .1991944          0  4.818388  Replicate weight 222
weight_r~223  16655    452   .1986051          0  4.818388  Replicate weight 223
weight_r~224  16655    451   .1981009          0  4.818388  Replicate weight 224
weight_r~225  16655    451   .1991408          0  4.818388  Replicate weight 225
weight_r~226  16655    451    .198358          0  4.818388  Replicate weight 226
weight_r~227  16655    451   .1983452          0  4.818388  Replicate weight 227
weight_r~228  16655    451    .198795          0  4.818388  Replicate weight 228
weight_r~229  16655    451   .1986573          0  4.818388  Replicate weight 229
weight_r~230  11392    260   .1804031          0    .48195  Replicate weight 230
weight_r~231  11392    261   .1808454          0    .48195  Replicate weight 231
weight_r~232  11392    260   .1805926          0    .48195  Replicate weight 232
weight_r~233  11392    260   .1799151          0    .48195  Replicate weight 233
weight_r~234  11392    260   .1810636          0    .48195  Replicate weight 234
weight_r~235  11392    260   .1806673          0    .48195  Replicate weight 235
weight_r~236  11392    260   .1806396          0    .48195  Replicate weight 236
weight_r~237  11392    260   .1809511          0    .48195  Replicate weight 237
weight_r~238  11392    261   .1808466          0    .48195  Replicate weight 238
weight_r~239  11392    260     .18083          0    .48195  Replicate weight 239
weight_r~240  11392    261   .1805718          0    .48195  Replicate weight 240
weight_r~241  11392    261    .181265          0    .48195  Replicate weight 241
weight_r~242  11392    260   .1805136          0    .48195  Replicate weight 242
weight_r~243  11392    261   .1804582          0    .48195  Replicate weight 243
weight_r~244  11392    261    .180886          0    .48195  Replicate weight 244
weight_r~245  11392    261   .1805886          0    .48195  Replicate weight 245
weight_r~246  11392    260   .1810079          0    .48195  Replicate weight 246
weight_r~247  11392    260   .1802039          0    .48195  Replicate weight 247
weight_r~248  11392    260   .1802876          0    .48195  Replicate weight 248
weight_r~249  11392    260   .1805343          0    .48195  Replicate weight 249
weight_r~250  11392    260   .1814825          0    .48195  Replicate weight 250
weight_r~251   6499    251   .1593571          0    .48195  Replicate weight 251
weight_r~252   6499    251   .1593732          0    .48195  Replicate weight 252
weight_r~253   6499    252   .1595901          0    .48195  Replicate weight 253
weight_r~254   6499    252   .1591344          0    .48195  Replicate weight 254
weight_r~255   6499    251    .158714          0    .48195  Replicate weight 255
weight_r~256   6499    252   .1590993          0    .48195  Replicate weight 256
weight_r~257   6499    251   .1592039          0    .48195  Replicate weight 257
weight_r~258   6499    251    .159285          0    .48195  Replicate weight 258
weight_r~259   6499    251   .1595374          0    .48195  Replicate weight 259
weight_r~260   6499    251   .1591102          0    .48195  Replicate weight 260
weight_r~261   6499    251   .1591687          0    .48195  Replicate weight 261
weight_r~262   6499    252    .159956          0    .48195  Replicate weight 262
weight_r~263   6499    251   .1596723          0    .48195  Replicate weight 263
weight_r~264   6499    252    .159538          0    .48195  Replicate weight 264
weight_r~265   6499    251   .1596086          0    .48195  Replicate weight 265
weight_r~266   6499    251   .1594988          0    .48195  Replicate weight 266
weight_r~267   6499    252    .159564          0    .48195  Replicate weight 267
weight_r~268   6499    251   .1594531          0    .48195  Replicate weight 268
weight_r~269   6499    251   .1594689          0    .48195  Replicate weight 269
weight_r~270   6499    251   .1595628          0    .48195  Replicate weight 270
weight_r~271   6499    251   .1593869          0    .48195  Replicate weight 271
weight_r~272   6499    251   .1593484          0    .48195  Replicate weight 272
weight_r~273   6499    251   .1596317          0    .48195  Replicate weight 273
weight_r~274   6499    251   .1594592          0    .48195  Replicate weight 274
weight_r~275   6499    251   .1599578          0    .48195  Replicate weight 275
weight_r~276   6499    252    .159958          0    .48195  Replicate weight 276
weight_r~277   6499    252   .1598023          0    .48195  Replicate weight 277
weight_r~278   6499    251   .1593566          0    .48195  Replicate weight 278
weight_r~279   6499    251   .1595587          0    .48195  Replicate weight 279
weight_r~280   6499    252   .1594547          0    .48195  Replicate weight 280
weight_r~281   6499    252   .1598765          0    .48195  Replicate weight 281
weight_r~282   6499    252    .159969          0    .48195  Replicate weight 282
weight_r~283   6499    251   .1596586          0    .48195  Replicate weight 283
weight_r~284   6499    251   .1597578          0    .48195  Replicate weight 284
weight_r~285   6499    252   .1599162          0    .48195  Replicate weight 285
weight_r~286   6499    251   .1597817          0    .48195  Replicate weight 286
weight_r~287   6499    251    .159929          0    .48195  Replicate weight 287
weight_r~288   6499    252    .159936          0    .48195  Replicate weight 288
weight_r~289   6499    251   .1597809          0    .48195  Replicate weight 289
weight_r~290   6499    251   .1598044          0    .48195  Replicate weight 290
weight_r~291   6499    251   .1599619          0    .48195  Replicate weight 291
weight_r~292   6499    251   .1598953          0    .48195  Replicate weight 292
weight_r~293   6499    251   .1598655          0    .48195  Replicate weight 293
weight_r~294   6499    252   .1599697          0    .48195  Replicate weight 294
weight_r~295   6499    252   .1598369          0    .48195  Replicate weight 295
weight_r~296   6499    252   .1598963          0    .48195  Replicate weight 296
weight_r~297   6499    252   .1598765          0    .48195  Replicate weight 297
weight_r~298   6499    251   .1599228          0    .48195  Replicate weight 298
weight_r~299   6499    251   .1598634          0    .48195  Replicate weight 299
weight_r~300   6499    251   .1598413          0    .48195  Replicate weight 300
weight_r~301   6499    251   .1594865          0    .48195  Replicate weight 301
weight_r~302   6499    252   .1596368          0    .48195  Replicate weight 302
weight_r~303   6499    251   .1594938          0    .48195  Replicate weight 303
weight_r~304   6499    252   .1598865          0    .48195  Replicate weight 304
weight_r~305   6499    251   .1595476          0    .48195  Replicate weight 305
weight_r~306   6499    252   .1596547          0    .48195  Replicate weight 306
weight_r~307   6499    251    .159601          0    .48195  Replicate weight 307
weight_r~308   6499    252    .159833          0    .48195  Replicate weight 308
weight_r~309   6499    251   .1596366          0    .48195  Replicate weight 309
weight_r~310   6499    252   .1597795          0    .48195  Replicate weight 310
weight_r~311   6499    252   .1597438          0    .48195  Replicate weight 311
weight_r~312   6499    252   .1597973          0    .48195  Replicate weight 312
weight_r~313   6499    252    .159726          0    .48195  Replicate weight 313
weight_r~314   6499    252   .1598508          0    .48195  Replicate weight 314
weight_r~315   6499    252   .1597438          0    .48195  Replicate weight 315
weight_r~316   6499    251   .1599441          0    .48195  Replicate weight 316
weight_r~317   6499    251   .1594225          0    .48195  Replicate weight 317
weight_r~318   6499    252    .159619          0    .48195  Replicate weight 318
weight_r~319   6499    251   .1597081          0    .48195  Replicate weight 319
weight_r~320   6499    251   .1593156          0    .48195  Replicate weight 320
learner_we~t  29206    833   .2054376       .004  4.015323  Learner weight
strata        29206     47   9.442101          1        47  Strata
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


Plus the variables merged-on-the-fly, which are:

traitvars:  lp01_threshold_var lp02_threshold_var lp03_threshold_var lp04_threshold_var lp05_threshold_var lp06_threshold_var lp07_threshold_var lp08_threshold_var lp09_threshold_var lp10_threshold_var lp01_threshold_val lp02_threshold_val lp03_threshold_val lp04_threshold_val lp05_threshold_val lp06_threshold_val lp07_threshold_val lp08_threshold_val lp09_threshold_val lp10_threshold_val lp01_threshold_res lp02_threshold_res lp03_threshold_res lp04_threshold_res lp05_threshold_res lp06_threshold_res lp07_threshold_res lp08_threshold_res lp09_threshold_res lp10_threshold_res
valuevars:  sdg411_read_01 bmp_read_01 fgt1_read_01 fgt2_read_01 sdg411_read_02 bmp_read_02 fgt1_read_02 fgt2_read_02 sdg411_read_03 bmp_read_03 fgt1_read_03 fgt2_read_03 sdg411_read_04 bmp_read_04 fgt1_read_04 fgt2_read_04 sdg411_read_05 bmp_read_05 fgt1_read_05 fgt2_read_05 sdg411_math_01 bmp_math_01 fgt1_math_01 fgt2_math_01 sdg411_math_02 bmp_math_02 fgt1_math_02 fgt2_math_02 sdg411_math_03 bmp_math_03 fgt1_math_03 fgt2_math_03 sdg411_math_04 bmp_math_04 fgt1_math_04 fgt2_math_04 sdg411_math_05 bmp_math_05 fgt1_math_05 fgt2_math_05
~~~~

About the **29,206  observations** in this dataset:

~~~~
. tab countrycode idgrade if national_level==1

WB country |
   code (3 |  Grade ID
  letters) |         6 |     Total
-----------+-----------+----------
       BDI |     4,908 |     4,908 
       BFA |     6,499 |     6,499 
       CIV |     3,811 |     3,811 
       KEN |     5,263 |     5,263 
       SEN |     3,832 |     3,832 
       ZMB |     4,893 |     4,893 
-----------+-----------+----------
     Total |    29,206 |    29,206 

. 
. tab countrycode idgrade if national_level==0
no observations

~~~~

**Harmonization** of proficiency (done on-the-fly):

~~~~

      sdg411_read_01 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
      Non-proficient |     22,709       77.75       77.75
          Proficient |      1,234        4.23       81.98
 Missing score/level |      5,263       18.02      100.00
---------------------+-----------------------------------
               Total |     29,206      100.00

         bmp_read_01 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
          Proficient |      1,234        4.23        4.23
      Non-proficient |     22,709       77.75       81.98
Non-harmonized grade |      5,263       18.02      100.00
---------------------+-----------------------------------
               Total |     29,206      100.00

fgt1_read_0 |
          1 |      Freq.     Percent        Cum.
------------+-----------------------------------
          1 |     22,709       77.75       77.75
          . |      6,497       22.25      100.00
------------+-----------------------------------
      Total |     29,206      100.00

fgt2_read_0 |
          1 |      Freq.     Percent        Cum.
------------+-----------------------------------
          1 |     22,709       77.75       77.75
          . |      6,497       22.25      100.00
------------+-----------------------------------
      Total |     29,206      100.00

      sdg411_read_02 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
      Non-proficient |     22,709       77.75       77.75
          Proficient |      1,234        4.23       81.98
 Missing score/level |      5,263       18.02      100.00
---------------------+-----------------------------------
               Total |     29,206      100.00

         bmp_read_02 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
          Proficient |      1,234        4.23        4.23
      Non-proficient |     22,709       77.75       81.98
Non-harmonized grade |      5,263       18.02      100.00
---------------------+-----------------------------------
               Total |     29,206      100.00

fgt1_read_0 |
          2 |      Freq.     Percent        Cum.
------------+-----------------------------------
          1 |     22,709       77.75       77.75
          . |      6,497       22.25      100.00
------------+-----------------------------------
      Total |     29,206      100.00

fgt2_read_0 |
          2 |      Freq.     Percent        Cum.
------------+-----------------------------------
          1 |     22,709       77.75       77.75
          . |      6,497       22.25      100.00
------------+-----------------------------------
      Total |     29,206      100.00

      sdg411_read_03 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
      Non-proficient |     22,730       77.83       77.83
          Proficient |      1,213        4.15       81.98
 Missing score/level |      5,263       18.02      100.00
---------------------+-----------------------------------
               Total |     29,206      100.00

         bmp_read_03 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
          Proficient |      1,213        4.15        4.15
      Non-proficient |     22,730       77.83       81.98
Non-harmonized grade |      5,263       18.02      100.00
---------------------+-----------------------------------
               Total |     29,206      100.00

fgt1_read_0 |
          3 |      Freq.     Percent        Cum.
------------+-----------------------------------
          1 |     22,730       77.83       77.83
          . |      6,476       22.17      100.00
------------+-----------------------------------
      Total |     29,206      100.00

fgt2_read_0 |
          3 |      Freq.     Percent        Cum.
------------+-----------------------------------
          1 |     22,730       77.83       77.83
          . |      6,476       22.17      100.00
------------+-----------------------------------
      Total |     29,206      100.00

      sdg411_read_04 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
      Non-proficient |     22,732       77.83       77.83
          Proficient |      1,211        4.15       81.98
 Missing score/level |      5,263       18.02      100.00
---------------------+-----------------------------------
               Total |     29,206      100.00

         bmp_read_04 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
          Proficient |      1,211        4.15        4.15
      Non-proficient |     22,732       77.83       81.98
Non-harmonized grade |      5,263       18.02      100.00
---------------------+-----------------------------------
               Total |     29,206      100.00

fgt1_read_0 |
          4 |      Freq.     Percent        Cum.
------------+-----------------------------------
          1 |     22,732       77.83       77.83
          . |      6,474       22.17      100.00
------------+-----------------------------------
      Total |     29,206      100.00

fgt2_read_0 |
          4 |      Freq.     Percent        Cum.
------------+-----------------------------------
          1 |     22,732       77.83       77.83
          . |      6,474       22.17      100.00
------------+-----------------------------------
      Total |     29,206      100.00

      sdg411_read_05 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
      Non-proficient |     22,740       77.86       77.86
          Proficient |      1,203        4.12       81.98
 Missing score/level |      5,263       18.02      100.00
---------------------+-----------------------------------
               Total |     29,206      100.00

         bmp_read_05 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
          Proficient |      1,203        4.12        4.12
      Non-proficient |     22,740       77.86       81.98
Non-harmonized grade |      5,263       18.02      100.00
---------------------+-----------------------------------
               Total |     29,206      100.00

fgt1_read_0 |
          5 |      Freq.     Percent        Cum.
------------+-----------------------------------
          1 |     22,740       77.86       77.86
          . |      6,466       22.14      100.00
------------+-----------------------------------
      Total |     29,206      100.00

fgt2_read_0 |
          5 |      Freq.     Percent        Cum.
------------+-----------------------------------
          1 |     22,740       77.86       77.86
          . |      6,466       22.14      100.00
------------+-----------------------------------
      Total |     29,206      100.00

      sdg411_math_01 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
      Non-proficient |     21,322       73.01       73.01
          Proficient |      7,884       26.99      100.00
---------------------+-----------------------------------
               Total |     29,206      100.00

         bmp_math_01 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
          Proficient |      7,884       26.99       26.99
      Non-proficient |     21,322       73.01      100.00
---------------------+-----------------------------------
               Total |     29,206      100.00

fgt1_math_0 |
          1 |      Freq.     Percent        Cum.
------------+-----------------------------------
          1 |     21,322       73.01       73.01
          . |      7,884       26.99      100.00
------------+-----------------------------------
      Total |     29,206      100.00

fgt2_math_0 |
          1 |      Freq.     Percent        Cum.
------------+-----------------------------------
          1 |     21,322       73.01       73.01
          . |      7,884       26.99      100.00
------------+-----------------------------------
      Total |     29,206      100.00

      sdg411_math_02 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
      Non-proficient |     21,322       73.01       73.01
          Proficient |      7,884       26.99      100.00
---------------------+-----------------------------------
               Total |     29,206      100.00

         bmp_math_02 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
          Proficient |      7,884       26.99       26.99
      Non-proficient |     21,322       73.01      100.00
---------------------+-----------------------------------
               Total |     29,206      100.00

fgt1_math_0 |
          2 |      Freq.     Percent        Cum.
------------+-----------------------------------
          1 |     21,322       73.01       73.01
          . |      7,884       26.99      100.00
------------+-----------------------------------
      Total |     29,206      100.00

fgt2_math_0 |
          2 |      Freq.     Percent        Cum.
------------+-----------------------------------
          1 |     21,322       73.01       73.01
          . |      7,884       26.99      100.00
------------+-----------------------------------
      Total |     29,206      100.00

      sdg411_math_03 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
      Non-proficient |     21,384       73.22       73.22
          Proficient |      7,822       26.78      100.00
---------------------+-----------------------------------
               Total |     29,206      100.00

         bmp_math_03 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
          Proficient |      7,822       26.78       26.78
      Non-proficient |     21,384       73.22      100.00
---------------------+-----------------------------------
               Total |     29,206      100.00

fgt1_math_0 |
          3 |      Freq.     Percent        Cum.
------------+-----------------------------------
          1 |     21,384       73.22       73.22
          . |      7,822       26.78      100.00
------------+-----------------------------------
      Total |     29,206      100.00

fgt2_math_0 |
          3 |      Freq.     Percent        Cum.
------------+-----------------------------------
          1 |     21,384       73.22       73.22
          . |      7,822       26.78      100.00
------------+-----------------------------------
      Total |     29,206      100.00

      sdg411_math_04 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
      Non-proficient |     21,411       73.31       73.31
          Proficient |      7,795       26.69      100.00
---------------------+-----------------------------------
               Total |     29,206      100.00

         bmp_math_04 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
          Proficient |      7,795       26.69       26.69
      Non-proficient |     21,411       73.31      100.00
---------------------+-----------------------------------
               Total |     29,206      100.00

fgt1_math_0 |
          4 |      Freq.     Percent        Cum.
------------+-----------------------------------
          1 |     21,411       73.31       73.31
          . |      7,795       26.69      100.00
------------+-----------------------------------
      Total |     29,206      100.00

fgt2_math_0 |
          4 |      Freq.     Percent        Cum.
------------+-----------------------------------
          1 |     21,411       73.31       73.31
          . |      7,795       26.69      100.00
------------+-----------------------------------
      Total |     29,206      100.00

      sdg411_math_05 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
      Non-proficient |     21,409       73.30       73.30
          Proficient |      7,797       26.70      100.00
---------------------+-----------------------------------
               Total |     29,206      100.00

         bmp_math_05 |      Freq.     Percent        Cum.
---------------------+-----------------------------------
          Proficient |      7,797       26.70       26.70
      Non-proficient |     21,409       73.30      100.00
---------------------+-----------------------------------
               Total |     29,206      100.00

fgt1_math_0 |
          5 |      Freq.     Percent        Cum.
------------+-----------------------------------
          1 |     21,409       73.30       73.30
          . |      7,797       26.70      100.00
------------+-----------------------------------
      Total |     29,206      100.00

fgt2_math_0 |
          5 |      Freq.     Percent        Cum.
------------+-----------------------------------
          1 |     21,409       73.30       73.30
          . |      7,797       26.70      100.00
------------+-----------------------------------
      Total |     29,206      100.00



     +---------------------------------------------------------+
     | idgrade   prefix                harmonization_condition |
     |---------------------------------------------------------|
  1. |       6     lp01   read_01 = (score_amplb_read_02 >= 1) |
  2. |       6     lp02   read_02 = (score_amplb_read_02 >= 1) |
  3. |       6     lp03   read_03 = (score_amplb_read_03 >= 1) |
  4. |       6     lp04   read_04 = (score_amplb_read_04 >= 1) |
  5. |       6     lp05   read_05 = (score_amplb_read_05 >= 1) |
     |---------------------------------------------------------|
  6. |       6     lp06   math_01 = (score_amplb_math_01 >= 1) |
  7. |       6     lp07   math_02 = (score_amplb_math_02 >= 1) |
  8. |       6     lp08   math_03 = (score_amplb_math_03 >= 1) |
  9. |       6     lp09   math_04 = (score_amplb_math_04 >= 1) |
 10. |       6     lp10   math_05 = (score_amplb_math_05 >= 1) |
     +---------------------------------------------------------+

~~~~
