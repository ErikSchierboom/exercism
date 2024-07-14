source("./sum-of-multiples.R")
library(testthat)

test_that("Case 1", {
  expect_equal(sum_of_multiples(c(3, 5), 1), 0)
})

test_that("Case 2", {
  expect_equal(sum_of_multiples(c(3, 5), 4), 3)
})

test_that("Case 3", {
  expect_equal(sum_of_multiples(c(3, 5), 10), 23)
})

test_that("Case 4", {
  expect_equal(sum_of_multiples(c(3, 5), 100), 2318)
})

test_that("Case 5", {
  expect_equal(sum_of_multiples(c(3, 5), 1000), 233168)
})

test_that("Case 6", {
  expect_equal(sum_of_multiples(c(7, 13, 17), 20), 51)
})

test_that("Case 7", {
  expect_equal(sum_of_multiples(c(4, 6), 15), 30)
})

test_that("Case 8", {
  expect_equal(sum_of_multiples(c(5, 6, 8), 150), 4419)
})

test_that("Case 9", {
  expect_equal(sum_of_multiples(c(5, 25), 51), 275)
})

test_that("Case 10", {
  expect_equal(sum_of_multiples(c(43, 47), 10000), 2203160)
})

test_that("Case 11", {
  expect_equal(sum_of_multiples(c(1), 100), 4950)
})

test_that("Case 12", {
  expect_equal(sum_of_multiples(c(), 10000), 0)
})
