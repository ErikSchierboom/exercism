subjects <- c(
  "house that Jack built",
  "malt that lay in",
  "rat that ate",
  "cat that killed",
  "dog that worried",
  "cow with the crumpled horn that tossed",
  "maiden all forlorn that milked",
  "man all tattered and torn that kissed",
  "priest all shaven and shorn that married",
  "rooster that crowed in the morn that woke",
  "farmer sowing his corn that kept",
  "horse and the hound and the horn that belonged to"
)

verse <- function(number) {
  verse_subjects <- paste0(subjects[number:1], collapse = " the ")
  paste("This is the ", verse_subjects, ".", sep = "")
}

recite <- function(start_verse, end_verse) {
  sapply(start_verse:end_verse, verse)
}
