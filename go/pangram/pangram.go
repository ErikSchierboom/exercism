package pangram

import "unicode"

func IsPangram(input string) bool {
	m := map[rune]bool{}

	for _, c := range input {
		if unicode.IsLetter(c) {
			m[unicode.ToLower(c)] = true
		}
	}

	return len(m) == 26
}
