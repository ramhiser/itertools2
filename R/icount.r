#' Iterator of numeric sequence with initial value and step size
#'
#' Constructs an iterator that generates a sequence of evenly spaced values
#' starting with \code{icount}. The step size is given by \code{step}. By
#' default, the sequence is neverending unless the optional \code{stop} is
#' provided.
#'
#' NOTE: Use a negative \code{step} size to generate decreasing sequences.
#'
#' Often used as an argument to \code{\link[itertools2]{imap}} to
#' generate consecutive data points.
#'
#' @export
#' @param start sequence's initial value
#' @param step sequence's step size
#' @param stop optional stopping point to sequence
#' @return sequence's iterator
#'
#' @examples
#' it <- icount()
#' iterators::nextElem(it)
#' iterators::nextElem(it)
#' iterators::nextElem(it)
#'
#' it2 <- icount(start=5.5, step=1.5)
#' iterators::nextElem(it2)
#' iterators::nextElem(it2)
#' iterators::nextElem(it2)
#'
#' it3 <- icount(start=1, stop=3)
#' iterators::nextElem(it3)
#' iterators::nextElem(it3)
#' iterators::nextElem(it3)
#'
icount <- function(start=0, step=1, stop=NULL) {
  start <- as.numeric(start)
  step <- as.numeric(step)

  if (length(start) != 1) {
    stop("'start' must be a numeric value of length 1")
  }
  if (length(step) != 1) {
    stop("'step' must be a numeric value of length 1")
  }

  if (!is.null(stop)) {
    stop <- as.numeric(stop)
    if (length(stop) != 1) {
      stop("'stop' must be a numeric value of length 1")
    }
  }

  current_val <- start - step
  nextElem <- function() {
    current_val <<- current_val + step

    if (!is.null(stop) && current_val > stop) {
      stop("StopIteration", call.=FALSE)
    }

    current_val
  }

  it <- list(nextElem=nextElem)
  class(it) <- c("abstractiter", "iter")
  it
}
