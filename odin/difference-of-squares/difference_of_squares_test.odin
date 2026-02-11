package difference_of_squares

import "core:testing"

@(test)
/// description = Square of sum 1
test_square_of_sum_1 :: proc(t: ^testing.T) {
	testing.expect_value(t, square_of_sum(1), 1)
}

@(test)
/// description = Square of sum 5
test_square_of_sum_5 :: proc(t: ^testing.T) {
	testing.expect_value(t, square_of_sum(5), 225)
}

@(test)
/// description = Square of sum 100
test_square_of_sum_100 :: proc(t: ^testing.T) {
	testing.expect_value(t, square_of_sum(100), 25_502_500)
}

@(test)
/// description = Sum of squares 1 test
sum_of_squares_1_test :: proc(t: ^testing.T) {
	testing.expect_value(t, sum_of_squares(1), 1)
}

@(test)
/// description = Sum of squares 5 test
sum_of_squares_5_test :: proc(t: ^testing.T) {
	testing.expect_value(t, sum_of_squares(5), 55)
}

@(test)
/// description = Sum of squares 100 test
sum_of_squares_100_test :: proc(t: ^testing.T) {
	testing.expect_value(t, sum_of_squares(100), 338_350)
}

@(test)
/// description = Difference of squares 1 test
difference_of_squares_1_test :: proc(t: ^testing.T) {
	testing.expect_value(t, difference(1), 0)
}

@(test)
/// description = Difference of squares 5 test
difference_of_squares_5_test :: proc(t: ^testing.T) {
	testing.expect_value(t, difference(5), 170)
}

@(test)
/// description = Difference of squares 100 test
difference_of_squares_100_test :: proc(t: ^testing.T) {
	testing.expect_value(t, difference(100), 25_164_150)
}
