package protein_translation

import "core:fmt"
import "core:testing"

expect_slices_match :: proc(t: ^testing.T, actual, expected: []$E, loc := #caller_location) {
	result := fmt.aprintf("%v", actual)
	exp_str := fmt.aprintf("%v", expected)
	defer {
		delete(result)
		delete(exp_str)
	}

	testing.expect_value(t, result, exp_str)
}

@(test)
/// description = Empty RNA sequence results in no proteins
test_empty_rna_sequence_results_in_no_proteins :: proc(t: ^testing.T) {

	result, ok := proteins("")
	defer delete(result)

	expect_slices_match(t, result, []string{})
	testing.expect_value(t, ok, true)
}

@(test)
/// description = Methionine RNA sequence
test_methionine_rna_sequence :: proc(t: ^testing.T) {

	result, ok := proteins("AUG")
	defer delete(result)

	expect_slices_match(t, result, []string{"Methionine"})
	testing.expect_value(t, ok, true)
}

@(test)
/// description = Phenylalanine RNA sequence 1
test_phenylalanine_rna_sequence_1 :: proc(t: ^testing.T) {

	result, ok := proteins("UUU")
	defer delete(result)

	expect_slices_match(t, result, []string{"Phenylalanine"})
	testing.expect_value(t, ok, true)
}

@(test)
/// description = Phenylalanine RNA sequence 2
test_phenylalanine_rna_sequence_2 :: proc(t: ^testing.T) {

	result, ok := proteins("UUC")
	defer delete(result)

	expect_slices_match(t, result, []string{"Phenylalanine"})
	testing.expect_value(t, ok, true)
}

@(test)
/// description = Leucine RNA sequence 1
test_leucine_rna_sequence_1 :: proc(t: ^testing.T) {

	result, ok := proteins("UUA")
	defer delete(result)

	expect_slices_match(t, result, []string{"Leucine"})
	testing.expect_value(t, ok, true)
}

@(test)
/// description = Leucine RNA sequence 2
test_leucine_rna_sequence_2 :: proc(t: ^testing.T) {

	result, ok := proteins("UUG")
	defer delete(result)

	expect_slices_match(t, result, []string{"Leucine"})
	testing.expect_value(t, ok, true)
}

@(test)
/// description = Serine RNA sequence 1
test_serine_rna_sequence_1 :: proc(t: ^testing.T) {

	result, ok := proteins("UCU")
	defer delete(result)

	expect_slices_match(t, result, []string{"Serine"})
	testing.expect_value(t, ok, true)
}

@(test)
/// description = Serine RNA sequence 2
test_serine_rna_sequence_2 :: proc(t: ^testing.T) {

	result, ok := proteins("UCC")
	defer delete(result)

	expect_slices_match(t, result, []string{"Serine"})
	testing.expect_value(t, ok, true)
}

@(test)
/// description = Serine RNA sequence 3
test_serine_rna_sequence_3 :: proc(t: ^testing.T) {

	result, ok := proteins("UCA")
	defer delete(result)

	expect_slices_match(t, result, []string{"Serine"})
	testing.expect_value(t, ok, true)
}

@(test)
/// description = Serine RNA sequence 4
test_serine_rna_sequence_4 :: proc(t: ^testing.T) {

	result, ok := proteins("UCG")
	defer delete(result)

	expect_slices_match(t, result, []string{"Serine"})
	testing.expect_value(t, ok, true)
}

@(test)
/// description = Tyrosine RNA sequence 1
test_tyrosine_rna_sequence_1 :: proc(t: ^testing.T) {

	result, ok := proteins("UAU")
	defer delete(result)

	expect_slices_match(t, result, []string{"Tyrosine"})
	testing.expect_value(t, ok, true)
}

@(test)
/// description = Tyrosine RNA sequence 2
test_tyrosine_rna_sequence_2 :: proc(t: ^testing.T) {

	result, ok := proteins("UAC")
	defer delete(result)

	expect_slices_match(t, result, []string{"Tyrosine"})
	testing.expect_value(t, ok, true)
}

@(test)
/// description = Cysteine RNA sequence 1
test_cysteine_rna_sequence_1 :: proc(t: ^testing.T) {

	result, ok := proteins("UGU")
	defer delete(result)

	expect_slices_match(t, result, []string{"Cysteine"})
	testing.expect_value(t, ok, true)
}

@(test)
/// description = Cysteine RNA sequence 2
test_cysteine_rna_sequence_2 :: proc(t: ^testing.T) {

	result, ok := proteins("UGC")
	defer delete(result)

	expect_slices_match(t, result, []string{"Cysteine"})
	testing.expect_value(t, ok, true)
}

@(test)
/// description = Tryptophan RNA sequence
test_tryptophan_rna_sequence :: proc(t: ^testing.T) {

	result, ok := proteins("UGG")
	defer delete(result)

	expect_slices_match(t, result, []string{"Tryptophan"})
	testing.expect_value(t, ok, true)
}

@(test)
/// description = STOP codon RNA sequence 1
test_stop_codon_rna_sequence_1 :: proc(t: ^testing.T) {

	result, ok := proteins("UAA")
	defer delete(result)

	expect_slices_match(t, result, []string{})
	testing.expect_value(t, ok, true)
}

@(test)
/// description = STOP codon RNA sequence 2
test_stop_codon_rna_sequence_2 :: proc(t: ^testing.T) {

	result, ok := proteins("UAG")
	defer delete(result)

	expect_slices_match(t, result, []string{})
	testing.expect_value(t, ok, true)
}

@(test)
/// description = STOP codon RNA sequence 3
test_stop_codon_rna_sequence_3 :: proc(t: ^testing.T) {

	result, ok := proteins("UGA")
	defer delete(result)

	expect_slices_match(t, result, []string{})
	testing.expect_value(t, ok, true)
}

@(test)
/// description = Sequence of two protein codons translates into proteins
test_sequence_of_two_protein_codons_translates_into_proteins :: proc(t: ^testing.T) {

	result, ok := proteins("UUUUUU")
	defer delete(result)

	expect_slices_match(t, result, []string{"Phenylalanine", "Phenylalanine"})
	testing.expect_value(t, ok, true)
}

@(test)
/// description = Sequence of two different protein codons translates into proteins
test_sequence_of_two_different_protein_codons_translates_into_proteins :: proc(t: ^testing.T) {

	result, ok := proteins("UUAUUG")
	defer delete(result)

	expect_slices_match(t, result, []string{"Leucine", "Leucine"})
	testing.expect_value(t, ok, true)
}

@(test)
/// description = Translate RNA strand into correct protein list
test_translate_rna_strand_into_correct_protein_list :: proc(t: ^testing.T) {

	result, ok := proteins("AUGUUUUGG")
	defer delete(result)

	expect_slices_match(t, result, []string{"Methionine", "Phenylalanine", "Tryptophan"})
	testing.expect_value(t, ok, true)
}

@(test)
/// description = Translation stops if STOP codon at beginning of sequence
test_translation_stops_if_stop_codon_at_beginning_of_sequence :: proc(t: ^testing.T) {

	result, ok := proteins("UAGUGG")
	defer delete(result)

	expect_slices_match(t, result, []string{})
	testing.expect_value(t, ok, true)
}

@(test)
/// description = Translation stops if STOP codon at end of two-codon sequence
test_translation_stops_if_stop_codon_at_end_of_two_codon_sequence :: proc(t: ^testing.T) {

	result, ok := proteins("UGGUAG")
	defer delete(result)

	expect_slices_match(t, result, []string{"Tryptophan"})
	testing.expect_value(t, ok, true)
}

@(test)
/// description = Translation stops if STOP codon at end of three-codon sequence
test_translation_stops_if_stop_codon_at_end_of_three_codon_sequence :: proc(t: ^testing.T) {

	result, ok := proteins("AUGUUUUAA")
	defer delete(result)

	expect_slices_match(t, result, []string{"Methionine", "Phenylalanine"})
	testing.expect_value(t, ok, true)
}

@(test)
/// description = Translation stops if STOP codon in middle of three-codon sequence
test_translation_stops_if_stop_codon_in_middle_of_three_codon_sequence :: proc(t: ^testing.T) {

	result, ok := proteins("UGGUAGUGG")
	defer delete(result)

	expect_slices_match(t, result, []string{"Tryptophan"})
	testing.expect_value(t, ok, true)
}

@(test)
/// description = Translation stops if STOP codon in middle of six-codon sequence
test_translation_stops_if_stop_codon_in_middle_of_six_codon_sequence :: proc(t: ^testing.T) {

	result, ok := proteins("UGGUGUUAUUAAUGGUUU")
	defer delete(result)

	expect_slices_match(t, result, []string{"Tryptophan", "Cysteine", "Tyrosine"})
	testing.expect_value(t, ok, true)
}

@(test)
/// description = Sequence of two non-STOP codons does not translate to a STOP codon
test_sequence_of_two_non_stop_codons_does_not_translate_to_a_stop_codon :: proc(t: ^testing.T) {

	result, ok := proteins("AUGAUG")
	defer delete(result)

	expect_slices_match(t, result, []string{"Methionine", "Methionine"})
	testing.expect_value(t, ok, true)
}

@(test)
/// description = Unknown amino acids, not part of a codon, can't translate
test_unknown_amino_acids_not_part_of_a_codon_cant_translate :: proc(t: ^testing.T) {

	result, ok := proteins("XYZ")
	defer delete(result)

	testing.expect_value(t, ok, false)
}

@(test)
/// description = Incomplete RNA sequence can't translate
test_incomplete_rna_sequence_cant_translate :: proc(t: ^testing.T) {

	result, ok := proteins("AUGU")
	defer delete(result)

	testing.expect_value(t, ok, false)
}

@(test)
/// description = Incomplete RNA sequence can translate if valid until a STOP codon
test_incomplete_rna_sequence_can_translate_if_valid_until_a_stop_codon :: proc(t: ^testing.T) {

	result, ok := proteins("UUCUUCUAAUGGU")
	defer delete(result)

	expect_slices_match(t, result, []string{"Phenylalanine", "Phenylalanine"})
	testing.expect_value(t, ok, true)
}
