source("./hello-world.R")
library(testthat)

context("hello world")

test_that("no name", {
  expect_equal(hello_world(), "Hello, World!")
})

message("All tests passed for exercise: hello-world")
