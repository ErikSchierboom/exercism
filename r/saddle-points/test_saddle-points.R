source("./saddle-points.R")
library(testthat)

test_that("Can identify single saddle point", {
  expect_equal(
    saddle_point(
      matrix(c(9, 8, 7, 5, 3, 2, 6, 6, 7), ncol = 3, nrow = 3, byrow = TRUE)
    ),
    data.frame(row = 2, col = 1)
  )
})

test_that("Can identify that empty matrix has no saddle points", {
  expect_equal(
    saddle_point(
      matrix(nrow = 0, ncol = 0)
    ),
    data.frame(row = numeric(), col = numeric())
  )
})

test_that("Can identify lack of saddle points when there are none", {
  expect_equal(
    saddle_point(
      matrix(c(1, 2, 3, 3, 1, 2, 2, 3, 1), nrow = 3, ncol = 3, byrow = TRUE)
    ),
    data.frame(row = numeric(), col = numeric())
  )
})

test_that("Can identify multiple saddle points in a column", {
  expect_equal(
    saddle_point(
      matrix(c(4, 5, 4, 3, 5, 5, 1, 5, 4), nrow = 3, ncol = 3, byrow = TRUE)
    ),
    data.frame(row = 1:3, col = 2)
  )
})

test_that("Can identify multiple saddle points in a row", {
  expect_equal(
    saddle_point(
      matrix(c(6, 7, 8, 5, 5, 5, 7, 5, 6), nrow = 3, ncol = 3, byrow = TRUE)
    ),
    data.frame(row = 2, col = 1:3)
  )
})

test_that("Can identify saddle point in bottom right corner", {
  expect_equal(
    saddle_point(
      matrix(c(8, 7, 9, 6, 7, 6, 3, 2, 5), nrow = 3, ncol = 3, byrow = TRUE)
    ),
    data.frame(row = 3, col = 3)
  )
})

test_that("Can identify saddle points in a non square matrix", {
  expect_equal(
    saddle_point(
      matrix(c(3, 1, 3, 3, 2, 4), nrow = 2, ncol = 3, byrow = TRUE)
    ),
    data.frame(row = 1, col = c(1, 3))
  )
})

test_that("Can identify that saddle points in a single column matrix are those
          with the minimum value", {
  expect_equal(
    saddle_point(
      matrix(c(2, 1, 4, 1), nrow = 4, ncol = 1)
    ),
    data.frame(row = c(2, 4), col = 1)
  )
})

test_that("Can identify that saddle points in a single row matrix are those
          with the maximum value", {
  expect_equal(
    saddle_point(
      matrix(c(2, 5, 3, 5), nrow = 1, ncol = 4, byrow = TRUE)
    ),
    data.frame(row = 1, col = c(2, 4))
  )
})
