#!/usr/bin/env bats
load bats-extra

# local version: 1.2.0.0

# encode

@test "encode yes" {
  run gawk -f atbash-cipher.awk -v direction=encode <<< "yes"
  assert_success
  assert_output "bvh"
}

@test "encode no" {
  run gawk -f atbash-cipher.awk -v direction=encode <<< "no"
  assert_success
  assert_output "ml"
}

@test "encode OMG" {
  run gawk -f atbash-cipher.awk -v direction=encode <<< "OMG"
  assert_success
  assert_output "lnt"
}

@test "encode spaces" {
  run gawk -f atbash-cipher.awk -v direction=encode <<< "O M G"
  assert_success
  assert_output "lnt"
}

@test "encode mindblowingly" {
  run gawk -f atbash-cipher.awk -v direction=encode <<< "mindblowingly"
  assert_success
  assert_output "nrmwy oldrm tob"
}

@test "encode numbers" {
  run gawk -f atbash-cipher.awk -v direction=encode <<< "Testing,1 2 3, testing."
  assert_success
  assert_output "gvhgr mt123 gvhgr mt"
}

@test "encode deep thought" {
  run gawk -f atbash-cipher.awk -v direction=encode <<< "Truth is fiction."
  assert_success
  assert_output "gifgs rhurx grlm"
}

@test "encode all the letters" {
  run gawk -f atbash-cipher.awk -v direction=encode <<< "The quick brown fox jumps over the lazy dog."
  assert_success
  assert_output "gsvjf rxpyi ldmul cqfnk hlevi gsvoz abwlt"
}

# decode

@test "decode exercism" {
  run gawk -f atbash-cipher.awk -v direction=decode <<< "vcvix rhn"
  assert_success
  assert_output "exercism"
}

@test "decode a sentence" {
  run gawk -f atbash-cipher.awk -v direction=decode <<< "zmlyh gzxov rhlug vmzhg vkkrm thglm v"
  assert_success
  assert_output "anobstacleisoftenasteppingstone"
}

@test "decode numbers" {
  run gawk -f atbash-cipher.awk -v direction=decode <<< "gvhgr mt123 gvhgr mt"
  assert_success
  assert_output "testing123testing"
}

@test "decode all the letters" {
  run gawk -f atbash-cipher.awk -v direction=decode <<< "gsvjf rxpyi ldmul cqfnk hlevi gsvoz abwlt"
  assert_success
  assert_output "thequickbrownfoxjumpsoverthelazydog"
}

@test "decode with too many spaces" {
  run gawk -f atbash-cipher.awk -v direction=decode <<< "vc vix    r hn"
  assert_success
  assert_output "exercism"
}

@test "decode with no spaces" {
  run gawk -f atbash-cipher.awk -v direction=decode <<< "zmlyhgzxovrhlugvmzhgvkkrmthglmv"
  assert_success
  assert_output "anobstacleisoftenasteppingstone"
}

