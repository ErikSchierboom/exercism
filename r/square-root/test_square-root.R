source("./square-root.R")
library(testthat)

test_that("Square root of 1 is 1", {
  expect_equal(square_root(1), 1)
})

test_that("Square root of 4 is 2", {
  expect_equal(square_root(4), 2)
})

test_that("Square root of 25 is 5", {
  expect_equal(square_root(25), 5)
})

test_that("Square root of 81 is 9", {
  expect_equal(square_root(81), 9)
})

test_that("Square root of 196 is 14", {
  expect_equal(square_root(196), 14)
})

test_that("Square root of 65025 is 255", {
  expect_equal(square_root(65025), 255)
})

test_that("Domain error for negative number", {
  expect_error(square_root(-65536))
})
