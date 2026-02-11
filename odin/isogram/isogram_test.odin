package isogram

import "core:testing"

@(test)
/// description = empty string
test_empty_string :: proc(t: ^testing.T) {
	input := ""
	result := is_isogram(input)
	expected := true
	testing.expect_value(t, result, expected)
}

@(test)
/// description = isogram with only lower case characters
test_isogram_with_only_lower_case_characters :: proc(t: ^testing.T) {
	input := "isogram"
	result := is_isogram(input)
	expected := true
	testing.expect_value(t, result, expected)
}

@(test)
/// description = word with one duplicated character
test_word_with_one_duplicated_character :: proc(t: ^testing.T) {
	input := "eleven"
	result := is_isogram(input)
	expected := false
	testing.expect_value(t, result, expected)
}

@(test)
/// description = word with one duplicated character from the end of the alphabet
test_word_with_one_duplicated_character_from_the_end_of_the_alphabet :: proc(t: ^testing.T) {
	input := "zzyzx"
	result := is_isogram(input)
	expected := false
	testing.expect_value(t, result, expected)
}

@(test)
/// description = longest reported english isogram
test_longest_reported_english_isogram :: proc(t: ^testing.T) {
	input := "subdermatoglyphic"
	result := is_isogram(input)
	expected := true
	testing.expect_value(t, result, expected)
}

@(test)
/// description = word with duplicated character in mixed case
test_word_with_duplicated_character_in_mixed_case :: proc(t: ^testing.T) {
	input := "Alphabet"
	result := is_isogram(input)
	expected := false
	testing.expect_value(t, result, expected)
}

@(test)
/// description = word with duplicated character in mixed case, lowercase first
test_word_with_duplicated_character_in_mixed_case_lowercase_first :: proc(t: ^testing.T) {
	input := "alphAbet"
	result := is_isogram(input)
	expected := false
	testing.expect_value(t, result, expected)
}

@(test)
/// description = hypothetical isogrammic word with hyphen
test_hypothetical_isogrammic_word_with_hyphen :: proc(t: ^testing.T) {
	input := "thumbscrew-japingly"
	result := is_isogram(input)
	expected := true
	testing.expect_value(t, result, expected)
}

@(test)
/// description = hypothetical word with duplicated character following hyphen
test_hypothetical_word_with_duplicated_character_following_hyphen :: proc(t: ^testing.T) {
	input := "thumbscrew-jappingly"
	result := is_isogram(input)
	expected := false
	testing.expect_value(t, result, expected)
}

@(test)
/// description = isogram with duplicated hyphen
test_isogram_with_duplicated_hyphen :: proc(t: ^testing.T) {
	input := "six-year-old"
	result := is_isogram(input)
	expected := true
	testing.expect_value(t, result, expected)
}

@(test)
/// description = made-up name that is an isogram
test_made_up_name_that_is_an_isogram :: proc(t: ^testing.T) {
	input := "Emily Jung Schwartzkopf"
	result := is_isogram(input)
	expected := true

	testing.expect_value(t, result, expected)
}

@(test)
/// description = duplicated character in the middle
test_duplicated_character_in_the_middle :: proc(t: ^testing.T) {
	input := "accentor"
	result := is_isogram(input)
	expected := false
	testing.expect_value(t, result, expected)
}

@(test)
/// description = same first and last characters
test_same_first_and_last_characters :: proc(t: ^testing.T) {
	input := "angola"
	result := is_isogram(input)
	expected := false
	testing.expect_value(t, result, expected)
}

@(test)
/// description = word with duplicated character and with two hyphens
test_word_with_duplicated_character_and_with_two_hyphens :: proc(t: ^testing.T) {
	input := "up-to-date"
	result := is_isogram(input)
	expected := false
	testing.expect_value(t, result, expected)
}
