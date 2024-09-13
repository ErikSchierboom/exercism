source("./pascals-triangle.R")
library(testthat)

test_that("zero rows", {
  expect_equal(pascals_triangle(0), list())
})

test_that("single row", {
  expect_equal(pascals_triangle(1), list(1))
})

test_that("two rows", {
  expect_equal(pascals_triangle(2), list(1, c(1, 1)))
})

test_that("three rows", {
  expect_equal(pascals_triangle(3), list(1, c(1, 1), c(1, 2, 1)))
})

test_that("four rows", {
  expect_equal(pascals_triangle(4), list(1, c(1, 1), c(1, 2, 1), c(1, 3, 3, 1)))
})

test_that("negative rows", {
  expect_error(pascals_triangle(-1))
})

test_that("null/no rows", {
  expect_error(pascals_triangle(NULL))
})
