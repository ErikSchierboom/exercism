package binary_search

import "core:testing"

@(test)
/// description = finds a value in an array with one element
test_finds_a_value_in_an_array_with_one_element :: proc(t: ^testing.T) {
	input := []u32{6}
	result := find(input, 6)
	expected := 0
	testing.expect_value(t, result, expected)
}

@(test)
/// description = finds a value in the middle of an array
test_finds_a_value_in_the_middle_of_an_array :: proc(t: ^testing.T) {
	input := []u32{1, 3, 4, 6, 8, 9, 11}
	result := find(input, 6)
	expected := 3
	testing.expect_value(t, result, expected)
}

@(test)
/// description = finds a value at the beginning of an array
test_finds_a_value_at_the_beginning_of_an_array :: proc(t: ^testing.T) {
	input := []u32{1, 3, 4, 6, 8, 9, 11}
	result := find(input, 1)
	expected := 0
	testing.expect_value(t, result, expected)
}

@(test)
/// description = finds a value at the end of an array
test_finds_a_value_at_the_end_of_an_array :: proc(t: ^testing.T) {
	input := []u32{1, 3, 4, 6, 8, 9, 11}
	result := find(input, 11)
	expected := 6
	testing.expect_value(t, result, expected)
}

@(test)
/// description = finds a value in an array of odd length
test_finds_a_value_in_an_array_of_odd_length :: proc(t: ^testing.T) {
	input := []u32{1, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233, 377, 634}
	result := find(input, 144)
	expected := 9
	testing.expect_value(t, result, expected)
}

@(test)
/// description = finds a value in an array of even length
test_finds_a_value_in_an_array_of_even_length :: proc(t: ^testing.T) {
	input := []u32{1, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233, 377}
	result := find(input, 21)
	expected := 5
	testing.expect_value(t, result, expected)
}

@(test)
/// description = identifies that a value is not included in the array
test_identifies_that_a_value_is_not_included_in_the_array :: proc(t: ^testing.T) {
	input := []u32{1, 3, 4, 6, 8, 9, 11}
	_, found := find(input, 7)
	testing.expect_value(t, found, false)
}

@(test)
/// description = a value smaller than the array's smallest value is not found
test_a_value_smaller_than_the_arrays_smallest_value_is_not_found :: proc(t: ^testing.T) {
	input := []u32{1, 3, 4, 6, 8, 9, 11}
	_, found := find(input, 0)
	testing.expect_value(t, found, false)
}

@(test)
/// description = a value larger than the array's largest value is not found
test_a_value_larger_than_the_arrays_largest_value_is_not_found :: proc(t: ^testing.T) {
	input := []u32{1, 3, 4, 6, 8, 9, 11}
	_, found := find(input, 13)
	testing.expect_value(t, found, false)
}

@(test)
/// description = nothing is found in an empty array
test_nothing_is_found_in_an_empty_array :: proc(t: ^testing.T) {
	input := []u32{}
	_, found := find(input, 1)
	testing.expect_value(t, found, false)
}

@(test)
/// description = nothing is found when the left and right bounds cross
test_nothing_is_found_when_the_left_and_right_bounds_cross :: proc(t: ^testing.T) {
	input := []u32{1, 2}
	_, found := find(input, 0)
	testing.expect_value(t, found, false)
}
