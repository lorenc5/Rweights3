survey_weight <-
function(matrix,dataframe,...) {
	
	if (!is.matrix(matrix)) stop("matrix argument must be matrix")
	if (!is.data.frame(dataframe)) stop("dataframe argument must be data frame")
	fw <- apply(matrix,1,prod)
	svyd <- survey::svydesign(id=~0, data=dataframe, weights=~fw,na.rm=TRUE)
	return (list(survey_design=svyd,survey_weight=fw))

}
