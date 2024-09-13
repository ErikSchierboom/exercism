source("./secret-handshake.R")
library(testthat)

test_that("wink for 1", {
  expect_equal(handshake(1), c("wink"))
})

test_that("double blink for 10", {
  expect_equal(handshake(2), c("double blink"))
})

test_that("close your eyes for 100", {
  expect_equal(handshake(4), c("close your eyes"))
})

test_that("jump for 1000", {
  expect_equal(handshake(8), c("jump"))
})

test_that("combine two actions", {
  expect_equal(handshake(3), c("wink", "double blink"))
})

test_that("reverse two actions", {
  expect_equal(handshake(19), c("double blink", "wink"))
})

test_that("reversing one action gives the same action", {
  expect_equal(handshake(24), c("jump"))
})

test_that("reversing no actions still gives no actions", {
  expect_equal(handshake(16), c())
})

test_that("all possible actions", {
  expect_equal(
    handshake(15),
    c("wink", "double blink", "close your eyes", "jump")
  )
})

test_that("reverse all possible actions", {
  expect_equal(
    handshake(31),
    c("jump", "close your eyes", "double blink", "wink")
  )
})

test_that("do nothing for zero", {
  expect_equal(handshake(0), c())
})

test_that("do nothing if lower 5 bits not set", {
  expect_equal(handshake(32), c())
})
