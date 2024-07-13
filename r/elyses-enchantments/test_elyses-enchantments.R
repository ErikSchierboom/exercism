source("./elyses-enchantments.R")
library(testthat)

# get_item

test_that("get the first card", {
  stack <- c(1, 2, 3)
  position <- 1
  expect_equal(get_item(stack, position), 1)
})

test_that("get the middle card", {
  stack <- c(4, 5, 6)
  position <- 2
  expect_equal(get_item(stack, position), 5)
})

test_that("get the last card", {
  stack <- c(9, 8, 7)
  position <- 3
  expect_equal(get_item(stack, position), 7)
})

# set_item

test_that("replace the first card with a 7", {
  stack <- c(1, 2, 3)
  position <- 1
  replacement_card <- 7
  expect_equal(set_item(stack, position, replacement_card), c(7, 2, 3))
})

test_that("replace the middle card with a 5", {
  stack <- c(2, 2, 2)
  position <- 2
  replacement_card <- 5
  expect_equal(set_item(stack, position, replacement_card), c(2, 5, 2))
})

test_that("replace the last card with a 7", {
  stack <- c(7, 7, 6)
  position <- 3
  replacement_card <- 7
  expect_equal(set_item(stack, position, replacement_card), c(7, 7, 7))
})

#

test_that("adding a second card at the top'", {
  stack <- c(1)
  new_card <- 5
  expect_equal(insert_item_at_top(stack, new_card), c(1, 5))
})

test_that("adding a third card at the top'", {
  stack <- c(1, 5)
  new_card <- 9
  expect_equal(insert_item_at_top(stack, new_card), c(1, 5, 9))
})

test_that("adding a fourth card at the top'", {
  stack <- c(1, 5, 9)
  new_card <- 2
  expect_equal(insert_item_at_top(stack, new_card), c(1, 5, 9, 2))
})

test_that("adding a different fourth card at the top'", {
  stack <- c(1, 5, 9)
  new_card <- 8
  expect_equal(insert_item_at_top(stack, new_card), c(1, 5, 9, 8))
})

# remove_item

test_that("remove the card at the bottom'", {
  stack <- c(1, 2, 3, 4)
  position <- 1
  expect_equal(remove_item(stack, position), c(2, 3, 4))
})

test_that("remove the card at the top'", {
  stack <- c(1, 2, 3, 4)
  position <- 4
  expect_equal(remove_item(stack, position), c(1, 2, 3))
})

test_that("remove the second card", {
  stack <- c(1, 2, 3, 4)
  position <- 2
  expect_equal(remove_item(stack, position), c(1, 3, 4))
})

# remove_item_from_top

test_that("remove the only card from the top", {
  stack <- c(1)
  expect_equal(remove_item_from_top(stack), c())
})

test_that("remove the card from the top", {
  stack <- c(1, 2, 3)
  expect_equal(remove_item_from_top(stack), c(1, 2))
})

#

test_that("adding a second card to the bottom", {
  stack <- c(1)
  new_card <- 5
  expect_equal(insert_item_at_bottom(stack, new_card), c(5, 1))
})

test_that("adding a third card to the bottom", {
  stack <- c(5, 1)
  new_card <- 9
  expect_equal(insert_item_at_bottom(stack, new_card), c(9, 5, 1))
})

test_that("adding a fourth card to the bottom", {
  stack <- c(9, 5, 1)
  new_card <- 2
  expect_equal(insert_item_at_bottom(stack, new_card), c(2, 9, 5, 1))
})

test_that("adding a different fourth card to the bottom", {
  stack <- c(9, 5, 1)
  new_card <- 8
  expect_equal(insert_item_at_bottom(stack, new_card), c(8, 9, 5, 1))
})

# remove_item_at_bottom

test_that("remove the only card from the bottom", {
  stack <- c(1)
  expect_equal(remove_item_at_bottom(stack), c())
})

test_that("remove the card from the bottom", {
  stack <- c(1, 2, 3)
  expect_equal(remove_item_at_bottom(stack), c(2, 3))
})

# check_size_of_stack

test_that("an empty stack of cards", {
  stack <- c()
  stack_size <- 0
  expect_equal(check_size_of_stack(stack, stack_size), TRUE)
})

test_that("an empty stack of cards", {
  stack <- c()
  stack_size <- 1
  expect_equal(check_size_of_stack(stack, stack_size), FALSE)
})

test_that("has exactly 1 card", {
  stack <- c(7)
  stack_size <- 0
  expect_equal(check_size_of_stack(stack, stack_size), FALSE)
})

test_that("has exactly 1 card", {
  stack <- c(7)
  stack_size <- 1
  expect_equal(check_size_of_stack(stack, stack_size), TRUE)
})

test_that("has exactly 1 card", {
  stack <- c(7)
  stack_size <- 2
  expect_equal(check_size_of_stack(stack, stack_size), FALSE)
})

test_that("has exactly 4 cards", {
  stack <- c(2, 4, 6, 8)
  stack_size <- 3
  expect_equal(check_size_of_stack(stack, stack_size), FALSE)
})

test_that("has exactly 4 cards", {
  stack <- c(2, 4, 6, 8)
  stack_size <- 4
  expect_equal(check_size_of_stack(stack, stack_size), TRUE)
})

test_that("has exactly 4 cards", {
  stack <- c(2, 4, 6, 8)
  stack_size <- 15
  expect_equal(check_size_of_stack(stack, stack_size), FALSE)
})

test_that("has exactly 5 cards", {
  stack <- c(1, 3, 5, 7, 9)
  stack_size <- 3
  expect_equal(check_size_of_stack(stack, stack_size), FALSE)
})

test_that("has exactly 5 cards", {
  stack <- c(1, 3, 5, 7, 9)
  stack_size <- 4
  expect_equal(check_size_of_stack(stack, stack_size), FALSE)
})

test_that("has exactly 5 cards", {
  stack <- c(1, 3, 5, 7, 9)
  stack_size <- 5
  expect_equal(check_size_of_stack(stack, stack_size), TRUE)
})
