#' Consume the first n items 
#'
#' Advances the iterator n-steps ahead. If n is 0, the iterator is consumed
#' entirely.
#'
#' @importFrom iterators nextElem
#' @importFrom testthat try
#' @export
#' @param iterator The iterator to measure
#' @param n The number of elements to consume
#' 
#' @example
#' it <- iter(1:10)
#' consume(it, 5)
#' nextElem(it)
#' 

consume <- function(iterator, n = 0){
  if(n < 0 | !is.numeric(n) | length(n) != 1){
    stop("n must be a non-negative integer of length 1")
  }
  
  if (n == 0){
    repeat{
      if(stop_iteration(iterator)) break
    }
    
  } else {
    n <- floor(n)
    for (i in 1:n){
      elem <- try(nextElem(iterator), T)
      if (stop_iteration(elem)){
        warning("Iterator consumed", call. = F)
        break
      }
    }
  }
}

#' Advance an iterable n items 
#'
#' Advances the iterator n-steps ahead. If n is 0, the iterator is consumed
#' entirely.
#'
#' @importFrom iterators nextElem
#' @importFrom testthat try
#' @export
#' @param iterator The iterator to measure
#' @param n The location of the desired element to return
#' @param default The value to return if iterable is consumed, default is NA
#' @return The nth element of the iterable or the default value
#' 
#' @examples
#' it <- iter(1:10)
#' nth(it, 5)
#' 
#' it2 <- iter(1:3)
#' nth(it2, 5)
#' 
#' 
nth <- function(iterator, n, default = NA){

  if(n < 0 | !is.numeric(n) | length(n) != 1){
    stop("n must be a positive integer of length 1")
  }
  n <- floor(n)

  consume(iterator, n - 1)
  elem <- try(nextElem(iterator), T)
  res <- ifelse(stop_iteration(elem), default, elem)
  return(res)
}