#' Interweave a set of iterables
#'
#' Combines a series of iterables, alternating which source to draw from for the
#' next element
#'
#' @importFrom iterators nextElem
#' @importFrom testthat try
#' @export
#' @param ... The interators to interweave
#' @return An iterable that alternates between the supplied set
#' 
#' @example
#' it <- iter(c("A", "B", "C"))
#' it2 <- iter("D")
#' it3 <- iter(c("E", "F"))
#' take(roundrobin(it, it2, it3), 6)
#'
#'
roundrobin <- function(...){
  iters <- list(...)
  len <- length(iters)
  
  no_good <- c()
  i <- icycle(1:len)
  
  nextElement <- function() {
    
    witch <- nextElem(i)
    next_elem <- try(nextElem(iters[[witch]]), T)
    
    while (stop_iteration(next_elem)){
      no_good <<- unique(c(no_good, witch))
      if (length(no_good) == len) stop("StopIteration", call.=FALSE)
      witch <- nextElem(i)
      next_elem <- try(nextElem(iters[[witch]]), T)
    }
    
    while(witch %in% no_good){
      witch <- nextElem(i)
    }   
    return(next_elem)
  }
  
  it <- list(nextElem=nextElement)
  class(it) <- c("abstractiter", "iter")
  it
}