context("idotproduct test")

test_that("idotproduct returns expected value", {
  it <- iter(1:5)
  it2 <- iter(1:5)
  expect_equal(idotproduct(it, it2), 55) 
  
  it3 <- iter(c(10, 10))
  it4 <- iter(c(20, 20))
  expect_equal(idotproduct(it3, it4), 400)
  
  it3 <- iter(c(10, 10))
  it5 <- iter(c(T, F))
  expect_equal(idotproduct(it3, it5), 10)
})

test_that("idotproduct errors for vectors of unequal length", {
  it <- iter(1:5)
  it2 <- iter(1:4)
  expect_error(idotproduct(it, it2), "Iterators must be of equal length")
  
  it <- iter(1:5)
  it2 <- iter(1:4)
  expect_error(idotproduct(it2, it), "Iterators must be of equal length")
})

test_that("idotproduct errors for non-numeric vectors", {
  it <- iter(1:5)
  it2 <- iter(levels(iris$Species))  
  expect_error(idotproduct(it, it2), "Iterator must be numeric")
  
  it <- iter(1:5)
  it2 <- iter(levels(iris$Species))
  expect_error(idotproduct(it2, it), "Iterator must be numeric")
})


