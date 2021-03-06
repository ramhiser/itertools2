% Generated by roxygen2 (4.1.1): do not edit by hand
% Please edit documentation in R/itakewhile.r
\name{itakewhile}
\alias{itakewhile}
\title{Iterator that returns elements while a predicate function returns TRUE}
\usage{
itakewhile(predicate, object)
}
\arguments{
\item{predicate}{a function that determines whether an element is \code{TRUE}
or \code{FALSE}. The function is assumed to take only one argument.}

\item{object}{an iterable object}
}
\value{
iterator object
}
\description{
Constructs an iterator that returns elements from an iterable \code{object}
as long as the given \code{predicate} function returns \code{TRUE}.
}
\examples{
# Filters out numbers exceeding 5
not_too_large <- function(x) {
  x <= 5
}
it <- itakewhile(not_too_large, 1:100)
unlist(as.list(it)) == 1:5

# Same approach but uses an anonymous function
it2 <- itakewhile(function(x) x <= 10, seq(2, 100, by=2))
unlist(as.list(it2)) == c(2, 4, 6, 8, 10)
}

