subjects <- c(
  "a Partridge in a Pear Tree", "two Turtle Doves", "three French Hens",
  "four Calling Birds", "five Gold Rings", "six Geese-a-Laying",
  "seven Swans-a-Swimming", "eight Maids-a-Milking", "nine Ladies Dancing",
  "ten Lords-a-Leaping", "eleven Pipers Piping", "twelve Drummers Drumming"
)

days <- c(
  "first", "second", "third", "fourth", "fifth", "sixth",
  "seventh", "eighth", "ninth", "tenth", "eleventh", "twelfth"
)

verse <- function(number) {
  gifts <- subjects[number:1]
  if (number > 1) {
    gifts[length(gifts)] <- paste("and", gifts[length(gifts)])
  }

  paste(
    "On the ", days[number], " day of Christmas my true love gave to me: ",
    paste0(gifts, collapse = ", "), ".",
    sep = ""
  )
}

recite <- function(start_verse, end_verse) {
  sapply(start_verse:end_verse, verse)
}
