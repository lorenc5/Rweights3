\name{weight_to}
\alias{weight_to}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
weight_to
}
\description{
Creates proportions (with names) of the variables you want to weight to.
}
\usage{
weight_to(vector, names)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{vector}{
Numeric vector of the proportions. Probably something like c(33,33,34).
}
  \item{names}{
Character vector of names. Probably something like c("Dem","Rep","Ind")
}
}
\details{
%%  ~~ If necessary, more details than the description above ~~
}
\value{
Numeric vector of proportions with names associated with it.
}
\references{
%% ~put references to the literature/web site here ~
}
\author{
Loren Collingwood <loren.collingwood@ucr.edu>
}
\note{
%%  ~~further notes~~
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
%% ~~objects to See Also as \code{\link{help}}, ~~~
}
\examples{
#NOT RUN: CREATE WEIGHT TO PROPORTIONS
weight_props_age <- weight_to(c(26.0,39.3,34.7), c("18-40","41-65","66+"))
weight_props_age
weight_props_gender <- weight_to(c(49,51), c("Male","Female"))
weight_props_gender
weight_props_party <- weight_to(c(33.8,28.1,38.1), c("Dem","Rep","Ind"))
weight_props_party
weight_props_region <- weight_to(c(53.5,20.6,25.8), c("Reg1-PS","Reg2-EW","Reg3-O"))
weight_props_region
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
%\keyword{ ~kwd1 }
%\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
