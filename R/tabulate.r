#' Map a function to an iterator
#'
#' Returns an iterator mapping a given function over linear input. The start 
#' argument will be increased by 1 each time the iterator is called and fed 
#' into the function. It is assumed that the input function has 1 argument.
#'
#' @param fn The function to apply
#' @param start The starting parameter to apply the function to, default is 1 
#' @param end The last parameter to be transformed, default is NULL
#' @return A iterable with transformed elements
#' 
#' @example
#' t <- tabulate(function(x) x^2, start = -3)
#' take(t, 3)
#' 
#' t <- tabulate(function(x) x + 1, end = 3)
#' take(t, 4)

tabulate <- function(fn, start = 1, end = NULL){
  start <- as.numeric(start)
  if (is.na(start) | length(start) != 1) {
    stop("'start' must be a numeric value of length 1")
  }
  if (!is.null(end)) {
    end <- as.numeric(end)
    if (is.na(end) | length(end) != 1) {
      stop("'end' must be a numeric value of length 1")
    }
  }
  
  i <- start - 1
  nextElem <- function() {
    i <<- i + 1
    
    if (!is.null(end) && i > end) {
      stop("StopIteration", call.=FALSE)
    }
    sapply(i, fn)
  }
  
  it <- list(nextElem=nextElem)
  class(it) <- c("abstractiter", "iter")
  it
  
}