package grains

Error :: enum {
	None = 0,
	InvalidSquare,
}

// Returns the number of grains on the specified square.
square :: proc(n: int) -> (u64, Error) {
	if n < 1 || n > 64 do return 0, .InvalidSquare

	return 1 << (u64(n) - 1), .None
}

// Returns the total number of squares on the board.
total :: proc() -> (u64, Error) {
	return (1 << 64) - 1, .None
}
