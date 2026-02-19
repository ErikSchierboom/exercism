package isbn_verifier

is_valid :: proc(isbn: string) -> bool {
	multiplier := 10
	checksum := 0

	for c in isbn {
		if c == '-' {
			continue
		} else if c == 'X' && multiplier == 1 {
			checksum += 10
		} else if c < '0' || c > '9' {
			return false 
		} else {
			checksum += (int(c) - '0') * multiplier
		}

		multiplier -= 1
	}

	return multiplier == 0 && checksum % 11 == 0
}
