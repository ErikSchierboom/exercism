source("./largest-series-product.R")
library(testthat)

test_that("finds the largest product if span equals length", {
  digits <- "29"
  span <- 2
  expect_equal(largest_series_product(digits, span), 18)
})

test_that("can find the largest product of 2 with numbers in order", {
  digits <- "0123456789"
  span <- 2
  expect_equal(largest_series_product(digits, span), 72)
})

test_that("can find the largest product of 2", {
  digits <- "576802143"
  span <- 2
  expect_equal(largest_series_product(digits, span), 48)
})

test_that("can find the largest product of 3 with numbers in order", {
  digits <- "0123456789"
  span <- 3
  expect_equal(largest_series_product(digits, span), 504)
})

test_that("can find the largest product of 3", {
  digits <- "1027839564"
  span <- 3
  expect_equal(largest_series_product(digits, span), 270)
})

test_that("can find the largest product of 5 with numbers in order", {
  digits <- "0123456789"
  span <- 5
  expect_equal(largest_series_product(digits, span), 15120)
})

test_that("can get the largest product of a big number", {
  digits <- "73167176531330624919225119674426574742355349194934"
  span <- 6
  expect_equal(largest_series_product(digits, span), 23520)
})

test_that("reports zero if the only digits are zero", {
  digits <- "0000"
  span <- 2
  expect_equal(largest_series_product(digits, span), 0)
})

test_that("reports zero if all spans include zero", {
  digits <- "99099"
  span <- 3
  expect_equal(largest_series_product(digits, span), 0)
})

test_that("rejects span longer than string length", {
  digits <- "123"
  span <- 4
  expect_error(largest_series_product(digits, span))
})

test_that("rejects empty string and nonzero span", {
  digits <- ""
  span <- 1
  expect_error(largest_series_product(digits, span))
})

test_that("rejects invalid character in digits", {
  digits <- "1234a5"
  span <- 2
  expect_error(largest_series_product(digits, span))
})

test_that("rejects negative span", {
  digits <- "12345"
  span <- -1
  expect_error(largest_series_product(digits, span))
})
