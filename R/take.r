#' Returns the first n items 
#'
#' Returns first n items of an iterable as a list. If n is greater than the
#' number of elements, returns NA.
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
  if(n < 0 | !is.numeric(n) | length(n) != 1) stop("n must be a positive integer of length 1")
  n <- floor(n)
  out <- as.list(rep(NA, n))
  for (i in 1:n){
    elem <- try(nextElem(iterator), T)
    out[i] <- ifelse(class(elem) == "try-error", NA, elem)
  }
  return(out)
}