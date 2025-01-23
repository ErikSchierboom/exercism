new_robot <- function() {
  structure(
    list(
      name = random_name()
    ),
    class = "robot"
  )
}

reset_robot <- function(robot) {
  robot$name <- random_name()
  robot
}

random_name <- function() {
  paste0(
    c(sample(LETTERS, 2, replace = TRUE), sample(0:9, 3, replace = TRUE)),
    collapse = ""
  )
}
