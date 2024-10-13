flatten <- function(input) {
  flattened <- c()

  for (element in input) {
    if (is.null(element)) next

    if (is.list(element)) {
      flattened <- c(flattened, flatten(element))
    } else {
      flattened <- c(flattened, element)
    }
  }

  flattened
}
