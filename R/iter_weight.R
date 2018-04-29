iter_weight <-
function (weight_props, weight_tabs, variable, survey_weight_obj, dataframe, prop_diff=.01) {
	abs_diff <- abs(weight_props - weight_tabs)
	pct_diff <- abs_diff / weight_props
	varweightto <- weight_amount (weight_props,weight_tabs)
	yes_vec <- NULL
	for ( i in 1:length(pct_diff)) {
		if (pct_diff[i] >=prop_diff) {
			yes_vec[i] <- "TRUE"
		}
		else {
			yes_vec[i] = "FALSE"
		}
	}		
		if (any(yes_vec=="TRUE")) {
			varweightto <- weight_amount (weight_props,weight_tabs)
			weight_var <- variable_weight (variable, varweightto) 
			svyd <- survey_weight(cbind(survey_weight_obj,weight_var),dataframe=dataframe)
			return(svyd)	
		}
		else {
			print (paste("All proportions less than",prop_diff,sep=" "))
		}		
}
