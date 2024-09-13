source('./protein-translation.R')
library(testthat)

test_that("Empty RNA sequence results in no proteins", {
  expect_equal(translate(""), NULL)
})

test_that("Methionine RNA sequence", {
  expect_equal(translate("AUG"), 'Methionine')
})

test_that("Phenylalanine RNA sequence 1", {
  expect_equal(translate("UUU"), 'Phenylalanine')
})

test_that("Phenylalanine RNA sequence 2", {
  expect_equal(translate("UUC"), 'Phenylalanine')
})

test_that("Leucine RNA sequence 1", {
  expect_equal(translate("UUA"), 'Leucine')
})

test_that("Leucine RNA sequence 2", {
  expect_equal(translate("UUG"), 'Leucine')
})

test_that("Serine RNA sequence 1", {
  expect_equal(translate("UCU"), 'Serine')
})

test_that("Serine RNA sequence 2", {
  expect_equal(translate("UCC"), 'Serine')
})

test_that("Serine RNA sequence 3", {
  expect_equal(translate("UCA"), 'Serine')
})

test_that("Serine RNA sequence 4", {
  expect_equal(translate("UCG"), 'Serine')
})

test_that("Tyrosine RNA sequence 1", {
  expect_equal(translate("UAU"), 'Tyrosine')
})

test_that("Tyrosine RNA sequence 2", {
  expect_equal(translate("UAC"), 'Tyrosine')
})

test_that("Cysteine RNA sequence 1", {
  expect_equal(translate("UGU"), 'Cysteine')
})

test_that("Cysteine RNA sequence 2", {
  expect_equal(translate("UGC"), 'Cysteine')
})

test_that("Tryptophan RNA sequence", {
  expect_equal(translate("UGG"), 'Tryptophan')
})

test_that("STOP codon RNA sequence 1", {
  expect_equal(translate("UAA"), c())
})

test_that("STOP codon RNA sequence 2", {
  expect_equal(translate("UAG"), c())
})

test_that("STOP codon RNA sequence 3", {
  expect_equal(translate("UGA"), c())
})

test_that("Sequence of two protein codons translates into proteins", {
  expect_equal(translate("UUUUUU"), c('Phenylalanine', 'Phenylalanine'))
})

test_that("Sequence of two different protein codons translates into proteins", {
  expect_equal(translate("UUAUUG"), c('Leucine', 'Leucine'))
})

test_that("Translate RNA strand into correct protein list", {
  expect_equal(translate("AUGUUUUGG"), 
               c('Methionine', 'Phenylalanine', 'Tryptophan'))
})

test_that("Translation stops if STOP codon at beginning of sequence", {
  expect_equal(translate("UAGUGG"), c())
})

test_that("Translation stops if STOP codon at end of two-codon sequence", {
  expect_equal(translate("UGGUAG"), c('Tryptophan'))
})

test_that("Translation stops if STOP codon at end of three-codon sequence", {
  expect_equal(translate("AUGUUUUAA"), c('Methionine', 'Phenylalanine'))
})

test_that("Translation stops if STOP codon in middle of three-codon sequence", {
  expect_equal(translate("UGGUAGUGG"), c('Tryptophan'))
})

test_that("Translation stops if STOP codon in middle of six-codon sequence", {
  expect_equal(translate("UGGUGUUAUUAAUGGUUU"), 
               c('Tryptophan', 'Cysteine', 'Tyrosine'))
})

test_that("Non-existing codon can't translate", {
  expect_error(translate("AAA"))
})

test_that("Unknown amino acids, not part of a codon, can't translate", {
  expect_error(translate("XYZ"))
})

test_that("Incomplete RNA sequence can't translate", {
  expect_error(translate("AUGU"))
})

test_that("Incomplete RNA sequence can translate if valid until a STOP codon", {
  expect_equal(translate("UUCUUCUAAUGGU"), c('Phenylalanine', 'Phenylalanine'))
})

