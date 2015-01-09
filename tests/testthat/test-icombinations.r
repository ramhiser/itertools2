context("icombinations iterator")

test_that("icombinations matches the output from utils::combn", {
  combn_out <- utils::combn(x=seq_len(5), m=2, simplify=FALSE)
  it <- icombinations(seq_len(5), 2)
  expect_equal(iterators::nextElem(it), combn_out[[1]])
  expect_equal(iterators::nextElem(it), combn_out[[2]])
  expect_equal(iterators::nextElem(it), combn_out[[3]])
  expect_equal(iterators::nextElem(it), combn_out[[4]])
  expect_equal(iterators::nextElem(it), combn_out[[5]])
  expect_equal(iterators::nextElem(it), combn_out[[6]])
  expect_equal(iterators::nextElem(it), combn_out[[7]])
  expect_equal(iterators::nextElem(it), combn_out[[8]])
  expect_equal(iterators::nextElem(it), combn_out[[9]])
  expect_equal(iterators::nextElem(it), combn_out[[10]])
  
  expect_error(iterators::nextElem(it), "StopIteration")
})
