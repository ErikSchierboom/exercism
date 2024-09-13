source("./pythagorean-triplet.R")
library(testthat)

test_that("triplets whose sum is 12", {
  expect_equal(pythagorean_triplet(12), list(3:5))
})

test_that("triplets whose sum is 108", {
  expect_equal(pythagorean_triplet(108), list(c(27, 36, 45)))
})

test_that("triplets whose sum is 1000", {
  expect_equal(pythagorean_triplet(1000), list(c(200, 375, 425)))
})

test_that("no matching triplets for 1001", {
  expect_equal(pythagorean_triplet(1001), list())
})

test_that("returns all matching triplets", {
  expect_equal(pythagorean_triplet(90), list(c(9, 40, 41), c(15, 36, 39)))
})

test_that("several matching triplets", {
  expect_equal(
    pythagorean_triplet(840),
    list(
      c(40, 399, 401),
      c(56, 390, 394),
      c(105, 360, 375),
      c(120, 350, 370),
      c(140, 336, 364),
      c(168, 315, 357),
      c(210, 280, 350),
      c(240, 252, 348)
    )
  )
})

test_that("triplets for large number", {
  expect_equal(
    pythagorean_triplet(30000),
    list(
      c(1200, 14375, 14425),
      c(1875, 14000, 14125),
      c(5000, 12000, 13000),
      c(6000, 11250, 12750),
      c(7500, 10000, 12500)
    )
  )
})
