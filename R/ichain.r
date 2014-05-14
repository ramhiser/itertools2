#' Iterator that chains multiple arguments together into a single iterator
#'
#' Generates an iterator that returns elements from the first argument until it
#' is exhausted. Then generates an iterator from the next argument and returns
#' elements from it. This process continues until all arguments are exhausted
#' Chaining is useful for treating consecutive sequences as a single sequence.
#'
#' @importFrom iterators iter nextElem
#' @export
#' @param ... multiple arguments to iterate through in sequence
#' @return iterator that iterates through each argument in sequence
#' 
#' @examples
#' it <- ichain(1:3, 4:5, 6)
#' nextElem(it) # 1
#' nextElem(it) # 2
#' nextElem(it) # 3
#' nextElem(it) # 4
#' nextElem(it) # 5
#' nextElem(it) # 6
#' 
#' it2 <- ichain(1:3, levels(iris$Species))
#' nextElem(it2) # 1
#' nextElem(it2) # 2
#' nextElem(it2) # 3
#' nextElem(it2) # setosa
#' nextElem(it2) # versicolor
#' nextElem(it2) # virginica
ichain <- function(...) {
  iter_list <- lapply(list(...), iter)
  num_args <- length(iter_list)

  if (num_args == 0) {
    stop("At least one argument must be supplied.")
  }

  # TODO: Introduce iterators:::hasNext() to circumvent catching StopIteration?
  #       See the iterators vignette for details.
  arg_i <- 1
  nextElem <- function() {
    next_elem <- try(iterators::nextElem(iter_list[[arg_i]]), silent=TRUE)
    if (stop_iteration(next_elem)) {
      arg_i <<- arg_i + 1
      if (arg_i > num_args) {
        stop("StopIteration", call.=FALSE)
      } else {
        next_elem <- iterators::nextElem(iter_list[[arg_i]])
      }
    }
    next_elem
  }

  it <- list(nextElem=nextElem)
  class(it) <- c("abstractiter", "iter")
  it
}

