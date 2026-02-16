package rna_transcription

import "core:strings"

to_rna :: proc(dna: string) -> (rna: string, ok: bool) {
	sb := strings.builder_make(len(rna), len(rna))

	for nucleotide in dna {
		switch nucleotide {
			case 'G': strings.write_rune(&sb, 'C')
			case 'C': strings.write_rune(&sb, 'G')
			case 'T': strings.write_rune(&sb, 'A')
			case 'A': strings.write_rune(&sb, 'U')
			case: return strings.to_string(sb), false
		}
	}

	return strings.to_string(sb), true
}
