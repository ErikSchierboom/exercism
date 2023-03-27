source("./triangle.R")
library(testthat)

context("triangle")

test_that("true if all sides are equal", {
  expect_is(triangle(2, 2, 2), "equilateral")
})

test_that("false if any side is unequal", {
  expect_false(any("equilateral" %in% class(triangle(2, 3, 2))))
})

test_that("false if no sides are equal", {
  expect_false(any("equilateral" %in% class(triangle(5, 4, 6))))
})

test_that("not equilateral if sides are zero", {
  expect_error(triangle(0, 0, 0))
})

test_that("sides may be floats", {
  expect_is(triangle(0.5, 0.5, 0.5), "equilateral")
})

test_that("isosceles if last two sides are equal", {
  expect_is(triangle(3, 4, 4), "isosceles")
})

test_that("isosceles if first two sides are equal", {
  expect_is(triangle(4, 4, 3), "isosceles")
})

test_that("isosceles if first and last sides are equal", {
  expect_is(triangle(4, 3, 4), "isosceles")
})

test_that("equilateral triangles are also isosceles", {
  expect_is(triangle(4, 4, 4), "isosceles")
})

test_that("not isosceles if no sides are equal", {
  expect_false(any("isosceles" %in% class(triangle(2, 3, 4))))
})

test_that("not isosceles if triangle inequality is violated", {
  expect_error(triangle(1, 1, 3))
})

test_that("sides may be floats", {
  expect_is(triangle(0.5, 0.4, 0.5), "isosceles")
})

test_that("scalene if no sides are equal", {
  expect_is(triangle(5, 4, 6), "scalene")
})

test_that("not scalene if all sides are equal", {
  expect_false(any("scalene" %in% class(triangle(4, 4, 4))))
})

test_that("not scalene if two sides are equal", {
  expect_false(any("scalene" %in% class(triangle(4, 4, 3))))
})

test_that("not scalene if triangle inequality is violated", {
  expect_error(triangle(7, 3, 2))
})

test_that("sides may be floats", {
  expect_is(triangle(0.5, 0.4, 0.6), "scalene")
})

message("All tests passed for exercise: triangle")
