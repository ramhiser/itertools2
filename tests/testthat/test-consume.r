context("consume test")

test_that("consume and nth behave well for n < length of the iterable", {
  it <- iter(letters)
  consume(it, 4)
  expect_equal(nextElem(it), "e")
  
  it2 <- iter(letters)
  expect_equal(nth(it2, 5), "e")
})

test_that("consume behaves well for n > length of the iterable", {
  it <- iter(letters) 
  consume(it, 27)
  expect_error(nextElem(it), "StopIteration")
})

test_that("nth returns the given default value when the iterator is consumed", {
  it <- iter(letters)
  expect_equal(nth(it, 30, "default"), "default")
  
  it2 <- iter(letters)
  expect_equal(nth(it2, 27), NA)
})

test_that("consume rejects non-positive or non-numeric n", {
  it <- iter(letters)
  expect_error(consume(it, -1), "n must be a non-negative integer of length 1")
  expect_error(consume(it, "a"), "n must be a non-negative integer of length 1")
})

test_that("nth rejects negative or non-numeric n", {
  it <- iter(letters)
  expect_error(nth(it, -1), "n must be a positive integer of length 1")
  expect_error(nth(it, "a"), "n must be a positive integer of length 1")
})