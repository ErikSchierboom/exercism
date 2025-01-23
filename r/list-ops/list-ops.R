my_foldl <- function(x, f, init) {
  val <- init

  for (element in x) {
    val <- f(val, element)
  }

  val
}

my_foldr <- function(x, f, init) {
  my_foldl(rev(x), f, init)
}

my_append <- function(x, y) {
  my_foldl(y, \(acc, el) append(acc, list(el)), x)
}

my_concat <- function(x) {
  my_foldl(x, my_append, list())
}

my_filter <- function(x, f) {
  my_foldl(x, \(acc, el) if (f(el)) append(acc, list(el)) else acc, list())
}

my_length <- function(x) {
  my_foldl(x, \(acc, el) acc + 1, 0)
}

my_map <- function(x, f) {
  my_foldl(x, \(acc, el) append(acc, list(f(el))), list())
}

my_reverse <- function(x) {
  my_foldr(x, \(acc, el) append(acc, list(el)), list())
}
