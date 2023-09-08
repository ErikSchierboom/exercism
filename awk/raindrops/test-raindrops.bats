#!/usr/bin/env bats
load bats-extra

@test "the sound for 1 is 1" {
  run gawk -v num=1 -f raindrops.awk
  assert_success
  assert_output "1"
}

@test "the sound for 3 is Pling" {
  run gawk -v num=3 -f raindrops.awk
  assert_success
  assert_output "Pling"
}

@test "the sound for 5 is Plang" {
  run gawk -v num=5 -f raindrops.awk
  assert_success
  assert_output "Plang"
}

@test "the sound for 7 is Plong" {
  run gawk -v num=7 -f raindrops.awk
  assert_success
  assert_output "Plong"
}

@test "the sound for 6 is Pling as it has a factor 3" {
  run gawk -v num=6 -f raindrops.awk
  assert_success
  assert_output "Pling"
}

@test "2 to the power 3 does not make a raindrop sound as 3 is the exponent not the base" {
  run gawk -v num=8 -f raindrops.awk
  assert_success
  assert_output "8"
}

@test "the sound for 9 is Pling as it has a factor 3" {
  run gawk -v num=9 -f raindrops.awk
  assert_success
  assert_output "Pling"
}

@test "the sound for 10 is Plang as it has a factor 5" {
  run gawk -v num=10 -f raindrops.awk
  assert_success
  assert_output "Plang"
}

@test "the sound for 14 is Plong as it has a factor of 7" {
  run gawk -v num=14 -f raindrops.awk
  assert_success
  assert_output "Plong"
}

@test "the sound for 15 is PlingPlang as it has factors 3 and 5" {
  run gawk -v num=15 -f raindrops.awk
  assert_success
  assert_output "PlingPlang"
}

@test "the sound for 21 is PlingPlong as it has factors 3 and 7" {
  run gawk -v num=21 -f raindrops.awk
  assert_success
  assert_output "PlingPlong"
}

@test "the sound for 25 is Plang as it has a factor 5" {
  run gawk -v num=25 -f raindrops.awk
  assert_success
  assert_output "Plang"
}

@test "the sound for 27 is Pling as it has a factor 3" {
  run gawk -v num=27 -f raindrops.awk
  assert_success
  assert_output "Pling"
}

@test "the sound for 35 is PlangPlong as it has factors 5 and 7" {
  run gawk -v num=35 -f raindrops.awk
  assert_success
  assert_output "PlangPlong"
}

@test "the sound for 49 is Plong as it has a factor 7" {
  run gawk -v num=49 -f raindrops.awk
  assert_success
  assert_output "Plong"
}

@test "the sound for 52 is 52" {
  run gawk -v num=52 -f raindrops.awk
  assert_success
  assert_output "52"
}

@test "the sound for 105 is PlingPlangPlong as it has factors 3, 5 and 7" {
  run gawk -v num=105 -f raindrops.awk
  assert_success
  assert_output "PlingPlangPlong"
}

@test "the sound for 3125 is Plang as it has a factor 5" {
  run gawk -v num=3125 -f raindrops.awk
  assert_success
  assert_output "Plang"
}
