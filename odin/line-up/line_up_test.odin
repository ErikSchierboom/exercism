package line_up

import "core:testing"

@(test)
/// description = format smallest non-exceptional ordinal numeral 4
test_format_smallest_non_exceptional_ordinal_numeral_4 :: proc(t: ^testing.T) {
	testing.expect_value(
		t,
		format("Gianna", 4),
		"Gianna, you are the 4th customer we serve today. Thank you!",
	)
}

@(test)
/// description = format greatest single digit non-exceptional ordinal numeral 9
test_format_greatest_single_digit_non_exceptional_ordinal_numeral_9 :: proc(t: ^testing.T) {
	testing.expect_value(
		t,
		format("Maarten", 9),
		"Maarten, you are the 9th customer we serve today. Thank you!",
	)
}

@(test)
/// description = format non-exceptional ordinal numeral 5
test_format_non_exceptional_ordinal_numeral_5 :: proc(t: ^testing.T) {
	testing.expect_value(
		t,
		format("Petronila", 5),
		"Petronila, you are the 5th customer we serve today. Thank you!",
	)
}

@(test)
/// description = format non-exceptional ordinal numeral 6
test_format_non_exceptional_ordinal_numeral_6 :: proc(t: ^testing.T) {
	testing.expect_value(
		t,
		format("Attakullakulla", 6),
		"Attakullakulla, you are the 6th customer we serve today. Thank you!",
	)
}

@(test)
/// description = format non-exceptional ordinal numeral 7
test_format_non_exceptional_ordinal_numeral_7 :: proc(t: ^testing.T) {
	testing.expect_value(
		t,
		format("Kate", 7),
		"Kate, you are the 7th customer we serve today. Thank you!",
	)
}

@(test)
/// description = format non-exceptional ordinal numeral 8
test_format_non_exceptional_ordinal_numeral_8 :: proc(t: ^testing.T) {
	testing.expect_value(
		t,
		format("Maximiliano", 8),
		"Maximiliano, you are the 8th customer we serve today. Thank you!",
	)
}

@(test)
/// description = format exceptional ordinal numeral 1
test_format_exceptional_ordinal_numeral_1 :: proc(t: ^testing.T) {
	testing.expect_value(
		t,
		format("Mary", 1),
		"Mary, you are the 1st customer we serve today. Thank you!",
	)
}

@(test)
/// description = format exceptional ordinal numeral 2
test_format_exceptional_ordinal_numeral_2 :: proc(t: ^testing.T) {
	testing.expect_value(
		t,
		format("Haruto", 2),
		"Haruto, you are the 2nd customer we serve today. Thank you!",
	)
}

@(test)
/// description = format exceptional ordinal numeral 3
test_format_exceptional_ordinal_numeral_3 :: proc(t: ^testing.T) {
	testing.expect_value(
		t,
		format("Henriette", 3),
		"Henriette, you are the 3rd customer we serve today. Thank you!",
	)
}

@(test)
/// description = format smallest two digit non-exceptional ordinal numeral 10
test_format_smallest_two_digit_non_exceptional_ordinal_numeral_10 :: proc(t: ^testing.T) {
	testing.expect_value(
		t,
		format("Alvarez", 10),
		"Alvarez, you are the 10th customer we serve today. Thank you!",
	)
}

@(test)
/// description = format non-exceptional ordinal numeral 11
test_format_non_exceptional_ordinal_numeral_11 :: proc(t: ^testing.T) {
	testing.expect_value(
		t,
		format("Jacqueline", 11),
		"Jacqueline, you are the 11th customer we serve today. Thank you!",
	)
}

@(test)
/// description = format non-exceptional ordinal numeral 12
test_format_non_exceptional_ordinal_numeral_12 :: proc(t: ^testing.T) {
	testing.expect_value(
		t,
		format("Juan", 12),
		"Juan, you are the 12th customer we serve today. Thank you!",
	)
}

@(test)
/// description = format non-exceptional ordinal numeral 13
test_format_non_exceptional_ordinal_numeral_13 :: proc(t: ^testing.T) {
	testing.expect_value(
		t,
		format("Patricia", 13),
		"Patricia, you are the 13th customer we serve today. Thank you!",
	)
}

@(test)
/// description = format exceptional ordinal numeral 21
test_format_exceptional_ordinal_numeral_21 :: proc(t: ^testing.T) {
	testing.expect_value(
		t,
		format("Washi", 21),
		"Washi, you are the 21st customer we serve today. Thank you!",
	)
}

@(test)
/// description = format exceptional ordinal numeral 62
test_format_exceptional_ordinal_numeral_62 :: proc(t: ^testing.T) {
	testing.expect_value(
		t,
		format("Nayra", 62),
		"Nayra, you are the 62nd customer we serve today. Thank you!",
	)
}

@(test)
/// description = format exceptional ordinal numeral 100
test_format_exceptional_ordinal_numeral_100 :: proc(t: ^testing.T) {
	testing.expect_value(
		t,
		format("John", 100),
		"John, you are the 100th customer we serve today. Thank you!",
	)
}

@(test)
/// description = format exceptional ordinal numeral 101
test_format_exceptional_ordinal_numeral_101 :: proc(t: ^testing.T) {
	testing.expect_value(
		t,
		format("Zeinab", 101),
		"Zeinab, you are the 101st customer we serve today. Thank you!",
	)
}

@(test)
/// description = format non-exceptional ordinal numeral 112
test_format_non_exceptional_ordinal_numeral_112 :: proc(t: ^testing.T) {
	testing.expect_value(
		t,
		format("Knud", 112),
		"Knud, you are the 112th customer we serve today. Thank you!",
	)
}

@(test)
/// description = format exceptional ordinal numeral 123
test_format_exceptional_ordinal_numeral_123 :: proc(t: ^testing.T) {
	testing.expect_value(
		t,
		format("Yma", 123),
		"Yma, you are the 123rd customer we serve today. Thank you!",
	)
}
