# Adapted from: https://exercism.org/tracks/nim/exercises/anagram/solutions/Piqueiras

import strutils

const primes: array['a'..'z', int] = 
  ['a':2,  'b':3,  'c':5,  'd':7,  'e':11, 'f':13, 'g':17, 'h':19, 'i':23, 'j':29, 
   'k':31, 'l':37, 'm':41, 'n':43, 'o':47, 'p':53, 'q':59, 'r':61, 's':67,
   't':71, 'u':73, 'v':79, 'w':83, 'x':89, 'y':97, 'z':101]

proc primeValue(word:string): int =
  result = 1
  for letter in word:
    if isAlphaAscii(letter):
      result *= primes[letter.toLowerAscii]

proc isAnagramOf(candidate, word: string): bool =
  candidate.toLower != word.toLower and
    primeValue(word) == primeValue(candidate)
        
proc detectAnagrams*(word:string, candidates:seq[string]): seq[string] =
  for candidate in candidates:
    if candidate.isAnagramOf(word):
        result.add(candidate)
