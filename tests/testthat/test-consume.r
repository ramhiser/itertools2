context("consume iterator")

test_that("consume consumes an iterator when n < length(iterator)", {
  it <- iter(letters)
  consume(it, n=4)
  expect_equal(nextElem(it), "e")
})

test_that("consume consumes an iterator when n=0 or n > length(iterator)", {
  it <- iter(letters)
  consume(it, n=0)
  expect_error(nextElem(it), "StopIteration")

  it2 <- iter(letters)
  consume(it2, n=27)
  expect_error(nextElem(it), "StopIteration")
})

test_that("consume rejects non-positive or non-integer n", {
  it <- iter(letters)
  expect_error(consume(it, -1), "n must be a non-negative integer of length 1")
  expect_error(consume(it, "a"), "n must be a non-negative integer of length 1")
})

test_that("nth consumes an iterator when n < length(iterable)", {
  it <- iter(letters)
  expect_equal(nth(it, 5), "e")
})

test_that("nth returns the given default value when the iterator is consumed", {
  it <- iter(letters)
  expect_equal(nth(it, 27), NA)
})

test_that("nth rejects negative or non-integer n", {
  it <- iter(letters)
  expect_error(nth(it, -1), "n must be a positive integer of length 1")
  expect_error(nth(it, "a"), "n must be a positive integer of length 1")
})
