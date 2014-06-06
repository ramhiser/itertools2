#' Iterator that applies a given function to several iterables concurrently.
#'
#' Constructs an iterator that computes the given function \code{f} using the
#' arguments from each of the iterables given in \code{...}.
#'
#' The iterator returned is exhausted when the shortest iterable in \code{...}
#' is exhausted. Note that \code{imap} does not recycle arguments as
#' \code{\link[base]{Map}} does.
#'
#' @importFrom iterators nextElem
#' @export
#' @param object object to return indefinitely.
#' @return iterator that returns the values of \code{object} along with the
#' index of the object. 
#' 
#' @examples
#' pow <- function(x, y) {
#'   x^y
#' }
#' it <- imap(pow, c(2, 3, 10), c(5, 2, 3))
#' nextElem(it) # 32
#' nextElem(it) # 9
#' nextElem(it) # 1000
#'
#' # Similar to the above, but because the second vector is exhausted after two
#' # calls to `nextElem`, the iterator is exhausted.
#' it2 <- imap(pow, c(2, 3, 10), c(5, 2))
#' nextElem(it)
#' nextElem(it)
#' nextElem(it) # BOOM! Error.
#'
#' # Another similar example but with lists instead of vectors
#' it3 <- imap(pow, list(2, 3, 10), list(5, 2, 3))
#' nextElem(it) # 32
#' nextElem(it) # 9
#' nextElem(it) # 1000
imap <- function(f, ...) {
  f <- match.fun(f)
  iter_obj <- izip(...)

  nextElem <- function() {
    do.call(f, iterators::nextElem(iter_obj))
  }

  it <- list(nextElem=nextElem)
  class(it) <- c("abstractiter", "iter")
  it
}
