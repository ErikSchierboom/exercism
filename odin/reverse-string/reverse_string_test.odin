package reverse_string

import "core:testing"

@(test)
/// description = an empty string
test_an_empty_string :: proc(t: ^testing.T) {
	input := ""
	result := reverse(input)
	defer delete(result)
	expected := ""
	testing.expect_value(t, result, expected)
}

@(test)
/// description = a word
test_a_word :: proc(t: ^testing.T) {
	input := "robot"
	result := reverse(input)
	defer delete(result)
	expected := "tobor"
	testing.expect_value(t, result, expected)
}

@(test)
/// description = a capitalized word
test_a_capitalized_word :: proc(t: ^testing.T) {
	input := "Ramen"
	result := reverse(input)
	defer delete(result)
	expected := "nemaR"
	testing.expect_value(t, result, expected)
}

@(test)
/// description = a sentence with punctuation
test_a_sentence_with_punctuation :: proc(t: ^testing.T) {
	input := "I'm hungry!"
	result := reverse(input)
	defer delete(result)
	expected := "!yrgnuh m'I"
	testing.expect_value(t, result, expected)
}

@(test)
/// description = a palindrome
test_a_palindrome :: proc(t: ^testing.T) {
	input := "racecar"
	result := reverse(input)
	defer delete(result)
	expected := "racecar"
	testing.expect_value(t, result, expected)
}

@(test)
/// description = an even-sized word
test_an_even_sized_word :: proc(t: ^testing.T) {
	input := "drawer"
	result := reverse(input)
	defer delete(result)
	expected := "reward"
	testing.expect_value(t, result, expected)
}

@(test)
/// description = wide characters
test_wide_characters :: proc(t: ^testing.T) {
	input := "子猫"
	result := reverse(input)
	defer delete(result)
	expected := "猫子"
	testing.expect_value(t, result, expected)
}

// Tests below need more complicated string processing

@(test)
/// description = emoji
test_emoji :: proc(t: ^testing.T) {
	input := "😀👹💑🏻"
	result := reverse(input)
	defer delete(result)
	expected := "💑🏻👹😀"
	testing.expect_value(t, result, expected)
}

@(test)
/// description = grapheme cluster with pre-combined form
test_grapheme_cluster_with_pre_combined_form :: proc(t: ^testing.T) {
	input := "Würstchenstand"
	result := reverse(input)
	defer delete(result)
	expected := "dnatsnehctsrüW"
	testing.expect_value(t, result, expected)
}

@(test)
/// description = grapheme clusters
test_grapheme_clusters :: proc(t: ^testing.T) {
	input := "ผู้เขียนโปรแกรม"
	result := reverse(input)
	defer delete(result)
	expected := "มรกแรปโนยขีเผู้"
	testing.expect_value(t, result, expected)
}
