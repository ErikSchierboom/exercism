package grains

import "core:testing"

@(test)
/// description = returns the number of grains on the square -> grains on square 1
test_returns_the_number_of_grains_on_the_square__grains_on_square_1 :: proc(t: ^testing.T) {
	c, e := square(1)
	testing.expect_value(t, c, 1)
	testing.expect_value(t, e, Error.None)
}

@(test)
/// description = returns the number of grains on the square -> grains on square 2
test_returns_the_number_of_grains_on_the_square__grains_on_square_2 :: proc(t: ^testing.T) {
	c, e := square(2)
	testing.expect_value(t, c, 2)
	testing.expect_value(t, e, Error.None)
}

@(test)
/// description = returns the number of grains on the square -> grains on square 3
test_returns_the_number_of_grains_on_the_square__grains_on_square_3 :: proc(t: ^testing.T) {
	c, e := square(3)
	testing.expect_value(t, c, 4)
	testing.expect_value(t, e, Error.None)
}

@(test)
/// description = returns the number of grains on the square -> grains on square 4
test_returns_the_number_of_grains_on_the_square__grains_on_square_4 :: proc(t: ^testing.T) {
	c, e := square(4)
	testing.expect_value(t, c, 8)
	testing.expect_value(t, e, Error.None)
}

@(test)
/// description = returns the number of grains on the square -> grains on square 16
test_returns_the_number_of_grains_on_the_square__grains_on_square_16 :: proc(t: ^testing.T) {
	c, e := square(16)
	testing.expect_value(t, c, 32_768)
	testing.expect_value(t, e, Error.None)
}

@(test)
/// description = returns the number of grains on the square -> grains on square 32
test_returns_the_number_of_grains_on_the_square__grains_on_square_32 :: proc(t: ^testing.T) {
	c, e := square(32)
	testing.expect_value(t, c, 2_147_483_648)
	testing.expect_value(t, e, Error.None)
}

@(test)
/// description = returns the number of grains on the square -> grains on square 64
test_returns_the_number_of_grains_on_the_square__grains_on_square_64 :: proc(t: ^testing.T) {
	c, e := square(64)
	testing.expect_value(t, c, 9_223_372_036_854_775_808)
	testing.expect_value(t, e, Error.None)
}

@(test)
/// description = returns the number of grains on the square -> square 0 is invalid
test_returns_the_number_of_grains_on_the_square__square_0_is_invalid :: proc(t: ^testing.T) {
	c, e := square(0)
	testing.expect_value(t, c, 0)
	testing.expect_value(t, e, Error.InvalidSquare)
}

@(test)
/// description = returns the number of grains on the square -> negative square is invalid
test_returns_the_number_of_grains_on_the_square__negative_square_is_invalid :: proc(
	t: ^testing.T,
) {
	c, e := square(-1)
	testing.expect_value(t, c, 0)
	testing.expect_value(t, e, Error.InvalidSquare)
}

@(test)
/// description = returns the number of grains on the square -> square greater than 64 is invalid
test_returns_the_number_of_grains_on_the_square__square_greater_than_64_is_invalid :: proc(
	t: ^testing.T,
) {
	c, e := square(65)
	testing.expect_value(t, c, 0)
	testing.expect_value(t, e, Error.InvalidSquare)
}

@(test)
/// description = returns the total number of grains on the board
test_returns_the_total_number_of_grains_on_the_board :: proc(t: ^testing.T) {
	c, e := total()
	testing.expect_value(t, c, 18_446_744_073_709_551_615)
	testing.expect_value(t, e, Error.None)
}
