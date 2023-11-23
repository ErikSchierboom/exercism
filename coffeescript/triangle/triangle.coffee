class Triangle
  constructor: (x, y, z) ->
    @valid = x + y + z > 0 && x + y >= z && x + z >= y && y + z >= x
    @numUniqueSides = new Set([x, y, z]).size

  equilateral: -> @valid && @numUniqueSides == 1

  isosceles: -> @valid && @numUniqueSides <= 2

  scalene: -> @valid && @numUniqueSides == 3 

module.exports = Triangle
