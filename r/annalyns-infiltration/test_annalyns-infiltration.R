source("./annalyns-infiltration.R")
library(testthat)

# 1) can_fast_attack

test_that("Cannot execute fast attack if knight is awake", {
  knight_is_awake <- TRUE
  expect_equal(can_fast_attack(knight_is_awake), FALSE)
})

test_that("Can execute fast attack if knight is sleeping", {
  knight_is_awake <- FALSE
  expect_equal(can_fast_attack(knight_is_awake), TRUE)
})

#  2) can_spy

test_that("Cannot spy if everyone is sleeping", {
  knight_is_awake <- FALSE
  archer_is_awake <- FALSE
  prisoner_is_awake <- FALSE
  expect_equal(
    can_spy(knight_is_awake, archer_is_awake, prisoner_is_awake),
    FALSE
  )
})

test_that("Can spy if everyone but knight is sleeping", {
  knight_is_awake <- TRUE
  archer_is_awake <- FALSE
  prisoner_is_awake <- FALSE
  expect_equal(
    can_spy(knight_is_awake, archer_is_awake, prisoner_is_awake),
    TRUE
  )
})

test_that("Can spy if everyone but archer is sleeping", {
  knight_is_awake <- FALSE
  archer_is_awake <- TRUE
  prisoner_is_awake <- FALSE
  expect_equal(
    can_spy(knight_is_awake, archer_is_awake, prisoner_is_awake),
    TRUE
  )
})

test_that("Can spy if everyone but prisoner is sleeping", {
  knight_is_awake <- FALSE
  archer_is_awake <- FALSE
  prisoner_is_awake <- TRUE
  expect_equal(
    can_spy(knight_is_awake, archer_is_awake, prisoner_is_awake),
    TRUE
  )
})

test_that("Can spy if only knight is sleeping", {
  knight_is_awake <- FALSE
  archer_is_awake <- TRUE
  prisoner_is_awake <- TRUE
  expect_equal(
    can_spy(knight_is_awake, archer_is_awake, prisoner_is_awake),
    TRUE
  )
})

test_that("Can spy if only archer is sleeping", {
  knight_is_awake <- TRUE
  archer_is_awake <- FALSE
  prisoner_is_awake <- TRUE
  expect_equal(
    can_spy(knight_is_awake, archer_is_awake, prisoner_is_awake),
    TRUE
  )
})

test_that("Can spy if only prisoner is sleeping", {
  knight_is_awake <- TRUE
  archer_is_awake <- TRUE
  prisoner_is_awake <- FALSE
  expect_equal(
    can_spy(knight_is_awake, archer_is_awake, prisoner_is_awake),
    TRUE
  )
})

test_that("Can spy if everyone is awake", {
  knight_is_awake <- TRUE
  archer_is_awake <- TRUE
  prisoner_is_awake <- TRUE
  expect_equal(
    can_spy(knight_is_awake, archer_is_awake, prisoner_is_awake),
    TRUE
  )
})

#  3) can_signal_prisoner

test_that("Can signal prisoner if archer is sleeping and prisoner is awake", {
  archer_is_awake <- FALSE
  prisoner_is_awake <- TRUE
  expect_equal(
    can_signal_prisoner(archer_is_awake, prisoner_is_awake),
    TRUE
  )
})

test_that("Cannot signal prisoner if archer is awake, prisoner is sleeping", {
  archer_is_awake <- TRUE
  prisoner_is_awake <- FALSE
  expect_equal(
    can_signal_prisoner(archer_is_awake, prisoner_is_awake),
    FALSE
  )
})

test_that("Cannot signal prisoner if archer and prisoner are both sleeping", {
  archer_is_awake <- FALSE
  prisoner_is_awake <- FALSE
  expect_equal(
    can_signal_prisoner(archer_is_awake, prisoner_is_awake),
    FALSE
  )
})

test_that("Cannot signal prisoner if archer and prisoner are both awake", {
  archer_is_awake <- TRUE
  prisoner_is_awake <- TRUE
  expect_equal(
    can_signal_prisoner(archer_is_awake, prisoner_is_awake),
    FALSE
  )
})


#  4) can_free_prisoner

test_that("Cannot free prisoner if everyone is awake and pet dog is present", {
  knight_is_awake <- TRUE
  archer_is_awake <- TRUE
  prisoner_is_awake <- TRUE
  pet_dog_is_present <- TRUE
  expect_equal(
    can_free_prisoner(
      knight_is_awake,
      archer_is_awake,
      prisoner_is_awake,
      pet_dog_is_present
    ),
    FALSE
  )
})

test_that("Cannot free prisoner if everyone is awake and pet dog is absent", {
  knight_is_awake <- TRUE
  archer_is_awake <- TRUE
  prisoner_is_awake <- TRUE
  pet_dog_is_present <- FALSE
  expect_equal(
    can_free_prisoner(
      knight_is_awake,
      archer_is_awake,
      prisoner_is_awake,
      pet_dog_is_present
    ),
    FALSE
  )
})

test_that("Can free prisoner if everyone is asleep and pet dog is present", {
  knight_is_awake <- FALSE
  archer_is_awake <- FALSE
  prisoner_is_awake <- FALSE
  pet_dog_is_present <- TRUE
  expect_equal(
    can_free_prisoner(
      knight_is_awake,
      archer_is_awake,
      prisoner_is_awake,
      pet_dog_is_present
    ),
    TRUE
  )
})

test_that("Cannot free prisoner if everyone is asleep and pet dog is absent", {
  knight_is_awake <- FALSE
  archer_is_awake <- FALSE
  prisoner_is_awake <- FALSE
  pet_dog_is_present <- FALSE
  expect_equal(
    can_free_prisoner(
      knight_is_awake,
      archer_is_awake,
      prisoner_is_awake,
      pet_dog_is_present
    ),
    FALSE
  )
})

test_that("Can free prisoner if only prisoner awake and pet dog present", {
  knight_is_awake <- FALSE
  archer_is_awake <- FALSE
  prisoner_is_awake <- TRUE
  pet_dog_is_present <- TRUE
  expect_equal(
    can_free_prisoner(
      knight_is_awake,
      archer_is_awake,
      prisoner_is_awake,
      pet_dog_is_present
    ),
    TRUE
  )
})

test_that("Can free prisoner if only prisoner is awake and pet dog is absent", {
  knight_is_awake <- FALSE
  archer_is_awake <- FALSE
  prisoner_is_awake <- TRUE
  pet_dog_is_present <- FALSE
  expect_equal(
    can_free_prisoner(
      knight_is_awake,
      archer_is_awake,
      prisoner_is_awake,
      pet_dog_is_present
    ),
    TRUE
  )
})

test_that("Cannot free prisoner if only archer awake and pet dog present", {
  knight_is_awake <- FALSE
  archer_is_awake <- TRUE
  prisoner_is_awake <- FALSE
  pet_dog_is_present <- TRUE
  expect_equal(
    can_free_prisoner(
      knight_is_awake,
      archer_is_awake,
      prisoner_is_awake,
      pet_dog_is_present
    ),
    FALSE
  )
})

test_that("Cannot free prisoner if only archer awake and pet dog absent", {
  knight_is_awake <- FALSE
  archer_is_awake <- TRUE
  prisoner_is_awake <- FALSE
  pet_dog_is_present <- FALSE
  expect_equal(
    can_free_prisoner(
      knight_is_awake,
      archer_is_awake,
      prisoner_is_awake,
      pet_dog_is_present
    ),
    FALSE
  )
})

test_that("Can free prisoner if only knight is awake and pet dog is present", {
  knight_is_awake <- TRUE
  archer_is_awake <- FALSE
  prisoner_is_awake <- FALSE
  pet_dog_is_present <- TRUE
  expect_equal(
    can_free_prisoner(
      knight_is_awake,
      archer_is_awake,
      prisoner_is_awake,
      pet_dog_is_present
    ),
    TRUE
  )
})

test_that("Cannot free prisoner if only knight awake and pet dog absent", {
  knight_is_awake <- TRUE
  archer_is_awake <- FALSE
  prisoner_is_awake <- FALSE
  pet_dog_is_present <- FALSE
  expect_equal(
    can_free_prisoner(
      knight_is_awake,
      archer_is_awake,
      prisoner_is_awake,
      pet_dog_is_present
    ),
    FALSE
  )
})

test_that("Cannot free prisoner if only knight asleep and pet dog present", {
  knight_is_awake <- FALSE
  archer_is_awake <- TRUE
  prisoner_is_awake <- TRUE
  pet_dog_is_present <- TRUE
  expect_equal(
    can_free_prisoner(
      knight_is_awake,
      archer_is_awake,
      prisoner_is_awake,
      pet_dog_is_present
    ),
    FALSE
  )
})

test_that("Cannot free prisoner if only knight asleep and pet dog absent", {
  knight_is_awake <- FALSE
  archer_is_awake <- TRUE
  prisoner_is_awake <- TRUE
  pet_dog_is_present <- FALSE
  expect_equal(
    can_free_prisoner(
      knight_is_awake,
      archer_is_awake,
      prisoner_is_awake,
      pet_dog_is_present
    ),
    FALSE
  )
})

test_that("Can free prisoner if only archer is asleep and pet dog is present", {
  knight_is_awake <- TRUE
  archer_is_awake <- FALSE
  prisoner_is_awake <- TRUE
  pet_dog_is_present <- TRUE
  expect_equal(
    can_free_prisoner(
      knight_is_awake,
      archer_is_awake,
      prisoner_is_awake,
      pet_dog_is_present
    ),
    TRUE
  )
})

test_that("Cannot free prisoner if only archer asleep and pet dog absent", {
  knight_is_awake <- TRUE
  archer_is_awake <- FALSE
  prisoner_is_awake <- TRUE
  pet_dog_is_present <- FALSE
  expect_equal(
    can_free_prisoner(
      knight_is_awake,
      archer_is_awake,
      prisoner_is_awake,
      pet_dog_is_present
    ),
    FALSE
  )
})

test_that("Cannot free prisoner if only prisoner asleep and pet dog present", {
  knight_is_awake <- TRUE
  archer_is_awake <- TRUE
  prisoner_is_awake <- FALSE
  pet_dog_is_present <- TRUE
  expect_equal(
    can_free_prisoner(
      knight_is_awake,
      archer_is_awake,
      prisoner_is_awake,
      pet_dog_is_present
    ),
    FALSE
  )
})

test_that("Cannot free prisoner if only prisoner asleep and pet dog absent", {
  knight_is_awake <- TRUE
  archer_is_awake <- TRUE
  prisoner_is_awake <- FALSE
  pet_dog_is_present <- FALSE
  expect_equal(
    can_free_prisoner(
      knight_is_awake,
      archer_is_awake,
      prisoner_is_awake,
      pet_dog_is_present
    ),
    FALSE
  )
})
