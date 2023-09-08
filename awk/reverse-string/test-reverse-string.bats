#!/usr/bin/env bats
load bats-extra

# local version: 1.2.0.1

@test "an empty string" {
  run gawk -f reverse-string.awk <<< ""

  assert_success
  assert_output ""
}

@test "a word" {
  run gawk -f reverse-string.awk <<< "robot"

  assert_success
  assert_output "tobor"
}

@test "a capitalised word" {
  run gawk -f reverse-string.awk <<< "Ramen"

  assert_success
  assert_output "nemaR"
}

@test "a sentence with punctuation" {
  run gawk -f reverse-string.awk <<< "I'm hungry!"

  assert_success
  assert_output "!yrgnuh m'I"
}

@test "a palindrome" {
  run gawk -f reverse-string.awk <<< "racecar"

  assert_success
  assert_output "racecar"
}

@test "an even-sized word" {
  run gawk -f reverse-string.awk <<< "drawer"

  assert_success
  assert_output "reward"
}
