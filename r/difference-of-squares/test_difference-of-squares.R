source("./difference-of-squares.R")
library(testthat)

context("difference of squares")

test_that("difference of squares 0", {
  input <- 0
  expect_equal(difference_of_squares(input), 0)
})

test_that("difference of squares 5", {
  input <- 5
  expect_equal(difference_of_squares(input), 170)
})

test_that("difference of squares 10", {
  input <- 10
  expect_equal(difference_of_squares(input), 2640)
})

test_that("difference of squares 100", {
  input <- 100
  expect_equal(difference_of_squares(input), 25164150)
})

message("All tests passed for exercise: difference-of-squares")
