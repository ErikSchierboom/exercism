source("./vehicle-purchase.R")
library(testthat)

# needs_license

test_that("requires a license for a car", {
  expect_equal(needs_license("car"), TRUE)
})

test_that("requires a license for a truck", {
  expect_equal(needs_license("truck"), TRUE)
})

test_that("requires a license for a bike", {
  expect_equal(needs_license("bike"), FALSE)
})

test_that("requires a license for a stroller", {
  expect_equal(needs_license("stroller"), FALSE)
})

test_that("requires a license for an e-scooter", {
  expect_equal(needs_license("e-scooter"), FALSE)
})

# choose_vehicle

test_that("correctly recommends the first option", {
  expect_equal(
    choose_vehicle("Bugatti Veyron", "Ford Pinto"),
    "Bugatti Veyron"
  )
})

test_that("correctly recommends the first option", {
  expect_equal(
    choose_vehicle("Chery EQ", "Kia Niro Elektro"),
    "Chery EQ"
  )
})

test_that("correctly recommends the second option", {
  expect_equal(
    choose_vehicle("Ford Pinto", "Bugatti Veyron"),
    "Bugatti Veyron"
  )
})

test_that("correctly recommends the second option", {
  expect_equal(
    choose_vehicle("2020 Gazelle Medeo", "2018 Bergamont City"),
    "2018 Bergamont City"
  )
})

# calculate_resale_price

test_that("price is reduced to 80% for age below 3", {
  expect_equal(calculate_resale_price(40000, 2), 32000)
})

test_that("price is reduced to 80% for age below 3", {
  expect_equal(calculate_resale_price(40000, 2.5), 32000)
})

test_that("price is reduced to 50% for age above 10", {
  expect_equal(calculate_resale_price(40000, 12), 20000)
})

test_that("price is reduced to 70% for between 3 and 10", {
  expect_equal(calculate_resale_price(25000, 7), 17500)
})

test_that("works correctly for threshold age 3", {
  expect_equal(calculate_resale_price(40000, 3), 28000)
})

test_that("works correctly for threshold age 10", {
  expect_equal(calculate_resale_price(25000, 10), 17500)
})
