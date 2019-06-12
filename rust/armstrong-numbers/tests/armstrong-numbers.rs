use armstrong_numbers::*;

#[test]
fn test_single_digit_numbers_are_armstrong_numbers() {
    assert!(is_armstrong_number(5))
}

#[test]
fn test_there_are_no_2_digit_armstrong_numbers() {
    assert!(!is_armstrong_number(10))
}

#[test]
fn test_three_digit_armstrong_number() {
    assert!(is_armstrong_number(153))
}

#[test]
fn test_three_digit_non_armstrong_number() {
    assert!(!is_armstrong_number(100))
}

#[test]
fn test_four_digit_armstrong_number() {
    assert!(is_armstrong_number(9474))
}

#[test]
fn test_four_digit_non_armstrong_number() {
    assert!(!is_armstrong_number(9475))
}

#[test]
fn test_seven_digit_armstrong_number() {
    assert!(is_armstrong_number(9926315))
}

#[test]
fn test_seven_digit_non_armstrong_number() {
    assert!(!is_armstrong_number(9926316))
}
