import gleam/string
import gleam/list

pub fn slices(input: String, size: Int) -> Result(List(String), Error) {
  let characters = string.to_graphemes(input)
  let num_characters = list.length(characters)

  case characters {
    [] -> Error(EmptySeries)
    _ if size < 0 -> Error(SliceLengthNegative)
    _ if size == 0 -> Error(SliceLengthZero)
    _ if size > num_characters -> Error(SliceLengthTooLarge)
    _ ->
      characters
      |> list.window(by: size)
      |> list.map(string.concat)
      |> Ok()
  }
}

pub type Error {
  EmptySeries
  SliceLengthZero
  SliceLengthNegative
  SliceLengthTooLarge
}
