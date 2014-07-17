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

#' Helper function that determines the length of an iterator object
#'
#' Returns the length of an iterator object. In the case that the iterator's
#' length is \code{NULL}, a value of 1 is returned by default. This value can be
#' set using the \code{default} argument.
#'
#' @param object an iterator object
#' @param default the value returned when an iterator has \code{NULL} length
#' @return integer
iter_length <- function(object, default=1) {
  ifelse(is.null(object$length), default, object$length)
}
