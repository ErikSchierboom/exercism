package perfect_numbers

import "core:testing"

@(test)
/// description = Perfect numbers -> Smallest perfect number is classified correctly
test_perfect_numbers__smallest_perfect_number_is_classified_correctly :: proc(t: ^testing.T) {
	testing.expect_value(t, classify(6), Classification.Perfect)
}

@(test)
/// description = Perfect numbers -> Medium perfect number is classified correctly
test_perfect_numbers__medium_perfect_number_is_classified_correctly :: proc(t: ^testing.T) {
	testing.expect_value(t, classify(28), Classification.Perfect)
}

@(test)
/// description = Perfect numbers -> Large perfect number is classified correctly
test_perfect_numbers__large_perfect_number_is_classified_correctly :: proc(t: ^testing.T) {
	testing.expect_value(t, classify(33550336), Classification.Perfect)
}

@(test)
/// description = Abundant numbers -> Smallest abundant number is classified correctly
test_abundant_numbers__smallest_abundant_number_is_classified_correctly :: proc(t: ^testing.T) {
	testing.expect_value(t, classify(12), Classification.Abundant)
}

@(test)
/// description = Abundant numbers -> Medium abundant number is classified correctly
test_abundant_numbers__medium_abundant_number_is_classified_correctly :: proc(t: ^testing.T) {
	testing.expect_value(t, classify(30), Classification.Abundant)
}

@(test)
/// description = Abundant numbers -> Large abundant number is classified correctly
test_abundant_numbers__large_abundant_number_is_classified_correctly :: proc(t: ^testing.T) {
	testing.expect_value(t, classify(33550335), Classification.Abundant)
}

@(test)
/// description = Abundant numbers -> Perfect square abundant number is classified correctly
test_abundant_numbers__perfect_square_abundant_number_is_classified_correctly :: proc(
	t: ^testing.T,
) {
	testing.expect_value(t, classify(196), Classification.Abundant)
}

@(test)
/// description = Deficient numbers -> Smallest prime deficient number is classified correctly
test_deficient_numbers__smallest_prime_deficient_number_is_classified_correctly :: proc(
	t: ^testing.T,
) {
	testing.expect_value(t, classify(2), Classification.Deficient)
}

@(test)
/// description = Deficient numbers -> Smallest non-prime deficient number is classified correctly
test_deficient_numbers__smallest_non_prime_deficient_number_is_classified_correctly :: proc(
	t: ^testing.T,
) {
	testing.expect_value(t, classify(4), Classification.Deficient)
}

@(test)
/// description = Deficient numbers -> Medium deficient number is classified correctly
test_deficient_numbers__medium_deficient_number_is_classified_correctly :: proc(t: ^testing.T) {
	testing.expect_value(t, classify(32), Classification.Deficient)
}

@(test)
/// description = Deficient numbers -> Large deficient number is classified correctly
test_deficient_numbers__large_deficient_number_is_classified_correctly :: proc(t: ^testing.T) {
	testing.expect_value(t, classify(33550337), Classification.Deficient)
}
@(test)
/// description = Deficient numbers -> Edge case (no factors other than itself) is classified correctly
test_deficient_numbers__edge_case_no_factors_other_than_itself_is_classified_correctly :: proc(
	t: ^testing.T,
) {
	testing.expect_value(t, classify(1), Classification.Deficient)
}

@(test)
/// description = Invalid inputs -> Zero is rejected (as it is not a positive integer)
test_invalid_inputs__zero_is_rejected_as_it_is_not_a_positive_integer :: proc(t: ^testing.T) {
	testing.expect_value(t, classify(0), Classification.Undefined)
}
