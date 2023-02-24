import gleam/bitwise

pub type Error {
  InvalidSquare
}

pub fn square(square: Int) -> Result(Int, Error) {
  case square < 1 || square > 64 {
    True -> Error(InvalidSquare)
    False -> Ok(bitwise.shift_left(1, square - 1))
  }
}

pub fn total() -> Int {
  bitwise.shift_left(1, 64) - 1
}
