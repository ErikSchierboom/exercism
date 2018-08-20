module RotationalCipher

open System

let private lowerCaseLetters = "abcdefghijklmnopqrstuvwxyz"
let private upperCaseLetters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"

let private keyForLetter letter = if Char.IsLower(letter) then lowerCaseLetters else upperCaseLetters

let private shiftLetter shiftKey (key: string) (letter: char) = 
    let shiftIndex = key.IndexOf(letter) + shiftKey
    key.[shiftIndex % key.Length]

let rotateLetter shiftKey letter =
    if Char.IsLetter(letter) then
        shiftLetter shiftKey (keyForLetter letter) letter
    else
        letter

let rotate shiftKey text =
    text
    |> Seq.map (rotateLetter shiftKey)
    |> Seq.toArray
    |> String