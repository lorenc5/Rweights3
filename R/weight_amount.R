weight_amount <-
function(weight_props, survey_props) {

	if (!is.vector(weight_props)) stop("weight_props must be vector")
	if (!is.vector(survey_props)) stop("survey_props must be vector")
	weight_out <- as.vector(weight_props)/as.vector(survey_props)
	return (weight_out)
}
