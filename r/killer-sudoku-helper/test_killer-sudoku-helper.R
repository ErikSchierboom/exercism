source("./killer-sudoku-helper.R")
library(testthat)

test_that("1", {
  expected <- list(c(1))
  expect_equal(expected, combinations(1, 1, c()))
})

test_that("2", {
  expected <- list(c(2))
  expect_equal(expected, combinations(1, 2, c()))
})

test_that("3", {
  expected <- list(c(3))
  expect_equal(expected, combinations(1, 3, c()))
})

test_that("4", {
  expected <- list(c(4))
  expect_equal(expected, combinations(1, 4, c()))
})

test_that("5", {
  expected <- list(c(5))
  expect_equal(expected, combinations(1, 5, c()))
})

test_that("6", {
  expected <- list(c(6))
  expect_equal(expected, combinations(1, 6, c()))
})

test_that("7", {
  expected <- list(c(7))
  expect_equal(expected, combinations(1, 7, c()))
})

test_that("8", {
  expected <- list(c(8))
  expect_equal(expected, combinations(1, 8, c()))
})

test_that("9", {
  expected <- list(c(9))
  expect_equal(expected, combinations(1, 9, c()))
})

test_that("Cage with sum 45 contains all digits 1:9", {
  expected <- list(c(1, 2, 3, 4, 5, 6, 7, 8, 9))
  expect_equal(expected, combinations(9, 45, c()))
})

test_that("Cage with only 1 possible combination", {
  expected <- list(c(1, 2, 4))
  expect_equal(expected, combinations(3, 7, c()))
})

test_that("Cage with several combinations", {
  expected <- list(c(1, 9), c(2, 8), c(3, 7), c(4, 6))
  expect_equal(expected, combinations(2, 10, c()))
})

test_that("Cage with several combinations that is restricted", {
  expected <- list(c(2, 8), c(3, 7))
  expect_equal(expected, combinations(2, 10, c(1, 4)))
})
