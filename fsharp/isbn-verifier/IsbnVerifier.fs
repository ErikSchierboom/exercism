module IsbnVerifier

open System.Text.RegularExpressions

let private normalize (isbn: string) = isbn.Replace("-", "")

let private hasValidCharacters isbn = Regex.IsMatch(isbn, @"^\d{9}[\dX]$")

let private digitToValue index digit =
    let indexFactor = index + 1

    match digit with
    | 'X' -> 10 * indexFactor
    | _   -> (int digit - int '0') * indexFactor

let private checksum isbn =
    isbn
    |> Seq.rev
    |> Seq.mapi digitToValue
    |> Seq.sum

let isValid isbn = 
    let normalizedIsbn = normalize isbn
    hasValidCharacters normalizedIsbn && checksum normalizedIsbn % 11 = 0