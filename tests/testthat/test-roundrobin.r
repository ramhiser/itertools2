context("roundrobin test")

test_that("roundrobin works with all data types", {
  it <- iter(1:5)
  it2 <- iter(1:5)
  rr <- roundrobin(it, it2)
  expect_equal(unlist(take(rr, 10)), rep(1:5, each = 2))
  expect_error(nextElem(rr), "StopIteration")
  
  it3 <- iter(levels(iris$Species))
  it4 <- iter(1:3)
  rr <- roundrobin(it3, it4)
  expect_equal(unlist(take(rr, 6)), c("setosa", 1, "versicolor", 2, "virginica", 3)) 
  expect_error(nextElem(rr), "StopIteration")
  
  it5 <- iter(letters[1:3])
  it6 <- iter(c(T, F, F))
  rr <- roundrobin(it5, it6)
  expect_equal(unlist(take(rr, 6)), c("a", T, "b", F, "c", F)) 
  expect_error(nextElem(rr), "StopIteration")
})

test_that("roundrobin works with any number of iterators", {
  it <- iter(1:5)
  rr <- roundrobin(it)
  expect_equal(unlist(take(rr, 5)), 1:5)
  expect_error(nextElem(rr), "StopIteration")
  
  it <- iter(1:5)
  it2 <- iter(1:5)
  it3 <- iter(1:5)
  rr <- roundrobin(it, it2, it3)
  expect_equal(unlist(take(rr, 15)), rep(1:5, each = 3))
  expect_error(nextElem(rr), "StopIteration")
})

test_that("roundrobin works for iterators of unequal length", {
  it <- iter(letters[1:3])
  it2 <- iter(LETTERS[5])
  it3 <- iter(letters[25:26])
  rr <- roundrobin(it, it2, it3)
  expect_equal(unlist(take(rr, 6)), c("a", "E", "y", "b", "z", "c"))
  expect_error(nextElem(rr), "StopIteration")
  
  it4 <- iter(1:3)
  it5 <- iter(5)
  it6 <- iter(25:26)
  rr <- roundrobin(it5, it6, it4)
  expect_equal(unlist(take(rr, 6)), c(5, 25, 1, 26, 2, 3))
  expect_error(nextElem(rr), "StopIteration")
})



