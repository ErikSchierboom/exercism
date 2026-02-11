package pangram

import "core:strings"

ALPHABET :: "abcdefghijklmnopqrstuvwxyz"

is_pangram :: proc(str: string) -> bool {
	lower_str := strings.to_lower(str)
	defer delete(lower_str)
	chars, _ := strings.ascii_set_make(lower_str)

	for letter in ALPHABET {
		if !strings.ascii_set_contains(chars, u8(letter)) do return false
	}

	return true
}
