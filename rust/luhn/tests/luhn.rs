use luhn::*;

#[test]
fn single_digit_strings_can_not_be_valid() {
    assert!(!is_valid("1"));
}

#[test]
fn a_single_zero_is_invalid() {
    assert!(!is_valid("0"));
}

#[test]
fn a_simple_valid_sin_that_remains_valid_if_reversed() {
    assert!(is_valid("059"));
}

#[test]
fn a_simple_valid_sin_that_becomes_invalid_if_reversed() {
    assert!(is_valid("59"));
}

#[test]
fn a_valid_canadian_sin() {
    assert!(is_valid("055 444 285"));
}

#[test]
fn invalid_canadian_sin() {
    assert!(!is_valid("055 444 286"));
}

#[test]
fn invalid_credit_card() {
    assert!(!is_valid("8273 1232 7352 0569"));
}

#[test]
fn invalid_long_number_with_an_even_remainder() {
    assert!(!is_valid("1 2345 6789 1234 5678 9012"));
}

#[test]
fn invalid_long_number_with_a_remainder_divisible_by_5() {
    assert!(!is_valid("1 2345 6789 1234 5678 9013"));
}

#[test]
fn valid_number_with_an_even_number_of_digits() {
    assert!(is_valid("095 245 88"));
}

#[test]
fn valid_number_with_an_odd_number_of_spaces() {
    assert!(is_valid("234 567 891 234"));
}

#[test]
fn valid_strings_with_a_non_digit_added_at_the_end_become_invalid() {
    assert!(!is_valid("059a"));
}

#[test]
fn valid_strings_with_punctuation_included_become_invalid() {
    assert!(!is_valid("055-444-285"));
}

#[test]
fn valid_strings_with_symbols_included_become_invalid() {
    assert!(!is_valid("055# 444$ 285"));
}

#[test]
fn single_zero_with_space_is_invalid() {
    assert!(!is_valid(" 0"));
}

#[test]
fn more_than_a_single_zero_is_valid() {
    assert!(is_valid("0000 0"));
}

#[test]
fn input_digit_9_is_correctly_converted_to_output_digit_9() {
    assert!(is_valid("091"));
}

#[test]
fn very_long_input_is_valid() {
    assert!(is_valid("9999999999 9999999999 9999999999 9999999999"));
}

#[test]
fn valid_luhn_with_an_odd_number_of_digits_and_non_zero_first_digit() {
    assert!(is_valid("109"));
}

#[test]
fn using_ascii_value_for_non_doubled_non_digit_isn_t_allowed() {
    assert!(!is_valid("055b 444 285"));
}

#[test]
fn using_ascii_value_for_doubled_non_digit_isn_t_allowed() {
    assert!(!is_valid(":9"));
}

#[test]
fn non_numeric_non_space_char_in_the_middle_with_a_sum_that_s_divisible_by_10_isn_t_allowed() {
    assert!(!is_valid("59%59"));
}
