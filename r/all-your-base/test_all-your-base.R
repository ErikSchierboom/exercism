source("./all-your-base.R")
library(testthat)


test_that("single bit one to decimal", {
  digits <- 1
  input_base <- 2
  output_base <- 10
  expect_equal(rebase(input_base, digits, output_base), 1)
})

test_that("binary to single decimal", {
  digits <- c(1, 0, 1)
  input_base <- 2
  output_base <- 10
  expect_equal(rebase(input_base, digits, output_base), 5)
})

test_that("single decimal to binary", {
  digits <- c(5)
  input_base <- 10
  output_base <- 2
  expect_equal(rebase(input_base, digits, output_base), c(1, 0, 1))
})

test_that("binary to multiple decimal", {
  digits <- c(1, 0, 1, 0, 1, 0)
  input_base <- 2
  output_base <- 10
  expect_equal(rebase(input_base, digits, output_base), c(4, 2))
})

test_that("decimal to binary", {
  digits <- c(4, 2)
  input_base <- 10
  output_base <- 2
  expect_equal(rebase(input_base, digits, output_base), c(1, 0, 1, 0, 1, 0))
})

test_that("trinary to hexadecimal", {
  digits <- c(1, 1, 2, 0)
  input_base <- 3
  output_base <- 16
  expect_equal(rebase(input_base, digits, output_base), c(2, 10))
})

test_that("hexadecimal to trinary", {
  digits <- c(2, 10)
  input_base <- 16
  output_base <- 3
  expect_equal(rebase(input_base, digits, output_base), c(1, 1, 2, 0))
})

test_that("15-bit integer", {
  digits <- c(3, 46, 60)
  input_base <- 97
  output_base <- 73
  expect_equal(rebase(input_base, digits, output_base), c(6, 10, 45))
})

test_that("empty list", {
  digits <- c()
  input_base <- 2
  output_base <- 10
  expect_equal(rebase(input_base, digits, output_base), 0)
})

test_that("single zero", {
  digits <- c(0)
  input_base <- 10
  output_base <- 2
  expect_equal(rebase(input_base, digits, output_base), 0)
})

test_that("multiple zeros", {
  digits <- c(0, 0, 0)
  input_base <- 10
  output_base <- 2
  expect_equal(rebase(input_base, digits, output_base), 0)
})

test_that("leading zeros", {
  digits <- c(0, 6, 0)
  input_base <- 7
  output_base <- 10
  expect_equal(rebase(input_base, digits, output_base), c(4, 2))
})

test_that("input base is one", {
  digits <- c(0)
  input_base <- 1
  output_base <- 10
  expect_error(
    rebase(input_base, digits, output_base),
    "input base must be >= 2"
  )
})

test_that("input base is zero", {
  digits <- c()
  input_base <- 0
  output_base <- 10
  expect_error(
    rebase(input_base, digits, output_base),
    "input base must be >= 2"
  )
})

test_that("input base is negative", {
  digits <- c(1)
  input_base <- -2
  output_base <- 10
  expect_error(
    rebase(input_base, digits, output_base),
    "input base must be >= 2"
  )
})

test_that("negative digit", {
  digits <- c(1, -1, 1, 0, 1, 0)
  input_base <- 2
  output_base <- 10
  expect_error(
    rebase(input_base, digits, output_base),
    "all digits must satisfy 0 <= d < input base"
  )
})

test_that("invalid positive digit", {
  digits <- c(1, 2, 1, 0, 1, 0)
  input_base <- 2
  output_base <- 10
  expect_error(
    rebase(input_base, digits, output_base),
    "all digits must satisfy 0 <= d < input base"
  )
})

test_that("output base is one", {
  digits <- c(1, 0, 1, 0, 1, 0)
  input_base <- 2
  output_base <- 1
  expect_error(
    rebase(input_base, digits, output_base),
    "output base must be >= 2"
  )
})

test_that("output base is zero", {
  digits <- c(7)
  input_base <- 10
  output_base <- 0
  expect_error(
    rebase(input_base, digits, output_base),
    "output base must be >= 2"
  )
})

test_that("output base is negative", {
  digits <- c(1)
  input_base <- 2
  output_base <- -7
  expect_error(
    rebase(input_base, digits, output_base),
    "output base must be >= 2"
  )
})

test_that("both bases are negative", {
  digits <- c(1)
  input_base <- -2
  output_base <- -7
  expect_error(
    rebase(input_base, digits, output_base),
    "input base must be >= 2"
  )
})

message("All tests passed for exercise: all-your-base")
