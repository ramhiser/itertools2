#' Iterator that filters elements not satisfying a predicate function
#'
#' Constructs an iterator that filters elements from iterable returning only
#' those for which the predicate is \code{TRUE}.
#'
#' @importFrom iterators iter nextElem
#' @export
#' @param predicate a function that determines whether an element is \code{TRUE}
#' or \code{FALSE}.  The function is assumed to take only one argument.
#' @param iterable an iterable object
#' @return iterator object
#' 
#' @examples
#' # Filters out odd numbers and retains only even numbers
#' is_even <- function(x) {
#'   x %% 2 == 0
#' }
#' it <- ifilter(is_even, 1:10)
#' nextElem(it) # 2
#' nextElem(it) # 4
#' nextElem(it) # 6
#' nextElem(it) # 8
#' nextElem(it) # 10
#'
#' # Similar idea here but anonymous function is used to filter out even
#' # numbers
#' it2 <- ifilter(function(x) x %% 2 == 1, 1:10)
#' nextElem(it) # 1
#' nextElem(it) # 3
#' nextElem(it) # 5
#' nextElem(it) # 7
#' nextElem(it) # 9
#'
#' is_vowel <- function(x) {
#'   x %in% c('a', 'e', 'i', 'o', 'u')
#' }
#' it3 <- ifilter(is_vowel, letters)
#' nextElem(it) # a
#' nextElem(it) # e
#' nextElem(it) # i
#' nextElem(it) # o
#' nextElem(it) # u
ifilter <- function(predicate, iterable) {
  if (!is.function(predicate)) {
    stop("The 'predicate' must a function that returns TRUE or FALSE.")
  }

  iter_obj <- iterators::iter(iterable)

  nextElem <- function() {
    repeat {
      next_elem <- iterators::nextElem(iter_obj)
      if (predicate(next_elem)) {
        return(next_elem)
      }
    }
  }

  it <- list(nextElem=nextElem)
  class(it) <- c("abstractiter", "iter")
  it
}

