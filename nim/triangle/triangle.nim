import algorithm, math, sequtils

type
  Triangle = array[3, int]

proc isValid(triangle: Triangle): bool =
  var triangle = triangle.sorted
  triangle.sum > 0 and triangle[0] + triangle[1] >=  + triangle[2]

proc uniqueSides(triangle: Triangle): int =
  triangle.deduplicate.len

proc isEquilateral*(triangle: Triangle): bool =
  triangle.isValid and triangle.uniqueSides == 1

proc isIsosceles*(triangle: Triangle): bool =
  triangle.isValid and triangle.uniqueSides <= 2

proc isScalene*(triangle: Triangle): bool =
  triangle.isValid and triangle.uniqueSides == 3
