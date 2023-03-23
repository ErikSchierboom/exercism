source("./raindrops.R")
library(testthat)

context("raindrops")

test_that("the sound for 1 is 1", {
  number <- 1
  expect_equal(raindrops(number), "1")
})

test_that("the sound for 3 is Pling", {
  number <- 3
  expect_equal(raindrops(number), "Pling")
})

test_that("the sound for 5 is Plang", {
  number <- 5
  expect_equal(raindrops(number), "Plang")
})

test_that("the sound for 7 is Plong", {
  number <- 7
  expect_equal(raindrops(number), "Plong")
})

test_that("the sound for 6 is Pling as it has a factor 3", {
  number <- 6
  expect_equal(raindrops(number), "Pling")
})

test_that("2 to the power 3 does not make a raindrop sound as 3 is the exponent 
          not the base", {
  number <- 8
  expect_equal(raindrops(number), "8")
})

test_that("the sound for 9 is Pling as it has a factor 3", {
  number <- 9
  expect_equal(raindrops(number), "Pling")
})

test_that("the sound for 10 is Plang as it has a factor 5", {
  number <- 10
  expect_equal(raindrops(number), "Plang")
})

test_that("the sound for 14 is Plong as it has a factor of 7", {
  number <- 14
  expect_equal(raindrops(number), "Plong")
})

test_that("the sound for 15 is PlingPlang as it has factors 3 and 5", {
  number <- 15
  expect_equal(raindrops(number), "PlingPlang")
})

test_that("the sound for 21 is PlingPlong as it has factors 3 and 7", {
  number <- 21
  expect_equal(raindrops(number), "PlingPlong")
})

test_that("the sound for 25 is Plang as it has a factor 5", {
  number <- 25
  expect_equal(raindrops(number), "Plang")
})

test_that("the sound for 27 is Pling as it has a factor 3", {
  number <- 27
  expect_equal(raindrops(number), "Pling")
})

test_that("the sound for 35 is PlangPlong as it has factors 5 and 7", {
  number <- 35
  expect_equal(raindrops(number), "PlangPlong")
})

test_that("the sound for 49 is Plong as it has a factor 7", {
  number <- 49
  expect_equal(raindrops(number), "Plong")
})

test_that("the sound for 52 is 52", {
  number <- 52
  expect_equal(raindrops(number), "52")
})

test_that("the sound for 105 is PlingPlangPlong as it has factors 3, 5 and 7", {
  number <- 105
  expect_equal(raindrops(number), "PlingPlangPlong")
})

test_that("the sound for 3125 is Plang as it has a factor 5", {
  number <- 3125
  expect_equal(raindrops(number), "Plang")
})

message("All tests passed for exercise: raindrops")
