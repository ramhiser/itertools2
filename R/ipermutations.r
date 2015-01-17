#' Iterator that generates all permutations of an iterable object.
#'
#' Constructs an iterator generates all permutations of an iterable object. By
#' default, full-length permutations are generated. If \code{m} is specified,
#' successive \code{m} length permutations are instead generated.
#'
#' The implementation is loosely based on that of Python's itertools.
#'
#' @importFrom iterators iter nextElem
#' @export
#' @param object vector
#' @return iterator that generates all permutations of \code{object}
#' 
#' @examples
#' it <- ipermutations(1:3)
#' 
#' iterators::nextElem(it) # c(1, 2, 3)
#' iterators::nextElem(it) # c(1, 3, 2)
#' iterators::nextElem(it) # c(3, 1, 2)
#' iterators::nextElem(it) # c(3, 2, 1)
#' iterators::nextElem(it) # c(2, 3, 1)
#' iterators::nextElem(it) # c(2, 1, 3)
#'
#' it2 <- ipermutations(letters(1:4))
#' # 24 = 4! permutations of the letters a, b, c, and d
#' as.list(it2)
#' 
ipermutations <- function(object, m=NULL) {
  object <- as.vector(object)
  n <- length(object)

  # By default, m == n for full-length permutations.
  if (is.null(m)) {
    m <- n
  } else {
    m <- as.integer(m)
  }

  # Traverses through the Cartesian product of indices
  # Skips any cases where the indices are not unique
  # The unique indices generate the permutations
  # This approach is similar to how Python's itertools works
  replicate_n <- replicate(n=m, seq_len(n), simplify=FALSE)

  # We add the permutation length to the list passed to iproduct
  iter_product <- do.call(itertools2::iproduct, replicate_n)

  nextElem <- function() {
    repeat {
      indices <- unique(iterators::nextElem(iter_product))
      if (length(indices) == m) {
        return(object[unlist(indices)])
      }
    }
  }

  it <- list(nextElem=nextElem)
  class(it) <- c("abstractiter", "iter")
  it
}
