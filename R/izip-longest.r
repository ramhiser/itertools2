#' Iterator that iterates through several iterables concurrently.
#'
#' The resulting iterator aggregates elements from each of the iterables into a
#' list from each iteration. Used for lock-step iteration over several iterables
#' at a time.
#'
#' Although similar to \code{\link[itertools2]{izip}}, missing values are
#' replaced with \code{fill} if the iterables are of uneven length, and
#' Iteration continues until the longest iterable is exhausted.
#'
#' @importFrom iterators iter nextElem
#' @export
#' @param ... multiple arguments to iterate through in sequence
#' @param fill the value used to replace missing values when the iterables in
#' \code{...} are of uneven length
#' @return iterator that iterates through each argument in sequence
#' 
#' @examples
#' it <- izip(1:3, 4:6, 7:9)
#' nextElem(it) # list(1, 4, 7)
#' nextElem(it) # list(2, 5, 8)
#' nextElem(it) # list(3, 6, 9)
#'
#' it2 <- izip(1:3, 4:8)
#' nextElem(it2) # list(1, 4)
#' nextElem(it2) # list(2, 5)
#' nextElem(it2) # list(3, 6)
#' nextElem(it2) # list(NA, 7)
#' nextElem(it2) # list(NA, 8)
#' 
#' it3 <- izip(1:3, 4:7, levels(iris$Species), fill="w00t")
#' nextElem(it3) # list(1, 4, "setosa")
#' nextElem(it3) # list(2, 5, "versicolor")
#' nextElem(it3) # list(3, 6, "virginica")
#' nextElem(it3) # list("w00t", 7, "w00t")
izip_longest <- function(..., fill=NA) {
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

    which_stopped <- sapply(next_elem, stop_iteration)
    all_stopped <- all(which_stopped)
    
    if (all_stopped) {
      stop("StopIteration", call.=FALSE)
    } else {
      next_elem[which_stopped] <- fill
    }
    next_elem
  }

  it <- list(nextElem=nextElem)
  class(it) <- c("abstractiter", "iter")
  it
}

