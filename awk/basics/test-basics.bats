#!/usr/bin/env bats
load bats-extra

@test "List the usernames" {
    ## task 1
    run bash basics.sh

    assert_success
    assert_line --index 0 "root"
    assert_line --index 1 "john"
    assert_line --index 2 "jane"
    assert_line --index 3 "mark"
    assert_line --index 4 "susan"
    assert_line --index 5 "peter"
    assert_line --index 6 "bill"
}

@test "Print the line numbers" {
    ## task 2
    run bash basics.sh

    assert_success
    assert_line --index 7 "1"
    assert_line --index 8 "2"
    assert_line --index 9 "3"
    assert_line --index 10 "4"
    assert_line --index 11 "5"
    assert_line --index 12 "6"
    assert_line --index 13 "7"
}

@test "Print records with invalid home directories" {
    ## task 3
    run bash basics.sh

    assert_success
    assert_line --index 14 "susan:x:1004:1004:Susan Johnson:/invalid/home:/bin/bash"
    assert_line --index 15 "bill:x:1006:1004:Bill Gates:/invalid/steve:/usr/local/bin/pwsh"
}

@test "Print the valid users who use bash" {
    ## task 4
    run bash basics.sh

    assert_success
    assert_line --index 16 "root:x:0:0:root:/root:/bin/bash"
    assert_line --index 17 "john:x:1001:1001:John Doe:/home/john:/bin/bash"
    assert_line --index 18 "jane:x:1002:1002:Jane Doe:/home/jane:/bin/bash"
}
