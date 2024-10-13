source("./flatten-array.R")
library(testthat)

test_that("empty", {
  inputs <- list()
  expected <- c()
  expect_equal(flatten(inputs), expected)
})

test_that("no nesting", {
  inputs <- list(0, 1, 2)
  expected <- c(0, 1, 2)
  expect_equal(flatten(inputs), expected)
})

test_that("flattens a nested array", {
  inputs <- list(list(list()))
  expected <- c()
  expect_equal(flatten(inputs), expected)
})

test_that("flattens array with just integers present", {
  inputs <- list(1, list(2, 3, 4, 5, 6, 7), 8)
  expected <- c(1, 2, 3, 4, 5, 6, 7, 8)
  expect_equal(flatten(inputs), expected)
})

test_that("5 level nesting", {
  inputs <- list(0, 2, list(list(2, 3), 8, 100, 4, list(list(list(50)))), -2)
  expected <- c(0, 2, 2, 3, 8, 100, 4, 50, -2)
  expect_equal(flatten(inputs), expected)
})

test_that("6 level nesting", {
  inputs <- list(1, list(2, list(list(3)), list(4, list(list(5))), 6, 7), 8)
  expected <- c(1, 2, 3, 4, 5, 6, 7, 8)
  expect_equal(flatten(inputs), expected)
})

test_that("null values are omitted from the final result", {
  inputs <- list(1, 2, NULL)
  expected <- c(1, 2)
  expect_equal(flatten(inputs), expected)
})

test_that("consecutive null values at the front of the list are omitted from the final result", { # nolint
  inputs <- list(NULL, NULL, 3)
  expected <- c(3)
  expect_equal(flatten(inputs), expected)
})

test_that("consecutive null values in the middle of the list are omitted from the final result", { # nolint
  inputs <- list(1, NULL, NULL, 4)
  expected <- c(1, 4)
  expect_equal(flatten(inputs), expected)
})

test_that("6 level nest list with null values", {
  inputs <- list(0, 2, list(list(2, 3), 8, list(list(100)), NULL, list(list(NULL))), -2) # nolint
  expected <- c(0, 2, 2, 3, 8, 100, -2)
  expect_equal(flatten(inputs), expected)
})

test_that("all values in nested list are null", {
  inputs <- list(NULL, list(list(list(NULL))), NULL, NULL, list(list(NULL, NULL), NULL), NULL) # nolint
  expected <- c()
  expect_equal(flatten(inputs), expected)
})
