source("./scrabble-score.R")
library(testthat)

context("scrabble score")

test_that("lowercase letter", {
  input <- "a"
  expect_equal(scrabble_score(input), 1)
})

test_that("uppercase letter", {
  input <- "A"
  expect_equal(scrabble_score(input), 1)
})

test_that("valuable letter", {
  input <- "f"
  expect_equal(scrabble_score(input), 4)
})

test_that("short word", {
  input <- "at"
  expect_equal(scrabble_score(input), 2)
})

test_that("short, valuable word", {
  input <- "zoo"
  expect_equal(scrabble_score(input), 12)
})

test_that("medium word", {
  input <- "street"
  expect_equal(scrabble_score(input), 6)
})

test_that("medium, valuable word", {
  input <- "quirky"
  expect_equal(scrabble_score(input), 22)
})

test_that("long, mixed-case word", {
  input <- "OxyphenButazone"
  expect_equal(scrabble_score(input), 41)
})

test_that("english-like word", {
  input <- "pinata"
  expect_equal(scrabble_score(input), 8)
})

test_that("empty input", {
  input <- ""
  expect_equal(scrabble_score(input), 0)
})

test_that("entire alphabet available", {
  input <- "abcdefghijklmnopqrstuvwxyz"
  expect_equal(scrabble_score(input), 87)
})

message("All tests passed for exercise: scrabble-score")
