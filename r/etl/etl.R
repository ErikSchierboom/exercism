etl <- function(input) {
  transformed = list()
  
  for (score in names(input)) {
    for (letter in input[score]) {
      transformed[tolower(letter)] = as.integer(score)
    }
  }
  
  transformed[order(names(transformed))]
}
