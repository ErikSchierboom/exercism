import gleam/string
import gleam/list

pub fn reverse(input: String) -> String {
  input
  |> string.to_graphemes()
  |> list.reverse()
  |> string.concat()
}
