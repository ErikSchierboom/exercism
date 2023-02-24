import gleam/list
import gleam/int

pub fn sum(factors factors: List(Int), limit limit: Int) -> Int {
  list.range(1, limit - 1)
  |> list.filter(fn(number) {
    factors
    |> list.any(fn(factor) { factor > 0 && number % factor == 0 })
  })
  |> int.sum()
}
