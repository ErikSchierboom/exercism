import gleam/list.{reverse}

pub fn accumulate(list: List(a), fun: fn(a) -> b) -> List(b) {
  accumulate_helper(list, fun, [])
}

fn accumulate_helper(list: List(a), fun: fn(a) -> b, acc: List(b)) -> List(b) {
  case list {
    [] -> reverse(acc)
    [hd, ..tail] -> accumulate_helper(tail, fun, [fun(hd), ..acc])
  }
}
