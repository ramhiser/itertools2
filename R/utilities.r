#' Helper function that determines whether an object inherits from a
#' StopIteration exception
#'
#' Returns \code{TRUE} if the \code{object} resulted from a StopIteration
#' exception when \code{\link[iterators]{nextElem}} is called, and \code{FALSE}
#' otherwise.
#'
#' @param object an R object
#' @return \code{TRUE} if \code{object} resulted from a StopIteration
#' exception. Otherwise, \code{FALSE}.
stop_iteration <- function(object) {
  inherits(object, "try-error") && object == "Error : StopIteration\n"
}
