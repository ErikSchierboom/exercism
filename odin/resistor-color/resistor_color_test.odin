package resistor_color

import "core:testing"

@(test)
/// description = Color codes -> Black
test_color_codes__black :: proc(t: ^testing.T) {
	testing.expect_value(t, code(.Black), 0)
}

@(test)
/// description = Color codes -> Brown
test_color_codes__brown :: proc(t: ^testing.T) {
	testing.expect_value(t, code(.Brown), 1)
}

@(test)
/// description = Color codes -> Red
test_color_codes__red :: proc(t: ^testing.T) {
	testing.expect_value(t, code(.Red), 2)
}

@(test)
/// description = Color codes -> Orange
test_color_codes__orange :: proc(t: ^testing.T) {
	testing.expect_value(t, code(.Orange), 3)
}

@(test)
/// description = Color codes -> Yellow
test_color_codes__yellow :: proc(t: ^testing.T) {
	testing.expect_value(t, code(.Yellow), 4)
}

@(test)
/// description = Color codes -> Green
test_color_codes__green :: proc(t: ^testing.T) {
	testing.expect_value(t, code(.Green), 5)
}

@(test)
/// description = Color codes -> Blue
test_color_codes__blue :: proc(t: ^testing.T) {
	testing.expect_value(t, code(.Blue), 6)
}

@(test)
/// description = Color codes -> Violet
test_color_codes__violet :: proc(t: ^testing.T) {
	testing.expect_value(t, code(.Violet), 7)
}

@(test)
/// description = Color codes -> Grey
test_color_codes__grey :: proc(t: ^testing.T) {
	testing.expect_value(t, code(.Grey), 8)
}

@(test)
/// description = Color codes -> White
test_color_codes__white :: proc(t: ^testing.T) {
	testing.expect_value(t, code(.White), 9)
}

@(test)
/// description = Colors
test_colors :: proc(t: ^testing.T) {
	testing.expect_value(
		t,
		colors(),
		[10]Color{.Black, .Brown, .Red, .Orange, .Yellow, .Green, .Blue, .Violet, .Grey, .White},
	)
}
