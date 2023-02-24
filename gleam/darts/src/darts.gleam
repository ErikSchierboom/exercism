import gleam/float

pub fn score(x x: Float, y y: Float) -> Int {
  assert Ok(distance) = float.square_root(x *. x +. y *. y)

  case distance {
    _ if distance <=. 1.0 -> 10
    _ if distance <=. 5.0 -> 5
    _ if distance <=. 10.0 -> 1
    _ -> 0
  }
}
