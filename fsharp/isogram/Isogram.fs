module Isogram

let isIsogram (str: string) = 
    let lowerLetters = str.ToLower() |> Seq.filter System.Char.IsLetter |> Seq.toList
    lowerLetters = List.distinct lowerLetters
