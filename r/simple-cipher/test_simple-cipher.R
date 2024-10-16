source("./simple-cipher.R")
library(testthat)

test_that("Random key cipher - Key is made only of lowercase letters", {
  key <- generate_key()
  expect_equal(all(grepl("^[a-z]+$", key)), TRUE)
})

test_that("Random key cipher - Can encode", {
  key <- generate_key()
  expect_equal(encode("aaaaaaaaaa", key), substr(key, 1, 10))
})

test_that("Random key cipher - Can decode", {
  key <- generate_key()
  expect_equal(decode(substr(key, 1, 10), key), "aaaaaaaaaa")
})

test_that("Random key cipher - Is reversible. I.e., if you apply decode in a encoded result, you must see the same plaintext encode parameter as a result of the decode method", { # nolint
  key <- generate_key()
  expect_equal(decode(encode("abcdefghij", key), key), "abcdefghij")
})

test_that("Substitution cipher - Can encode", {
  key <- "abcdefghij"
  expect_equal(encode("aaaaaaaaaa", key), "abcdefghij")
})

test_that("Substitution cipher - Can decode", {
  key <- "abcdefghij"
  expect_equal(decode("abcdefghij", key), "aaaaaaaaaa")
})

test_that("Substitution cipher - Is reversible. I.e., if you apply decode in a encoded result, you must see the same plaintext encode parameter as a result of the decode method", { # nolint
  key <- "abcdefghij"
  expect_equal(decode(encode("abcdefghij", key), key), "abcdefghij")
})

test_that("Substitution cipher - Can double shift encode", {
  key <- "iamapandabear"
  expect_equal(encode("iamapandabear", key), "qayaeaagaciai")
})

test_that("Substitution cipher - Can wrap on encode", {
  key <- "abcdefghij"
  expect_equal(encode("zzzzzzzzzz", key), "zabcdefghi")
})

test_that("Substitution cipher - Can wrap on decode", {
  key <- "abcdefghij"
  expect_equal(decode("zabcdefghi", key), "zzzzzzzzzz")
})

test_that("Substitution cipher - Can encode messages longer than the key", {
  key <- "abc"
  expect_equal(encode("iamapandabear", key), "iboaqcnecbfcr")
})

test_that("Substitution cipher - Can decode messages longer than the key", {
  key <- "abc"
  expect_equal(decode("iboaqcnecbfcr", key), "iamapandabear")
})
