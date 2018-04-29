\name{iter_weight}
\alias{iter_weight}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
iter_weight
}
\description{
Upon initial ``final weighting'' if proportions still do not match with X percentage points of the target weight proportions, use iter_weight to rake the data to obtain desired target weight proportions.
}
\usage{
iter_weight(weight_props, weight_tabs, variable, survey_weight_obj, dataframe, prop_diff = 0.01)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{weight_props}{
Object from weight_to result.
}
  \item{weight_tabs}{
Numeric vector of proportions probably generated using svymean function, and then put into vector format.
}
  \item{variable}{
Numeric vector. Usually the unweighted variable from the data.
}
  \item{survey_weight_obj}{
Survey weights generated from previous round of weighting. Probably from survey_weight function -- the second output (survey_weight) 
}
  \item{dataframe}{
Data frame object
}
  \item{prop_diff}{
Proportion difference analyst is willing to weight to. Default is 0.01, or 1\%.
}
}
\details{
%%  ~~ If necessary, more details than the description above ~~
}
\value{
\item{survey_design}{Survey design object, based on \code{survey} package.}
\item{survey_weight}{Vector of survey weights for each respondent.}
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

#NOT RUN: RUN iter_weight FUNCTION FOR AGE
iter <- iter_weight(weight_props = weight_props_age,
			weight_tabs = matrix(age_tabs)[,1]*100,
			variable = wapoll$age3,
			survey_weight_obj = svyd_age_gender_party_region$survey_weight,
			dataframe=wapoll
			)
age_tabs <- svymean(~interaction(wapoll$age3), design=iter$survey_design, na.rm=TRUE)
tab_look(weight_props_age, matrix(age_tabs)[,1]*100)

#NOT RUN: RUN iter_weight FUNCTION FOR GENDER
iter2 <- iter_weight(weight_props = weight_props_gender,
			weight_tabs = matrix(gender_tabs)[,1]*100,
			variable = wapoll$gender,
			survey_weight_obj = iter$survey_weight,
			dataframe=wapoll
			)
gender_tabs2 <- svymean(~interaction(wapoll$gender), design=iter2$survey_design, na.rm=TRUE)
tab_look(weight_props_gender, matrix(gender_tabs2)[,1]*100)

#NOT RUN: LOOK AT THE OTHER PROPORTIONS TO MAKE SURE THEY ARE GOOD
age_tabs2 <- svymean(~interaction(wapoll$age3), design=iter2$survey_design, na.rm=TRUE)
tab_look(weight_props_age, matrix(age_tabs2)[,1]*100)

party_tabs2 <- svymean(~interaction(wapoll$pid), design=iter2$survey_design, na.rm=TRUE)
tab_look(weight_props_party, matrix(party_tabs2)[,1]*100)

region_tabs2 <- svymean(~interaction(wapoll$region), design=iter2$survey_design, na.rm=TRUE)
tab_look(weight_props_region, matrix(region_tabs2)[,1]*100)

}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
%\keyword{ ~kwd1 }
%\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
