source("./high-scores.R")
library(testthat)

test_that("list of scores", {
  scores <- c(30, 50, 20, 70)
  expected <- c(30, 50, 20, 70)
  expect_equal(scores_list(scores), expected)
})

test_that("latest score", {
  scores <- c(100, 0, 90, 30)
  expected <- 30
  expect_equal(latest(scores), expected)
})

test_that("personal best", {
  scores <- c(40, 100, 70)
  expected <- 100
  expect_equal(personal_best(scores), expected)
})

test_that("personal top three from a list of scores", {
  scores <- c(10, 30, 90, 30, 100, 20, 10, 0, 30, 40, 40, 70, 70)
  expected <- c(100, 90, 70)
  expect_equal(personal_top_three(scores), expected)
})

test_that("personal top highest to lowest", {
  scores <- c(20, 10, 30)
  expected <- c(30, 20, 10)
  expect_equal(personal_top_three(scores), expected)
})

test_that("personal top when there is a tie", {
  scores <- c(40, 20, 40, 30)
  expected <- c(40, 40, 30)
  expect_equal(personal_top_three(scores), expected)
})

test_that("personal top when there are less than 3", {
  scores <- c(30, 70)
  expected <- c(70, 30)
  expect_equal(personal_top_three(scores), expected)
})

test_that("personal top when there is only one", {
  scores <- c(40)
  expected <- c(40)
  expect_equal(personal_top_three(scores), expected)
})

test_that("latest score after personal top scores", {
  scores <- c(70, 50, 20, 30)
  expected <- 30
  personal_top_three(scores)
  expect_equal(latest(scores), expected)
})

test_that("scores after personal top scores", {
  scores <- c(30, 50, 20, 70)
  expected <- c(30, 50, 20, 70)
  personal_top_three(scores)
  expect_equal(scores_list(scores), expected)
})

test_that("latest score after personal best", {
  scores <- c(20, 70, 15, 25, 30)
  expected <- 30
  personal_best(scores)
  expect_equal(latest(scores), expected)
})

test_that("scores after personal best", {
  scores <- c(20, 70, 15, 25, 30)
  expected <- c(20, 70, 15, 25, 30)
  personal_best(scores)
  expect_equal(scores_list(scores), expected)
})
