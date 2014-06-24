#' Returns elements in pairs
#'
#' Returns an iterator of paired items, overlapping, from the original. Depends
#' on the ordering of the original iterator.
#'
#' @importFrom iterators nextElem
#' @importFrom testthat try
#' @export
#' @param iterator An iterator with at least 2 elements
#' @return an iterator with vector elements
#' 
#' @examples
#' it <- pairwise(iter(1:4))
#' 
#' it2 <- pairwise(iter(list(1:2, 3:4, 5:6)))
#' 
pairwise <- function(iterator){
  if(!(any(class(iterator) == "iter"))) stop("'iterator' must be of class 'iter'")
  
  old_elem <- nextElem(iterator)
  if(stop_iteration(old_elem)) stop("'iterator' must have at least 2 elements")
  
  nextElement <- function(){
    new_elem <- nextElem(iterator)
    if(stop_iteration(new_elem)){
      stop("StopIteration")
    }
    out <- c(old_elem, new_elem)
    old_elem <<- new_elem
    return(out)
  }
  
  it <- list(nextElem=nextElement)
  class(it) <- c("abstractiter", "iter")
  it
}




