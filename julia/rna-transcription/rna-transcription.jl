COMPLEMENTS = Dict('G' => 'C', 'C' => 'G', 'T' => 'A', 'A' => 'U')

to_rna(dna) = join(get(() -> error("Invalid"), COMPLEMENTS, n) for n in dna)

