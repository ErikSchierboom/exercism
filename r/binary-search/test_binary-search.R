source("./binary-search.R")
library(testthat)

test_that("Finds a needle in an haystack with one element", {
  haystack <- c(6)
  needle <- 6
  expect_equal(find(haystack, needle), 1)
})

test_that("Finds a needle in the middle of an haystack", {
  haystack <- c(1, 3, 4, 6, 8, 9, 11)
  needle <- 6
  expect_equal(find(haystack, needle), 4)
})

test_that("Finds a needle at the beginning of an haystack", {
  haystack <- c(1, 3, 4, 6, 8, 9, 11)
  needle <- 1
  expect_equal(find(haystack, needle), 1)
})

test_that("Finds a needle at the end of an haystack", {
  haystack <- c(1, 3, 4, 6, 8, 9, 11)
  needle <- 11
  expect_equal(find(haystack, needle), 7)
})

test_that("Finds a needle in an haystack of odd length", {
  haystack <- c(1, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233, 377, 634)
  needle <- 144
  expect_equal(find(haystack, needle), 10)
})

test_that("Finds a needle in an haystack of even length", {
  haystack <- c(1, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233, 377)
  needle <- 21
  expect_equal(find(haystack, needle), 6)
})

test_that("Identifies that a needle is not included in the haystack", {
  haystack <- c(1, 3, 4, 6, 8, 9, 11)
  needle <- 7
  expect_equal(find(haystack, needle), -1)
})

test_that("A needle smaller than the haystack's smallest needle is not found", {
  haystack <- c(1, 3, 4, 6, 8, 9, 11)
  needle <- 0
  expect_equal(find(haystack, needle), -1)
})

test_that("A needle larger than the haystack's largest needle is not found", {
  haystack <- c(1, 3, 4, 6, 8, 9, 11)
  needle <- 13
  expect_equal(find(haystack, needle), -1)
})

test_that("Nothing is found in an empty haystack", {
  haystack <- c()
  needle <- 1
  expected <- -1
  expect_equal(find(haystack, needle), -1)
})

test_that("Nothing is found when the left and right bounds cross", {
  haystack <- c(1, 2)
  needle <- 0
  expect_equal(find(haystack, needle), -1)
})
