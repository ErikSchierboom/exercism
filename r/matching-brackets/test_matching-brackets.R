source("./matching-brackets.R")
library(testthat)

test_that("Paired square brackets", {
  expect_equal(is_paired("[]"), TRUE)
})

test_that("Empty string", {
  expect_equal(is_paired(""), TRUE)
})

test_that("Unpaired brackets", {
  expect_equal(is_paired("[["), FALSE)
})

test_that("Wrong ordered brackets", {
  expect_equal(is_paired("}{"), FALSE)
})

test_that("Wrong closing bracket", {
  expect_equal(is_paired("{]"), FALSE)
})

test_that("Paired with whitespace", {
  expect_equal(is_paired("{ }"), TRUE)
})

test_that("Partially paired brackets", {
  expect_equal(is_paired("{[])"), FALSE)
})

test_that("Simple nested brackets", {
  expect_equal(is_paired("{[]}"), TRUE)
})

test_that("Several paired brackets", {
  expect_equal(is_paired("{}[]"), TRUE)
})

test_that("Paired and nested brackets", {
  expect_equal(is_paired("([{}({}[])])"), TRUE)
})

test_that("Unopened closing brackets", {
  expect_equal(is_paired("{[)][]}"), FALSE)
})

test_that("Unpaired and nested brackets", {
  expect_equal(is_paired("([{])"), FALSE)
})

test_that("Paired and wrong nested brackets", {
  expect_equal(is_paired("[({]})"), FALSE)
})

test_that("Paired and wrong nested brackets but innermost are correct", {
  expect_equal(is_paired("[({}])"), FALSE)
})

test_that("Paired and incomplete brackets", {
  expect_equal(is_paired("{}["), FALSE)
})

test_that("Too many closing brackets", {
  expect_equal(is_paired("[]]"), FALSE)
})

test_that("Early unexpected brackets", {
  expect_equal(is_paired(")()"), FALSE)
})

test_that("Early mismatched brackets", {
  expect_equal(is_paired("{)()"), FALSE)
})

test_that("Math expression", {
  input <- "(((185 + 223.85) * 15) - 543)/2"
  expect_equal(is_paired(input), TRUE)
})

test_that("Complex latex expression", {
  input <- "\\left(\\begin{array}{cc} \\frac{1}{3} & x\\ \\mathrm{e}^{x} &... x^2 \\end{array}\\right)" # nolint
  expect_equal(is_paired(input), TRUE)
})
