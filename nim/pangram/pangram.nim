import strutils
import sets

proc isPangram*(sentence: string): bool =
    var seenLetters = initHashSet[char](26)

    for c in sentence.toLower:
        if c in LowercaseLetters:
            seenLetters.incl c
            if seenLetters.len == LowercaseLetters.len:
                return true
