\name{icycle}
\alias{icycle}
\title{Iterator that cycles indefinitely through an iterable object}
\usage{
icycle(object, times = NULL)
}
\arguments{
  \item{object}{object to cycle indefinitely.}

  \item{times}{the number of times \code{object} is
  returned. If \code{NULL} (default), \code{object} is
  returned indefinitely.}
}
\value{
iterator that returns \code{object} in sequence
}
\description{
Constructs an iterator that returns an iterable object in
sequence over and over again.
}
\details{
Runs indefinitely unless the \code{times} argument is
specified.
}
\examples{
it <- icycle(1:3)
nextElem(it) # 1
nextElem(it) # 2
nextElem(it) # 3
nextElem(it) # 1
nextElem(it) # 2
nextElem(it) # 3
nextElem(it) # 1

it2 <- icycle(1:3, times=2)
nextElem(it) # 1
nextElem(it) # 2
nextElem(it) # 3
nextElem(it) # 1
nextElem(it) # 2
nextElem(it) # 3
nextElem(it) # BOOM! Throws error.

# Can return the results from a function.
it3 <- icycle(function() rnorm(1))
nextElem(it)
nextElem(it)
nextElem(it)
}

