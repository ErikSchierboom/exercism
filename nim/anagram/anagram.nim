import strutils
import sequtils
import tables

proc isAnagram(candidate: string, word: string): bool =
  word.toLower.toCountTable == candidate.toLower.toCountTable

proc isSame(candidate: string, word: string): bool =
  word.toLower == candidate.toLower

proc detectAnagrams*(word: string, candidates: seq[string]): seq[string] =
  candidates.filterIt(not it.isSame(word) and it.isAnagram(word))
