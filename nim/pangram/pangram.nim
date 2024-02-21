import strutils
import sets

proc isPangram*(sentence: string): bool =
    var letters = initHashSet[char](26)

    for c in sentence.toLower:
        if c in LowercaseLetters and c notin letters:
            letters.incl c
            if letters.len == LowercaseLetters.len:
                return true
