module CryptoSquare

open System

let private normalize (plaintext: string) =
    plaintext.ToLower() |> String.filter Char.IsLetterOrDigit
    
let private size (plaintext: string) = int (Math.Ceiling(Math.Sqrt(float plaintext.Length)))

let private rows (plaintext: string) =
    let n = size plaintext

    plaintext.ToCharArray()
    |> Array.chunkBySize (max 1 n)
    |> Array.map (fun row -> Array.append row (Array.replicate (n - row.Length) ' '))

let ciphertext (plaintext: string) = 
    plaintext
    |> normalize
    |> rows
    |> Array.transpose
    |> Array.map String 
    |> String.concat " "
