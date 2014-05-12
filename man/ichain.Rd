\name{ichain}
\alias{ichain}
\title{Iterator that chains multiple arguments together into a single iterator}
\usage{
ichain(...)
}
\arguments{
  \item{...}{multiple arguments to iterate through in
  sequence}
}
\value{
iterator that iterates through each argument in sequence
}
\description{
Generates an iterator that returns elements from the first
argument until it is exhausted. Then generates an iterator
from the next argument and returns elements from it. This
process continues until all arguments are exhausted
Chaining is useful for treating consecutive sequences as a
single sequence.
}
\details{
Runs indefinitely unless the \code{times} argument is
specified.
}
\examples{
it <- ichain(1:3, 4:5, 6)
nextElem(it) # 1
nextElem(it) # 2
nextElem(it) # 3
nextElem(it) # 4
nextElem(it) # 5
nextElem(it) # 6

it2 <- ichain(1:3, levels(iris$Species))
nextElem(it2) # 1
nextElem(it2) # 2
nextElem(it2) # 3
nextElem(it2) # setosa
nextElem(it2) # versicolor
nextElem(it2) # virginica
}

