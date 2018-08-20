module RotationalCipher

open System

let private lowerCaseLetters = "abcdefghijklmnopqrstuvwxyz"
let private upperCaseLetters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"

let private keyForLetter letter = if Char.IsLower(letter) then lowerCaseLetters else upperCaseLetters

let private rotateLetterUsingKey shiftKey (letter: char) (key: string) = 
    let shiftIndex = key.IndexOf(letter) + shiftKey
    key.[shiftIndex % key.Length]

let private rotateLetter shiftKey letter =
    if Char.IsLetter(letter) then
        rotateLetterUsingKey shiftKey letter  (keyForLetter letter)
    else
        letter

let rotate shiftKey text =
    text
    |> Seq.map (rotateLetter shiftKey)
    |> Seq.toArray
    |> String