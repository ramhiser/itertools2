#' Pad an iterator 
#'
#' Returns the sequence of elements and then returns a given value indefinitely.
#'
#' @export
#' @param iterator The iterator to start
#' @param fill_value The value to pad the iterator, default is NA
#' @return An iterable composed of the original iterable and the padded value
#' @example
#' it <- iter(1:5)
#' it2 <- ipad(it, fill_value = -1)
#' take(it2, 8)
#' 
#' 
ipad <- function(iterator, fill_value = NA){
  return(ichain(iterator, irepeat(fill_value)))
}