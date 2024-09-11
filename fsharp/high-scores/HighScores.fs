module HighScores

let scores = id

let latest = List.last

let personalBest = List.max

let personalTopThree scores = List.sortDescending scores |> List.truncate 3
