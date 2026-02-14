package bob

import "core:testing"

@(test)
/// description = stating something
test_stating_something :: proc(t: ^testing.T) {
	input := "Tom-ay-to, tom-aaaah-to."
	result := response(input)
	expected := "Whatever."

	testing.expect_value(t, result, expected)
}

@(test)
/// description = shouting
test_shouting :: proc(t: ^testing.T) {
	input := "WATCH OUT!"
	result := response(input)
	expected := "Whoa, chill out!"

	testing.expect_value(t, result, expected)
}

@(test)
/// description = shouting gibberish
test_shouting_gibberish :: proc(t: ^testing.T) {
	input := "FCECDFCAAB"
	result := response(input)
	expected := "Whoa, chill out!"

	testing.expect_value(t, result, expected)
}

@(test)
/// description = asking a question
test_asking_a_question :: proc(t: ^testing.T) {
	input := "Does this cryogenic chamber make me look fat?"
	result := response(input)
	expected := "Sure."

	testing.expect_value(t, result, expected)
}

@(test)
/// description = asking a numeric question
test_asking_a_numeric_question :: proc(t: ^testing.T) {
	input := "You are, what, like 15?"
	result := response(input)
	expected := "Sure."

	testing.expect_value(t, result, expected)
}

@(test)
/// description = asking gibberish
test_asking_gibberish :: proc(t: ^testing.T) {
	input := "fffbbcbeab?"
	result := response(input)
	expected := "Sure."

	testing.expect_value(t, result, expected)
}

@(test)
/// description = talking forcefully
test_talking_forcefully :: proc(t: ^testing.T) {
	input := "Hi there!"
	result := response(input)
	expected := "Whatever."

	testing.expect_value(t, result, expected)
}

@(test)
/// description = using acronyms in regular speech
test_using_acronyms_in_regular_speech :: proc(t: ^testing.T) {
	input := "It's OK if you don't want to go work for NASA."
	result := response(input)
	expected := "Whatever."

	testing.expect_value(t, result, expected)
}

@(test)
/// description = forceful question
test_forceful_question :: proc(t: ^testing.T) {
	input := "WHAT'S GOING ON?"
	result := response(input)
	expected := "Calm down, I know what I'm doing!"

	testing.expect_value(t, result, expected)
}

@(test)
/// description = shouting numbers
test_shouting_numbers :: proc(t: ^testing.T) {
	input := "1, 2, 3 GO!"
	result := response(input)
	expected := "Whoa, chill out!"

	testing.expect_value(t, result, expected)
}

@(test)
/// description = no letters
test_no_letters :: proc(t: ^testing.T) {
	input := "1, 2, 3"
	result := response(input)
	expected := "Whatever."

	testing.expect_value(t, result, expected)
}

@(test)
/// description = question with no letters
test_question_with_no_letters :: proc(t: ^testing.T) {
	input := "4?"
	result := response(input)
	expected := "Sure."

	testing.expect_value(t, result, expected)
}

@(test)
/// description = shouting with special characters
test_shouting_with_special_characters :: proc(t: ^testing.T) {
	input := "ZOMG THE %^*@#$(*^ ZOMBIES ARE COMING!!11!!1!"
	result := response(input)
	expected := "Whoa, chill out!"

	testing.expect_value(t, result, expected)
}

@(test)
/// description = shouting with no exclamation mark
test_shouting_with_no_exclamation_mark :: proc(t: ^testing.T) {
	input := "I HATE THE DENTIST"
	result := response(input)
	expected := "Whoa, chill out!"

	testing.expect_value(t, result, expected)
}

@(test)
/// description = statement containing question mark
test_statement_containing_question_mark :: proc(t: ^testing.T) {
	input := "Ending with ? means a question."
	result := response(input)
	expected := "Whatever."

	testing.expect_value(t, result, expected)
}

@(test)
/// description = non-letters with question
test_non_letters_with_question :: proc(t: ^testing.T) {
	input := ":) ?"
	result := response(input)
	expected := "Sure."

	testing.expect_value(t, result, expected)
}

@(test)
/// description = prattling on
test_prattling_on :: proc(t: ^testing.T) {
	input := "Wait! Hang on. Are you going to be OK?"
	result := response(input)
	expected := "Sure."

	testing.expect_value(t, result, expected)
}

@(test)
/// description = silence
test_silence :: proc(t: ^testing.T) {
	input := ""
	result := response(input)
	expected := "Fine. Be that way!"

	testing.expect_value(t, result, expected)
}

@(test)
/// description = prolonged silence
test_prolonged_silence :: proc(t: ^testing.T) {
	input := "          "
	result := response(input)
	expected := "Fine. Be that way!"

	testing.expect_value(t, result, expected)
}

@(test)
/// description = alternate silence
test_alternate_silence :: proc(t: ^testing.T) {
	input := "\t\t\t\t\t\t\t\t\t\t"
	result := response(input)
	expected := "Fine. Be that way!"

	testing.expect_value(t, result, expected)
}

@(test)
/// description = starting with whitespace
test_starting_with_whitespace :: proc(t: ^testing.T) {
	input := "         hmmmmmmm..."
	result := response(input)
	expected := "Whatever."

	testing.expect_value(t, result, expected)
}

@(test)
/// description = ending with whitespace
test_ending_with_whitespace :: proc(t: ^testing.T) {
	input := "Okay if like my  spacebar  quite a bit?   "
	result := response(input)
	expected := "Sure."

	testing.expect_value(t, result, expected)
}

@(test)
/// description = other whitespace
test_other_whitespace :: proc(t: ^testing.T) {
	input := "\n\r \t"
	result := response(input)
	expected := "Fine. Be that way!"

	testing.expect_value(t, result, expected)
}

@(test)
/// description = non-question ending with whitespace
test_non_question_ending_with_whitespace :: proc(t: ^testing.T) {
	input := "This is a statement ending with whitespace      "
	result := response(input)
	expected := "Whatever."

	testing.expect_value(t, result, expected)
}

@(test)
/// description = multiple line question
test_multiple_line_question :: proc(t: ^testing.T) {
	input := "\nDoes this cryogenic chamber make\n me look fat?"
	result := response(input)
	expected := "Sure."

	testing.expect_value(t, result, expected)
}
