#!/usr/bin/env bats
load bats-extra

@test "Say Hi!" {
  run gawk -f hello-world.awk

  # the program's exit status should be success (0)
  assert_success

  # program's output should be the expected text
  assert_output "Hello, World!"
}
