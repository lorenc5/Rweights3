\name{gen_survey_props}
\alias{gen_survey_props}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
gen_survey_props
}
\description{
Generates survey proportions based off of (ideally) an unweighted vector.
}
\usage{
gen_survey_props(vector)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{vector}{
Numeric vector
}
}
\details{
%%  ~~ If necessary, more details than the description above ~~
}
\value{
Numeric vector of proportions
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
#NOT RUN: READ IN DATA
data (wapoll)
#NOT RUN -- CREATE PROPORTIONS FROM TARGET DATA
age_current <- gen_survey_props(wapoll$age3) #1=18-40,2=41-65,3=66+; age3
age_current
gender_current <- gen_survey_props(wapoll$gender) #0=Male, 1=Female
gender_current

}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
%\keyword{ ~kwd1 }
%\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
