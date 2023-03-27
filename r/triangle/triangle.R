triangle <- function(x, y, z) {
  stopifnot(x > 0 && y > 0 && z > 0)
  stopifnot(x + y >= z, x + z >= y, y + z >= x)

  sides <- c(x, y, z)
  class_name <- switch(length(unique(sides)),
                       c("equilateral", "isosceles"),
                       "isosceles",
                       "scalene")
  
  structure(sides, class = class_name)
}
