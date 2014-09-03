#' Iterator that returns elements of an object in triplets
#' 
#' Constructs an iterator of an iterable \code{object} that returns its elements
#' in pairs.
#' 
#' @importFrom iterators nextElem iter
#' @export
#' @param object an iterable object
#' @return an iterator that returns tripletwise elements
#' 
#' @examples
#' it <- itripletwise(iterators::iter(letters[1:4]))
#' iterators::nextElem(it) # list("a", "b", "c")
#' iterators::nextElem(it) # list("b", "c", "d")
#'
#' it2 <- itripletwise(1:5)
#' iterators::nextElem(it2) # list(1, 2, 3)
#' iterators::nextElem(it2) # list(2, 3, 4)
#' iterators::nextElem(it2) # list(3, 4, 5)
#'
itripletwise <- function(object) {
  it_tee <- itee(object, n=3)
  # Skips second iterator ahead one
  dev_null <- iterators::nextElem(it_tee[[2]])

  # Skips second iterator ahead two
  dev_null <- iterators::nextElem(it_tee[[3]])
  dev_null <- iterators::nextElem(it_tee[[3]])
  
  nextElement <- function() {
    lapply(it_tee, iterators::nextElem)
  }

  it <- list(nextElem=nextElement)
  class(it) <- c("abstractiter", "iter")
  it
}

