package eliuds_eggs

egg_count :: proc(number: uint) -> (count: uint) {
	remainder := number

	for remainder > 0 {
		count += remainder & 1
		remainder = remainder >> 1
	}

	return count
}
