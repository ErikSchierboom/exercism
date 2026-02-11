package pangram

import "core:strings"

is_pangram :: proc(str: string) -> bool {
	letters := bit_set['a'..='z']{}

	for char in str {
		switch char {
		case 'a'..='z', 'A'..='Z':
			letters += {(char | 0x20)}
		}
	}

	return card(letters) == 26
}
