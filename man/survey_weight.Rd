\name{survey_weight}
\alias{survey_weight}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
survey_weight
}
\description{
Creates a survey design object of class list, with survey design and vector of weights as two outputs.
}
\usage{
survey_weight(matrix, dataframe, ...)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{matrix}{
\code{matrix} object, either as a matrix or as a \code{cbind} object
}
  \item{dataframe}{
\code{dataframe} object. Probably the data frame with which you are working.
}
  \item{\dots}{
Arguments passed on from other functions.
}
}
\details{
%%  ~~ If necessary, more details than the description above ~~
}
\value{
\item{survey_design}{Survey design object, from package \code{survey}}
%%  \item{survey_weights}{Survey weights.}
%% ...
}
\references{
Thomas Lumley, ``Survey Analysis in R'' <http://faculty.washington.edu/tlumley/survey/>
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
gender_weight_2 <- variable_weight(wapoll$gender,gender_weight_to)	
svyd_age_gender <- survey_weight(cbind(age_weight_2,gender_weight_2),dataframe=wapoll)
names(svyd_age_gender)
svyd_age_gender$survey_design
summary(svyd_age_gender$survey_weight)

}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
%\keyword{ ~kwd1 }
%\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
