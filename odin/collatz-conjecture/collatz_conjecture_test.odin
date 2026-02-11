package collatz_conjecture

import "core:testing"

@(test)
/// description = zero steps for one
test_zero_steps_for_one :: proc(t: ^testing.T) {
	s, ok := steps(1)
	testing.expect_value(t, s, 0)
	testing.expect(t, ok)
}

@(test)
/// description = divide if even
test_divide_if_even :: proc(t: ^testing.T) {
	s, ok := steps(16)
	testing.expect_value(t, s, 4)
	testing.expect(t, ok)
}

@(test)
/// description = even and odd steps
test_even_and_odd_steps :: proc(t: ^testing.T) {
	s, ok := steps(12)
	testing.expect_value(t, s, 9)
	testing.expect(t, ok)
}

@(test)
/// description = large number of even and odd steps
test_large_number_of_even_and_odd_steps :: proc(t: ^testing.T) {
	s, ok := steps(1_000_000)
	testing.expect_value(t, s, 152)
	testing.expect(t, ok)
}

@(test)
/// description = zero is an error
test_zero_is_an_error :: proc(t: ^testing.T) {
	s, ok := steps(0)
	testing.expect_value(t, s, 0)
	testing.expect(t, !ok)
}

@(test)
/// description = negative value is an error
test_negative_value_is_an_error :: proc(t: ^testing.T) {
	s, ok := steps(-15)
	testing.expect_value(t, s, 0)
	testing.expect(t, !ok)
}
