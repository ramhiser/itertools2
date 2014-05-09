context("count iterator: Infinite sequence")

test_that("count's default values generate the sequence 0, 1, 2, ..", {
  it <- count()

  i <- nextElem(it)
  expect_equal(i, 0)

  i <- nextElem(it)
  expect_equal(i, 1)

  i <- nextElem(it)
  expect_equal(i, 2)

  i <- nextElem(it)
  expect_equal(i, 3)
})

test_that("count works with a given initial value", {
  it <- count(start=42)

  i <- nextElem(it)
  expect_equal(i, 42)

  i <- nextElem(it)
  expect_equal(i, 43)

  i <- nextElem(it)
  expect_equal(i, 44)

  i <- nextElem(it)
  expect_equal(i, 45)
})

test_that("count works with a decimal step size", {
  it <- count(start=42, step=1.5)

  i <- nextElem(it)
  expect_equal(i, 42)

  i <- nextElem(it)
  expect_equal(i, 43.5)

  i <- nextElem(it)
  expect_equal(i, 45)

  i <- nextElem(it)
  expect_equal(i, 46.5)
})
