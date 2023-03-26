bob <- function(input) {
  if (is_silent(input)) {
    "Fine. Be that way!"
  } else if (is_shout(input) && is_question(input)) {
    "Calm down, I know what I'm doing!"
  } else if (is_shout(input)) {
    "Whoa, chill out!"
  } else if (is_question(input)) {
    "Sure."
  } else {
    "Whatever."
  }
}

is_silent <- function(input) {
  trimws(input) == ""
}

is_question <- function(input) {
  endsWith(trimws(input), "?")
}

is_shout <- function(input) {
  toupper(input) == input && tolower(input) != input
}
