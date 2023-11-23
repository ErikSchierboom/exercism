NucleotideCount = require './nucleotide-count'

describe 'NucleotideCount', ->
  it 'has no nucleotides', ->
    expected =
      A: 0
      T: 0
      C: 0
      G: 0
    dna = new NucleotideCount('')
    expect(dna.nucleotideCounts).toEqual expected

  it 'has no adoenosine', ->
    dna = new NucleotideCount('')
    expect(dna.count('A')).toEqual 0

  it 'repetitive cytidine gets counts', ->
    dna = new NucleotideCount('CCCCC')
    expect(dna.count('C')).toEqual 5

  it 'repetitive sequence has only gaunosine', ->
    dna = new NucleotideCount('GGGGGGGG')
    expected =
      A: 0
      T: 0
      C: 0
      G: 8
    expect(dna.nucleotideCounts).toEqual expected

  it 'counts only thymidine', ->
    dna = new NucleotideCount('GGGGTAACCCGG')
    expect(dna.count('T')).toEqual 1

  it 'counts a nucleotide only once', ->
    dna = new NucleotideCount('GGTTGG')
    dna.count('T')
    expect(dna.count('T')).toEqual 2

  it 'validates strand', ->
    expect ->
      new NucleotideCount('AGTXCG')
    .toThrow new Error('Invalid nucleotide strand')

  it 'validates nucleotides', ->
    dna = new NucleotideCount('GGTTGG')
    expect ->
      dna.count 'X'
    .toThrow new Error('Invalid nucleotide')

  it 'counts all nucleotides', ->
    dna = new NucleotideCount('AGCTTTTCATTCTGACTGCAACGGGCAATATGTCTCTGTGTGGATTAAAAAAAGAGTGTCTGATAGCAGC')
    expected =
      A: 20
      T: 21
      G: 17
      C: 12
    expect(dna.nucleotideCounts).toEqual expected
