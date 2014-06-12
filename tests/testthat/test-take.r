context("take test")

test_that("take properly extracts n elements, n < length of the iterable", {
  it <- ichain(1:3, 4:5, 6)
  expect_equal(take(it, 4), c(1:4))
  expect_equal(nextElem(it), 5)
  expect_equal(nextElem(it), 6)
  expect_error(nextElem(it), "StopIteration")
})

test_that("take properly extracts n elements, n = length of the iterable", {
  it <- ichain(1:3, 4:5, 6)
  expect_equal(take(it, 6), c(1:6))
  expect_equal(nextElem(it), 5)
  expect_equal(nextElem(it), 6)
  expect_error(nextElem(it), "StopIteration")
})

test_that("take properly extracts n elements, n > length of the iterable", {
  it <- ichain(1:3, 4:5, 6)
  expect_equal(take(it, 7), c(1:6, NA))
  expect_error(nextElem(it), "StopIteration") ### Need to deal with this in general
})
