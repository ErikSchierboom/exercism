source("./bob.R")
library(testthat)

context("bob")

test_that("stating something", {
  input <- "Tom-ay-to, tom-aaaah-to."
  expect_equal(bob(input),
               "Whatever.")
})

test_that("shouting", {
  input <- "WATCH OUT!"
  expect_equal(bob(input),
               "Whoa, chill out!")
})

test_that("shouting gibberish", {
  input <- "FCECDFCAAB"
  expect_equal(bob(input),
               "Whoa, chill out!")
})

test_that("asking a question", {
  input <- "Does this cryogenic chamber make me look fat?"
  expect_equal(bob(input),
               "Sure.")
})

test_that("asking a numeric question", {
  input <- "You are, what, like 15?"
  expect_equal(bob(input),
               "Sure.")
})

test_that("asking gibberish", {
  input <- "fffbbcbeab?"
  expect_equal(bob(input),
               "Sure.")
})

test_that("talking forcefully", {
  input <- "Let's go make out behind the gym!"
  expect_equal(bob(input),
  "Whatever."
  )
})
  
  test_that("using acronyms in regular speech", {
  input <- "It's OK if you don't want to go to the DMV."
  expect_equal(bob(input),
  "Whatever."
  )
  })
  
  test_that("forceful question", {
  input <- "WHAT THE HELL WERE YOU THINKING?"
  expect_equal(bob(input),
  "Calm down, I know what I'm doing!"
  )
  })
  
  test_that("shouting numbers", {
  input <- "1, 2, 3 GO!"
  expect_equal(bob(input),
  "Whoa, chill out!"
  )
  })
  
  test_that("only numbers", {
  input <- "1, 2, 3"
  expect_equal(bob(input),
  "Whatever."
  )
  })
  
  test_that("question with only numbers", {
  input <- "4?"
  expect_equal(bob(input),
  "Sure."
  )
  })
  
  test_that("shouting with special characters", {
  input <- "ZOMG THE % ^  * @#$(*^ ZOMBIES ARE COMING!!11!!1!"
    expect_equal(bob(input),
                 "Whoa, chill out!")
  })

test_that("shouting with no exclamation mark", {
  input <- "I HATE YOU"
  expect_equal(bob(input),
               "Whoa, chill out!")
})

test_that("statement containing question mark", {
  input <- "Ending with ? means a question."
  expect_equal(bob(input),
               "Whatever.")
})

test_that("non-letters with question", {
  input <- ":) ?"
  expect_equal(bob(input),
               "Sure.")
})

test_that("prattling on", {
  input <- "Wait! Hang on. Are you going to be OK?"
  expect_equal(bob(input),
               "Sure.")
})

test_that("silence", {
  input <- ""
  expect_equal(bob(input),
               "Fine. Be that way!")
})

test_that("prolonged silence", {
  input <- "          "
  expect_equal(bob(input),
               "Fine. Be that way!")
})

test_that("alternate silence", {
  input <- "										"
  expect_equal(bob(input),
               "Fine. Be that way!")
})

test_that("multiple line question", {
  input <- "
  Does this cryogenic chamber make me look fat?
  no"
  expect_equal(bob(input),
               "Whatever.")
})

test_that("starting with whitespace", {
  input <- "         hmmmmmmm..."
  expect_equal(bob(input),
               "Whatever.")
})

test_that("ending with whitespace", {
  input <- "Okay if like my  spacebar  quite a bit?   "
  expect_equal(bob(input),
               "Sure.")
})

test_that("other whitespace", {
  input <- "
  
  "
  expect_equal(bob(input),
               "Fine. Be that way!")
})

test_that("non-question ending with whitespace", {
  input <- "This is a statement ending with whitespace      "
  expect_equal(bob(input),
               "Whatever.")
})

message("All tests passed for exercise: bob")
