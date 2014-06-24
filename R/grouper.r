#' Block an iterator
#'
#' Collect elements from an iterator into fixed-length chunks or blocks. 
#'
#' @importFrom iterators nextElem
#' @importFrom testthat try
#' @export
#' @param iterator An iterator that returns values of length 1
#' @param n The number of items per block
#' @param fill_value The value to fill the last block with, if the length of the
#' iterator is not divisible by n
#' @return A list of the iterator elements. Each list item is a block of length n
#' 
#' @examples
#' it <- grouper(iter(1:4), 2)
#' 
#' it2 <- grouper(iter(levels(iris$Species)), 4, "None")
#'
#'
grouper <- function(iterator, n, fill_value = NA){
  if(!(any(class(iterator) == "iter"))) stop("'iterator' must be of class 'iter'")
  if (n < 0 | !is.numeric(n) | length(n) != 1) stop("n must be a positive scalar")
  n <- floor(n)
  
  out <- list()
  position <- icycle(1:n)
  i <- 1
  repeat{
    elem <- try(nextElem(iterator), T)
    if (length(elem) != 1) stop("Iterator elements must be of length 1")
    new_pos <- nextElem(position)
    if(stop_iteration(elem)){
      if (new_pos != 1){
        set <- c(set, rep(fill_value, n - new_pos + 1))
        out <- c(out, list(set))
      }
      break
    }
    
    if (new_pos == 1){
      set <- elem
    } else {
      set <- c(set, elem)
      if (new_pos == n){
        out <- c(out, list(set))
        i <- i + 1
      }
    }
  }
  return(out)
}