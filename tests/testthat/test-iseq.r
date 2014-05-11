context("iseq family of iterators")

test_that("iseq_len generates a finite sequence of integers", {
  it <- iseq_len(4)

  i <- nextElem(it)
  expect_equal(i, 1)

  i <- nextElem(it)
  expect_equal(i, 2)

  i <- nextElem(it)
  expect_equal(i, 3)

  i <- nextElem(it)
  expect_equal(i, 4)

  expect_error(nextElem(it), "StopIteration")
})

test_that("First element of iseq_len with length 0 yields StopIteration", {
  it <- iseq_len(0)
  expect_error(nextElem(it), "StopIteration")
})

test_that("iseq_along's generate a finite sequence of integers from a vector", {
  it <- iseq_along(1:4)

  i <- nextElem(it)
  expect_equal(i, 1)

  i <- nextElem(it)
  expect_equal(i, 2)

  i <- nextElem(it)
  expect_equal(i, 3)

  i <- nextElem(it)
  expect_equal(i, 4)

  expect_error(nextElem(it), "StopIteration")
})

test_that("iseq_along's generate a finite sequence of integers from a data.frame", {
  it <- iseq_along(iris)

  i <- nextElem(it)
  expect_equal(i, 1)

  i <- nextElem(it)
  expect_equal(i, 2)

  i <- nextElem(it)
  expect_equal(i, 3)

  i <- nextElem(it)
  expect_equal(i, 4)

  i <- nextElem(it)
  expect_equal(i, 5)

  expect_error(nextElem(it), "StopIteration")
})

test_that("First element of iseq_along applied to vector of length 0 yields StopIteration", {
  it <- iseq_along(numeric(0))
  expect_error(nextElem(it), "StopIteration")
})
