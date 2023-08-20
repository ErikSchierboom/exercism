BEGIN {
    sounds = ""
    if (num % 3 == 0) { sounds = sounds "Pling" }
    if (num % 5 == 0) { sounds = sounds "Plang" }
    if (num % 7 == 0) { sounds = sounds "Plong" }
    if (length(sounds) == 0) { sounds = num }
    print sounds
}
