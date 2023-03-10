% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/dexpectilizeVecR.R
\name{dexpectilizeVecR}
\alias{dexpectilizeVecR}
\title{Dexpectilize a vector according the a single asymmetric
point \eqn{\tau\in (0, 1)}.}
\usage{
dexpectilizeVecR(yvec, aweight, panSizeVec)
}
\arguments{
\item{yvec}{Numeric vector to de-expectilize.}

\item{aweight}{Numeric vector of individual asymmetric weight.}

\item{panSizeVec}{Numeric vector of individual panel size.}
}
\value{
Return a de-expectilized vector of the vector yvec.
}
\description{
This function is part of the erfe package. It de-expectilizes
a vector of data, which means subtracting the expectile
of level \eqn{\tau\in (0, 1)} of the vector to the vector itself.
When \eqn{\tau=0.5} then the process of de-expectilizing
corresponds to the process of deamining the vector. That is,
subtracting the mean of the vector from the vector itself.
}
\examples{
set.seed(13)
temps_obs <- 5 # panel size
n_subj <- 50 # sample size
id <- rep(1:n_subj, each = temps_obs)
asym <- 0.5
panSizeVec <- unname(unlist(lapply(split(id, id), function(x) length(x))))
yvec <- c(mvtnorm::rmvnorm(n_subj, sigma = diag(rep(1,temps_obs))))
aweight <- rep(asym, temps_obs * n_subj)
aweight[!(yvec > mean(yvec))] = 1 - asym
dexpectilizeVecR(yvec, aweight, panSizeVec)
}
\references{
Barry, Amadou, Oualkacha, Karim, and Charpentier
 Arthur. (2022). \emph{Weighted asymmetric least squares
  regression with fixed-effects}.
 arXiv preprint arXiv:2108.04737
}
\author{
Amadou Barry, \email{barryhafia@gmail.com}
}
