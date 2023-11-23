Triangle = require './triangle'

describe 'Triangle', ->
  describe 'equilateral', ->
    it 'all sides are equal', ->
      triangle = new Triangle(2, 2, 2)
      expect(triangle.equilateral()).toEqual true

    it 'any side is unequal', ->
      triangle = new Triangle(2, 3, 2)
      expect(triangle.equilateral()).toEqual false

    it 'no sides are equal', ->
      triangle = new Triangle(5, 4, 6)
      expect(triangle.equilateral()).toEqual false

    it 'all zero sides is not a triangle', ->
      triangle = new Triangle(0, 0, 0)
      expect(triangle.equilateral()).toEqual false

    it 'sides may be floats', ->
      triangle = new Triangle(0.5, 0.5, 0.5)
      expect(triangle.equilateral()).toEqual true

  describe 'isosceles', ->
    it 'last two sides are equal', ->
      triangle = new Triangle(3, 4, 4)
      expect(triangle.isosceles()).toEqual true

    it 'first two sides are equal', ->
      triangle = new Triangle(4, 4, 3)
      expect(triangle.isosceles()).toEqual true

    it 'first and last sides are equal', ->
      triangle = new Triangle(4, 3, 4)
      expect(triangle.isosceles()).toEqual true

    it 'equilateral triangles are also isosceles', ->
      triangle = new Triangle(4, 4, 4)
      expect(triangle.isosceles()).toEqual true

    it 'no sides are equal', ->
      triangle = new Triangle(2, 3, 4)
      expect(triangle.isosceles()).toEqual false

    it 'first triangle inequality violation', ->
      triangle = new Triangle(1, 1, 3)
      expect(triangle.isosceles()).toEqual false

    it 'second triangle inequality violation', ->
      triangle = new Triangle(1, 3, 1)
      expect(triangle.isosceles()).toEqual false

    it 'third triangle inequality violation', ->
      triangle = new Triangle(3, 1, 1)
      expect(triangle.isosceles()).toEqual false

    it 'sides may be floats', ->
      triangle = new Triangle(0.5, 0.4, 0.5)
      expect(triangle.isosceles()).toEqual true

  describe 'scalene', ->
    it 'no sides are equal', ->
      triangle = new Triangle(5, 4, 6)
      expect(triangle.scalene()).toEqual true

    it 'all sides are equal', ->
      triangle = new Triangle(4, 4, 4)
      expect(triangle.scalene()).toEqual false

    it 'first and second sides are equal', ->
      triangle = new Triangle(4, 4, 3)
      expect(triangle.scalene()).toEqual false

    it 'first and third sides are equal', ->
      triangle = new Triangle(3, 4, 3)
      expect(triangle.scalene()).toEqual false

    it 'second and third  sides are equal', ->
      triangle = new Triangle(4, 3, 3)
      expect(triangle.scalene()).toEqual false

    it 'may not violate triangle inequality', ->
      triangle = new Triangle(7, 3, 2)
      expect(triangle.scalene()).toEqual false

    it 'sides may be floats', ->
      triangle = new Triangle(0.5, 0.4, 0.6)
      expect(triangle.scalene()).toEqual true