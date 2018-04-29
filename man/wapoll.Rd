\name{wapoll}
\alias{wapoll}
\docType{data}
\title{
wapoll -- Washington Poll 
}
\description{
Partial data from 2011 Washington Poll. Only includes variables respnum, age3, gender, pid, region, for weighting.
}
\usage{data(wapoll)}
\format{
  A data frame with 825 observations on the following 5 variables.
  \describe{
    \item{\code{respnum}}{a numeric vector of unique respondent ids.}
    \item{\code{age3}}{a numeric vector, with categories 18-40,41-65,66+.}
    \item{\code{gender}}{a numeric vector, with categories 1=Male, 2=Female.}
    \item{\code{pid}}{a numeric vector, with categories 1=Democrat, 2=Republican, 3=Independent/Other.}
    \item{\code{region}}{a numeric vector, with categories 1=Puget Sound, 2=Eastern Washington, 3=Other.}
  }
}
\details{
%%  ~~ If necessary, more details than the __description__ above ~~
}
\source{
Washington Poll 2011. Matt Barreto, Director and Loren Collingwood, Senior Researcher.
}
\references{
Loren Collingwood <loren.collingwood@ucr.edu>
}
\examples{
data(wapoll)
str(wapoll)
head(wapoll)
}
\keyword{datasets}
