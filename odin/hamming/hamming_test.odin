package hamming

import "core:testing"

@(test)
/// description = empty strands
test_empty_strands :: proc(t: ^testing.T) {
	d, e := distance("", "")
	testing.expect_value(t, d, 0)
	testing.expect_value(t, e, Error.None)
}

@(test)
/// description = single letter identical strands
test_single_letter_identical_strands :: proc(t: ^testing.T) {
	d, e := distance("A", "A")
	testing.expect_value(t, d, 0)
	testing.expect_value(t, e, Error.None)
}

@(test)
/// description = single letter different strands
test_single_letter_different_strands :: proc(t: ^testing.T) {
	d, e := distance("G", "T")
	testing.expect_value(t, d, 1)
	testing.expect_value(t, e, Error.None)
}

@(test)
/// description = long identical strands
test_long_identical_strands :: proc(t: ^testing.T) {
	d, e := distance("GGACTGAAATCTG", "GGACTGAAATCTG")
	testing.expect_value(t, d, 0)
	testing.expect_value(t, e, Error.None)
}

@(test)
/// description = long different strands
test_long_different_strands :: proc(t: ^testing.T) {
	d, e := distance("GGACGGATTCTG", "AGGACGGATTCT")
	testing.expect_value(t, d, 9)
	testing.expect_value(t, e, Error.None)
}

@(test)
/// description = disallow first strand longer
test_disallow_first_strand_longer :: proc(t: ^testing.T) {
	_, e := distance("AATG", "AAA")
	testing.expect_value(t, e, Error.UnequalLengths)
}

@(test)
/// description = disallow second strand longer
test_disallow_second_strand_longer :: proc(t: ^testing.T) {
	_, e := distance("ATA", "AGTG")
	testing.expect_value(t, e, Error.UnequalLengths)
}

@(test)
/// description = disallow left empty strand
test_disallow_left_empty_strand :: proc(t: ^testing.T) {
	_, e := distance("", "G")
	testing.expect_value(t, e, Error.UnequalLengths)
}

@(test)
/// description = disallow right empty strand
test_disallow_right_empty_strand :: proc(t: ^testing.T) {
	_, e := distance("G", "")
	testing.expect_value(t, e, Error.UnequalLengths)
}
