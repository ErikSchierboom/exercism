import strutils
import sets

const alphabet = toHashSet("abcdefghijklmnopqrstuvwxyz")

proc isPangram*(sentence: string): bool =
    alphabet <= toHashSet(sentence.toLower)