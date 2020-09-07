import tables
import strutils
import re

proc words(phrase: string): seq[string] =
  phrase.findAll(re"\w+('\w+)?")

proc countWords*(phrase : string): CountTable[string] =
  phrase.toLower.words.toCountTable
