source("./rotational-cipher.R")
library(testthat)

context("rotational cipher")

test_that("rotate a by 1", {
  text <- "a"
  key <- 1
  expect_equal(rotate(text, key), "b")
})

test_that("rotate a by 26, same output as input", {
  text <- "a"
  key <- 26
  expect_equal(rotate(text, key), "a")
})

test_that("rotate a by 0, same output as input", {
  text <- "a"
  key <- 0
  expect_equal(rotate(text, key), "a")
})

test_that("rotate m by 13", {
  text <- "m"
  key <- 13
  expect_equal(rotate(text, key), "z")
})

test_that("rotate n by 13 with wrap around alphabet", {
  text <- "n"
  key <- 13
  expect_equal(rotate(text, key), "a")
})

test_that("rotate capital letters", {
  text <- "OMG"
  key <- 5
  expect_equal(rotate(text, key), "TRL")
})

test_that("rotate spaces", {
  text <- "O M G"
  key <- 5
  expect_equal(rotate(text, key), "T R L")
})

test_that("rotate numbers", {
  text <- "Testing 1 2 3 testing"
  key <- 4
  expect_equal(rotate(text, key), "Xiwxmrk 1 2 3 xiwxmrk")
})

test_that("rotate punctuation", {
  text <- "Let's eat, Grandma!"
  key <- 21
  expect_equal(rotate(text, key), "Gzo'n zvo, Bmviyhv!")
})

test_that("rotate all letters", {
  text <- "The quick brown fox jumps over the lazy dog."
  key <- 13
  expect_equal(rotate(text, key), 
               "Gur dhvpx oebja sbk whzcf bire gur ynml qbt.")
})

message("All tests passed for exercise: rotational-cipher")
