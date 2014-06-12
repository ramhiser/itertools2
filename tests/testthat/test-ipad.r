context("ipad test")

### FIX
test_that("ipad works with any type of value", {
  it <- ipad(iter(1:9))
  expect_equal(take(it, 15), c(1:9, rep("NA", 6)))
  
  it2 <- ipad(iter(1:9), 0)
  expect_equal(take(it2, 15), c(1:9, rep("0", 6)))
  
  it3 <- ipad(iter(1:9), TRUE)
  expect_equal(take(it4, 15), c(1:9, rep("T", 6)))
  
  it4 <- ipad(iter(1:9), "red")
  expect_equal(take(it4, 15), c(1:9, rep("red", 6)))
})