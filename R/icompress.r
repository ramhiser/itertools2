#' Iterator that filters elements where corresponding selector is false.
#'
#' Constructs an iterator that filters elements from iterable returning only
#' those for which the corresponding element from \code{selectors} is
#' \code{TRUE}.
#'
#' The iterator stops when either \code{object} or \code{selectors} has been
#' exhausted.
#'
#' @importFrom iterators iter nextElem
#' @export
#' @param object an iterable object
#' @param selectors an iterable that determines whether the corresponding
#' element in \code{object} is returned.
#' @return iterator object
#' 
#' @examples
#' # Filters out odd numbers and retains only even numbers
#' n <- 10
#' selectors <- rep(c(F, T), n)
#' it <- icompress(seq_len(n), selectors)
#' nextElem(it) # 2
#' nextElem(it) # 4
#' nextElem(it) # 6
#' nextElem(it) # 8
#' nextElem(it) # 10
#'
#' # Similar idea here but anonymous function is used to filter out even
#' # numbers
#' n <- 10
#' it2 <- icompress(seq_len(10), rep(c(T, F), n))
#' nextElem(it) # 1
#' nextElem(it) # 3
#' nextElem(it) # 5
#' nextElem(it) # 7
#' nextElem(it) # 9
#'
#' it3 <- icompress(letters, letters %in% c('a', 'e', 'i', 'o', 'u'))
#' nextElem(it) # a
#' nextElem(it) # e
#' nextElem(it) # i
#' nextElem(it) # o
#' nextElem(it) # u
icompress <- function(object, selectors) {
  iter_izip <- izip(obj=object, select=selectors)

  nextElem <- function() {
    repeat {
      next_elem <- iterators::nextElem(iter_izip)
      if (next_elem$select) {
        return(next_elem$obj)
      }
    }
  }

  it <- list(nextElem=nextElem)
  class(it) <- c("abstractiter", "iter")
  it
}
