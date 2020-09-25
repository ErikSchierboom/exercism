module AffineCipher

open System

let rec gcd a m = if a = 0 then m else gcd (m % a) a

let coprime a m = gcd a m = 1

let modulo a m = (a % m + m) % m

let modularInverse a m =
    if m = 1 then
        0
    else
        let m0 = m
        let mutable x = 1
        let mutable y = 0
        let mutable a' = a
        let mutable m' = m

        while a' > 1 do
            let q = a' / m'
            let tmp = a' % m' 
            a' <- m'
            m' <- tmp
            let tmp2 = x - q * y
            x <- y
            y <- tmp2

        if x < 0 then x + m0 else x

let alphabet = "abcdefghijklmnopqrstuvwxyz"
let chunkSize = 5

let charToIndex (c: char) = alphabet.IndexOf(Char.ToLower(c))

let indexToChar i = alphabet.[modulo i alphabet.Length]

let decode a b (cipheredText: string) =
    if not (coprime a alphabet.Length) then
        invalidArg "a" "a is not coprime"

    let modularInverse = modularInverse a alphabet.Length
    let shouldDecode = Char.IsLetterOrDigit
    let decode c = if Char.IsDigit(c) then c else indexToChar(modularInverse * (charToIndex c - b))

    String(cipheredText |> Seq.filter shouldDecode |> Seq.map decode |> Seq.toArray)

let encode a b (plainText: string) =
    if not (coprime a alphabet.Length) then
        invalidArg "a" "a is not coprime"
    
    let shouldEncode = Char.IsLetterOrDigit
    let encode c = if Char.IsDigit(c) then c else indexToChar(a * charToIndex c + b)

    plainText |> Seq.filter shouldEncode |> Seq.map encode |> Seq.chunkBySize chunkSize |> Seq.map String |> String.concat " "
