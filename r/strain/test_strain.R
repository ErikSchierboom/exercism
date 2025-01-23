source("./strain.R")
library(testthat)

test_that("Empty keep", {
  input <- c()
  expected <- c()
  expect_equal(keep(input, \(x) x < 10), expected)
})

test_that("Keep everything", {
  input <- c(1, 2, 3)
  expected <- c(1, 2, 3)
  expect_equal(keep(input, \(x) x < 10), expected)
})

test_that("Keep first and last", {
  input <- c(1, 2, 3)
  expected <- c(1, 3)
  expect_equal(keep(input, \(x) x %% 2 != 0), expected)
})

test_that("Keep neither first nor last", {
  input <- c(1, 2, 3, 4, 5)
  expected <- c(2, 4)
  expect_equal(keep(input, \(x) x %% 2 == 0), expected)
})

test_that("Keep strings", {
  input <- c("apple", "zebra", "banana", "zombies", "cherimoya", "zelot")
  expected <- c("zebra", "zombies", "zelot")
  expect_equal(keep(input, \(x) substr(x, 1, 1) == "z"), expected)
})

test_that("Keep list of vectors", {
  input <- list(
    c(1, 2, 3),
    c(5, 5, 5),
    c(5, 1, 2),
    c(2, 1, 2),
    c(1, 5, 2),
    c(2, 2, 1),
    c(1, 2, 5)
  )
  expected <- list(c(5, 5, 5), c(5, 1, 2), c(1, 5, 2), c(1, 2, 5))
  expect_equal(keep(input, \(x) 5 %in% x), expected)
})

test_that("Empty discard", {
  input <- c()
  expected <- c()
  expect_equal(discard(input, \(x) x < 10), expected)
})

test_that("Discard nothing", {
  input <- c(1, 2, 3)
  expected <- c(1, 2, 3)
  expect_equal(discard(input, \(x) x > 10), expected)
})

test_that("Discard first and last", {
  input <- c(1, 2, 3)
  expected <- c(2)
  expect_equal(discard(input, \(x) x %% 2 != 0), expected)
})

test_that("Discard neither first nor last", {
  input <- c(1, 2, 3, 4, 5)
  expected <- c(1, 3, 5)
  expect_equal(discard(input, \(x) x %% 2 == 0), expected)
})

test_that("Discard strings", {
  input <- c("apple", "zebra", "banana", "zombies", "cherimoya", "zelot")
  expected <- c("apple", "banana", "cherimoya")
  expect_equal(discard(input, \(x) substr(x, 1, 1) == "z"), expected)
})

test_that("Discard list of vectors", {
  input <- list(
    c(1, 2, 3),
    c(5, 5, 5),
    c(5, 1, 2),
    c(2, 1, 2),
    c(1, 5, 2),
    c(2, 2, 1),
    c(1, 2, 5)
  )
  expected <- list(c(1, 2, 3), c(2, 1, 2), c(2, 2, 1))
  expect_equal(discard(input, \(x) 5 %in% x), expected)
})
