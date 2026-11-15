const CODONTOPROTEIN = Dict(
    "AUG" => "Methionine",
    "UUU" => "Phenylalanine",
    "UUC" => "Phenylalanine",
    "UUA" => "Leucine",
    "UUG" => "Leucine",
    "UCU" => "Serine",
    "UCC" => "Serine",
    "UCA" => "Serine",
    "UCG" => "Serine",
    "UAU" => "Tyrosine",
    "UAC" => "Tyrosine",
    "UGU" => "Cysteine",
    "UGC" => "Cysteine",
    "UGG" => "Tryptophan",
    "UAA" => "STOP",
    "UAG" => "STOP",
    "UGA" => "STOP"
)

function protein(codon)
    haskey(CODONTOPROTEIN, codon) || throw(DomainError(codon))
    CODONTOPROTEIN[codon]
end

function proteins(strand)
    collect(Iterators.takewhile(protein -> protein != "STOP", Iterators.map(protein, Iterators.partition(strand, 3))))
end
