\name{izip}
\alias{izip}
\title{Iterator that iterates through several iterables concurrently.}
\usage{
izip(...)
}
\arguments{
  \item{...}{multiple arguments to iterate through in
  sequence}
}
\value{
iterator that iterates through each argument in sequence
}
\description{
The resulting iterator aggregates elements from each of the
iterables into a list from each iteration. Used for
lock-step iteration over several iterables at a time.
}
\examples{
it <- izip(1:3, 4:6, 7:9)
nextElem(it) # list(1, 4, 7)
nextElem(it) # list(1, 5, 8)
nextElem(it) # list(1, 6, 9)

it2 <- izip(1:3, 4:6, levels(iris$Species))
nextElem(it2) # list(1, 4, 7)
nextElem(it2) # list(1, 5, 8)
nextElem(it2) # list(1, 6, 9)

it3 <- izip(1:3, 4:42, levels(iris$Species))
nextElem(it3) # list(1, 4, "setosa")
nextElem(it3) # list(2, 5, "versicolor")
nextElem(it3) # list(3, 6, "virginica")
}

