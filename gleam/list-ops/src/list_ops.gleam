import gleam/list

pub fn append(first first: List(a), second second: List(a)) -> List(a) {
  foldr(over: first, from: second, with: list.prepend)
}

pub fn concat(lists: List(List(a))) -> List(a) {
  foldl(over: lists, from: [], with: append)
}

pub fn filter(list: List(a), function: fn(a) -> Bool) -> List(a) {
  foldr(
    over: list,
    from: [],
    with: fn(acc, elem) {
      case function(elem) {
        True -> [elem, ..acc]
        False -> acc
      }
    },
  )
}

pub fn length(list: List(a)) -> Int {
  foldl(over: list, from: 0, with: fn(acc, _) { acc + 1 })
}

pub fn map(list: List(a), function: fn(a) -> b) -> List(b) {
  foldr(over: list, from: [], with: fn(acc, elem) { [function(elem), ..acc] })
}

pub fn foldl(
  over list: List(a),
  from initial: b,
  with function: fn(b, a) -> b,
) -> b {
  case list {
    [] -> initial
    [hd, ..tail] -> foldl(tail, function(initial, hd), function)
  }
}

pub fn foldr(
  over list: List(a),
  from initial: b,
  with function: fn(b, a) -> b,
) -> b {
  case list {
    [] -> initial
    [hd, ..tail] -> function(foldr(tail, initial, function), hd)
  }
}

pub fn reverse(list: List(a)) -> List(a) {
  foldl(over: list, from: [], with: list.prepend)
}
