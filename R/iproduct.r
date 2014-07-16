#' Iterator that returns the Cartesian product of the arguments.
#'
#' Constructs an iterator that is the Cartesian product of each of the arguments.
#'
#' Although they share the same end goal, \code{iproduct} can yield drastic
#' memory savings compared to \code{\link[base]{expand.grid}}.
#'
#' @importFrom iterators iter nextElem
#' @export
#' @param ... multiple arguments
#' @return iterator that iterates through each element from the Cartesian
#' product
#' 
#' @examples
#' it <- iproduct(1:3, 4:5)
#' nextElem(it) # list(1, 4)
#' nextElem(it) # list(1, 5)
#' nextElem(it) # list(2, 4)
#' nextElem(it) # list(2, 5)
#' nextElem(it) # list(3, 4)
#' nextElem(it) # list(3, 5)
#' 
#' it2 <- iproduct(a=1:2, b=3:4, c=5:6)
#' nextElem(it2) # list(a=1, b=3, c=5)
#' nextElem(it2) # list(a=1, b=3, c=6)
#' nextElem(it2) # list(a=1, b=4, c=5)
#' nextElem(it2) # list(a=1, b=4, c=6)
#' nextElem(it2) # list(a=2, b=3, c=5)
#' nextElem(it2) # list(a=2, b=3, c=6)
#' nextElem(it2) # list(a=2, b=4, c=5)
#' nextElem(it2) # list(a=2, b=4, c=6)
iproduct <- function(...) {
  args_list <- list(...)
  if (length(args_list) == 0) {
    stop("At least one argument must be supplied.")
  }

  # Determines the frequency and number of replicates each element in args_list
  # must be repeated
  args_lengths <- sapply(args_list, length)
  freq <- cumprod(c(1, rev(args_lengths[-1])))
  freq <- rev(unname(freq))
  rep_times <- unname(prod(args_lengths) / freq / args_lengths)

  # For each element in args_list, an iterator is constructed that repeats each
  # of its values with the proper frequency and cadence.
  args_iters <- mapply(irep,
                       args_list,
                       times=rep_times,
                       each=freq,
                       SIMPLIFY=FALSE)

  # Finally, izip's the list of iterators
  it <- do.call(izip, args=args_iters)
}
