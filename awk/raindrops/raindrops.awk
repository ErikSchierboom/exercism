BEGIN {
    if (num % 3 == 0) sounds = sounds "Pling"
    if (num % 5 == 0) sounds = sounds "Plang"
    if (num % 7 == 0) sounds = sounds "Plong"
    print sounds ? sounds : num
}
