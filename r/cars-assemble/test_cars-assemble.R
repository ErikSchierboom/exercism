source("./cars-assemble.R")
library(testthat)

# 1) success_rate

test_that("Success rate for speed zero", {
  speed <- 0
  expect_equal(success_rate(speed), 0.0, tolerance = 0.001)
})

test_that("Success rate for speed one", {
  speed <- 1
  expect_equal(success_rate(speed), 1.0, tolerance = 0.001)
})

test_that("Success rate for speed four", {
  speed <- 4
  expect_equal(success_rate(speed), 1.0, tolerance = 0.001)
})

test_that("Success rate for speed five", {
  speed <- 5
  expect_equal(success_rate(speed), 0.9, tolerance = 0.001)
})

test_that("Success rate for speed nine", {
  speed <- 9
  expect_equal(success_rate(speed), 0.8, tolerance = 0.001)
})

test_that("Success rate for speed ten", {
  speed <- 10
  expect_equal(success_rate(speed), 0.77, tolerance = 0.001)
})

# 2) production_rate_per_hour

test_that("Production rate per hour for speed zero", {
  speed <- 0
  expect_equal(production_rate_per_hour(speed), 0.0, tolerance = 0.001)
})

test_that("Production rate per hour for speed one", {
  speed <- 1
  expect_equal(production_rate_per_hour(speed), 221.0, tolerance = 0.001)
})

test_that("Production rate per hour for speed four", {
  speed <- 4
  expect_equal(production_rate_per_hour(speed), 884.0, tolerance = 0.001)
})

test_that("Production rate per hour for speed seven", {
  speed <- 7
  expect_equal(production_rate_per_hour(speed), 1392.3, tolerance = 0.001)
})

test_that("Production rate per hour for speed nine", {
  speed <- 9
  expect_equal(production_rate_per_hour(speed), 1591.2, tolerance = 0.001)
})

test_that("Production rate per hour for speed ten", {
  speed <- 10
  expect_equal(production_rate_per_hour(speed), 1701.7, tolerance = 0.001)
})

# working_items_per_minute

test_that("Working items per minute for speed zero", {
  speed <- 0
  expect_equal(working_items_per_minute(speed), 0)
})

test_that("Working items per minute for speed one", {
  speed <- 1
  expect_equal(working_items_per_minute(speed), 3)
})

test_that("Working items per minute for speed five", {
  speed <- 5
  expect_equal(working_items_per_minute(speed), 16)
})

test_that("Working items per minute for speed eight", {
  speed <- 8
  expect_equal(working_items_per_minute(speed), 26)
})

test_that("Working items per minute for speed nine", {
  speed <- 9
  expect_equal(working_items_per_minute(speed), 26)
})

test_that("Working items per minute for speed ten", {
  speed <- 10
  expect_equal(working_items_per_minute(speed), 28)
})
