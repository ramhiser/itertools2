#' Computer the dot product of two iterators
#'
#' Returns the dot product of two numeric iterables of equal length
#'
#' @importFrom iterators iter nextElem
#' @importFrom testthat try
#' @export
#' @param iterator1 The first iterator to use
#' @param iterator2 The second iterator to use
#' @return A numeric of the dot product of the iterators
#' 
#' @example
#' it <- iter(1:3)
#' it2 <- iter(4:6)
#' idotproduct(it, it2)
#' 

idotproduct <- function(iterator1, iterator2){
  sum <- 0
  repeat{
    elem1 <- try(nextElem(iterator1), T)
    elem2 <- try(nextElem(iterator2), T)
    
    if (class(elem1) == "try-error"){
      if (class(elem2) == "try-error"){
        break
      } else {
        stop("Iterators must be of equal length")
      }
    } else if (class(elem2) == "try-error") {
      stop("Iterators must be of equal length")
    }
    
    if(!is.numeric(elem1) | !is.numeric(elem2)) stop("Iterator must be numeric")
    sum <- sum + elem1 * elem2
  }
  return(sum)
}