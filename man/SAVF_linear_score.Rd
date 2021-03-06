% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/SAVF_linear_score.R
\name{SAVF_linear_score}
\alias{SAVF_linear_score}
\title{Single Attribute Value Function (SAVF) Linear Score}
\usage{
SAVF_linear_score(x, x_low, x_mid, x_high, increasing = TRUE)
}
\arguments{
\item{x}{Attribute raw value}

\item{x_low}{Lowest value}

\item{x_mid}{Midpoint value}

\item{x_high}{Highest value}

\item{increasing}{TRUE=increasing, FALSE=decreasing, Default: TRUE}
}
\value{
Linear SAVF Score
}
\description{
: Calculates the Single Attribute Value Function (SAVF) score for a linearly increasing or decreasing function. 
It calculates the score based on the midpoint value method.
}
\examples{
\dontrun{ SAVF_linear_score(10, 0, 25, 100, FALSE)}

}
