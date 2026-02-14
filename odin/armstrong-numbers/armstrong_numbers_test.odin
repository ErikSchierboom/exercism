package armstrong_numbers

import "core:testing"

@(test)
/// description = Zero is an Armstrong number
test_zero_is_an_armstrong_number :: proc(t: ^testing.T) {
	testing.expect(t, is_armstrong_number(0), "zero is an armstrong number")
}

@(test)
/// description = Single-digit numbers are Armstrong numbers
test_single_digit_numbers_are_armstrong_numbers :: proc(t: ^testing.T) {
	testing.expect(t, is_armstrong_number(5), "single-digit numbers are armstrong numbers")
}

@(test)
/// description = There are no two-digit Armstrong numbers
test_there_are_no_two_digit_armstrong_numbers :: proc(t: ^testing.T) {
	testing.expect(t, !is_armstrong_number(10), "there are no two-digit armstrong numbers")
}

@(test)
/// description = Three-digit number that is an Armstrong number
test_three_digit_number_that_is_an_armstrong_number :: proc(t: ^testing.T) {
	testing.expect(t, is_armstrong_number(153), "three-digit number that is an armstrong number")
}

@(test)
/// description = Three-digit number that is not an Armstrong number
test_three_digit_number_that_is_not_an_armstrong_number :: proc(t: ^testing.T) {
	testing.expect(
		t,
		!is_armstrong_number(100),
		"three-digit number that is not an armstrong number",
	)
}

@(test)
/// description = Four-digit number that is an Armstrong number
test_four_digit_number_that_is_an_armstrong_number :: proc(t: ^testing.T) {
	testing.expect(t, is_armstrong_number(9_474), "four-digit number that is an armstrong number")
}

@(test)
/// description = Four-digit number that is not an Armstrong number
test_four_digit_number_that_is_not_an_armstrong_number :: proc(t: ^testing.T) {
	testing.expect(
		t,
		!is_armstrong_number(9_475),
		"four-digit number that is not an armstrong number",
	)
}

@(test)
/// description = Seven-digit number that is an Armstrong number
test_seven_digit_number_that_is_an_armstrong_number :: proc(t: ^testing.T) {
	testing.expect(
		t,
		is_armstrong_number(9_926_315),
		"seven-digit number that is an armstrong number",
	)
}

@(test)
/// description = Seven-digit number that is not an Armstrong number
test_seven_digit_number_that_is_not_an_armstrong_number :: proc(t: ^testing.T) {
	testing.expect(
		t,
		!is_armstrong_number(9_926_314),
		"seven-digit number that is not an armstrong number",
	)
}

@(test)
/// description = Armstrong number containing seven zeroes
test_armstrong_number_containing_seven_zeroes :: proc(t: ^testing.T) {
	testing.expect(
		t,
		is_armstrong_number(186_709_961_001_538_790_100_634_132_976_990),
		"armstrong number containing seven zeroes",
	)
}

@(test)
/// description = 38 digit number that is not an armstrong number
test_38_digit_number_that_is_not_an_armstrong_number :: proc(t: ^testing.T) {
	testing.expect(
		t,
		!is_armstrong_number(99_999_999_999_999_999_999_999_999_999_999_999_999),
		"38-digit number that is not an armstrong number",
	)
}

@(test)
/// description = The largest and last Armstrong number
test_the_largest_and_last_armstrong_number :: proc(t: ^testing.T) {
	testing.expect(
		t,
		is_armstrong_number(115_132_219_018_763_992_565_095_597_973_971_522_401),
		"the largest and last armstrong number",
	)
}

@(test)
/// description = The largest 128 bit number is not an armstrong number
test_the_largest_128_bit_number_is_not_an_armstrong_number :: proc(t: ^testing.T) {
	testing.expect(
		t,
		!is_armstrong_number(340_282_366_920_938_463_463_374_607_431_768_211_455),
		"the largest 128-bit unsigned integer value is not an armstrong number",
	)
}
