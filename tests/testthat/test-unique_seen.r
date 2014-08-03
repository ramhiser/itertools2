context("unique_*seen test")

test_that("unique_everseen works with numeric and character types", {
  it <- iter(c('A', 'A', 'A', 'A', 'B', 'B', 'B', 'C', 'C', 'D', 'A', 'A', 'B', 'B'))
  expect_equal(unique_everseen(it), c("A", "B", "C", "D"))

  it2 <- iter(c(1, 3, 4, 4, 2, 2, 2, 2, 1, 3, 3, 3))
  expect_equal(unique_everseen(it2), c(1, 3, 4, 2))
})

test_that("unique_justseen works with numeric and character types", {
  it <- iter(c('A', 'A', 'A', 'A', 'B', 'B', 'B', 'C', 'C', 'D', 'A', 'A', 'B', 'B'))
  expect_equal(unique_justseen(it), c("A", "B", "C", "D", "A", "B"))
  
  it2 <- iter(c(1, 3, 4, 4, 2, 2, 2, 2, 1, 3, 3, 3))
  expect_equal(unique_justseen(it2), c(1, 3, 4, 2, 1, 3))
})

test_that("unique_everseen and unique_justseen work can ignore case", {
  it <- iter(c('A', 'a', 'a', 'a', 'B', 'B', 'B', 'c', 'C', 'D', 'A', 'A', 'b', 'b'))
  expect_equal(unique_everseen(it), c("A", "a", "B", "c", "C", "D", "b"))
  
  it <- iter(c('A', 'a', 'a', 'a', 'B', 'B', 'B', 'c', 'C', 'D', 'A', 'A', 'b', 'b'))
  expect_equal(unique_everseen(it, ignore_case = T), c("a", "b", "c", "d"))
  
  it <- iter(c('A', 'a', 'a', 'a', 'B', 'B', 'B', 'c', 'C', 'D', 'A', 'A', 'b', 'b'))
  expect_equal(unique_justseen(it), c("A", "a", "B", "c", "C", "D", "A", "b"))
  
  it <- iter(c('A', 'a', 'a', 'a', 'B', 'B', 'B', 'c', 'C', 'D', 'A', 'A', 'b', 'b'))
  expect_equal(unique_justseen(it, ignore_case = T), c("a", "b", "c", "d", "a", "b"))
})



