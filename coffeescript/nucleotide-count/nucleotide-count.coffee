class NucleotideCount
  constructor: (strand) ->
    throw new Error('Invalid nucleotide strand') unless /^[ATCG]*$/.test(strand)

    @nucleotideCounts = A : 0, T: 0, C: 0, G: 0
    for nucleotide in strand
      @nucleotideCounts[nucleotide]++

  count: (nucleotide) -> 
    throw new Error('Invalid nucleotide') unless /^[ATCG]$/.test(nucleotide)

    @nucleotideCounts[nucleotide]

module.exports = NucleotideCount
