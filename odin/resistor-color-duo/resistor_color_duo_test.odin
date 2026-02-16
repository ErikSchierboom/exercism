package resistor_color_duo

import "core:testing"

@(test)
/// description = Brown and black
test_brown_and_black :: proc(t: ^testing.T) {
	c, e := value({.Brown, .Black})
	testing.expect_value(t, c, 10)
	testing.expect_value(t, e, Error.None)
}

@(test)
/// description = Blue and grey
test_blue_and_grey :: proc(t: ^testing.T) {
	c, e := value({.Blue, .Grey})
	testing.expect_value(t, c, 68)
	testing.expect_value(t, e, Error.None)
}

@(test)
/// description = Yellow and violet
test_yellow_and_violet :: proc(t: ^testing.T) {
	c, e := value({.Yellow, .Violet})
	testing.expect_value(t, c, 47)
	testing.expect_value(t, e, Error.None)
}

@(test)
/// description = White and red
test_white_and_red :: proc(t: ^testing.T) {
	c, e := value({.White, .Red})
	testing.expect_value(t, c, 92)
	testing.expect_value(t, e, Error.None)
}

@(test)
/// description = Orange and orange
test_orange_and_orange :: proc(t: ^testing.T) {
	c, e := value({.Orange, .Orange})
	testing.expect_value(t, c, 33)
	testing.expect_value(t, e, Error.None)
}

@(test)
/// description = Ignore additional colors
test_ignore_additional_colors :: proc(t: ^testing.T) {
	c, e := value({.Green, .Brown, .Orange})
	testing.expect_value(t, c, 51)
	testing.expect_value(t, e, Error.None)
}

@(test)
/// description = Black and brown, one-digit
test_black_and_brown_one_digit :: proc(t: ^testing.T) {
	c, e := value({.Black, .Brown})
	testing.expect_value(t, c, 1)
	testing.expect_value(t, e, Error.None)
}

@(test)
/// description = One color is an error
test_one_color_is_an_error :: proc(t: ^testing.T) {
	_, e := value({.Violet})
	testing.expect_value(t, e, Error.TooFewColors)
}

@(test)
/// description = Empty slice is an error
test_empty_slice_is_an_error :: proc(t: ^testing.T) {
	_, e := value({})
	testing.expect_value(t, e, Error.TooFewColors)
}
