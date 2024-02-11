function count_nucleotides(strand)
    counts = Dict('A' => 0, 'C' => 0, 'G' => 0, 'T' => 0)

    for nucleotide in strand
        haskey(counts, nucleotide) || throw(DomainError("Invalid nucleotide"))
        counts[nucleotide] += 1
    end

    counts
end
