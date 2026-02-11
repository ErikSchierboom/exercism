package pangram

import "core:testing"

@(test)
/// description = empty sentence
test_empty_sentence :: proc(t: ^testing.T) {
	testing.expect(t, !is_pangram(""))
}

@(test)
/// description = only lower case
test_only_lower_case :: proc(t: ^testing.T) {
	testing.expect(t, is_pangram("the quick brown fox jumps over the lazy dog"))
}

@(test)
/// description = missing the letter 'x'
test_missing_the_letter_x :: proc(t: ^testing.T) {
	testing.expect(t, !is_pangram("a quick movement of the enemy will jeopardize five gunboats"))
}

@(test)
/// description = missing the letter 'h'
test_missing_the_letter_h :: proc(t: ^testing.T) {
	testing.expect(t, !is_pangram("five boxing wizards jump quickly at it"))
}

@(test)
/// description = with underscores
test_with_underscores :: proc(t: ^testing.T) {
	testing.expect(t, is_pangram("the_quick_brown_fox_jumps_over_the_lazy_dog"))
}

@(test)
/// description = with numbers
test_with_numbers :: proc(t: ^testing.T) {
	testing.expect(t, is_pangram("the 1 quick brown fox jumps over the 2 lazy dogs"))
}

@(test)
/// description = missing letters replaced by numbers
test_missing_letters_replaced_by_numbers :: proc(t: ^testing.T) {
	testing.expect(t, !is_pangram("7h3 qu1ck brown fox jumps ov3r 7h3 lazy dog"))
}

@(test)
/// description = mixed case and punctuation
test_mixed_case_and_punctuation :: proc(t: ^testing.T) {
	testing.expect(t, is_pangram("\"Five quacking Zephyrs jolt my wax bed.\""))
}

@(test)
/// description = a-m and A-M are 26 different characters but not a pangram
test_a_m_and_a_m_are_26_different_characters_but_not_a_pangram :: proc(t: ^testing.T) {
	testing.expect(t, !is_pangram("abcdefghijklm ABCDEFGHIJKLM"))
}

@(test)
/// description = non alphanumeric printable
test_non_alphanumeric_printable :: proc(t: ^testing.T) {
	testing.expect(t, !is_pangram(" !\"#$%&'()*+,-./:;<=>?@[\\]^_`{|}~"))
}
