tab_look <-
function (vector1, vector2) {
	
	if (!is.vector(vector1)) stop("vector1 argument must be vector")
	if (!is.numeric(vector1)) stop("vector1 must be numeric")
	if (!is.vector(vector2)) stop("vector2 argument must be vector")
	if (!is.numeric(vector2)) stop("vector2 must be numeric")
	
	abs_diff <- round(abs(vector1 - vector2),4)
	pct_diff <- round(abs_diff / vector1,4)
	tab_look <- cbind(round(vector1,4), round(vector2,4),abs_diff,pct_diff)
	colnames(tab_look) <- c("vector1","vector2","Abs.Diff","Pct.Diff")
	return (tab_look)
}
