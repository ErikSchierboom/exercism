import gleam/list

pub fn rows(n: Int) -> List(List(Int)) {
  list.map(
    list.range(0, n - 1),
    fn(row) { list.map(list.range(0, row), value(row, _)) },
  )
}

fn value(row: Int, col: Int) -> Int {
  factorial(row) / { factorial(row - col) * factorial(col) }
}

fn factorial(i: Int) -> Int {
  case i {
    0 | 1 -> 1
    _ -> i * factorial(i - 1)
  }
}
