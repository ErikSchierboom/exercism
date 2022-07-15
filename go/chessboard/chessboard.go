package chessboard

type Rank []bool

type Chessboard map[string]Rank

// CountInRank returns how many squares are occupied in the chessboard,
// within the given rank
func CountInRank(cb Chessboard, rank string) int {
	var count int

	for _, occupied := range cb[rank] {
		if occupied {
			count++
		}
	}

	return count
}

// CountInFile returns how many squares are occupied in the chessboard,
// within the given file
func CountInFile(cb Chessboard, file int) int {
	if file <= 0 || file > 8 {
		return 0
	}

	var count int

	for rank := range cb {
		if cb[rank][file-1] {
			count++
		}
	}

	return count
}

// CountAll should count how many squares are present in the chessboard
func CountAll(cb Chessboard) int {
	var count int

	for rank := range cb {
		for range cb[rank] {
			count++
		}
	}

	return count
}

// CountOccupied returns how many squares are occupied in the chessboard
func CountOccupied(cb Chessboard) int {
	var count int

	for rank := range cb {
		count += CountInRank(cb, rank)
	}

	return count
}
