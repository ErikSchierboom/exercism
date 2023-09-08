#!/usr/bin/env bats
load bats-extra

@test "stating something" {
  run gawk -f bob.awk <<< 'Tom-ay-to, tom-aaaah-to.'
  assert_success
  assert_output "Whatever."
}

@test "shouting" {
  run gawk -f bob.awk <<< 'WATCH OUT!'
  assert_success
  assert_output "Whoa, chill out!"
}

@test "shouting gibberish" {
  run gawk -f bob.awk <<< 'FCECDFCAAB'
  assert_success
  assert_output "Whoa, chill out!"
}

@test "asking a question" {
  run gawk -f bob.awk <<< 'Does this cryogenic chamber make me look fat?'
  assert_success
  assert_output "Sure."
}

@test "asking a numeric question" {
  run gawk -f bob.awk <<< 'You are, what, like 15?'
  assert_success
  assert_output "Sure."
}

@test "asking gibberish" {
  run gawk -f bob.awk <<< 'fffbbcbeab?'
  assert_success
  assert_output "Sure."
}

@test "talking forcefully" {
  run gawk -f bob.awk <<< "Hi there!"
  assert_success
  assert_output "Whatever."
}

@test "using acronyms in regular speech" {
  run gawk -f bob.awk <<< "It's OK if you don't want to go work for NASA."
  assert_success
  assert_output "Whatever."
}

@test "forceful question" {
  run gawk -f bob.awk <<< "WHAT'S GOING ON?"
  assert_success
  assert_output "Calm down, I know what I'm doing!"
}

@test "shouting numbers" {
  run gawk -f bob.awk <<< '1, 2, 3 GO!'
  assert_success
  assert_output "Whoa, chill out!"
}

@test "no letters" {
  run gawk -f bob.awk <<< '1, 2, 3'
  assert_success
  assert_output "Whatever."
}

@test "question with no letters" {
  run gawk -f bob.awk <<< '4?'
  assert_success
  assert_output "Sure."
}

@test "shouting with special characters" {
  run gawk -f bob.awk <<< 'ZOMG THE %^*@#$(*^ ZOMBIES ARE COMING!!11!!1!'
  assert_success
  assert_output "Whoa, chill out!"
}

@test "shouting with no exclamation mark" {
  run gawk -f bob.awk <<< 'I HATE THE DENTIST'
  assert_success
  assert_output "Whoa, chill out!"
}

@test "statement containing question mark" {
  run gawk -f bob.awk <<< 'Ending with ? means a question.'
  assert_success
  assert_output "Whatever."
}

@test "non-letters with question" {
  run gawk -f bob.awk <<< ':) ?'
  assert_success
  assert_output "Sure."
}

@test "prattling on" {
  run gawk -f bob.awk <<< 'Wait! Hang on. Are you going to be OK?'
  assert_success
  assert_output "Sure."
}

@test "silence" {
  run gawk -f bob.awk <<< ''
  assert_success
  assert_output "Fine. Be that way!"
}

@test "prolonged silence" {
  run gawk -f bob.awk <<< '          '
  assert_success
  assert_output "Fine. Be that way!"
}

@test "alternate silence" {
  run gawk -f bob.awk <<< $'\t\t\t\t\t\t\t\t\t\t'
  assert_success
  assert_output "Fine. Be that way!"
}

@test "multiple line question" {
  run gawk -f bob.awk <<< $'\nDoes this cryogenic chamber make me look fat?\nNo'
  assert_success
  assert_output "Whatever."
}

@test "starting with whitespace" {
  run gawk -f bob.awk <<< '         hmmmmmmm...'
  assert_success
  assert_output "Whatever."
}

@test "ending with whitespace" {
  run gawk -f bob.awk <<< 'Okay if like my  spacebar  quite a bit?   '
  assert_success
  assert_output "Sure."
}

@test "other whitespace" {
  run gawk -f bob.awk <<< $'\n\r \t'
  assert_success
  assert_output "Fine. Be that way!"
}

@test "non-question ending with whitespace" {
  run gawk -f bob.awk <<< 'This is a statement ending with whitespace      '
  assert_success
  assert_output "Whatever."
}

@test "no input is silence" {
  run gawk -f bob.awk </dev/null
  assert_success
  assert_output "Fine. Be that way!"
}
