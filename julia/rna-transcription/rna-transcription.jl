COMPLEMENTS = Dict('G' => 'C', 'C' => 'G', 'T' => 'A', 'A' => 'U')

function to_rna(dna)
    join(haskey(COMPLEMENTS, n) ? COMPLEMENTS[n] : error("Invalid") for n in dna)
end

