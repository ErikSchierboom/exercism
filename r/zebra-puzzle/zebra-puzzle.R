colors <- c("Red", "Green", "Ivory", "Yellow", "Blue")
nationalities <- c("Englishman", "Spaniard", "Ukrainian", "Japanese", "Norwegian") # nolint
pets <- c("Dog", "Snails", "Fox", "Horse", "Zebra")
drinks <- c("Coffee", "Tea", "Milk", "OrangeJuice", "Water")
hobbies <- c("Dancing", "Painting", "Reading", "Football", "Chess")

drinks_water <- function() {
  solution <- solve()
  solution$Nation[match("Water", solution$Drink)]
}

owns_zebra <- function() {
  solution <- solve()
  solution$Nation[match("Zebra", solution$Pet)]
}

solve <- function() { # nolint
  for (nation in permute(nationalities)) {
    if (nation[1] != "Norwegian") next

    for (color in permute(colors)) {
      if (match("Englishman", nation) != match("Red", color)) next
      if (abs(match("Norwegian", nation) - match("Blue", color)) != 1) next
      if ((match("Ivory", color) + 1) != match("Green", color)) next

      for (hobby in permute(hobbies)) {
        if (match("Painting", hobby) != match("Yellow", color)) next
        if (match("Chess", hobby) != match("Japanese", nation)) next

        for (pet in permute(pets)) {
          if (abs(match("Reading", hobby) - match("Fox", pet)) != 1) next
          if (abs(match("Painting", hobby) - match("Horse", pet)) != 1) next
          if (match("Spaniard", nation) != match("Dog", pet)) next
          if (match("Dancing", hobby) != match("Snails", pet)) next

          for (drink in permute(drinks)) {
            if (drink[3] != "Milk") next
            if (match("Ukrainian", nation) != match("Tea", drink)) next
            if (match("Green", color) != match("Coffee", drink)) next
            if (match("Football", hobby) != match("OrangeJuice", drink)) next

            return(
              data.frame(
                Nation = nation,
                Color = color,
                hobby = hobby,
                Pet = pet,
                Drink = drink
              )
            )
          }
        }
      }
    }
  }

  stop("Could not find solution")
}

permute <- function(x) {
  if (length(x) == 1) {
    return(list(x))
  }

  result <- list()
  for (i in seq_along(x)) {
    sub_perms <- permute(x[-i])
    for (sub_perm in sub_perms) {
      result <- append(result, list(c(x[i], sub_perm)))
    }
  }
  return(result)
}
