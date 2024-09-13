source("./robot-simulator.R")
library(testthat)

test_that("Create robot -> class robot",
          {
            robbo <- new_robot(c(0, 0), "SOUTH")
            expect_s3_class(robbo, "robot")
          }
)
test_that("Create robot -> at origin facing north",
          {
            robbo <- new_robot(c(0, 0), "NORTH")
            expect_equal(robbo$coordinates, c(0, 0))
            expect_equal(robbo$direction, "NORTH")
          }
)
test_that("Create robot -> at negative position facing south",
          {
            robbo <- new_robot(c(-1, -1), "SOUTH")    
            expect_equal(robbo$coordinates, c(-1, -1))
            expect_equal(robbo$direction, "SOUTH")
          }
)
test_that("Rotating clockwise -> changes north to east",
          {
            robbo <- new_robot(c(0, 0), "NORTH")
            robbo <- move(robbo, "R")
            expect_equal(robbo$coordinates, c(0, 0))
            expect_equal(robbo$direction, "EAST")
          }
)

test_that("Rotating clockwise -> changes east to south",
          {
            robbo <- new_robot(c(0, 0), "EAST")
            robbo <- move(robbo, "R")
            expect_equal(robbo$coordinates, c(0, 0))
            expect_equal(robbo$direction, "SOUTH")
          }
)

test_that("Rotating clockwise -> changes south to west",
          {
            robbo <- new_robot(c(0, 0), "SOUTH")
            robbo <- move(robbo, "R")
            expect_equal(robbo$coordinates, c(0, 0))
            expect_equal(robbo$direction, "WEST")
          }
)

test_that("Rotating clockwise -> changes west to north",
          {
            robbo <- new_robot(c(0, 0), "WEST")
            robbo <- move(robbo, "R")
            expect_equal(robbo$coordinates, c(0, 0))
            expect_equal(robbo$direction, "NORTH")
          }
)

test_that("Rotating counter-clockwise -> changes north to west",
          {
            robbo <- new_robot(c(0, 0), "NORTH")
            robbo <- move(robbo, "L")
            expect_equal(robbo$coordinates, c(0, 0))
            expect_equal(robbo$direction, "WEST")
          }
)

test_that("Rotating counter-clockwise -> changes west to south",
          {
            robbo <- new_robot(c(0, 0), "WEST")
            robbo <- move(robbo, "L")
            expect_equal(robbo$coordinates, c(0, 0))
            expect_equal(robbo$direction, "SOUTH")
          }
)

test_that("Rotating counter-clockwise -> changes south to east",
          {
            robbo <- new_robot(c(0, 0), "SOUTH")
            robbo <- move(robbo, "L")
            expect_equal(robbo$coordinates, c(0, 0))
            expect_equal(robbo$direction, "EAST")
          }
)

test_that("Rotating counter-clockwise -> changes east to north",
          {
            robbo <- new_robot(c(0, 0), "EAST")
            robbo <- move(robbo, "L")
            expect_equal(robbo$coordinates, c(0, 0))
            expect_equal(robbo$direction, "NORTH")
          }
)

test_that("Moving forward one -> facing north increments Y",
          {
            robbo <- new_robot(c(0, 0), "NORTH")
            robbo <- move(robbo, "A")
            expect_equal(robbo$coordinates, c(0, 1))
            expect_equal(robbo$direction, "NORTH")
          }
)

test_that("Moving forward one -> facing south decrements Y",
          {
            robbo <- new_robot(c(0, 0), "SOUTH")
            robbo <- move(robbo, "A")
            expect_equal(robbo$coordinates, c(0, -1))
            expect_equal(robbo$direction, "SOUTH")
          }
)

test_that("Moving forward one -> facing east increments X",
          {
            robbo <- new_robot(c(0, 0), "EAST")
            robbo <- move(robbo, "A")
            expect_equal(robbo$coordinates, c(1, 0))
            expect_equal(robbo$direction, "EAST")
          }
)

test_that("Moving forward one -> facing west decrements X",
          {
            robbo <- new_robot(c(0, 0), "WEST")
            robbo <- move(robbo, "A")
            expect_equal(robbo$coordinates, c(-1, 0))
            expect_equal(robbo$direction, "WEST")
          }
)

test_that("Follow series of instructions -> moving east and north from README",
          {
            robbo <- new_robot(c(7, 3), "NORTH")
            robbo <- move(robbo, "RAALAL")
            expect_equal(robbo$coordinates, c(9, 4))
            expect_equal(robbo$direction, "WEST")
          }
)

test_that("Follow series of instructions -> moving west and north",
          {
            robbo <- new_robot(c(0, 0), "NORTH")
            robbo <- move(robbo, "LAAARALA")
            expect_equal(robbo$coordinates, c(-4, 1))
            expect_equal(robbo$direction, "WEST")
          }
)

test_that("Follow series of instructions -> moving west and south",
          {
            robbo <- new_robot(c(2, -7), "EAST")
            robbo <- move(robbo, "RRAAAAALA")
            expect_equal(robbo$coordinates, c(-3, -8))
            expect_equal(robbo$direction, "SOUTH")
          }
)

test_that("Follow series of instructions -> moving east and north",
          {
            robbo <- new_robot(c(8, 4), "SOUTH")
            robbo <- move(robbo, "LAAARRRALLLL")
            expect_equal(robbo$coordinates, c(11, 5))
            expect_equal(robbo$direction, "NORTH")
          }
)

