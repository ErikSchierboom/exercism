source("./hamming.R")
library(testthat)

context("hamming")

test_that("identical strands", {
  strand1 <- "A"
  strand2 <- "A"
  expect_equal(hamming(strand1, strand2), 0)
})

test_that("long identical strands", {
  strand1 <- "GGACTGA"
  strand2 <- "GGACTGA"
  expect_equal(hamming(strand1, strand2), 0)
})

test_that("complete distance in single nucleotide strands", {
  strand1 <- "A"
  strand2 <- "G"
  expect_equal(hamming(strand1, strand2), 1)
})

test_that("complete distance in small strands", {
  strand1 <- "AG"
  strand2 <- "CT"
  expect_equal(hamming(strand1, strand2), 2)
})

test_that("small distance in small strands", {
  strand1 <- "AT"
  strand2 <- "CT"
  expect_equal(hamming(strand1, strand2), 1)
})

test_that("small distance", {
  strand1 <- "GGACG"
  strand2 <- "GGTCG"
  expect_equal(hamming(strand1, strand2), 1)
})

test_that("small distance in long strands", {
  strand1 <- "ACCAGGG"
  strand2 <- "ACTATGG"
  expect_equal(hamming(strand1, strand2), 2)
})

test_that("non-unique character in first strand", {
  strand1 <- "AGA"
  strand2 <- "AGG"
  expect_equal(hamming(strand1, strand2), 1)
})

test_that("non-unique character in second strand", {
  strand1 <- "AGG"
  strand2 <- "AGA"
  expect_equal(hamming(strand1, strand2), 1)
})

test_that("same nucleotides in different positions", {
  strand1 <- "TAG"
  strand2 <- "GAT"
  expect_equal(hamming(strand1, strand2), 2)
})

test_that("large distance", {
  strand1 <- "GATACA"
  strand2 <- "GCATAA"
  expect_equal(hamming(strand1, strand2), 4)
})

test_that("empty strands", {
  strand1 <- ""
  strand2 <- ""
  expect_equal(hamming(strand1, strand2), 0)
})

test_that("disallow first strand longer", {
  strand1 <- "AATG"
  strand2 <- "AAA"
  expect_error(hamming(strand1, strand2))
})

test_that("disallow second strand longer", {
  strand1 <- "ATA"
  strand2 <- "AGTG"
  expect_error(hamming(strand1, strand2))
})

message("All tests passed for exercise: hamming")
