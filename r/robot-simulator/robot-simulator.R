new_robot <- function(coordinates, direction) {
  robot <- list(coordinates = coordinates, direction = direction)
  class(robot) <- "robot"
  robot
}

move <- function(a_robot, commands) {
  for (command in unlist(strsplit(commands, ""))) {
    a_robot <- switch(command,
      L = turn_left(a_robot),
      R = turn_right(a_robot),
      A = advance(a_robot)
    )
  }
  
  a_robot
}

turn_left <- function(a_robot) {
  switch(a_robot$direction,
         NORTH = new_robot(a_robot$coordinates, "WEST"),
         EAST  = new_robot(a_robot$coordinates, "NORTH"),
         SOUTH = new_robot(a_robot$coordinates, "EAST"),
         WEST  = new_robot(a_robot$coordinates, "SOUTH"),
  )
}

turn_right <- function(a_robot) {
  switch(a_robot$direction,
         NORTH = new_robot(a_robot$coordinates, "EAST"),
         EAST  = new_robot(a_robot$coordinates, "SOUTH"),
         SOUTH = new_robot(a_robot$coordinates, "WEST"),
         WEST  = new_robot(a_robot$coordinates, "NORTH"),
  )
}

advance <- function(a_robot) {
  x = a_robot$coordinates[[1]]
  y = a_robot$coordinates[[2]]
  
  switch(a_robot$direction,
         NORTH = new_robot(c(x,     y + 1), a_robot$direction),
         EAST  = new_robot(c(x + 1, y),     a_robot$direction),
         SOUTH = new_robot(c(x,     y - 1), a_robot$direction),
         WEST  = new_robot(c(x - 1, y),     a_robot$direction),
  )
}

