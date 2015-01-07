library(combinat)

context("ipermutations iterator")

test_that("ipermutations matches the output from combinat::permn", {
  permn_out <- combinat::permn(letters[1:4])
  it <- ipermutations(letters[1:4])

  # The ordering of the permutations from ipermutations does not match
  # that of combinat::permn. Consequently, we create a matrix from
  # each method and then sort them before the test comparison is made.
  permn_rbind <- do.call(rbind, permn_out)
  ipermutations_rbind <- do.call(rbind, as.list(it))

  permn_order <- order(permn_rbind[, 1],
                       permn_rbind[, 2],
                       permn_rbind[, 3],
                       permn_rbind[, 4])
  permn_rbind <- permn_rbind[permn_order, ]

  ipermutations_order <- order(ipermutations_rbind[, 1],
                               ipermutations_rbind[, 2],
                               ipermutations_rbind[, 3],
                               ipermutations_rbind[, 4])
  ipermutations_rbind <- ipermutations_rbind[ipermutations_order, ]

  expect_equal(ipermutations_rbind, permn_rbind)
  expect_error(nextElem(it), "StopIteration")
})
