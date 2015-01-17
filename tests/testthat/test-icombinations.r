context("icombinations iterator")

test_that("icombinations matches the output from utils::combn", {
  combn_out <- utils::combn(x=5, m=2, simplify=FALSE)
  it <- icombinations(seq_len(5), 2)

  expect_equal(as.list(it), combn_out)
})

test_that("icombinations matches the output from another utils::combn call", {
  combn_out <- utils::combn(x=3, m=3, simplify=FALSE)
  it <- icombinations(seq_len(3), 3)

  expect_equal(as.list(it), combn_out)
})
