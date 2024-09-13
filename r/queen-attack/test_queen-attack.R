source("./queen-attack.R")
library(testthat)

# Test creation of Queens with valid and invalid positions

test_that("queen with a valid position", {
  row <- 2
  col <- 2
  expect_no_error(create(row, col))
})

test_that("queen must have positive row", {
  row <- -2
  col <- 2
  expect_error(create(row, col))
})

test_that("queen must have row on board", {
  row <- 8
  col <- 4
  expect_error(create(row, col))
})

test_that("queen must have positive column", {
  row <- 2
  col <- -2
  expect_error(create(row, col))
})

test_that("queen must have column on board", {
  row <- 4
  col <- 8
  expect_error(create(row, col))
})

# Test the ability of one queen to attack another

test_that("cannot attack", {
  queen1 <- create(2, 4)
  queen2 <- create(6, 6)
  expect_equal(can_attack(queen1, queen2), FALSE)
})

test_that("can attack on same row", {
  queen1 <- create(2, 4)
  queen2 <- create(2, 6)
  expect_equal(can_attack(queen1, queen2), TRUE)
})

test_that("can attack on same column", {
  queen1 <- create(4, 5)
  queen2 <- create(2, 5)
  expect_equal(can_attack(queen1, queen2), TRUE)
})

test_that("can attack on first diagonal", {
  queen1 <- create(2, 2)
  queen2 <- create(0, 4)
  expect_equal(can_attack(queen1, queen2), TRUE)
})

test_that("can attack on second diagonal", {
  queen1 <- create(2, 2)
  queen2 <- create(3, 1)
  expect_equal(can_attack(queen1, queen2), TRUE)
})

test_that("can attack on third diagonal", {
  queen1 <- create(2, 2)
  queen2 <- create(1, 1)
  expect_equal(can_attack(queen1, queen2), TRUE)
})

test_that("can attack on fourth diagonal", {
  queen1 <- create(1, 7)
  queen2 <- create(0, 6)
  expect_equal(can_attack(queen1, queen2), TRUE)
})

# cannot attack if falling diagonals are only the same when reflected
# across the longest falling diagonal
test_that("cannot attack", {
  queen1 <- create(4, 1)
  queen2 <- create(2, 5)
  expect_equal(can_attack(queen1, queen2), FALSE)
})
