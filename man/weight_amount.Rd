\name{weight_amount}
\alias{weight_amount}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
weight_amount
}
\description{
Creates a weight amount ratio that will be applied to each respondent.
}
\usage{
weight_amount(weight_props, survey_props)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{weight_props}{
Numeric vector. Probably object created from weight_to function.
}
  \item{survey_props}{
Numeric vector. Probably object created from gen_survey_props function.
}
}
\details{
%%  ~~ If necessary, more details than the description above ~~
}
\value{
Numeric vector of ``weight to'' proportions.
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

#NOT RUN: CREATE WEIGHT TO PROPORTIONS
weight_props_age <- weight_to(c(26.0,39.3,34.7), c("18-40","41-65","66+"))
weight_props_gender <- weight_to(c(49,51), c("Male","Female"))

#NOT RUN: CREATE PROPORTIONS FROM DATA
age_current <- gen_survey_props(wapoll$age3) #1=18-40,2=41-65,3=66+; age3
gender_current <- gen_survey_props(wapoll$gender) #0=Male, 1=Female

#NOT RUN: CREATE WEIGHT TO AMOUNT
age_weight_to <- weight_amount(weight_props_age,age_current)
age_weight_to
gender_weight_to <- weight_amount(weight_props_gender,gender_current)
gender_weight_to

}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
%\keyword{ ~kwd1 }
%\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
