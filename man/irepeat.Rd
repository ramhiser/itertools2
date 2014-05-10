\name{irepeat}
\alias{irepeat}
\title{Iterator that returns an object indefinitely}
\usage{
irepeat(object, times = NULL)
}
\arguments{
  \item{object}{object to return indefinitely.}

  \item{times}{the number of times \code{object} is
  returned. If \code{NULL} (default), \code{object} is
  returned indefinitely.}
}
\value{
iterator that returns \code{object}
}
\description{
Constructs an iterator that returns an object over and over
again.
}
\details{
Runs indefinitely unless the \code{times} argument is
specified. Used as argument to
\code{\link[itertools2]{imap}} for invariant function
parameters. Also used with \code{\link[itertools2]{izip}}
to create constant fields in a tuple record.
}
\examples{
it <- irepeat(42)
nextElem(it)
nextElem(it)
nextElem(it)

it2 <- irepeat(42, times=4)
nextElem(it2)
nextElem(it2)
nextElem(it2)

# The object can be a data.frame, matrix, etc
it3 <- irepeat(iris, times=4)
nextElem(it3)
nextElem(it3)
nextElem(it3)
}

