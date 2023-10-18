#!/usr/bin/env bats
load bats-extra

@test "Missed target" {
    run gawk -f darts.awk <<< '-9 9'
    assert_success
    assert_output "0"
}

@test "On the outer circle" {
    run gawk -f darts.awk <<< '0 10'
    assert_success
    assert_output "1"
}

@test "On the middle circle" {
    run gawk -f darts.awk <<< '-5 0'
    assert_success
    assert_output "5"
}

@test "On the inner circle" {
    run gawk -f darts.awk <<< '0 -1'
    assert_success
    assert_output "10"
}

@test "Exactly on centre" {
    run gawk -f darts.awk <<< '0 0'
    assert_success
    assert_output "10"
}

@test "Near the centre" {
    run gawk -f darts.awk <<< '-0.1 -0.1'
    assert_success
    assert_output "10"
}

@test "Just within the inner circle" {
    run gawk -f darts.awk <<< '0.7 0.7'
    assert_success
    assert_output "10"
}

@test "Just outside the inner circle" {
    run gawk -f darts.awk <<< '0.8 -0.8'
    assert_success
    assert_output "5"
}

@test "Just within the middle circle" {
    run gawk -f darts.awk <<< '-3.5 3.5'
    assert_success
    assert_output "5"
}   

@test "Just outside the middle circle" {
    run gawk -f darts.awk <<< '-3.6 -3.6'
    assert_success
    assert_output "1"
}     

@test "Just within the outer circle" {
    run gawk -f darts.awk <<< '-7.0 7.0'
    assert_success
    assert_output "1"
}     

@test "Just outside the outer circle" {
    run gawk -f darts.awk <<< '7.1 -7.1'
    assert_success
    assert_output "0"
}    

@test "Asymmetric position between the inner and middle circles" {
    run gawk -f darts.awk <<< '0.5 -4'
    assert_success
    assert_output "5"
}
