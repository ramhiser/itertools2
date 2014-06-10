#' Count logicals 
#'
#' Returns the how many times the predicate is true
#'
#' @importFrom iterators nextElem
#' @importFrom testthat try
#' @export
#' @param iterator The iterator to measure
#' @return The number of TRUE elements
#' 
#' @example
#' it <- iter(T, F, T)
#' quantify(it)
#' 
 
quantify <- function(iterator){
  i <- 0
  repeat{
    elem <- try(nextElem(iterator), T)
    if(class(elem) == "try-error") break
    if(class(elem) != "logical") stop("Iterator must contain logical elements")
    if(elem) i <- i + 1
  }
  return(i)
}