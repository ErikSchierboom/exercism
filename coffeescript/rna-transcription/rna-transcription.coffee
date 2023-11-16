COMPLEMENT = C: 'G', G: 'C', T: 'A', A: 'U'

class RnaTrascription
  constructor: (@dna) ->

  toRna: -> (COMPLEMENT[nucleotide] for nucleotide in @dna).join ''

module.exports = RnaTrascription
