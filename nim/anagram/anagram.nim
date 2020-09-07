import algorithm
import strutils
import sequtils

proc sortedCharsInLowerCase(word: string): seq[char] = 
  toSeq(word.toLower).sorted.reversed

proc isAnagram(candidate: string, word: string): bool =
  word.sortedCharsInLowerCase == candidate.sortedCharsInLowerCase

proc isSame(candidate: string, word: string): bool =
  cmpIgnoreCase(word, candidate) == 0

proc detectAnagrams*(word: string, candidates: seq[string]): seq[string] =
  candidates.filterIt(not it.isSame(word) and it.isAnagram(word))
