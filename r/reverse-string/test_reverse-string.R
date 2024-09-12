source("./reverse-string.R")
library(testthat)

test_that("an empty string", {
  expect_equal(reverse(""), "")
})

test_that("a word", {
  expect_equal(reverse("robot"), "tobor")
})

test_that("a capitalized word", {
  expect_equal(reverse("Ramen"), "nemaR")
})

test_that("a sentence with punctuation", {
  expect_equal(reverse("I'm hungry!"), "!yrgnuh m'I")
})

test_that("a palindrome", {
  expect_equal(reverse("racecar"), "racecar")
})

test_that("an even-sized word", {
  expect_equal(reverse("drawer"), "reward")
})

