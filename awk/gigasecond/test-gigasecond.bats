#!/usr/bin/env bats
load bats-extra

# Ensure your date calculations are done using UTC time zone

@test 'date only specificaion of time' {
  run gawk -f gigasecond.awk <<< '2011-04-25'

  assert_success
  assert_output "2043-01-01T01:46:40"
}

@test 'second test for date only specification of time' {
  run gawk -f gigasecond.awk <<< '1977-06-13'

  assert_success
  assert_output "2009-02-19T01:46:40"
}

@test 'third test for date only specification of time' {
  run gawk -f gigasecond.awk <<< '1959-07-19'

  assert_success
  assert_output "1991-03-27T01:46:40"
}

@test 'full time specified' {
  run gawk -f gigasecond.awk <<< '2015-01-24T22:00:00'

  assert_success
  assert_output "2046-10-02T23:46:40"
}

@test 'full time with day roll-over' {
  run gawk -f gigasecond.awk <<< '2015-01-24T23:59:59'

  assert_success
  assert_output "2046-10-03T01:46:39"
}
