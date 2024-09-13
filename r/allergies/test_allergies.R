source("./allergies.R")
library(testthat)

test_that("no allergies means not allergic", {
  x <- allergy(0)
  expect_false(allergic_to(x, "peanuts"))
  expect_false(allergic_to(x, "cats"))
  expect_false(allergic_to(x, "strawberries"))
})

test_that("is allergic to eggs", {
  x <- allergy(1)
  expect_true(allergic_to(x, "eggs"))
})

test_that("allergic to eggs in addition to other stuff", {
  x <- allergy(5)
  expect_true(allergic_to(x, "eggs"))
  expect_true(allergic_to(x, "shellfish"))
  expect_false(allergic_to(x, "strawberries"))
})

test_that("no allergies at all", {
  x <- allergy(0)
  expect_equal(list_allergies(x), character())
})

test_that("allergic to just eggs", {
  x <- allergy(1)
  expect_equal(list_allergies(x), c("eggs"))
})

test_that("allergic to just peanuts", {
  x <- allergy(2)
  expect_equal(list_allergies(x), c("peanuts"))
})

test_that("allergic to just strawberries", {
  x <- allergy(8)
  expect_equal(list_allergies(x), c("strawberries"))
})

test_that("allergic to eggs and peanuts", {
  x <- allergy(3)
  expect_true(setequal(
    list_allergies(x),
    c("eggs", "peanuts")
  ))
})

test_that("allergic to more than eggs but not peanuts", {
  x <- allergy(5)
  expect_true(setequal(
    list_allergies(x),
    c("eggs", "shellfish")
  ))
})

test_that("allergic to lots of stuff", {
  x <- allergy(248)
  expect_true(setequal(
    list_allergies(x),
    c("strawberries", "tomatoes", "chocolate", "pollen", "cats")
  ))
})

test_that("allergic to everything", {
  x <- allergy(255)
  expect_true(setequal(
    list_allergies(x),
    c(
      "eggs", "peanuts", "shellfish", "strawberries", "tomatoes",
      "chocolate", "pollen", "cats"
    )
  ))
})

test_that("ignore non allergen score parts", {
  x <- allergy(509)
  expect_true(setequal(
    list_allergies(x),
    c(
      "eggs", "shellfish", "strawberries", "tomatoes",
      "chocolate", "pollen", "cats"
    )
  ))
})
