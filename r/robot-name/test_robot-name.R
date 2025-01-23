source("./robot-name.R")
library(testthat)

test_that("Robot has a class", {
  robot <- new_robot()
  expect_s3_class(robot, "robot")
})

test_that("Robot has a name", {
  robot <- new_robot()
  expect_match(robot$name, "^[A-Z]{2}\\d{3}$")
})

test_that("Name is the same each time", {
  robot <- new_robot()
  expect_equal(robot$name, robot$name)
})

test_that("Two different robots have different names", {
  robot1 <- new_robot()
  robot2 <- new_robot()
  expect_true(robot1$name != robot2$name)
})

test_that("Can reset the name", {
  robot <- new_robot()
  reset_robot <- reset_robot(robot)
  expect_true(robot$name != reset_robot$name)
})
