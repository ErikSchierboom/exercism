source("./gigasecond.R")
library(testthat)

test_that("Date only specification of time", {
  expect_equal(
    add_gigasecond(ISOdate(2011, 4, 25)),
    ISOdate(2043, 1, 1, 13, 46, 40)
  )
})

test_that("Second test for date only specification of time", {
  expect_equal(
    add_gigasecond(ISOdate(1977, 6, 13)),
    ISOdate(2009, 2, 19, 13, 46, 40)
  )
})

test_that("Third test for date only specification of time", {
  expect_equal(
    add_gigasecond(ISOdate(1959, 7, 19)),
    ISOdate(1991, 3, 27, 13, 46, 40)
  )
})

test_that("Full time specified", {
  expect_equal(
    add_gigasecond(ISOdate(2015, 1, 24, 22, 0, 0)),
    ISOdate(2046, 10, 2, 23, 46, 40)
  )
})

test_that("Full time with day roll-over", {
  expect_equal(
    add_gigasecond(ISOdate(2015, 1, 24, 23, 59, 59)),
    ISOdate(2046, 10, 3, 1, 46, 39)
  )
})
