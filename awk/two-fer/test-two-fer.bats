#!/usr/bin/env bats
load bats-extra

setup() {
    echo > empty.txt
    echo "Alice" > one.txt
}

teardown() {
    rm empty.txt one.txt
}


@test "no file given" {
  # The above line controls whether to skip the test.
  # Normally, we skip every test except for the first one
  # (the first one is always commented out).  This allows for
  # a person to focus on solving a test at a time: you can
  # comment out or delete the
  # `[[ $BATS_RUN_SKIPPED == "true" ]] || skip`
  # line to run the test when you are ready.
  #
  # You can also run all the tests by setting the
  # `$BATS_RUN_SKIPPED` environment variable, like this:
  #
  #     $ BATS_RUN_SKIPPED=true bats test-two-fer.bats

  run gawk -f two-fer.awk < /dev/null
  assert_success
  assert_output "One for you, one for me."
}

@test "empty file given" {
  run gawk -f two-fer.awk empty.txt
  assert_success
  assert_output "One for you, one for me."
}

@test "a name given" {
  run gawk -f two-fer.awk one.txt
  assert_success
  assert_output "One for Alice, one for me."
}

@test "name with a space" {
  run gawk -f two-fer.awk <<< "Mary Ann"
  assert_success
  assert_output "One for Mary Ann, one for me."
}
