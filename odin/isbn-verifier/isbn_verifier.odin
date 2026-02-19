package isbn_verifier

is_valid :: proc(isbn: string) -> bool {
	multiplier := 10
	checksum := 0

	for c in isbn {
		switch c {
		case '-':
		case '0'..='9':
			checksum += (int(c) - '0') * multiplier
			multiplier -= 1
		case 'X':
			if multiplier != 1 do return false
			checksum += 10
			multiplier -= 1
		case: return false
		}
	}

	return multiplier == 0 && checksum % 11 == 0
}
