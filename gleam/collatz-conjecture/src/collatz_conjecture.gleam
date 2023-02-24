pub type Error {
  NonPositiveNumber
}

pub fn steps(number: Int) -> Result(Int, Error) {
  case number < 1 {
    True -> Error(NonPositiveNumber)
    False -> Ok(do_steps(number, 0))
  }
}

fn do_steps(number: Int, steps: Int) -> Int {
  case number, number % 2 == 0 {
    1, _ -> steps
    _, True -> do_steps(number / 2, steps + 1)
    _, False -> do_steps(number * 3 + 1, steps + 1)
  }
}
