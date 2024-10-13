source("./kindergarten-garden.R")
library(testthat)

test_that("partial garden garden with single student", {
  garden <- "RC\nGG"
  child <- "Alice"
  expect_equal(
    plants(garden, child),
    c("Radish", "Clover", "Grass", "Grass")
  )
})

test_that("partial garden different garden with single student", {
  garden <- "VC\nRC"
  child <- "Alice"
  expect_equal(
    plants(garden, child),
    c("Violet", "Clover", "Radish", "Clover")
  )
})

test_that("partial garden garden with two students", {
  garden <- "VVCG\nVVRC"
  child <- "Bob"
  expect_equal(
    plants(garden, child),
    c("Clover", "Grass", "Radish", "Clover")
  )
})

test_that("partial garden second student s garden", {
  garden <- "VVCCGG\nVVCCGG"
  child <- "Bob"
  expect_equal(
    plants(garden, child),
    c("Clover", "Clover", "Clover", "Clover")
  )
})

test_that("partial garden third student s garden", {
  garden <- "VVCCGG\nVVCCGG"
  child <- "Charlie"
  expect_equal(plants(garden, child), c("Grass", "Grass", "Grass", "Grass"))
})

test_that("full garden for alice first student s garden", {
  garden <- "VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV"
  child <- "Alice"
  expect_equal(
    plants(garden, child),
    c("Violet", "Radish", "Violet", "Radish")
  )
})

test_that("full garden for bob second student s garden", {
  garden <- "VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV"
  child <- "Bob"
  expect_equal(
    plants(garden, child),
    c("Clover", "Grass", "Clover", "Clover")
  )
})

test_that("full garden for charlie", {
  garden <- "VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV"
  child <- "Charlie"
  expect_equal(
    plants(garden, child),
    c("Violet", "Violet", "Clover", "Grass")
  )
})

test_that("full garden for david", {
  garden <- "VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV"
  child <- "David"
  expect_equal(
    plants(garden, child),
    c("Radish", "Violet", "Clover", "Radish")
  )
})

test_that("full garden for eve", {
  garden <- "VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV"
  child <- "Eve"
  expect_equal(
    plants(garden, child),
    c("Clover", "Grass", "Radish", "Grass")
  )
})

test_that("full garden for fred", {
  garden <- "VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV"
  child <- "Fred"
  expect_equal(
    plants(garden, child),
    c("Grass", "Clover", "Violet", "Clover")
  )
})

test_that("full garden for ginny", {
  garden <- "VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV"
  child <- "Ginny"
  expect_equal(
    plants(garden, child),
    c("Clover", "Grass", "Grass", "Clover")
  )
})

test_that("full garden for harriet", {
  garden <- "VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV"
  child <- "Harriet"
  expect_equal(
    plants(garden, child),
    c("Violet", "Radish", "Radish", "Violet")
  )
})

test_that("full garden for ileana", {
  garden <- "VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV"
  child <- "Ileana"
  expect_equal(
    plants(garden, child),
    c("Grass", "Clover", "Violet", "Clover")
  )
})

test_that("full garden for joseph", {
  garden <- "VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV"
  child <- "Joseph"
  expect_equal(
    plants(garden, child),
    c("Violet", "Clover", "Violet", "Grass")
  )
})

test_that("full garden for kincaid second to last student s garden", {
  garden <- "VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV"
  child <- "Kincaid"
  expect_equal(
    plants(garden, child),
    c("Grass", "Clover", "Clover", "Grass")
  )
})

test_that("full garden for larry last student s garden", {
  garden <- "VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV"
  child <- "Larry"
  expect_equal(
    plants(garden, child),
    c("Grass", "Violet", "Clover", "Violet")
  )
})
