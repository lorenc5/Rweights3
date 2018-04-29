variable_weight <-
function(vector,var_weight_to) {

	if (!is.vector(vector)) stop("vector argument must be vector")
	if (!is.vector(var_weight_to)) stop("vector argument must be vector")

	a <- sort(unique(vector)) #Get variable labels
	new_var <-NULL
	for (i in a) new_var[vector==a[i]] <- var_weight_to[i]
	new_var[vector==NA] <- 1
	new_var <- car::recode(new_var,"NA=1")

	return(new_var)
}
