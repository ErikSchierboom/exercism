class NucleotideCount
  constructor: (strand) ->
    @nucleotideCounts = A : 0, T: 0, C: 0, G: 0

    for nucleotide in strand
      throw new Error('Invalid nucleotide strand') if nucleotide not of @nucleotideCounts
      @nucleotideCounts[nucleotide]++

  count: (nucleotide) -> 
    throw new Error('Invalid nucleotide') if nucleotide not of @nucleotideCounts
    @nucleotideCounts[nucleotide]

module.exports = NucleotideCount
