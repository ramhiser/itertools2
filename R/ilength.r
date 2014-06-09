#' Determines the length of an iterator
#'
#' Counts the number of elements in an iterator. Note: This does consume the 
#' iterator.
#'
#' @importFrom iterators iter nextElem
#' @importFrom testthat try
#' @export
#' @param iterator The interator to measure
#' @return numeric count of the elements in the iterator
#' 
#' @examples
#' it <- ichain(1:3, 4:5, 6)
#' ilength(it)
#' 
#' it2 <- ichain(1:3, levels(iris$Species))
#' ilength(it2)
#'
#'
ilength <- function(iterator){
  # check of class "iter"
  if(!("iter" %in% class(iterator))) stop(paste("ilength only defined for objects of class \"iter\""))
  # Alt:
  # if(!("iter" %in% class(iterator))) return(length(iterator))
  
  i <- 0
  repeat{
    if(class(try(nextElem(iterator), T)) == "try-error") break
    i <- i + 1
  }
  return(i)
}