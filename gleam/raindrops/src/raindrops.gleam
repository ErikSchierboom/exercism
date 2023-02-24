import gleam/string
import gleam/pair
import gleam/list
import gleam/int

pub fn convert(number: Int) -> String {
  let sounds =
    [#(3, "Pling"), #(5, "Plang"), #(7, "Plong")]
    |> list.filter(fn(coded_sound) { number % coded_sound.0 == 0 })
    |> list.map(pair.second)

  case sounds {
    [] -> int.to_string(number)
    _ -> string.concat(sounds)
  }
}
