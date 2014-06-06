#' Iterator that iterates through several iterables concurrently.
#'
#' The resulting iterator aggregates elements from each of the iterables into a
#' list from each iteration. Used for lock-step iteration over several iterables
#' at a time.
#'
#' @importFrom iterators iter nextElem
#' @export
#' @param ... multiple arguments to iterate through in sequence
#' @return iterator that iterates through each argument in sequence
#' 
#' @examples
#' it <- izip(1:3, 4:6, 7:9)
#' nextElem(it) # list(1, 4, 7)
#' nextElem(it) # list(2, 5, 8)
#' nextElem(it) # list(3, 6, 9)
#'
#' it2 <- izip(1:3, 4:6, levels(iris$Species))
#' nextElem(it2) # list(1, 4, "setosa")
#' nextElem(it2) # list(2, 5, "versicolor")
#' nextElem(it2) # list(3, 6, "virginica")
#' 
#' it3 <- izip(1:3, 4:42, levels(iris$Species))
#' nextElem(it3) # list(1, 4, "setosa")
#' nextElem(it3) # list(2, 5, "versicolor")
#' nextElem(it3) # list(3, 6, "virginica")
izip <- function(...) {
  iter_list <- lapply(list(...), iter)
  if (length(iter_list) == 0) {
    stop("At least one argument must be supplied.")
  }

  # TODO: Introduce iterators:::hasNext() to circumvent catching StopIteration?
  #       See the iterators vignette for details.
  nextElem <- function() {
    next_elem <- lapply(iter_list, function(x) {
      try(iterators::nextElem(x), silent=TRUE)
    })

    any_stopped <- any(sapply(next_elem, stop_iteration))
    if (any_stopped) {
      stop("StopIteration", call.=FALSE)
    }
    next_elem
  }

  it <- list(nextElem=nextElem)
  class(it) <- c("abstractiter", "iter")
  it
}

