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
  i <- 1
  
  nextElem <- function() {
    
    next_elem <- try(iterators::nextElem(iters[[i]]), T)
    while (class(next_elem) == "try-error"){
      no_good <<- unique(c(no_good, i))
      if (length(no_good) == len) stop("End of iteration")
      i <<- ifelse(i == len, 1, i + 1)
      next_elem <- try(iterators::nextElem(iters[[i]]), T)
    }
    
    i <<- ifelse(i == len, 1, i + 1)
    
    while(i %in% no_good){
      i <<- ifelse(i == len, 1, i + 1)
    }
    
    return(next_elem)    
  }
  
  it <- list(nextElem=nextElem)
  class(it) <- c("abstractiter", "iter")
  it
}