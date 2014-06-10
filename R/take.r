#' Returns the first n items 
#'
#' Returns first n items of an iterable as a list
#'
#' @importFrom iterators iter nextElem
#' @importFrom testthat try
#' @export
#' @param iterator The iterator to measure
#' @param n The number of elements to take
#' @return A list of the first n items of the iterable
#' 
#' @example
#' take(iter(1:10), 3)
#' 

take <- function(iterator, n){
  out <- rep(NA, n)
  for (i in 1:n){
    elem <- try(nextElem(iterator), T)
    out[i] <- ifelse(class(elem) == "try-error", NA, elem)
  }
  return(out)
}