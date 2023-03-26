is.silent <- \(input) trimws(input) == ""
is.question <- \(input) endsWith(trimws(input), "?")
is.shout <- \(input) toupper(input) == input && tolower(input) != input

bob <- function(input) {
  if (is.silent(input)) {
    "Fine. Be that way!"
  } else if (is.shout(input) && is.question(input)) {
    "Calm down, I know what I'm doing!"
  } else if (is.shout(input)) {
    "Whoa, chill out!"
  } else if (is.question(input)) {
    "Sure."
  } else {
    "Whatever."
  }
}


