#!/usr/bin/env bats
load bats-extra

@test "1" {
  run gawk -f grains.awk <<< 1
  assert_success
  assert_output "1"
}

@test "2" {
  run gawk -f grains.awk <<< 2
  assert_success
  assert_output "2"
}

@test "3" {
  run gawk -f grains.awk <<< 3
  assert_success
  assert_output "4"
}

@test "4" {
  run gawk -f grains.awk <<< 4
  assert_success
  assert_output "8"
}

@test "16" {
  run gawk -f grains.awk <<< 16
  assert_success
  assert_output "32768"
}

@test "32" {
  run gawk -f grains.awk <<< 32
  assert_success
  assert_output "2147483648"
}

@test "64" {
  run gawk -f grains.awk <<< 64
  assert_success
  assert_output "9223372036854775808"
}

@test "square 0 raises an exception" {
  run gawk -f grains.awk <<< 0
  assert_failure
  assert_output "square must be between 1 and 64"
}

@test "negative square raises an exception" {
  run gawk -f grains.awk <<< -1
  assert_failure
  assert_output "square must be between 1 and 64"
}

@test "square greater than 64 raises an exception" {
  run gawk -f grains.awk <<< 65
  assert_failure
  assert_output "square must be between 1 and 64"
}

@test "returns the total number of grains on the board" {
  run gawk -M -f grains.awk <<< total
  assert_success
  assert_output "18446744073709551615"
}
