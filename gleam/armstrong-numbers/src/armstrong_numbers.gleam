import gleam/int
import gleam/list

pub fn is_armstrong_number(number: Int) -> Bool {
  assert Ok(digits) = int.digits(number, 10)
  let num_digits = list.length(digits)

  let armstrong_sum =
    digits
    |> list.map(fn(digit) { int.product(list.repeat(digit, num_digits)) })
    |> int.sum()

  number == armstrong_sum
}
