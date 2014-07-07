#' Iterator that replicates elements of an iterable object
#'
#' Constructs an iterator that replicates the values of an \code{object}. This
#' function is intended an iterable version of the standard
#' \code{\link[base]{rep}} function.
#'
#' @export
#' @param object object to return indefinitely.
#' @param times the number of times to repeat each element in \code{object}
#' @param length.out non-negative integer. The desired length of the iterator
#' @param each non-negative integer. Each element is repeated \code{each} times
#' @return iterator that returns \code{object}
#' 
#' @examples
#' it <- irep(42)
#' nextElem(it)
#' nextElem(it)
#' nextElem(it)
#' 
#' it2 <- irep(42, times=4)
#' nextElem(it2)
#' nextElem(it2)
#' nextElem(it2)
#'
#' # The object can be a data.frame, matrix, etc
#' it3 <- irep(iris, times=4)
#' nextElem(it3)
#' nextElem(it3)
#' nextElem(it3)
irep <- function(object, times=1, length.out=NULL, each=NULL) {
  if (!is.null(length.out)) {
    length.out <- as.numeric(length.out)
    if (length(length.out) != 1) {
      stop("'length.out' must be a numeric value of length 1")
    }
  }
  if (!is.null(each)) {
    each <- as.numeric(each)
    if (length(each) != 1) {
      stop("'each' must be a numeric value of length 1")
    }
  }

  i <- 0
  nextElem <- function() {
    i <<- i + 1

    if (!is.null(times) && i > times) {
      stop("StopIteration", call.=FALSE)
    }
    object
  }

  it <- list(nextElem=nextElem)
  class(it) <- c("abstractiter", "iter")
  it
}

