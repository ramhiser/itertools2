context("itripletwise iterator")

test_that("itripletwise functions properly with an iterator", {
  it <- iterators::iter(letters[1:4])
  it_itripletwise <- itripletwise(it)
  expect_equal(iterators::nextElem(it_itripletwise), list("a", "b", "c"))
  expect_equal(iterators::nextElem(it_itripletwise), list("b", "c", "d"))
  expect_error(iterators::nextElem(it_itripletwise), "StopIteration")
})

test_that("itripletwise functions properly with a vector", {
  it_itripletwise <- itripletwise(letters[1:5])
  expect_equal(iterators::nextElem(it_itripletwise), list("a", "b", "c"))
  expect_equal(iterators::nextElem(it_itripletwise), list("b", "c", "d"))
  expect_equal(iterators::nextElem(it_itripletwise), list("c", "d", "e"))
  expect_error(iterators::nextElem(it_itripletwise), "StopIteration")
})
