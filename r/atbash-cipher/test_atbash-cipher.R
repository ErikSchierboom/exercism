source("./atbash-cipher.R")
library(testthat)

test_that("Encode yes", {
  plaintext <- "yes"
  expected <- "bvh"
  expect_equal(encode(plaintext), expected)
})

test_that("Encode no", {
  plaintext <- "no"
  expected <- "ml"
  expect_equal(encode(plaintext), expected)
})

test_that("Encode OMG", {
  plaintext <- "OMG"
  expected <- "lnt"
  expect_equal(encode(plaintext), expected)
})

test_that("Encode spaces", {
  plaintext <- "O M G"
  expected <- "lnt"
  expect_equal(encode(plaintext), expected)
})

test_that("Encode mindblowingly", {
  plaintext <- "mindblowingly"
  expected <- "nrmwy oldrm tob"
  expect_equal(encode(plaintext), expected)
})

test_that("Encode numbers", {
  plaintext <- "Testing,1 2 3, testing."
  expected <- "gvhgr mt123 gvhgr mt"
  expect_equal(encode(plaintext), expected)
})

test_that("Encode deep thought", {
  plaintext <- "Truth is fiction."
  expected <- "gifgs rhurx grlm"
  expect_equal(encode(plaintext), expected)
})

test_that("Encode all the letters", {
  plaintext <- "The quick brown fox jumps over the lazy dog."
  expected <- "gsvjf rxpyi ldmul cqfnk hlevi gsvoz abwlt"
  expect_equal(encode(plaintext), expected)
})

test_that("Decode exercism", {
  ciphertext <- "vcvix rhn"
  expected <- "exercism"
  expect_equal(decode(ciphertext), expected)
})

test_that("Decode a sentence", {
  ciphertext <- "zmlyh gzxov rhlug vmzhg vkkrm thglm v"
  expected <- "anobstacleisoftenasteppingstone"
  expect_equal(decode(ciphertext), expected)
})

test_that("Decode numbers", {
  ciphertext <- "gvhgr mt123 gvhgr mt"
  expected <- "testing123testing"
  expect_equal(decode(ciphertext), expected)
})

test_that("Decode all the letters", {
  ciphertext <- "gsvjf rxpyi ldmul cqfnk hlevi gsvoz abwlt"
  expected <- "thequickbrownfoxjumpsoverthelazydog"
  expect_equal(decode(ciphertext), expected)
})

test_that("Decode with too many spaces", {
  ciphertext <- "vc vix    r hn"
  expected <- "exercism"
  expect_equal(decode(ciphertext), expected)
})

test_that("Decode with no spaces", {
  ciphertext <- "zmlyhgzxovrhlugvmzhgvkkrmthglmv"
  expected <- "anobstacleisoftenasteppingstone"
  expect_equal(decode(ciphertext), expected)
})
