module SimpleCipher

open System

let private letters = [| 'a'..'z' |]

module Key =
    let private random = Random()
    let private keyLength = 100
    
    let isValid key = System.Text.RegularExpressions.Regex.IsMatch(key, @"^[a-z]+$")
    
    let generate() = 
        Array.init keyLength (fun _ -> letters.[random.Next(letters.Length)]) 
        |> String

type SimpleCipher(key: string) =
    do 
        if not (Key.isValid key) then 
            invalidArg "key" "Invalid key"
            
    let shift op (input:string) =
        let modulo x y = ((x % y) + y) % y
        let shiftLetter i c =
            let alphabetIndex = Array.IndexOf(letters, c)
            let keyIndex = Array.IndexOf(letters, key.[modulo i key.Length])
            letters.[modulo (op alphabetIndex keyIndex) letters.Length]
        
        String.mapi shiftLetter input
    
    member _.Key with get() = key

    member _.Encode(plaintext: string) = shift (+) plaintext    
    member _.Decode(ciphertext: string) = shift (-) ciphertext
    
    new() = SimpleCipher(Key.generate())
