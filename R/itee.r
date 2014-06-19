#' Returns a list of n independent iterators from a single iterable object
#'
#' Constructs a list of \code{n} iterators, each of which iterates through an
#' iterable \code{object}.
#'
#' @export
#' @param object an iterable object
#' @param n the number of iterables to return
#' @return a list of \code{n} iterators
#' 
#' @examples
#' iter_list <- itee(1:5, n=3)
#' nextElem(iter_list[[1]]) # 1
#' nextElem(iter_list[[1]]) # 2
#' nextElem(iter_list[[1]]) # 3
#'
#' nextElem(iter_list[[2]]) # 1
#' nextElem(iter_list[[2]]) # 2
#' 
#' nextElem(iter_list[[3]]) # 1
#' nextElem(iter_list[[3]]) # 2
#'
#' nextElem(iter_list[[1]]) # 4
#' nextElem(iter_list[[1]]) # 5
#'
#' nextElem(iter_list[[2]]) # 3
#' nextElem(iter_list[[2]]) # 4
#' nextElem(iter_list[[2]]) # 5
#'
#' nextElem(iter_list[[3]]) # 3
#' nextElem(iter_list[[3]]) # 4
#' nextElem(iter_list[[3]]) # 5
itee <- function(object, n=2) {
  n <- as.integer(n)
  if (length(n) != 1) {
    stop("'n' must be an integer value of length 1")
  } else if (n < 1) {
    stop("'n' must be a positive integer")
  }

  # TODO: Confirm that efficient buffering is performed for a more complex
  # example. For assistance on this, see this excellent post about how Python's
  # itertools.tee works: http://discontinuously.com/2012/06/inside-python-tee/
  replicate(n=n,
            expr=iterators::iter(object),
            simplify=FALSE)
}

