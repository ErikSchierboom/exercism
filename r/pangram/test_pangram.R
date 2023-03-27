source("./pangram.R")
library(testthat)

context("pangram")

test_that("sentence empty", {
    expect_false(is_pangram(""))
})

test_that("pangram with only lower case", {
    expect_true(is_pangram("the quick brown fox jumps over the lazy dog"))
})

test_that("missing character 'x'", {
    expect_false(
      is_pangram("a quick movement of the enemy will jeopardize five gunboats"))
})

test_that("another missing character 'x'", {
    expect_false(is_pangram("the quick brown fish jumps over the lazy dog"))
})

test_that("pangram with underscores", {
    expect_true(is_pangram("the_quick_brown_fox_jumps_over_the_lazy_dog"))
})

test_that("pangram with numbers", {
    expect_true(is_pangram("the 1 quick brown fox jumps over the 2 lazy dogs"))
})

test_that("missing letters replaced by numbers", {
    expect_false(is_pangram("7h3 qu1ck brown fox jumps ov3r 7h3 lazy dog"))
})

test_that("pangram with mixed case and punctuation", {
    expect_true(is_pangram("\"Five quacking Zephyrs jolt my wax bed.\""))
})

test_that("upper and lower case versions of the same character should not be 
          counted separately", {
    expect_false(is_pangram("the quick brown fox jumped over the lazy FOX"))
})

message("All tests passed for exercise: pangram")
