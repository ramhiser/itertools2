#' Returns unique elements
#'
#' Returns a vector of unique elements from an iterator. Order of the elements 
#' is maintained.
#'
#' @importFrom iterators nextElem
#' @importFrom testthat try
#' @export
#' @param iterator An iterator
#' @return vector with unique elements from the iterator
#' 
#' @examples
#' it <- ichain(rep(1,4), rep(2, 5), 4:7, 2)
#  unique_everseen(it)
#' 
#' it2 <- iter(c('a', 'a', "A", "V"))
#' unique_everseen(it2, ignore.case = T)
#'
#'

unique_everseen <- function(iterator, ignore_case = F){
  unis <- c()
  next_elem <- try(nextElem(iterator), T)
  while(class(next_elem) != "try-error"){
    if (ignore_case){
      if (!(tolower(next_elem) %in% unis)){
        unis <- c(unis, tolower(next_elem)) 
      }
    } else {
      if (!(next_elem %in% unis)){
        unis <- c(unis, next_elem)
      }
    }
    next_elem <- try(nextElem(iterator), T)
  }
  return(unis)
}

#' Remove sequential duplicates
#'
#' Returns a vector of elements from an iterator with sequential duplicates 
#' removed. Order of the elements is maintained.
#'
#' @importFrom iterators nextElem
#' @importFrom testthat try
#' @export
#' @param iterator An iterator
#' @return vector with repeated sequential elements removed
#' 
#' @examples
#' it <- ichain(rep(1,4), rep(2, 5), 4:7, 2)
#  unique_justseen(it)
#' 
#' it2 <- iter(c('a', 'a', "A", "V"))
#' unique_justseen(it2, ignore.case = T)
#'
#'
unique_justseen <- function(iterator, ignore_case = F){
  
  first_elem <- try(nextElem(iterator), T)
  if (class(first_elem) == "try-error") stop("Stop iteration")
  unis <- first_elem
  next_elem <- try(nextElem(iterator), T)
  while(class(next_elem) != "try-error"){
    if (ignore_case){
      if (first_elem != next_elem){
        unis <- c(unis, tolower(next_elem)) 
      }
    } else {
      if (first_elem != next_elem){
        unis <- c(unis, next_elem)
      }
    }
    first_elem <- next_elem
    next_elem <- try(nextElem(iterator), T)
  }
  return(unis)
}