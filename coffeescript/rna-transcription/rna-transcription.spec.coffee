RnaTrascription = require './rna-transcription'

describe 'RnaTrascription', ->
  it 'Empty RNA sequence', ->
    dna = new RnaTrascription ""
    expect(dna.toRna()).toEqual("")

  it 'RNA complement of cytosine is guanine', ->
    dna = new RnaTrascription "C"
    expect(dna.toRna()).toEqual("G")

  it 'RNA complement of guanine is cytosine', ->
    dna = new RnaTrascription "G"
    expect(dna.toRna()).toEqual("C")

  it 'RNA complement of thymine is adenine', ->
    dna = new RnaTrascription "T"
    expect(dna.toRna()).toEqual("A")

  it 'RNA complement of adenine is uracil', ->
    dna = new RnaTrascription "A"
    expect(dna.toRna()).toEqual("U")

  it 'RNA complement', ->
    dna = new RnaTrascription "ACGTGGTCTTAA"
    expect(dna.toRna()).toEqual("UGCACCAGAAUU")
