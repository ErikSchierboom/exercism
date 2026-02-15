package raindrops

import "core:mem"
import "core:testing"

@(test)
/// description = the sound for 1 is 1
test_the_sound_for_1_is_1 :: proc(t: ^testing.T) {
	testing.expect_value(t, convert(1), "1")
}

@(test)
/// description = the sound for 3 is Pling
test_the_sound_for_3_is_pling :: proc(t: ^testing.T) {
	testing.expect_value(t, convert(3), "Pling")
}

@(test)
/// description = the sound for 5 is Plang
test_the_sound_for_5_is_plang :: proc(t: ^testing.T) {
	testing.expect_value(t, convert(5), "Plang")
}

@(test)
/// description = the sound for 7 is Plong
test_the_sound_for_7_is_plong :: proc(t: ^testing.T) {
	testing.expect_value(t, convert(7), "Plong")
}

@(test)
/// description = the sound for 6 is Pling as it has a factor 3
test_the_sound_for_6_is_pling_as_it_has_a_factor_3 :: proc(t: ^testing.T) {
	testing.expect_value(t, convert(6), "Pling")
}

@(test)
/// description = 2 to the power 3 does not make a raindrop sound as 3 is the exponent not the base
test_2_to_the_power_3_does_not_make_a_raindrop_sound_as_3_is_the_exponent_not_the_base :: proc(
	t: ^testing.T,
) {
	testing.expect_value(t, convert(8), "8")
}

@(test)
/// description = the sound for 9 is Pling as it has a factor 3
test_the_sound_for_9_is_pling_as_it_has_a_factor_3 :: proc(t: ^testing.T) {
	testing.expect_value(t, convert(9), "Pling")
}

@(test)
/// description = the sound for 10 is Plang as it has a factor 5
test_the_sound_for_10_is_plang_as_it_has_a_factor_5 :: proc(t: ^testing.T) {
	testing.expect_value(t, convert(10), "Plang")
}

@(test)
/// description = the sound for 14 is Plong as it has a factor of 7
test_the_sound_for_14_is_plong_as_it_has_a_factor_of_7 :: proc(t: ^testing.T) {
	testing.expect_value(t, convert(14), "Plong")
}

@(test)
/// description = the sound for 15 is PlingPlang as it has factors 3 and 5
test_the_sound_for_15_is_pling_plang_as_it_has_factors_3_and_5 :: proc(t: ^testing.T) {
	testing.expect_value(t, convert(15), "PlingPlang")
}

@(test)
/// description = the sound for 21 is PlingPlong as it has factors 3 and 7
test_the_sound_for_21_is_pling_plong_as_it_has_factors_3_and_7 :: proc(t: ^testing.T) {
	testing.expect_value(t, convert(21), "PlingPlong")
}

@(test)
/// description = the sound for 25 is Plang as it has a factor 5
test_the_sound_for_25_is_plang_as_it_has_a_factor_5 :: proc(t: ^testing.T) {
	testing.expect_value(t, convert(25), "Plang")
}

@(test)
/// description = the sound for 27 is Pling as it has a factor 3
test_the_sound_for_27_is_pling_as_it_has_a_factor_3 :: proc(t: ^testing.T) {
	testing.expect_value(t, convert(27), "Pling")
}

@(test)
/// description = the sound for 35 is PlangPlong as it has factors 5 and 7
test_the_sound_for_35_is_plang_plong_as_it_has_factors_5_and_7 :: proc(t: ^testing.T) {
	testing.expect_value(t, convert(35), "PlangPlong")
}

@(test)
/// description = the sound for 49 is Plong as it has a factor 7
test_the_sound_for_49_is_plong_as_it_has_a_factor_7 :: proc(t: ^testing.T) {
	testing.expect_value(t, convert(49), "Plong")
}

@(test)
/// description = the sound for 52 is 52
test_the_sound_for_52_is_52 :: proc(t: ^testing.T) {
	testing.expect_value(t, convert(52), "52")
}

@(test)
/// description = the sound for 105 is PlingPlangPlong as it has factors 3, 5 and 7
test_the_sound_for_105_is_pling_plang_plong_as_it_has_factors_3_5_and_7 :: proc(t: ^testing.T) {
	testing.expect_value(t, convert(105), "PlingPlangPlong")
}

@(test)
/// description = the sound for 3125 is Plang as it has a factor 5
test_the_sound_for_3125_is_plang_as_it_has_a_factor_5 :: proc(t: ^testing.T) {
	testing.expect_value(t, convert(3125), "Plang")
}

// This test is optional. If you are on the command line
// and want to check that your solution has no memory
// leak, uncomment this test.
// If you want to learn more about Odin's tracking
// allocator, you may watch this YouTube video:
// https://www.youtube.com/watch?v=dg6qogN8kIE
// @(test)
test_no_memory_leaks :: proc(t: ^testing.T) {
	track: mem.Tracking_Allocator
	mem.tracking_allocator_init(&track, context.allocator)
	defer mem.tracking_allocator_destroy(&track)
	context.allocator = mem.tracking_allocator(&track)
	test_the_sound_for_105_is_pling_plang_plong_as_it_has_factors_3_5_and_7(t)
	testing.expect_value(t, len(track.allocation_map), 0)
	testing.expect_value(t, len(track.bad_free_array), 0)
}
