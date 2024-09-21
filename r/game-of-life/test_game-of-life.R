source("./game-of-life.R")
library(testthat)

test_that("live cells with zero live neighbors die", {
  expect_equal(
    tick(
      matrix(
        c(0, 0, 0,
          0, 1, 0,
          0, 0, 0), 3, byrow = TRUE)),
    matrix(
      c(0, 0, 0,
        0, 0, 0,
        0, 0, 0), 3, byrow = TRUE)
  )
})

test_that("live cells with only one live neighbor die", {
  expect_equal(
    tick(
      matrix(
        c(0, 0, 0,
          0, 1, 0,
          0, 1, 0), 3, byrow = TRUE)),
    matrix(
      c(0, 0, 0,
        0, 0, 0,
        0, 0, 0), 3, byrow = TRUE)
  )
})

test_that("live cells with two live neighbors stay alive", {
  expect_equal(
    tick(
      matrix(
        c(1, 0, 1,
          1, 0, 1,
          1, 0, 1), 3, byrow = TRUE)),
    matrix(
      c(0, 0, 0,
        1, 0, 1,
        0, 0, 0), 3, byrow = TRUE)
    )
})

test_that("live cells with three live neighbors stay alive", {
  expect_equal(
    tick(
      matrix(
        c(0, 1, 0, 
          1, 0, 0, 
          1, 1, 0), 3, byrow = TRUE)),
    matrix(
      c(0, 0, 0, 
        1, 0, 0, 
        1, 1, 0), 3, byrow = TRUE)
  )
})

test_that("dead cells with three live neighbors become alive", {
  expect_equal(
    tick(
      matrix(
        c(1, 1, 0, 
          0, 0, 0, 
          1, 0, 0), 3, byrow = TRUE)),
    matrix(
      c(0, 0, 0,
        1, 1, 0,
        0, 0, 0), 3, byrow = TRUE)
  )
})

test_that("live cells with four or more neighbors die", {
  expect_equal(
    tick(
      matrix(
        c(1, 1, 1, 
          1, 1, 1, 
          1, 1, 1), 3, byrow = TRUE)),
    matrix(
      c(1, 0, 1, 
        0, 0, 0, 
        1, 0, 1), 3, byrow = TRUE)
  )
})

test_that("bigger matrix", {
  expect_equal(
    tick(
      matrix(
        c(1, 1, 0, 1, 1, 0, 0, 0, 
          1, 0, 1, 1, 0, 0, 0, 0, 
          1, 1, 1, 0, 0, 1, 1, 1, 
          0, 0, 0, 0, 0, 1, 1, 0, 
          1, 0, 0, 0, 1, 1, 0, 0, 
          1, 1, 0, 0, 0, 1, 1, 1, 
          0, 0, 1, 0, 1, 0, 0, 1, 
          1, 0, 0, 0, 0, 0, 1, 1), 8)),
    matrix(
      c(1, 1, 0, 1, 1, 0, 0, 0, 
        0, 0, 0, 0, 0, 1, 1, 0, 
        1, 0, 1, 1, 1, 1, 0, 1,
        1, 0, 0, 0, 0, 0, 0, 1, 
        1, 1, 0, 0, 1, 0, 0, 1, 
        1, 1, 0, 1, 0, 0, 0, 1,
        1, 0, 0, 0, 0, 0, 0, 0, 
        0, 0, 0, 0, 0, 0, 1, 1), 8)
  )
})
