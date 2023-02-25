import gleam/int
import gleam/list
import gleam/string

pub fn score(word: String) -> Int {
  word
  |> string.uppercase()
  |> string.to_graphemes()
  |> list.map(score_letter)
  |> int.sum()
}

fn score_letter(letter: String) -> Int {
  case letter {
    "A" | "E" | "I" | "O" | "U" | "L" | "N" | "R" | "S" | "T" -> 1
    "D" -> 2
    "G" -> 2
    "B" -> 3
    "C" -> 3
    "M" -> 3
    "P" -> 3
    "F" -> 4
    "H" -> 4
    "V" -> 4
    "W" -> 4
    "Y" -> 4
    "K" -> 5
    "J" -> 8
    "X" -> 8
    "Q" -> 10
    "Z" -> 10
  }
}
