pub fn accumulate(list: List(a), fun: fn(a) -> b) -> List(b) {
  case list {
    [] -> []
    [hd, ..tail] -> [fun(hd), ..accumulate(tail, fun)]
  }
}
