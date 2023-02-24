import gleam/string
import gleam/set.{Set}

const alphabet = "abcdefghijklmnopqrstuvwxyz"

pub fn is_pangram(sentence: String) -> Bool {
  set.intersection(of: graphemes_set(alphabet), and: graphemes_set(sentence))
  |> set.size == string.length(alphabet)
}

fn graphemes_set(str: String) -> Set(String) {
  str
  |> string.lowercase()
  |> string.to_graphemes()
  |> set.from_list
}
