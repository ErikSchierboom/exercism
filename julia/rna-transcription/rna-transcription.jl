MAPPING = Dict('G' => 'C', 'C' => 'G', 'T' => 'A', 'A' => 'U')

function to_rna(dna)
    join(haskey(MAPPING, n) ? MAPPING[n] : error("Invalid") for n in dna)
end

