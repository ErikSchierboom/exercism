package collatz_conjecture

// Returns the number of steps to get to a value of 1.
steps :: proc(start: int) -> (result: int, ok: bool) {
	if start < 1 {
		return result, false
	}

	current := start

	for current != 1 {
		if current % 2 == 0 {
			current /= 2
		} else {
			current = current * 3 + 1
		}
		result += 1
	}

	return result, true
}
