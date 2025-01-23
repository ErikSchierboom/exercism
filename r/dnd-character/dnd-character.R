modifier <- function(score) {
  (score - 10) %/% 2
}

ability <- function() {
  sample(1:6, 4, replace = TRUE) |> sort() |> tail(n = 3) |> sum()
}

new_character <- function() {
  constitution <- ability()
  
  structure(
    list(
      strength = ability(),
      dexterity = ability(),
      intelligence = ability(),
      wisdom = ability(),
      charisma = ability(),
      constitution = constitution,
      hitpoints = 10 + modifier(constitution)
    ),
    class = "character"
  )
}
