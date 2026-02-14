package armstrong_numbers

import "core:math"

is_armstrong_number :: proc(n: u128) -> bool {
	armstrong_sum: u128 = 0
	num_digits := number_of_digits(n)

	for n := n; n != 0; n /= 10 {
		armstrong_sum += pow(n % 10, num_digits)
	}

	return armstrong_sum == n
}

number_of_digits :: proc(n: u128) -> u8 {
	return u8(math.floor(math.log10(f64(n)) + 1))
}

pow :: proc(n: u128, amount: u8) -> (result: u128 = 1) {
	for _ in 0..<amount do result *= n
	return result
}
