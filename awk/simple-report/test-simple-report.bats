#!/usr/bin/env bats
load bats-extra

@test "Generate the report" {
    ## task 1
    run gawk -f simple-report.awk input.csv

    assert_success
    assert_line --index 0 "#1, north = 85"
    assert_line --index 1 "#2, east = 66"
    assert_line --index 2 "#3, south = 98"
    assert_line --index 3 "#4, west = 54"
}
