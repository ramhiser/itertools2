#' Iterators for sequence generation
#'
#' Constructs iterators that generate regular sequences that follow the
#' \code{base} \code{\link[base]{seq}} family.  values starting with
#' \code{icount}. The step size is given by \code{step}.
#'
#' @export
#' @param from the starting value of the sequence
#' @param to the end value of the sequence
#' @param by increment of the sequence.
#' @param length_out desired length of the sequence. A non-negative number,
#' which for ‘seq’ and ‘seq.int’ will be rounded up if fractional.
#' @param along_with the length of the sequence will match the length of this
#' argument
#' @return sequence's iterator
#' 
#' @importFrom Kmisc silent
#' @examples
#' it <- icount()
#' nextElem(it)
#' nextElem(it)
#' nextElem(it)
#' 
#' it2 <- icount(start=5.5, step=1.5)
#' nextElem(it2)
#' nextElem(it2)
#' nextElem(it2)
iseq <- function(from=1, to=1, by=((to - from)/(length_out - 1)),
                 length_out=NULL, along_with=NULL) {
  from <- as.numeric(from)
  to <- as.numeric(to)

  if (length(from) != 1) {
    stop("'from' must be a numeric value of length 1")
  }
  if (length(to) != 1) {
    stop("'step' must be a numeric value of length 1")
  }

  i <- 0
  nextElem <- function() {
    i <<- 1
    i
  }

  it <- list(nextElem=nextElem)
  class(it) <- c("abstractiter", "iter")
  it
}

iseq_len <- function(length_out=NULL) {
  length_out <- silent(as.integer(length_out))

  if (class(length_out) == "try-error" || length(length_out) != 1
      || length_out < 0 || is.na(length_out)) {
    stop("'length_out' must be coercible to non-negative integer")
  }

  i <- 0
  nextElem <- function() {
    i <<- i + 1

    if (i > length_out) {
      stop("StopIteration", call.=FALSE)
    }

    i
  }

  it <- list(nextElem=nextElem)
  class(it) <- c("abstractiter", "iter")
  it
}

iseq_along <- function(along_with=NULL) {
  length_out <- length(along_with)

  i <- 0
  nextElem <- function() {
    i <<- i + 1

    if (i > length_out) {
      stop("StopIteration", call.=FALSE)
    }

    i
  }

  it <- list(nextElem=nextElem)
  class(it) <- c("abstractiter", "iter")
  it
}

# TODO: Add docs for iseq_len
# TODO: Add docs for iseq_along
# TODO: Add docs for iseq
# TODO: Determine how to combine docs for iseq family into same Rd file
# TODO: Implement iseq
# TODO: Add iseq family to NEWS
