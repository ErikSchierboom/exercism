#!/usr/bin/env bats
load bats-extra

# local version: 1.0.0.0

@test "slices of one from one" {
      expected="1"
    run gawk -f series.awk -v len=1 <<< 1
    assert_success
    assert_output "$expected"
}

@test "slices of one from two" {
      expected="1 2"
    run gawk -f series.awk -v len=1 <<< 12
    assert_success
    assert_output "$expected"
}

@test "slices of two" {
      expected="35"
    run gawk -f series.awk -v len=2 <<< 35
    assert_success
    assert_output "$expected"
}

@test "slices of two overlap" {
      expected="91 14 42"
    run gawk -f series.awk -v len=2 <<< 9142
    assert_success
    assert_output "$expected"
}

@test "slices can include duplicates" {
      expected="777 777 777 777"
    run gawk -f series.awk -v len=3 <<< 777777
    assert_success
    assert_output "$expected"
}

@test "slices of a long series" {
      expected="91849 18493 84939 49390 93904 39042 90424 04243"
    run gawk -f series.awk -v len=5 <<< 918493904243
    assert_success
    assert_output "$expected"
}

@test "slice length is too large" {
      expected="invalid length"
    run gawk -f series.awk -v len=6 <<< 12345
    assert_failure
    assert_output --partial "$expected"
}

@test "slice length is way too large" {
      expected="invalid length"
    run gawk -f series.awk -v len=42 <<< 12345
    assert_failure
    assert_output --partial "$expected"
}

@test "slice length cannot be zero" {
      expected="invalid length"
    run gawk -f series.awk -v len=0 <<< 12345
    assert_failure
    assert_output --partial "$expected"
}

@test "slice length cannot be negative" {
      expected="invalid length"
    run gawk -f series.awk -v len=-1 <<< 123
    assert_failure
    assert_output --partial "$expected"
}

@test "empty series is invalid" {
      expected="series cannot be empty"
    run gawk -f series.awk -v len=1 <<< ""
    assert_failure
    assert_output --partial "$expected"
}
