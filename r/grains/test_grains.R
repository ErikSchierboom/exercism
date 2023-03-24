source("./grains.R")
library(testthat)

context("grains")

test_that("Case 1", {
  expect_equal(square(1), 1)
})

test_that("Case 2", {
  expect_equal(square(2), 2)
})

test_that("Case 3", {
  expect_equal(square(3), 4)
})

test_that("Case 4", {
  expect_equal(square(4), 8)
})

test_that("Case 16", {
  expect_equal(square(16), 32768)
})

test_that("Case 32", {
  expect_equal(square(32), 2147483648)
})

test_that("Case 1", {
  expect_equal(square(64), 9223372036854775808)
})

test_that("square 0 raises an exception", {
  expect_error(square(0))
})

test_that("negative square raises an exception", {
  expect_error(square(-1))
})

test_that("square greater than 64 raises an exception", {
  expect_error(square(65))
})

test_that("returns the total number of square on the board", {
  expect_equal(total(), 18446744073709551615)
})

message("All tests passed for exercise: grains")
