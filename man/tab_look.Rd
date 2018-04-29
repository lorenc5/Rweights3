\name{tab_look}
\alias{tab_look}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
tab_look
}
\description{
Prints table of ``weight to'' proportions, actual proportions (from unweighted or weighted data), absolute difference, and percent difference.
}
\usage{
tab_look(vector1, vector2)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{vector1}{
Numeric vector of proportions
}
  \item{vector2}{
Numeric vector of, ideally, weighted proportions
}
}
\details{
%%  ~~ If necessary, more details than the description above ~~
}
\value{
Matrix object of values, including columns of initial vector of ``weight to'' proportions, weighted proportions, absolute difference, and percent difference between vector1 and vector2.
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
weight_props_party <- weight_to(c(33.8,28.1,38.1), c("Dem","Rep","Ind"))
weight_props_region <- weight_to(c(53.5,20.6,25.8), c("Reg1-PS","Reg2-EW","Reg3-O"))

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

#NOT RUN: INCLUDE PARTY IN AGE*GENDER WEIGHT
party_tab2 <- svymean(~interaction(wapoll$pid), design=svyd_age_gender$survey_design, na.rm=TRUE)
weight_to_party <- weight_amount(weight_props_party,c(party_tab2[[1]]*100,party_tab2[[2]]*100,party_tab2[[3]]*100))
weight_party_2 <- variable_weight(wapoll$pid,weight_to_party)

#NOT RUN: WEIGHT CREATED FOR age*gender*party
svyd_age_gender_party <- survey_weight(cbind(svyd_age_gender$survey_weight,weight_party_2),dataframe=wapoll)

#NOT RUN: Region Proportions (weighted by (age*gender)*Party)
region_tab2 <- svymean(~interaction(wapoll$region), design=svyd_age_gender_party$survey_design, na.rm=TRUE)
#NOT RUN: INCLUDE REGION IN PARTY*AGE*GENDER WEIGHT
weight_to_region <- weight_amount(weight_props_region,c(region_tab2[[1]]*100,region_tab2[[2]]*100,region_tab2[[3]]*100))
weight_region_2 <- variable_weight(wapoll$region,weight_to_region)

#NOT RUN: CREATE INITIAL "FINAL" WEIGHT
svyd_age_gender_party_region <- survey_weight(cbind(svyd_age_gender_party$survey_weight,weight_region_2),dataframe=wapoll)

#NOT RUN: EXAMINE WEIGHTED TABS
age_tabs <- svymean(~interaction(wapoll$age3), design=svyd_age_gender_party_region$survey_design, na.rm=TRUE)
gender_tabs <- svymean(~interaction(wapoll$gender), design=svyd_age_gender_party_region$survey_design, na.rm=TRUE)
party_tabs <- svymean(~interaction(wapoll$pid), design=svyd_age_gender_party_region$survey_design, na.rm=TRUE)
region_tabs <- svymean(~interaction(wapoll$region), design=svyd_age_gender_party_region$survey_design, na.rm=TRUE)

#NOT RUN: PUT WEIGHT PROPORTIONS AND NEWLY CALCULATED WEIGHTED PROPORTIONS IN VECTORS AND SEND TO tab_look
weight_props <- c( weight_props_age, weight_props_gender, weight_props_party, weight_props_region)
weighted_data <- c( matrix(age_tabs)[,1]*100, matrix(gender_tabs)[,1]*100, matrix(party_tabs)[,1]*100, matrix(region_tabs)[,1]*100 )
tab_weights <- tab_look(weight_props, weighted_data)
tab_weights

}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
%\keyword{ ~kwd1 }
%\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
