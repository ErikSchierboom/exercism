source("./zebra-puzzle.R")
library(testthat)

test_that("Resident who drinks water", {
  expect_equal(drinks_water(), "Norwegian")
})

test_that("Resident who owns zebra", {
  expect_equal(owns_zebra(), "Japanese")
})
