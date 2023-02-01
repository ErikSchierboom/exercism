import gleam/string.{ends_with, is_empty, trim}
import gleam/regex.{check, from_string}

pub fn hey(remark: String) -> String {
  case is_silent(remark), is_shout(remark), is_question(remark) {
    True, _, _ -> "Fine. Be that way!"
    _, True, True -> "Calm down, I know what I'm doing!"
    _, True, _ -> "Whoa, chill out!"
    _, _, True -> "Sure."
    _, _, _ -> "Whatever."
  }
}

fn is_silent(remark: String) -> Bool {
  is_empty(trim(remark))
}

fn is_shout(remark: String) -> Bool {
  assert Ok(re) = from_string("^[^a-z]*[A-Z][^a-z]*$")
  check(re, remark)
}

fn is_question(remark: String) -> Bool {
  ends_with(trim(remark), "?")
}
