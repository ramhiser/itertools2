context("grouper test")

test_that("grouper works in basic case", {
  it <- iter(letters[1:3])
  expect_equal(grouper(it, 3), list(c("a", "b", "c")))
  it <- iter(letters[1:3])
  expect_equal(grouper(it, 2), list(c("a", "b"), c("c", NA)))
  it <- iter(letters[1:3])
  expect_equal(grouper(it, 2, 0), list(c("a", "b"), c("c", 0))) 
  
  it2 <- iter(1:4)
  expect_equal(grouper(it2, 2), list(1:2, 3:4))
  it2 <- iter(1:4)
  expect_equal(grouper(it2, 3), list(1:3, c(4, NA, NA)))
  it2 <- iter(1:4)
  expect_equal(grouper(it2, 3, 0), list(1:3, c(4, 0, 0))) 
})


test_that("grouper rejects non-positive or non-numeric n", {
  it <- iter(letters)
  expect_error(grouper(it, -1), "n must be a positive scalar")
  expect_error(grouper(it, "1"), "n must be a positive scalar")
})

test_that("grouper does not work with elements of length > 1", {
  it <- iter(list(c('a', 'b', 'c'), 'd', c('e', 'f')))
  expect_error(grouper(it, 2), "Iterator elements must be of length 1")
})

