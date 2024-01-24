#!/usr/bin/env bats
# generated on 2022-11-02T20:59:42Z
load bats-extra

@test 'an empty string' {
    run jq -r -f reverse-string.jq << 'END_INPUT'
        {
          "value": ""
        }
END_INPUT

    assert_success
    expected=''
    assert_equal "$output" "$expected"
}

@test 'a word' {
    run jq -r -f reverse-string.jq << 'END_INPUT'
        {
          "value": "robot"
        }
END_INPUT

    assert_success
    expected='tobor'
    assert_equal "$output" "$expected"
}

@test 'a capitalized word' {
    run jq -r -f reverse-string.jq << 'END_INPUT'
        {
          "value": "Ramen"
        }
END_INPUT

    assert_success
    expected='nemaR'
    assert_equal "$output" "$expected"
}

@test 'a sentence with punctuation' {
    run jq -r -f reverse-string.jq << 'END_INPUT'
        {
          "value": "I'm hungry!"
        }
END_INPUT

    assert_success
    expected='!yrgnuh m'\''I'
    assert_equal "$output" "$expected"
}

@test 'a palindrome' {
    run jq -r -f reverse-string.jq << 'END_INPUT'
        {
          "value": "racecar"
        }
END_INPUT

    assert_success
    expected='racecar'
    assert_equal "$output" "$expected"
}

@test 'an even-sized word' {
    run jq -r -f reverse-string.jq << 'END_INPUT'
        {
          "value": "drawer"
        }
END_INPUT

    assert_success
    expected='reward'
    assert_equal "$output" "$expected"
}

