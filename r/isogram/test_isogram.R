source("./isogram.R")
library(testthat)

context("isogram")

test_that("empty string", {
  word <- ""
  expect_equal(is_isogram(word), TRUE)
})

test_that("isogram with only lower case characters", {
  word <- "isogram"
  expect_equal(is_isogram(word), TRUE)
})

test_that("word with one duplicated character", {
  word <- "eleven"
  expect_equal(is_isogram(word), FALSE)
})

test_that("longest reported english isogram", {
  word <- "subdermatoglyphic"
  expect_equal(is_isogram(word), TRUE)
})

test_that("word with duplicated character in mixed case", {
  word <- "Alphabet"
  expect_equal(is_isogram(word), FALSE)
})

test_that("hypothetical isogrammic word with hyphen", {
  word <- "thumbscrew-japingly"
  expect_equal(is_isogram(word), TRUE)
})

test_that("isogram with duplicated non letter character", {
  word <- "Hjelmqvist-Gryb-Zock-Pfund-Wax"
  expect_equal(is_isogram(word), TRUE)
})

test_that("made-up name that is an isogram", {
  word <- "Emily Jung Schwartzkopf"
  expect_equal(is_isogram(word), TRUE)
})

message("All tests passed for exercise: isogram")
