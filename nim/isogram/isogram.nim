import sequtils, strutils

proc isIsogram*(phrase: string): bool =
    let letters = phrase.toLowerAscii.filterIt(it.isLowerAscii)
    letters.len == letters.deduplicate.len
