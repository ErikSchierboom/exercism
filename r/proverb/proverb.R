verse_line <- function(want, lost) {
  paste("For want of a", want, "the", lost, "was lost.")
}

verse_ending <- function(want) {
  paste("And all for the want of a ", want, ".", sep = "")
}

recite <- function(wanted) {
  if (is.null(wanted)) {
    return(c())
  }

  lines <- mapply(verse_line, wanted, c(wanted[-1], NA))[-length(wanted)]
  c(unname(lines), verse_ending(wanted[[1]]))
}
