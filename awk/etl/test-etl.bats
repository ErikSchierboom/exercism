#!/usr/bin/env bats
load bats-extra

@test 'single letter' {
    run gawk -f etl.awk << END_INPUT
1: A
END_INPUT

    assert_success
    assert_output "a,1"
}

@test 'single score with multiple letters' {
    run gawk -f etl.awk << END_INPUT
1:  "A", "E", "I", "O", "U"
END_INPUT

    assert_success
    assert_line --index 0 -- "a,1"
    assert_line --index 1 -- "e,1"
    assert_line --index 2 -- "i,1"
    assert_line --index 3 -- "o,1"
    assert_line --index 4 -- "u,1"
    assert_equal "${#lines[@]}" 5
}

@test 'a score with no letters' {
    run gawk -f etl.awk << END_INPUT
1: A
7: 
END_INPUT

    assert_success
    assert_output "a,1"
}

@test 'multiple scores with multiple letters' {
    run gawk -f etl.awk << END_INPUT
1:  "E", "A"
2:"D","G"
END_INPUT

    assert_success
    assert_line --index 0 -- "a,1"
    assert_line --index 1 -- "d,2"
    assert_line --index 2 -- "e,1"
    assert_line --index 3 -- "g,2"
    assert_equal "${#lines[@]}" 4
}

@test 'multiple scores with multiple letters, blank lines' {
    run gawk -f etl.awk << END_INPUT

2:"D","G"
        
1:  "E", "A"
END_INPUT

    assert_success
    assert_line --index 0 -- "a,1"
    assert_line --index 1 -- "d,2"
    assert_line --index 2 -- "e,1"
    assert_line --index 3 -- "g,2"
    assert_equal "${#lines[@]}" 4
}

@test 'multiple scores with differing numbers of letters' {
    
    # there are tab characters below
    run gawk -f etl.awk << END_INPUT
1:	"A", "E", "I", "O", "U", "L", "N", "R", "S", "T"
2:	"D", "G"
4:	"F", "H", "V", "W", "Y"
3:	"m", "B", "C", "P"
5:	"K"
8:	"J", "X"
10:	"Q", "Z"
END_INPUT

    assert_success
    assert_line --index  0 -- a,1
    assert_line --index  1 -- b,3
    assert_line --index  2 -- c,3
    assert_line --index  3 -- d,2
    assert_line --index  4 -- e,1
    assert_line --index  5 -- f,4
    assert_line --index  6 -- g,2
    assert_line --index  7 -- h,4
    assert_line --index  8 -- i,1
    assert_line --index  9 -- j,8
    assert_line --index 10 -- k,5
    assert_line --index 11 -- l,1
    assert_line --index 12 -- m,3
    assert_line --index 13 -- n,1
    assert_line --index 14 -- o,1
    assert_line --index 15 -- p,3
    assert_line --index 16 -- q,10
    assert_line --index 17 -- r,1
    assert_line --index 18 -- s,1
    assert_line --index 19 -- t,1
    assert_line --index 20 -- u,1
    assert_line --index 21 -- v,4
    assert_line --index 22 -- w,4
    assert_line --index 23 -- x,8
    assert_line --index 24 -- y,4
    assert_line --index 25 -- z,10
    assert_equal "${#lines[@]}" 26
}
