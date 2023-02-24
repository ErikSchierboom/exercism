import gleam/list
import gleam/string

pub fn find_anagrams(word: String, candidates: List(String)) -> List(String) {
  candidates
  |> list.filter(fn(candidate) {
    string.lowercase(word) != string.lowercase(candidate)
  })
  |> list.filter(fn(candidate) {
    sorted_letters(word) == sorted_letters(candidate)
  })
}

fn sorted_letters(word: String) -> List(String) {
  word
  |> string.lowercase()
  |> string.to_graphemes()
  |> list.sort(string.compare)
}
