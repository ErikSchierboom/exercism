package protein_translation

proteins :: proc(rna_strand: string) -> ([]string, bool) {
	proteins := make([dynamic]string)

	for i := 0; i < len(rna_strand); i += 3 {
		if i > len(rna_strand) - 3 do return proteins[:], false

		switch rna_strand[i:i+3] {
		case "AUG":                      append(&proteins, "Methionine")
		case "UUU", "UUC":               append(&proteins, "Phenylalanine")
		case "UUA", "UUG":               append(&proteins, "Leucine")
		case "UCU", "UCC", "UCA", "UCG": append(&proteins, "Serine")
		case "UAU", "UAC":               append(&proteins, "Tyrosine")
		case "UGU", "UGC":               append(&proteins, "Cysteine")
		case "UGG":                      append(&proteins, "Tryptophan")
		case "UAA", "UAG", "UGA":        return proteins[:], true
		case:                            return proteins[:], false
		}
	}

	return proteins[:], true
}
