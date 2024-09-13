source("./space-age.R")
library(testthat)

test_that("Age on Earth", {
  seconds <- 1000000000
  expect_equal(space_age(seconds, "earth"), 31.69)
})

test_that("Age on Mercury", {
  seconds <- 2134835688
  expect_equal(space_age(seconds, "mercury"), 280.88)
})

test_that("Age on Venus", {
  seconds <- 189839836
  expect_equal(space_age(seconds, "venus"), 9.78)
})

test_that("Age on Mars", {
  seconds <- 2329871239
  expect_equal(space_age(seconds, "mars"), 39.25)
})

test_that("Age on Jupiter", {
  seconds <- 901876382
  expect_equal(space_age(seconds, "jupiter"), 2.41)
})

test_that("Age on Saturn", {
  seconds <- 3000000000
  expect_equal(space_age(seconds, "saturn"), 3.23)
})

test_that("Age on Uranus", {
  seconds <- 3210123456
  expect_equal(space_age(seconds, "uranus"), 1.21)
})

test_that("Age on Neptune", {
  seconds <- 8210123456
  expect_equal(space_age(seconds, "neptune"), 1.58)
})
