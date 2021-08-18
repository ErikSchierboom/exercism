module Etl

open System

let transform scoreToLetters =
    let transformLetterScore score lettersToScore letter = Map.add (Char.ToLower letter) score lettersToScore
    let transformScoreToLetters lettersToScore score = List.fold (transformLetterScore score) lettersToScore
    Map.fold transformScoreToLetters Map.empty scoreToLetters
