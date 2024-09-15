source("./crypto-square.R")
library(testthat)

test_that("Lowercase", {
  expect_equal(normalized_plaintext("Hello"), "hello")
})

test_that("Remove spaces", {
  expect_equal(normalized_plaintext("Hi there"), "hithere")
})

test_that("Remove punctuation", {
  expect_equal(normalized_plaintext("@1, 2%, 3 Go!"), "123go")
})

test_that("empty plaintext results in an empty rectangle", {
  expect_equal(plaintext_segments(""), "")
})

test_that("4 character plaintext results in an 2x2 rectangle", {
  expect_equal(plaintext_segments("Ab Cd"), c("ab", "cd"))
})

test_that("9 character plaintext results in an 3x3 rectangle", {
  expect_equal(plaintext_segments("This is fun!"), c("thi", "sis", "fun"))
})

test_that("54 character plaintext results in an 8x7 rectangle", {
  expect_equal(
    plaintext_segments(
      "If man was meant to stay on the ground, god would have given us roots."
    ),
    c(
      "ifmanwas",
      "meanttos",
      "tayonthe",
      "groundgo",
      "dwouldha",
      "vegivenu",
      "sroots"
    )
  )
})

test_that("empty plaintext results in an empty encode", {
  expect_equal(encoded(""), "")
})

test_that("Non-empty plaintext results in the combined plaintext segments", {
  expect_equal(
    encoded(
      "If man was meant to stay on the ground, god would have given us roots."
    ),
    "imtgdvsfearwermayoogoanouuiontnnlvtwttddesaohghnsseoau"
  )
})

test_that("empty plaintext results in an empty ciphertext", {
  expect_equal(ciphertext(""), "")
})

test_that("9 character plaintext results in 3 chunks of 3 characters", {
  expect_equal(ciphertext("This is fun!"), "tsf hiu isn")
})

test_that("54 character plaintext results in 7 chunks, the last two padded with
          spaces", {
  expect_equal(
    ciphertext(
      "If man was meant to stay on the ground, god would have given us roots."
    ),
    "imtgdvs fearwer mayoogo anouuio ntnnlvt wttddes aohghn  sseoau "
  )
})
