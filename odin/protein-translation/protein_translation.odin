package protein_translation

proteins :: proc(rna_strand: string) -> ([]string, bool) {
	proteins := make([dynamic]string)

	for i := 0; i < len(rna_strand); i += 3 {
		if i > len(rna_strand) - 3 do return proteins[:], false

		switch rna_strand[i:i+3] {
		case "AUG": append(&proteins, "Methionine")
		case "UUU": append(&proteins, "Phenylalanine")
		case "UUC": append(&proteins, "Phenylalanine")
		case "UUA": append(&proteins, "Leucine")
		case "UUG": append(&proteins, "Leucine")
		case "UCU": append(&proteins, "Serine")
		case "UCC": append(&proteins, "Serine")
		case "UCA": append(&proteins, "Serine")
		case "UCG": append(&proteins, "Serine")
		case "UAU": append(&proteins, "Tyrosine")
		case "UAC": append(&proteins, "Tyrosine")
		case "UGU": append(&proteins, "Cysteine")
		case "UGC": append(&proteins, "Cysteine")
		case "UGG": append(&proteins, "Tryptophan")
		case "UAA": return proteins[:], true
		case "UAG": return proteins[:], true
		case "UGA": return proteins[:], true
		case: return proteins[:], false
		}
	}

	return proteins[:], true
}
