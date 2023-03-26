source("./perfect-numbers.R")
library(testthat)

context("perfect numbers")

test_that("Smallest perfect number is classified correctly", {
  n <- 6
  expect_equal(number_type(n), "perfect")
})

test_that("Medium perfect number is classified correctly", {
  n <- 28
  expect_equal(number_type(n), "perfect")
})

test_that("Large perfect number is classified correctly", {
  n <- 33550336
  expect_equal(number_type(n), "perfect")
})



test_that("Smallest abundant number is classified correctly", {
  n <- 12
  expect_equal(number_type(n), "abundant")
})

test_that("Medium abundant number is classified correctly", {
  n <- 30
  expect_equal(number_type(n), "abundant")
})

test_that("Large abundant number is classified correctly", {
  n <- 33550335
  expect_equal(number_type(n), "abundant")
})



test_that("Smallest prime deficient number is classified correctly", {
  n <- 2
  expect_equal(number_type(n), "deficient")
})

test_that("Smallest non-prime deficient number is classified correctly", {
  n <- 4
  expect_equal(number_type(n), "deficient")
})

test_that("Medium deficient number is classified correctly", {
  n <- 32
  expect_equal(number_type(n), "deficient")
})

test_that("Large deficient number is classified correctly", {
  n <- 33550337
  expect_equal(number_type(n), "deficient")
})

test_that("Edge case (no factors other than itself) is classified correctly", {
  n <- 1
  expect_equal(number_type(n), "deficient")
})



test_that("Zero is rejected (not a natural number)", {
  n <- 0
  expect_error(number_type(n))
})

test_that("Negative integer is rejected (not a natural number)", {
  n <- -1
  expect_error(number_type(n))
})


message("All tests passed for exercise: perfect-numbers")
