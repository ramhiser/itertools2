#' Iterators for sequence generation
#'
#' Constructs iterators that generate regular sequences that follow the
#' \code{base} \code{\link[base]{seq}} family.  values starting with
#' \code{icount}. The step size is given by \code{step}.
#'
#' @export
#' @param start sequence's initial value
#' @param step sequence's step size
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
iseq <- function(from=1, to=1, by = ((to - from)/(length_out - 1)),
                 length_out=NULL, along_with=NULL) {
  from <- as.numeric(from)
  to <- as.numeric(to)

  if (length(start) != 1) {
    stop("'start' must be a numeric value of length 1")
  }
  if (length(step) != 1) {
    stop("'step' must be a numeric value of length 1")
  }

  current_val <- start - step
  nextElem <- function() {
    current_val <<- current_val + step
    current_val
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
# TODO: Add stub for iseq
# TODO: Add stub for iseq_int
# TODO: Add test for iseq
# TODO: Add test for iseq_int
# TODO: Add docs for iseq
# TODO: Add docs for iseq_int
# TODO: Determine how to combine docs for iseq family into same Rd file
# TODO: Implement iseq
# TODO: Implement iseq_int
