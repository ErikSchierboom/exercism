raindrops <- function(number) {
  sounds <- c("Pling" = 3, "Plang" = 5, "Plong" = 7)
  drops <- sounds[number %% sounds == 0] |> names() |> paste(collapse = "")
  ifelse(nchar(drops) > 1, yes = drops, no = as.character(number))
}
