source("./luhn.R")
library(testthat)

context("luhn")

test_that("single digit strings can not be valid", {
  input <- "1"
  expect_equal(is_valid(input), FALSE)
})

test_that("A single zero is invalid", {
  input <- "0"
  expect_equal(is_valid(input), FALSE)
})

test_that("a simple valid SIN that remains valid if reversed", {
  input <- "059"
  expect_equal(is_valid(input), TRUE)
})

test_that("a simple valid SIN that becomes invalid if reversed", {
  input <- "59"
  expect_equal(is_valid(input), TRUE)
})

test_that("valid Canadian SIN", {
  input <- "046 454 286"
  expect_equal(is_valid(input), TRUE)
})

test_that("invalid Canadian SIN", {
  input <- "046 454 287"
  expect_equal(is_valid(input), FALSE)
})

test_that("invalid credit card", {
  input <- "8273 1232 7352 0569"
  expect_equal(is_valid(input), FALSE)
})

test_that("valid strings with a non-digit added become invalid", {
  input <- "055a 444 285"
  expect_equal(is_valid(input), FALSE)
})

test_that("punctuation is not allowed", {
  input <- "055-444-285"
  expect_equal(is_valid(input), FALSE)
})

test_that("symbols are not allowed", {
  input <- "055£ 444$ 285"
  expect_equal(is_valid(input), FALSE)
})

test_that("single zero with space is invalid", {
  input <- " 0"
  expect_equal(is_valid(input), FALSE)
})

test_that("more than a single zero is valid", {
  input <- "0000 0"
  expect_equal(is_valid(input), TRUE)
})

test_that("another valid sin", {
  input <- "055 444 285"
  expect_equal(is_valid(input), TRUE)
})

test_that("nine doubled is nine", {
  input <- "091"
  expect_equal(is_valid(input), TRUE)
})

message("All tests passed for exercise: luhn")
