context("pairwise test")

test_that("pairwise works with a usual iterator", {
  it <- iter(letters[1:3])
  it2 <- pairwise(it)
  expect_equal(nextElem(it2), c("a", "b"))
  expect_equal(nextElem(it2), c("b", "c"))
  expect_error(nextElem(it2), "StopIteration")
  
  it3 <- iter(1:4)
  it4 <- pairwise(it3)
  expect_equal(nextElem(it4), 1:2)
  expect_equal(nextElem(it4), 2:3)
  expect_equal(nextElem(it4), 3:4)
  expect_error(nextElem(it4), "StopIteration")
})

test_that("pairwise works with an iterator returning items of length > 1", {
  it <- iter(list(1:2, 3:4, 5:6))
  it2 <- pairwise(it)
  expect_equal(nextElem(it2), 1:4)
  expect_equal(nextElem(it2), 3:6)
  expect_error(nextElem(it2), "StopIteration")
  
  
  it3 <- iter(list(c('a', 'b', 'c'), 'd', c('e', 'f')))
  it4 <- pairwise(it3)
  expect_equal(nextElem(it4), letters[1:4])
  expect_equal(nextElem(it4), letters[4:6])
  expect_error(nextElem(it4), "StopIteration")
})

test_that("pairwise does not work with non-iterators", {
  it <- c(letters)
  expect_error(pairwise(it), "'iterator' must be of class 'iter'")
})

