package nucleotide_count

Nucleotide :: enum {
	A,
	C,
	G,
	T,
}

Histogram :: [Nucleotide]int

nucleotide_counts :: proc(dna: string) -> (histogram: Histogram, valid: bool) {	
	for nucleotide in dna {
		switch nucleotide {
		case 'A': histogram[.A] += 1
		case 'C': histogram[.C] += 1
		case 'G': histogram[.G] += 1
		case 'T': histogram[.T] += 1
		case:
			valid = false
			return
		}
	}

	valid = true
	return
}
