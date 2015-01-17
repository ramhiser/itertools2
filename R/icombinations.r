#' Iterator that generates all combinations of a vector taken m at a time.
#'
#' Constructs an iterator generates all combinations of a vector taken \code{m}
#' at a time. This function is similar to \code{\link[utils]{combn}}.
#'
#' By default, the combinations are **without replacement** so that elements are
#' not repeated. To generate combinations **with replacement**, set
#' \code{replacement=TRUE}.
#'
#' The function implementation is loosely based on the \code{combinations}
#' function from Python's itertools. Combinations with replacement are based on
#' \code{combinations_with_replacement} from the same Python library.
#'
#' @importFrom iterators iter nextElem
#' @export
#' @param object vector
#' @param replacement Generate combinations with replacement? Default: no.
#' @return iterator that generates all combinations of \code{object}
#'
#' @examples
#' # Combinations without replacement
#' it <- icombinations(1:4, m=2)
#'
#' iterators::nextElem(it) # c(1, 2)
#' iterators::nextElem(it) # c(1, 3)
#' iterators::nextElem(it) # c(1, 4)
#' iterators::nextElem(it) # c(2, 3)
#' iterators::nextElem(it) # c(2, 4)
#' iterators::nextElem(it) # c(3, 4)
#'
#' # Combinations without replacement
#' it <- icombinations(1:4, m=2, replacement=TRUE)
#'
#' iterators::nextElem(it) # c(1, 1)
#' iterators::nextElem(it) # c(1, 2)
#' iterators::nextElem(it) # c(1, 3)
#' iterators::nextElem(it) # c(1, 4)
#' iterators::nextElem(it) # c(2, 2)
#' iterators::nextElem(it) # c(2, 3)
#' iterators::nextElem(it) # c(2, 4)
#' iterators::nextElem(it) # c(3, 3)
#' iterators::nextElem(it) # c(3, 4)
#' iterators::nextElem(it) # c(4, 4)
#'
#' it3 <- icombinations(1:5, m=2)
#' as.list(it3)
#' utils::combn(x=1:5, m=2, simplify=FALSE)
#'
icombinations <- function(object, m, replacement=FALSE) {
  object <- as.vector(object)
  n <- length(object)
  m <- as.integer(m)

  # Traverses through all the permutations of object.
  # If the indices are sorted, then return the element.
  # This approach is similar to how Python's itertools works
  if (!replacement) {
    # Combinations without replacement
    iter_object <- itertools2::ipermutations(object, m=m)
  } else {
    # Combinations with replacement
    replicate_n <- replicate(n=m, seq_len(n), simplify=FALSE)
    iter_object <- do.call(itertools2::iproduct, replicate_n)
  }

  nextElem <- function() {
    repeat {
      indices <- unlist(iterators::nextElem(iter_object))
      if (all(sort(indices) == indices)) {
        return(object[indices])
      }
    }
  }

  it <- list(nextElem=nextElem)
  class(it) <- c("abstractiter", "iter")
  it
}
