source("./prime-factors.R")
library(testthat)

test_that("no factors", {
  number <- 1
  expect_equal(
    prime_factors(number),
    c()
  )
})

test_that("prime number", {
  number <- 2
  expect_equal(
    prime_factors(number),
    c(2)
  )
})

test_that("square of a prime", {
  number <- 9
  expect_equal(
    prime_factors(number),
    c(3, 3)
  )
})

test_that("cube of a prime", {
  number <- 8
  expect_equal(
    prime_factors(number),
    c(2, 2, 2)
  )
})

test_that("product of primes and non-primes", {
  number <- 12
  expect_equal(
    prime_factors(number),
    c(2, 2, 3)
  )
})

test_that("product of primes", {
  number <- 901255
  expect_equal(
    prime_factors(number),
    c(5, 17, 23, 461)
  )
})
test_that("factors include a large prime", {
  number <- 93819012551
  expect_equal(
    prime_factors(number),
    c(11, 9539, 894119)
  )
})
