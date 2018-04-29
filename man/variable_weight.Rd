\name{variable_weight}
\alias{variable_weight}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
variable_weight
}
\description{
Recode an existing variable to its ``weight to'' proportions
}
\usage{
variable_weight(vector, var_weight_to)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{vector}{
Numeric vector from unweighted data.
}
  \item{var_weight_to}{
Numeric vector. Probably object from ``weight amount'' function.
}
}
\details{
%%  ~~ If necessary, more details than the description above ~~
}
\value{
Numeric vector of weights applied to each respondent in the dataset.
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
gender_weight_to <- weight_amount(weight_props_gender,gender_current)

#NOT RUN: CREATE AGE*GENDER WEIGHT
age_weight_2 <- variable_weight(wapoll$age3,age_weight_to)	
summary(age_weight_2)
gender_weight_2 <- variable_weight(wapoll$gender,gender_weight_to)	
summary(gender_weight_2)

}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
%\keyword{ ~kwd1 }
%\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
