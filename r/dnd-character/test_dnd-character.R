source("./dnd-character.R")
library(testthat)

test_that("Ability modifier for score 3 is -4", {
  expect_equal(modifier(3), -4)
})

test_that("Ability modifier for score 4 is -3", {
  expect_equal(modifier(4), -3)
})

test_that("Ability modifier for score 5 is -3", {
  expect_equal(modifier(5), -3)
})

test_that("Ability modifier for score 6 is -2", {
  expect_equal(modifier(6), -2)
})

test_that("Ability modifier for score 7 is -2", {
  expect_equal(modifier(7), -2)
})

test_that("Ability modifier for score 8 is -1", {
  expect_equal(modifier(8), -1)
})

test_that("Ability modifier for score 9 is -1", {
  expect_equal(modifier(9), -1)
})

test_that("Ability modifier for score 10 is 0", {
  expect_equal(modifier(10), 0)
})

test_that("Ability modifier for score 11 is 0", {
  expect_equal(modifier(11), 0)
})

test_that("Ability modifier for score 12 is +1", {
  expect_equal(modifier(12), 1)
})

test_that("Ability modifier for score 13 is +1", {
  expect_equal(modifier(13), 1)
})

test_that("Ability modifier for score 14 is +2", {
  expect_equal(modifier(14), 2)
})

test_that("Ability modifier for score 15 is +2", {
  expect_equal(modifier(15), 2)
})

test_that("Ability modifier for score 16 is +3", {
  expect_equal(modifier(16), 3)
})

test_that("Ability modifier for score 17 is +3", {
  expect_equal(modifier(17), 3)
})

test_that("Ability modifier for score 18 is +4", {
  expect_equal(modifier(18), 4)
})

test_that("Random ability is within range", {
  for (i in 1:10) {
    expect_true(ability() %in% 3:18)
  }
})

test_that("Random character is valid", {
  for (i in 1:10) {
    character <- new_character()
    expect_s3_class(character, "character")
    expect_true(character$strength %in% 3:18)
    expect_true(character$dexterity %in% 3:18)
    expect_true(character$constitution %in% 3:18)
    expect_true(character$intelligence %in% 3:18)
    expect_true(character$wisdom %in% 3:18)
    expect_true(character$charisma %in% 3:18)
    expect_equal(character$hitpoints, 10 + modifier(character$constitution))
  }
})

test_that("Each ability is only calculated once", {
  for (i in 1:10) {
    character <- new_character()
    expect_equal(character$strength, character$strength)
    expect_equal(character$dexterity, character$dexterity)
    expect_equal(character$constitution, character$constitution)
    expect_equal(character$intelligence, character$intelligence)
    expect_equal(character$wisdom, character$wisdom)
    expect_equal(character$charisma, character$charisma)
    expect_equal(character$hitpoints, character$hitpoints)
  }
})
