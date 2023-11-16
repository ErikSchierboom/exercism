COMPLEMENTS = C: 'G', G: 'C', T: 'A', A: 'U'

class RnaTrascription
  constructor: (@dna) ->

  toRna: -> @dna.replace(/[CGTA]/g, (nucleotide) -> COMPLEMENTS[nucleotide])

module.exports = RnaTrascription
