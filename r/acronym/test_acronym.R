source("./acronym.R")
library(testthat)

context("acronym")

test_that("Abbreviate a phrase", {
  input <- "Portable Network Graphics"
  expect_equal(acronym(input), "PNG")
})

test_that("Lowercase words", {
  input <- "Ruby on Rails"
  expect_equal(acronym(input), "ROR")
})

test_that("Punctuation", {
  input <- "First In, First Out"
  expect_equal(acronym(input), "FIFO")
})

test_that("All caps word", {
  input <- "GNU Image Manipulation Program"
  expect_equal(acronym(input), "GIMP")
})

test_that("Punctuation without whitespace", {
  input <- "Complementary metal-oxide semiconductor"
  expect_equal(acronym(input), "CMOS")
})

test_that("Very long abbreviation", {
  input <- paste(
    "Rolling On The Floor Laughing So Hard ",
    "That My Dogs Came Over And Licked Me",
    sep = "")
  expect_equal(acronym(input), "ROTFLSHTMDCOALM")
})

test_that("Consecutive delimiters", {
  input <- "Something - I made up from thin air"
  expect_equal(acronym(input), "SIMUFTA")
})

test_that("Apostrophes", {
  input <- "Halley's Comet"
  expect_equal(acronym(input), "HC")
})

test_that("Underscore emphasis", {
  input <- "The Road _Not_ Taken"
  expect_equal(acronym(input), "TRNT")
})

message("All tests passed for exercise: acronym")
