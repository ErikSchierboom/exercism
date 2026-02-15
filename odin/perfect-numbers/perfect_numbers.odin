package perfect_numbers

import "core:math"

Classification :: enum {
	Perfect,
	Abundant,
	Deficient,
	Undefined,
}

classify :: proc(number: uint) -> Classification {
	if number < 1 do return .Undefined

	aliquot_sum := aliquot_sum(number)

	switch {
		case aliquot_sum < number: return .Deficient
		case aliquot_sum > number: return .Abundant
		case: return .Perfect
	}
}

aliquot_sum :: proc(number: uint) -> uint {
	sum: uint = 0

	for i in 1..=number / 2 {
		if number % i == 0 do sum += i
	}

	return sum
}
