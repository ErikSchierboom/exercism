def is_valid (sides: [3]f64): bool =
  (sides[0] != 0 || sides[1] != 0 || sides[2] != 0) &&
  (sides[0] + sides[1] >= sides[2]) &&
  (sides[0] + sides[2] >= sides[1]) &&
  (sides[2] + sides[1] >= sides[0])

def is_equilateral (sides: [3]f64): bool = 
  is_valid sides && sides[0] == sides[1] && sides[1] == sides[2]

def is_isosceles (sides: [3]f64): bool =
  is_valid sides && (sides[0] == sides[1] || sides[1] == sides[2] || sides[0] == sides[2])

def is_scalene (sides: [3]f64): bool =
  is_valid sides && sides[0] != sides[1] && sides[1] != sides[2] && sides[0] != sides[2]
