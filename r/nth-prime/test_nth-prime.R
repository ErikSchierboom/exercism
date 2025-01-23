source("./nth-prime.R")
library(testthat)

test_that("First prime", {
  expect_equal(prime(1), 2)
})

test_that("Second prime", {
  expect_equal(prime(2), 3)
})

test_that("Sixth prime", {
  expect_equal(prime(6), 13)
})

test_that("Big prime", {
  expect_equal(prime(10001), 104743)
})

test_that("There is no zeroth prime", {
  expect_error(prime(0))
})
