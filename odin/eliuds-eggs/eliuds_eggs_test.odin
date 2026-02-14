package eliuds_eggs

import "core:testing"

@(test)
/// description = 0 eggs
test_0_eggs :: proc(t: ^testing.T) {
	testing.expect_value(t, egg_count(0), 0)
}

@(test)
/// description = 1 egg
test_1_egg :: proc(t: ^testing.T) {
	testing.expect_value(t, egg_count(16), 1)
}

@(test)
/// description = 4 eggs
test_4_eggs :: proc(t: ^testing.T) {
	testing.expect_value(t, egg_count(89), 4)
}

@(test)
/// description = 13 eggs
test_13_eggs :: proc(t: ^testing.T) {
	testing.expect_value(t, egg_count(2_000_000_000), 13)
}
