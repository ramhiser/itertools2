#' Iterator that generates all combinations of a vector taken m at a time.
#'
#' Constructs an iterator generates all combinations of a vector taken \code{m}
#' at a time. This function is similar to \code{\link[utils]{combn}}.
#'
#' The implementation is loosely based on that of Python's itertools.
#'
#' @importFrom iterators iter nextElem
#' @export
#' @param object vector
#' @return iterator that generates all combinations of \code{object}
#' 
#' @examples
#' it <- icombinations(1:4, m=2)
#' 
#' iterators::nextElem(it) # c(1, 2)
#' iterators::nextElem(it) # c(1, 3)
#' iterators::nextElem(it) # c(1, 4)
#' iterators::nextElem(it) # c(2, 3)
#' iterators::nextElem(it) # c(2, 4)
#' iterators::nextElem(it) # c(3, 4)
#'
icombinations <- function(object, m) {
  object <- as.vector(object)
  n <- length(object)
  m <- as.integer(m)

  # Traverses through all the permutations of object.
  # If the indices are sorted, then return the element.
  # This approach is similar to how Python's itertools works
  iter_permutations <- itertools2::ipermutations(object, m)

  nextElem <- function() {
    repeat {
      indices <- iterators::nextElem(iter_permutations)
      if (sort(indices) == indices) {
        return(object[indices])
      }
    }
  }

  it <- list(nextElem=nextElem)
  class(it) <- c("abstractiter", "iter")
  it
}
