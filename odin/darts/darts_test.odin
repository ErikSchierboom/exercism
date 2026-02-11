package darts

import "core:testing"

// Return the correct amount earned by a dart's landing position.

@(test)
/// description = Missed target
test_missed_target :: proc(t: ^testing.T) {
	testing.expect_value(t, score(-9, 9), 0)
}

@(test)
/// description = On the outer circle
test_on_the_outer_circle :: proc(t: ^testing.T) {
	testing.expect_value(t, score(0, 10), 1)
}

@(test)
/// description = On the middle circle
test_on_the_middle_circle :: proc(t: ^testing.T) {
	testing.expect_value(t, score(-5, 0), 5)
}

@(test)
/// description = On the inner circle
test_on_the_inner_circle :: proc(t: ^testing.T) {
	testing.expect_value(t, score(0, -1), 10)
}

@(test)
/// description = Exactly on center
test_exactly_on_center :: proc(t: ^testing.T) {
	testing.expect_value(t, score(0, 0), 10)
}

@(test)
/// description = Near the center
test_near_the_center :: proc(t: ^testing.T) {
	testing.expect_value(t, score(-0.1, -0.1), 10)
}

@(test)
/// description = Just within the inner circle
test_just_within_the_inner_circle :: proc(t: ^testing.T) {
	testing.expect_value(t, score(0.7, 0.7), 10)
}

@(test)
/// description = Just outside the inner circle
test_just_outside_the_inner_circle :: proc(t: ^testing.T) {
	testing.expect_value(t, score(0.8, -0.8), 5)
}

@(test)
/// description = Just within the middle circle
test_just_within_the_middle_circle :: proc(t: ^testing.T) {
	testing.expect_value(t, score(-3.5, 3.5), 5)
}

@(test)
/// description = Just outside the middle circle
test_just_outside_the_middle_circle :: proc(t: ^testing.T) {
	testing.expect_value(t, score(-3.6, -3.6), 1)
}

@(test)
/// description = Just within the outer circle
test_just_within_the_outer_circle :: proc(t: ^testing.T) {
	testing.expect_value(t, score(-7.0, 7.0), 1)
}

@(test)
/// description = Just outside the outer circle
test_just_outside_the_outer_circle :: proc(t: ^testing.T) {
	testing.expect_value(t, score(7.1, -7.1), 0)
}

@(test)
/// description = Assymetric between inner and middle
test_assymetric_between_inner_and_middle :: proc(t: ^testing.T) {
	testing.expect_value(t, score(0.5, -4), 5)
}
