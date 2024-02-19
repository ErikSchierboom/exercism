MAPPING = {
    AUG = "Methionine",
    UUU = "Phenylalanine",
    UUC = "Phenylalanine",
    UUA = "Leucine",
    UUG = "Leucine",
    UCU = "Serine",
    UCC = "Serine",
    UCA = "Serine",
    UCG = "Serine",
    UAU = "Tyrosine",
    UAC = "Tyrosine",
    UGU = "Cysteine",
    UGC = "Cysteine",
    UGG = "Tryptophan",
    UAA = "STOP",
    UAG = "STOP",
    UGA = "STOP"
}

local function translate_codon(codon)
    return assert(MAPPING[codon])
end

local function translate_rna_strand(rna_strand)
    local result = {}

    for codon in string.gmatch(rna_strand, "...") do
        local protein = translate_codon(codon)
        if protein == "STOP" then break end
        result[#result + 1] = protein
    end

    return result
end

return { codon = translate_codon, rna_strand = translate_rna_strand }
