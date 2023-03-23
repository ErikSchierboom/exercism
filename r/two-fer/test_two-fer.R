source("./two-fer.R")
library(testthat)

context("two-fer")

test_that("No name given", {
  expect_equal(two_fer(), "One for you, one for me.")
})

test_that("A name given", {
  expect_equal(two_fer("Alice"), "One for Alice, one for me.")
})

test_that("Another name given", {
  expect_equal(two_fer("Bob"), "One for Bob, one for me.")
})

message("All tests passed for exercise: two-fer")
