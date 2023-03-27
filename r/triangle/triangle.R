triangle <- function(x, y, z) {
  stopifnot(x > 0 && y > 0 && z > 0)
  stopifnot(x + y >= z, x + z >= y, y + z >= x)

  sides = c(x, y, z)
  num_unique_sides = length(unique(sides))
  if (num_unique_sides == 1) {
    structure(sides, class = c("equilateral", "isosceles"))
  } else if (num_unique_sides == 2) {
    structure(sides, class = "isosceles")
  } else {
    structure(sides, class = "scalene")
  }
}
