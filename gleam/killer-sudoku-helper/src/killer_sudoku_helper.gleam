import gleam/list
import gleam/int

pub fn combinations(
  size size: Int,
  sum sum: Int,
  exclude exclude: List(Int),
) -> List(List(Int)) {
  list.range(1, 9)
  |> list.filter(fn(n) { !list.contains(exclude, n) })
  |> list.combinations(size)
  |> list.filter(fn(combination) { int.sum(combination) == sum })
}
