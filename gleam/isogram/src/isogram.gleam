import gleam/string
import gleam/regex
import gleam/list
import gleam/set

pub fn is_isogram(phrase phrase: String) -> Bool {
  let letters =
    phrase
    |> string.lowercase()
    |> string.to_graphemes()
    |> list.filter(is_letter)

  list.length(letters) == set.size(set.from_list(letters))
}

fn is_letter(char: String) -> Bool {
  assert Ok(re) = regex.from_string("[a-z]")

  regex.check(with: re, content: char)
}
