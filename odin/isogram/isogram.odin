package isogram

import "core:strings"

is_isogram :: proc(word: string) -> bool {
	seen := bit_set['a'..='z']{}

	for char in word {
		switch char {
		case 'a'..='z', 'A'..='Z':
			char := char | 0x20 // Convert to lowercase
			if char in seen do return false
			seen += {char}
		}
	}

	return true
}
