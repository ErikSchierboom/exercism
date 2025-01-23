subjects <- data.frame(
  Animal = c("fly", "spider", "bird", "cat", "dog", "goat", "cow", "horse"),
  Phrase = c(
    "",
    "It wriggled and jiggled and tickled inside her.",
    "How absurd to swallow a bird!",
    "Imagine that, to swallow a cat!",
    "What a hog, to swallow a dog!",
    "Just opened her throat and swallowed a goat!",
    "I don't know how she swallowed a cow!",
    ""
  )
)

recite <- function(begin_idx, end_idx) {
  lapply(begin_idx:end_idx, verse) |>
    lapply(FUN = \(verse) c(verse, "")) |> 
    unlist() |> 
    head(n = -1)
}

verse <- function(number) {
  c(verse_begin(number), verse_middle(number), verse_end(number))
}

verse_begin <- function(number) {
  paste(
    "I know an old lady who swallowed a ",
    subjects$Animal[number],
    ".",
    sep = ""
  )
}

verse_swallow <- function(swallowed, caught) {
  if (caught == "spider") {
    caught <- paste(caught, "that wriggled and jiggled and tickled inside her")
  }
  
  paste(
    "She swallowed the ",
    swallowed,
    " to catch the ",
    caught,
    ".",
    sep = ""
  )
}

verse_swallows <- function(number) {
  swallowed_animals <- subjects$Animal[number:2]
  caught_animals <- c(subjects$Animal[(number - 1):1], NA)[-number]
  mapply(verse_swallow, swallowed_animals, caught_animals) |> unname()
}

verse_middle <- function(number) {
  if (number %in% c(1, 8)) {
    return(c())
  }
  
  c(subjects$Phrase[number], verse_swallows(number))
}

verse_end <- function(number) {
  ifelse(
    number == 8,
    "She's dead, of course!",
    "I don't know why she swallowed the fly. Perhaps she'll die."
  )
}
