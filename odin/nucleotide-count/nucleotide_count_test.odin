package nucleotide_count

import "core:testing"

@(test)
/// description = empty strand
test_empty_strand :: proc(t: ^testing.T) {

	result, valid := nucleotide_counts("")
	expected := Histogram {
		.A = 0,
		.C = 0,
		.G = 0,
		.T = 0,
	}

	testing.expect_value(t, valid, true)
	testing.expect_value(t, result, expected)
}

@(test)
/// description = can count one nucleotide in single-character input
test_can_count_one_nucleotide_in_single_character_input :: proc(t: ^testing.T) {

	result, valid := nucleotide_counts("G")
	expected := Histogram {
		.A = 0,
		.C = 0,
		.G = 1,
		.T = 0,
	}

	testing.expect_value(t, valid, true)
	testing.expect_value(t, result, expected)
}

@(test)
/// description = strand with repeated nucleotide
test_strand_with_repeated_nucleotide :: proc(t: ^testing.T) {

	result, valid := nucleotide_counts("GGGGGGG")
	expected := Histogram {
		.A = 0,
		.C = 0,
		.G = 7,
		.T = 0,
	}

	testing.expect_value(t, valid, true)
	testing.expect_value(t, result, expected)
}

@(test)
/// description = strand with multiple nucleotides
test_strand_with_multiple_nucleotides :: proc(t: ^testing.T) {

	result, valid := nucleotide_counts(
		"AGCTTTTCATTCTGACTGCAACGGGCAATATGTCTCTGTGTGGATTAAAAAAAGAGTGTCTGATAGCAGC",
	)
	expected := Histogram {
		.A = 20,
		.C = 12,
		.G = 17,
		.T = 21,
	}

	testing.expect_value(t, valid, true)
	testing.expect_value(t, result, expected)
}

@(test)
/// description = strand with invalid nucleotides
test_strand_with_invalid_nucleotides :: proc(t: ^testing.T) {

	_, valid := nucleotide_counts("AGXXACT")

	testing.expect_value(t, valid, false)
}
