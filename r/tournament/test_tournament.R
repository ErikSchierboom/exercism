source("./tournament.R")
library(testthat)

context("tournament")

options(stringsAsFactors = FALSE)

test_that("typical input", {
  input <- c(
    "Allegoric Alaskans;Blithering Badgers;win",
    "Devastating Donkeys;Courageous Californians;draw",
    "Devastating Donkeys;Allegoric Alaskans;win",
    "Courageous Californians;Blithering Badgers;loss",
    "Blithering Badgers;Devastating Donkeys;loss",
    "Allegoric Alaskans;Courageous Californians;win"
  )
  expect_equal(tournament(input),
               data.frame(
                 Team = c(
                   "Devastating Donkeys",
                   "Allegoric Alaskans",
                   "Blithering Badgers",
                   "Courageous Californians"
                 ),
                 MP = c(3, 3, 3, 3),
                 W = c(2, 2, 1, 0),
                 D = c(1, 0, 0, 1),
                 L = c(0, 1, 2, 2),
                 P = c(7, 6, 3, 1)
               ))
})

test_that("incomplete competition (not all pairs have played)", {
  input <- c(
    "Allegoric Alaskans;Blithering Badgers;loss",
    "Devastating Donkeys;Allegoric Alaskans;loss",
    "Courageous Californians;Blithering Badgers;draw",
    "Allegoric Alaskans;Courageous Californians;win"
  )
  expect_equal(tournament(input),
               data.frame(
                 Team = c(
                   "Allegoric Alaskans",
                   "Blithering Badgers",
                   "Courageous Californians",
                   "Devastating Donkeys"
                 ),
                 MP = c(3, 2, 2, 1),
                 W = c(2, 1, 0, 0),
                 D = c(0, 1, 1, 0),
                 L = c(1, 0, 1, 1),
                 P = c(6, 4, 1, 0)
               ))
})

test_that("ties broken alphabetically", {
  input <- c(
    "Courageous Californians;Devastating Donkeys;win",
    "Allegoric Alaskans;Blithering Badgers;win",
    "Devastating Donkeys;Allegoric Alaskans;loss",
    "Courageous Californians;Blithering Badgers;win",
    "Blithering Badgers;Devastating Donkeys;draw",
    "Allegoric Alaskans;Courageous Californians;draw"
  )
  expect_equal(tournament(input),
               data.frame(
                 Team = c(
                   "Allegoric Alaskans",
                   "Courageous Californians",
                   "Blithering Badgers",
                   "Devastating Donkeys"
                 ),
                 MP = c(3, 3, 3, 3),
                 W = c(2, 2, 0, 0),
                 D = c(1, 1, 1, 1),
                 L = c(0, 0, 2, 2),
                 P = c(7, 7, 1, 1)
               ))
})

test_that("an empty line", {
  input <- c(
    "Allegoric Alaskans;Blithering Badgers;loss",
    "Devastating Donkeys;Allegoric Alaskans;loss",
    "",
    "Courageous Californians;Blithering Badgers;draw",
    "Allegoric Alaskans;Courageous Californians;win"
  )
  expect_equal(tournament(input),
               data.frame(
                 Team = c(
                   "Allegoric Alaskans",
                   "Blithering Badgers",
                   "Courageous Californians",
                   "Devastating Donkeys"
                 ),
                 MP = c(3, 2, 2, 1),
                 W = c(2, 1, 0, 0),
                 D = c(0, 1, 1, 0),
                 L = c(1, 0, 1, 1),
                 P = c(6, 4, 1, 0)
               ))
})

test_that("wrong separator used", {
  input <- c(
    "Allegoric Alaskans;Blithering Badgers;loss",
    "Devastating Donkeys;Allegoric Alaskans;loss",
    "Courageous Californians;Blithering Badgers;draw",
    "Devastating Donkeys@Courageous Californians;draw",
    "Allegoric Alaskans;Courageous Californians;win"
  )
  expect_equal(tournament(input),
               data.frame(
                 Team = c(
                   "Allegoric Alaskans",
                   "Blithering Badgers",
                   "Courageous Californians",
                   "Devastating Donkeys"
                 ),
                 MP = c(3, 2, 2, 1),
                 W = c(2, 1, 0, 0),
                 D = c(0, 1, 1, 0),
                 L = c(1, 0, 1, 1),
                 P = c(6, 4, 1, 0)
               ))
})

test_that("too many separators", {
  input <- c(
    "Allegoric Alaskans;Blithering Badgers;loss",
    "Devastating Donkeys;Courageous Californians;draw;5",
    "Devastating Donkeys;Allegoric Alaskans;loss",
    "Courageous Californians;Blithering Badgers;draw",
    "Allegoric Alaskans;Courageous Californians;win"
  )
  expect_equal(tournament(input),
               data.frame(
                 Team = c(
                   "Allegoric Alaskans",
                   "Blithering Badgers",
                   "Courageous Californians",
                   "Devastating Donkeys"
                 ),
                 MP = c(3, 2, 2, 1),
                 W = c(2, 1, 0, 0),
                 D = c(0, 1, 1, 0),
                 L = c(1, 0, 1, 1),
                 P = c(6, 4, 1, 0)
               ))
})

test_that("invalid match result", {
  input <- c(
    "Allegoric Alaskans;Blithering Badgers;loss",
    "Devastating Donkeys;Allegoric Alaskans;loss",
    "Courageous Californians;Blithering Badgers;draw",
    "Allegoric Alaskans;Courageous Californians;win",
    "Devastating Donkeys;Allegoric Alaskans;dra"
  )
  expect_equal(tournament(input),
               data.frame(
                 Team = c(
                   "Allegoric Alaskans",
                   "Blithering Badgers",
                   "Courageous Californians",
                   "Devastating Donkeys"
                 ),
                 MP = c(3, 2, 2, 1),
                 W = c(2, 1, 0, 0),
                 D = c(0, 1, 1, 0),
                 L = c(1, 0, 1, 1),
                 P = c(6, 4, 1, 0)
               ))
})

message("All tests passed for exercise: tournament")
