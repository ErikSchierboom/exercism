package isbn_verifier

import "core:testing"

@(test)
/// description = valid isbn
test_valid_isbn :: proc(t: ^testing.T) {

	testing.expect(t, is_valid("3-598-21508-8"))
}

@(test)
/// description = invalid isbn check digit
test_invalid_isbn_check_digit :: proc(t: ^testing.T) {

	testing.expect(t, !is_valid("3-598-21508-9"))
}

@(test)
/// description = valid isbn with a check digit of 10
test_valid_isbn_with_a_check_digit_of_10 :: proc(t: ^testing.T) {

	testing.expect(t, is_valid("3-598-21507-X"))

}

@(test)
/// description = check digit is a character other than X
test_check_digit_is_a_character_other_than_x :: proc(t: ^testing.T) {

	testing.expect(t, !is_valid("3-598-21507-A"))
}

@(test)
/// description = invalid check digit in isbn is not treated as zero
test_invalid_check_digit_in_isbn_is_not_treated_as_zero :: proc(t: ^testing.T) {

	testing.expect(t, !is_valid("4-598-21507-B"))
}

@(test)
/// description = invalid character in isbn is not treated as zero
test_invalid_character_in_isbn_is_not_treated_as_zero :: proc(t: ^testing.T) {

	testing.expect(t, !is_valid("3-598-P1581-X"))
}

@(test)
/// description = X is only valid as a check digit
test_x_is_only_valid_as_a_check_digit :: proc(t: ^testing.T) {

	testing.expect(t, !is_valid("3-598-2X507-9"))
}

@(test)
/// description = only one check digit is allowed
test_only_one_check_digit_is_allowed :: proc(t: ^testing.T) {

	testing.expect(t, !is_valid("3-598-21508-96"))
}

@(test)
/// description = X is not substituted by the value 10
test_x_is_not_substituted_by_the_value_10 :: proc(t: ^testing.T) {

	testing.expect(t, !is_valid("3-598-2X507-5"))
}

@(test)
/// description = valid isbn without separating dashes
test_valid_isbn_without_separating_dashes :: proc(t: ^testing.T) {

	testing.expect(t, is_valid("3598215088"))
}

@(test)
/// description = isbn without separating dashes and X as check digit
test_isbn_without_separating_dashes_and_x_as_check_digit :: proc(t: ^testing.T) {

	testing.expect(t, is_valid("359821507X"))
}

@(test)
/// description = isbn without check digit and dashes
test_isbn_without_check_digit_and_dashes :: proc(t: ^testing.T) {

	testing.expect(t, !is_valid("359821507"))
}
@(test)
/// description = too long isbn and no dashes
test_too_long_isbn_and_no_dashes :: proc(t: ^testing.T) {

	testing.expect(t, !is_valid("3598215078X"))
}

@(test)
/// description = too short isbn
test_too_short_isbn :: proc(t: ^testing.T) {

	testing.expect(t, !is_valid("00"))
}

@(test)
/// description = isbn without check digit
test_isbn_without_check_digit :: proc(t: ^testing.T) {

	testing.expect(t, !is_valid("3-598-21507"))
}

@(test)
/// description = check digit of X should not be used for 0
test_check_digit_of_x_should_not_be_used_for_0 :: proc(t: ^testing.T) {

	testing.expect(t, !is_valid("3-598-21515-X"))
}

@(test)
/// description = empty isbn
test_empty_isbn :: proc(t: ^testing.T) {

	testing.expect(t, !is_valid(""))
}

@(test)
/// description = input is 9 characters
test_input_is_9_characters :: proc(t: ^testing.T) {

	testing.expect(t, !is_valid("134456729"))
}

@(test)
/// description = invalid characters are not ignored after checking length
test_invalid_characters_are_not_ignored_after_checking_length :: proc(t: ^testing.T) {

	testing.expect(t, !is_valid("3132P34035"))
}

@(test)
/// description = invalid characters are not ignored before checking length
test_invalid_characters_are_not_ignored_before_checking_length :: proc(t: ^testing.T) {

	testing.expect(t, !is_valid("3598P215088"))
}

@(test)
/// description = input is too long but contains a valid isbn
test_input_is_too_long_but_contains_a_valid_isbn :: proc(t: ^testing.T) {

	testing.expect(t, !is_valid("98245726788"))
}
