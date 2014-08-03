context("quantify test")

test_that("quantify behaves well for logicals and 0-1 numerics", {
  it <- iter(c(F, T, T, F, T, T))
  expect_equal(quantify(it), 4)
  
  it2 <- iter(c(0, 1, 1, 0, 1, 1, 0, 0, 1))
  expect_equal(quantify(it2), 5)
})

test_that("quantify rejects non-logical elements", {
  it <- iter(letters) 
  expect_error(quantify(it), "Iterator must contain logical elements")
  
  it2 <- iter(0:9)
  expect_error(quantify(it2), "Iterator must contain logical elements")
})
