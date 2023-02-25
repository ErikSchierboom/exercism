import gleam/map.{Map}
import gleam/regex
import gleam/list
import gleam/string
import gleam/function

pub fn count_words(input: String) -> Map(String, Int) {
  assert Ok(re) = regex.from_string("\\w+('\\w+)*")

  input
  |> string.lowercase()
  |> regex.scan(re, _)
  |> list.map(fn(match) { match.content })
  |> list.group(function.identity)
  |> map.map_values(fn(_, occurences) { list.length(occurences) })
}
