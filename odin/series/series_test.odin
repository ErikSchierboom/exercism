package series

import "core:fmt"
import "core:testing"

expect_slices_match :: proc(t: ^testing.T, actual, expected: []$E, loc := #caller_location) {

	result := fmt.aprintf("%v", actual)
	exp_str := fmt.aprintf("%v", expected)
	defer {
		delete(result)
		delete(exp_str)
	}

	testing.expect_value(t, result, exp_str, loc = loc)
}

@(test)
/// description = slices of one from one
test_slices_of_one_from_one :: proc(t: ^testing.T) {

	result, error := series("1", 1)
	defer delete(result)

	testing.expect_value(t, error, Error.None)
	expect_slices_match(t, result, []string{"1"})
}

@(test)
/// description = slices of one from two
test_slices_of_one_from_two :: proc(t: ^testing.T) {

	result, error := series("12", 1)
	defer delete(result)

	testing.expect_value(t, error, Error.None)
	expect_slices_match(t, result, []string{"1", "2"})
}

@(test)
/// description = slices of two
test_slices_of_two :: proc(t: ^testing.T) {

	result, error := series("35", 2)
	defer delete(result)

	testing.expect_value(t, error, Error.None)
	expect_slices_match(t, result, []string{"35"})
}

@(test)
/// description = slices of two overlap
test_slices_of_two_overlap :: proc(t: ^testing.T) {

	result, error := series("9142", 2)
	defer delete(result)

	testing.expect_value(t, error, Error.None)
	expect_slices_match(t, result, []string{"91", "14", "42"})
}

@(test)
/// description = slices can include duplicates
test_slices_can_include_duplicates :: proc(t: ^testing.T) {

	result, error := series("777777", 3)
	defer delete(result)

	testing.expect_value(t, error, Error.None)
	expect_slices_match(t, result, []string{"777", "777", "777", "777"})
}

@(test)
/// description = slices of a long series
test_slices_of_a_long_series :: proc(t: ^testing.T) {

	result, error := series("918493904243", 5)
	defer delete(result)

	testing.expect_value(t, error, Error.None)
	expect_slices_match(
		t,
		result,
		[]string{"91849", "18493", "84939", "49390", "93904", "39042", "90424", "04243"},
	)
}

@(test)
/// description = slice length is too large
test_slice_length_is_too_large :: proc(t: ^testing.T) {

	result, error := series("12345", 6)
	defer delete(result)

	testing.expect_value(t, error, Error.Invalid_Series_Length_Too_Large)
}

@(test)
/// description = slice length is way too large
test_slice_length_is_way_too_large :: proc(t: ^testing.T) {

	result, error := series("12345", 42)
	defer delete(result)

	testing.expect_value(t, error, Error.Invalid_Series_Length_Too_Large)
}

@(test)
/// description = slice length cannot be zero
test_slice_length_cannot_be_zero :: proc(t: ^testing.T) {

	result, error := series("12345", 0)
	defer delete(result)

	testing.expect_value(t, error, Error.Invalid_Series_Length_Zero)
}

@(test)
/// description = slice length cannot be negative
test_slice_length_cannot_be_negative :: proc(t: ^testing.T) {

	result, error := series("12345", -1)
	defer delete(result)

	testing.expect_value(t, error, Error.Invalid_Series_Length_Negative)
}

@(test)
/// description = empty series is invalid
test_empty_series_is_invalid :: proc(t: ^testing.T) {

	result, error := series("", 1)
	defer delete(result)

	testing.expect_value(t, error, Error.Invalid_Sequence_Empty)
}
