package eliuds_eggs

egg_count :: proc(number: uint) -> (count: uint) {
	for remainder := number; remainder > 0; remainder >>= 1 {
		count += remainder & 1
	}

	return count
}
