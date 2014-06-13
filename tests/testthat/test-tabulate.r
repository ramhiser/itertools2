context("tabulate test")

test_that("tabulate works with stop value", {
  ifn <- function(x) x - 1 
  it <- tabulate(ifn, start = -10, end = 10)
  expect_equal(take(it, 21), -11:9) 
  expect_error(nextElem(it), "StopIteration")
})

test_that("tabulate works without stop value", {
  ifn <- function(x) x - 1 
  it <- tabulate(ifn, start = -10)
  expect_equal(take(it, 21), -11:9) 
  expect_equal(take(it, 21), 10:30)
})

test_that("tabulate will handle start > stop correctly", {
  ifn <- function(x) x - 1 
  it <- tabulate(ifn, start = 1, end = -1)
  expect_error(nextElem(it), "StopIteration")
})

test_that("tabulate won't accept non-numeric start or stop values", {
  ifn <- function(x) x - 1 
  it <- tabulate(ifn, start = T)
  expect_equal(take(it, 3), 0:2)
  expect_error(it <- tabulate(ifn, start = "a"), "'start' must be a numeric value of length 1")
  expect_error(it <- tabulate(ifn, start = 5, end = "a"), "'end' must be a numeric value of length 1")
})
