source("./armstrong-numbers.R")
library(testthat)

test_that("Zero is an Armstrong number", {
  expect_equal(is_armstrong_number(0), TRUE)
})

test_that("Single-digit numbers are Armstrong numbers", {
  expect_equal(is_armstrong_number(5), TRUE)
})

test_that("There are no two-digit Armstrong numbers", {
  expect_equal(is_armstrong_number(10), FALSE)
})

test_that("Three-digit number that is an Armstrong number", {
  expect_equal(is_armstrong_number(153), TRUE)
})

test_that("Three-digit number that is not an Armstrong number", {
  expect_equal(is_armstrong_number(100), FALSE)
})

test_that("Four-digit number that is an Armstrong number", {
  expect_equal(is_armstrong_number(9474), TRUE)
})

test_that("Four-digit number that is not an Armstrong number", {
  expect_equal(is_armstrong_number(9475), FALSE)
})

test_that("Seven-digit number that is an Armstrong number", {
  expect_equal(is_armstrong_number(9926315), TRUE)
})

test_that("Seven-digit number that is not an Armstrong number", {
  expect_equal(is_armstrong_number(9926314), FALSE)
})
