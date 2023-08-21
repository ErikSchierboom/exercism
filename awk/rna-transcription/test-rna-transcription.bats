#!/usr/bin/env bats
load bats-extra

# local version: 1.3.0.0

@test "Empty RNA sequence" {
  #[[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run gawk -f rna-transcription.awk <<< ""
  assert_success
  [[ -z $output ]]
}

@test "RNA complement of cytosine is guanine" {
  run gawk -f rna-transcription.awk <<< "C"
  assert_success
  assert_output "G"
}

@test "RNA complement of guanine is cytosine" {
  run gawk -f rna-transcription.awk <<< "G"
  assert_success
  assert_output "C"
}

@test "RNA complement of thymine is adenine" {
  run gawk -f rna-transcription.awk <<< "T"
  assert_success
  assert_output "A"
}

@test "RNA complement of adenine is uracil" {
  run gawk -f rna-transcription.awk <<< "A"
  assert_success
  assert_output "U"
}

@test "RNA complement" {
  run gawk -f rna-transcription.awk <<< "ACGTGGTCTTAA"
  assert_success
  assert_output "UGCACCAGAAUU"
}

@test "Handles invalid character" {
  run gawk -f rna-transcription.awk <<< "ACGTXCTTA"
  assert_failure
  assert_output "Invalid nucleotide detected."
}

@test "Handles completely invalid string" {
  run gawk -f rna-transcription.awk <<< "XXXX"
  assert_failure
  assert_output "Invalid nucleotide detected."
}

@test "Handles partially invalid string" {
  run gawk -f rna-transcription.awk <<< "ACGTXCTTAA"
  assert_failure
  assert_output "Invalid nucleotide detected."
}
