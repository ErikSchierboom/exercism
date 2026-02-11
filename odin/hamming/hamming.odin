package hamming

Error :: enum {
	None,
	UnequalLengths
}

distance :: proc(strand1, strand2: string) -> (result: int, error: Error) {
	if len(strand1) != len(strand2) {
		return 0, .UnequalLengths
	}

	for i in 0..<len(strand1) {
		if strand1[i] != strand2[i] {
			result += 1
		}
		
	}

	return result, .None
}
