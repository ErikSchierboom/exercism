score <- function(x, y) {
  distance <- sqrt(x^2 + y^2)
  if (distance <= 1.0) { 
    10
  } else if (distance <= 5.0) { 
    5
  } else if (distance <= 10.0) { 
    1
  } else {
    0
  }
}
