source("./matrix.R")
library(testthat)

test_that("Extract row from one number matrix", {
  expect_equal(matrix_row("1", 1), c(1))
})

test_that("Can extract row", {
  expect_equal(matrix_row("1 2\n3 4", 2), c(3, 4))
})

test_that("Extract row where numbers have different widths", {
  expect_equal(matrix_row("1 2\n10 20", 2), c(10, 20))
})

test_that("Can extract row from non-square matrix with no corresponding column", { # nolint
  expect_equal(matrix_row("1 2 3\n4 5 6\n7 8 9\n8 7 6", 4), c(8, 7, 6))
})

test_that("Extract column from one number matrix", {
  expect_equal(matrix_col("1", 1), c(1))
})

test_that("Can extract column", {
  expect_equal(matrix_col("1 2 3\n4 5 6\n7 8 9", 3), c(3, 6, 9))
})

test_that("Can extract column from non-square matrix with no corresponding row", { # nolint
  expect_equal(matrix_col("1 2 3 4\n5 6 7 8\n9 8 7 6", 4), c(4, 8, 6))
})

test_that("Extract column where numbers have different widths", {
  expect_equal(matrix_col("89 1903 3\n18 3 1\n9 4 800", 2), c(1903, 3, 4))
})
