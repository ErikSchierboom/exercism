source("./resistor-color.R")
library(testthat)

test_that("Colors", {
  expected <- c("black", "brown", "red", "orange", "yellow", "green", "blue", "violet", "grey", "white") # nolint
  expect_equal(colors, expected)
})

test_that("Black", {
  expect_equal(color_code("black"), 0)
})

test_that("White", {
  expect_equal(color_code("white"), 9)
})

test_that("Orange", {
  expect_equal(color_code("orange"), 3)
})
