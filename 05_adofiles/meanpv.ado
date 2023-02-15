*------------------------------------------------------------------------------- 
*! meanpv v.0.1  JPAzevedo  January 2020
* 
*------------------------------------------------------------------------------- 

cap program drop meanpv
program define meanpv , eclass

	version 16
	
    syntax                 	///
        ,                  	///
        var1(string)       	///
        var2(string)  	 	  ///
        [var3(string)]      ///
        [var4(string)]  		///
        [var5(string)]      ///
        [var6(string)]  		///
		wtg(string)
 
 
	tempname b V
 
*------------------------------------------------------------------------------- 
* run multiple means using the regress command
 
	if ("`var1'" != "") {
		reg `var1' [`wtg']
		mat eb1 = e(b) 
		mat eV1 = e(V)
	}
		
	if ("`var2'" != "") {
		reg `var2' [`wtg']
		mat eb2 = e(b) 
		mat eV2 = e(V)
	}

*------------------------------------------------------------------------------- 
* stack matrix with results

	mat eV1 = eV1	,	0
	mat eV2 = 0		,	eV2
	
	mat `b' = eb1 , eb2
	mat `V' = eV1 \ eV2
	
	mat colnames `b' = "var1" "var2" 
	mat colnames `V' = "var1" "var2" 
	mat rownames `V' = "var1" "var2" 

*------------------------------------------------------------------------------- 
* Return output in a single matrix
	
	ereturn post `b' `V' 
	
end 

