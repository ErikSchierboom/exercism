import gleam/string

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
  string.is_empty(string.trim(remark))
}

fn is_shout(remark: String) -> Bool {
  string.uppercase(remark) == remark && string.lowercase(remark) != remark
}

fn is_question(remark: String) -> Bool {
  string.ends_with(string.trim(remark), "?")
}
