weight_to <-
function(vector,names) {
	
	if (!is.vector(vector)) stop("Input must be vector")

	names(vector) <- names
	
	return(vector)
	
}
