import gleam/string
import gleam/result
import gleam/list
import gleam/int

pub fn valid(value: String) -> Bool {
  value
  |> to_digits()
  |> result.then(validate_length)
  |> result.map(validate_checksum)
  |> result.unwrap(False)
}

fn to_digits(value: String) -> Result(List(Int), Nil) {
  value
  |> string.replace(each: " ", with: "")
  |> string.to_graphemes()
  |> list.try_map(with: int.parse)
}

fn validate_length(digits: List(Int)) -> Result(List(Int), Nil) {
  case list.length(digits) > 1 {
    True -> Ok(digits)
    False -> Error(Nil)
  }
}

fn validate_checksum(digits: List(Int)) -> Bool {
  checksum(digits) % 10 == 0
}

fn checksum(digits: List(Int)) -> Int {
  digits
  |> list.reverse()
  |> list.index_map(digit_value)
  |> int.sum()
}

fn digit_value(digit: Int, index: Int) -> Int {
  case digit, int.is_odd(index) {
    _, True if digit < 5 -> digit * 2
    _, True -> digit * 2 - 9
    _, _ -> digit
  }
}
