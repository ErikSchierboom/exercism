lyrics <- function(first, last) {
  sapply(first:last, verse) |> paste0(collapse = "\n")
}

verse <- function(number) {
  paste0(verse_first_line(number), "\n", verse_second_line(number), "\n")
}

verse_first_line <- function(number) {
  paste0(bottles_of_beer(number), " on the wall, ", tolower(bottles_of_beer(number)), ".")
}

verse_second_line <- function(number) {
  paste0(instruction(number), ", ", tolower(bottles_of_beer(ifelse(number == 0, 99, number - 1))), " on the wall.")
}

bottles_of_beer <- function(count) {
  if (count == 0) return("No more bottles of beer")
  if (count == 1) return("1 bottle of beer")
  
  paste0(as.character(count), " bottles of beer")
}

instruction <- function(count) {
  if (count == 0) return("Go to the store and buy some more")
  if (count == 1) return("Take it down and pass it around")
  
  "Take one down and pass it around"
}
