gen_survey_props <-
function(vector) {

	if (!is.vector(vector)) stop("Input must be vector")
	
	x1 <- prop.table(table(vector))*100
	return (as.vector(x1))
	
}
