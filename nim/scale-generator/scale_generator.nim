import algorithm, strutils, tables

const chromaticScale = @[ "C", "C#", "D", "D#", "E", "F", "F#", "G", "G#", "A", "A#", "B" ]
const flatChromaticScale = @[ "C", "Db", "D", "Eb", "E", "F", "Gb", "G", "Ab", "A", "Bb", "B" ]
const flatKeys = @[ "F", "Bb", "Eb", "Ab", "Db", "Gb", "d", "g", "c", "f", "bb", "eb" ]

const intervalShift = { 'm': 1, 'M': 2, 'A': 3 }.toTable

proc normalized(tonic: string): string =
  tonic[0..0].toUpper & tonic[1..^1]

proc scale*(tonic: string, intervals: string = "mmmmmmmmmmmm"): seq[string] =
  var base = if tonic in flatKeys: flatChromaticScale else: chromaticScale
  base.rotateLeft(base.find(tonic.normalized))

  for interval in intervals:
    result.add(base[0])
    base.rotateLeft(intervalShift[interval])
