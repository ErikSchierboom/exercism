package rna_transcription

import "core:mem"
import "core:testing"

@(test)
/// description = Empty RNA sequence
test_empty_rna_sequence :: proc(t: ^testing.T) {
	rna, ok := to_rna("")
	defer delete(rna)

	testing.expect_value(t, rna, "")
	testing.expect(t, ok)
}

@(test)
/// description = RNA complement of cytosine is guanine
test_rna_complement_of_cytosine_is_guanine :: proc(t: ^testing.T) {
	rna, ok := to_rna("C")
	defer delete(rna)

	testing.expect_value(t, rna, "G")
	testing.expect(t, ok)
}

@(test)
/// description = RNA complement of guanine is cytosine
test_rna_complement_of_guanine_is_cytosine :: proc(t: ^testing.T) {
	rna, ok := to_rna("G")
	defer delete(rna)

	testing.expect_value(t, rna, "C")
	testing.expect(t, ok)
}

@(test)
/// description = RNA complement of thymine is adenine
test_rna_complement_of_thymine_is_adenine :: proc(t: ^testing.T) {
	rna, ok := to_rna("T")
	defer delete(rna)

	testing.expect_value(t, rna, "A")
	testing.expect(t, ok)
}

@(test)
/// description = RNA complement of adenine is uracil
test_rna_complement_of_adenine_is_uracil :: proc(t: ^testing.T) {
	rna, ok := to_rna("A")
	defer delete(rna)

	testing.expect_value(t, rna, "U")
	testing.expect(t, ok)
}

@(test)
/// description = RNA complement
test_rna_complement :: proc(t: ^testing.T) {
	rna, ok := to_rna("ACGTGGTCTTAA")
	defer delete(rna)

	testing.expect_value(t, rna, "UGCACCAGAAUU")
	testing.expect(t, ok)
}

// This test is optional.
// If you want to know if your solution has any memory leak,
// then un-comment the test attribute below.
// If you want to learn more about Odin's tracking allocation,
// you can watch this You Tube video
// https://www.youtube.com/watch?v=dg6qogN8kIE
// @(test)
test_no_memory_leaks :: proc(t: ^testing.T) {
	track: mem.Tracking_Allocator
	mem.tracking_allocator_init(&track, context.allocator)
	defer mem.tracking_allocator_destroy(&track)
	context.allocator = mem.tracking_allocator(&track)
	test_rna_complement(t)
	testing.expect_value(t, len(track.allocation_map), 0)
	testing.expect_value(t, len(track.bad_free_array), 0)
}
