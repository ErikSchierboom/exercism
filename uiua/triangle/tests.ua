~ "triangle.ua" ~ IsEquilateral IsIsosceles IsScalene

# equilateral triangle - all sides are equal
⍤⤙≍ 1 IsEquilateral [2 2 2]

# equilateral triangle - any side is unequal
⍤⤙≍ 0 IsEquilateral [2 3 2]

# equilateral triangle - no sides are equal
⍤⤙≍ 0 IsEquilateral [5 4 6]

# equilateral triangle - all zero sides is not a triangle
⍤⤙≍ 0 IsEquilateral [0 0 0]

# isosceles triangle - last two sides are equal
⍤⤙≍ 1 IsIsosceles [3 4 4]

# isosceles triangle - first two sides are equal
⍤⤙≍ 1 IsIsosceles [4 4 3]

# isosceles triangle - first and last sides are equal
⍤⤙≍ 1 IsIsosceles [4 3 4]

# IsEquilateral triangles are also isosceles
⍤⤙≍ 1 IsIsosceles [4 4 4]

# isosceles triangle - no sides are equal
⍤⤙≍ 0 IsIsosceles [2 3 4]

# isosceles triangle - first triangle inequality violation
⍤⤙≍ 0 IsIsosceles [1 1 3]

# isosceles triangle - second triangle inequality violation
⍤⤙≍ 0 IsIsosceles [1 3 1]

# isosceles triangle - third triangle inequality violation
⍤⤙≍ 0 IsIsosceles [3 1 1]

# scalene triangle - no sides are equal
⍤⤙≍ 1 IsScalene [5 4 6]

# scalene triangle - all sides are equal
⍤⤙≍ 0 IsScalene [4 4 4]

# scalene triangle - first and second sides are equal
⍤⤙≍ 0 IsScalene [4 4 3]

# scalene triangle - first and third sides are equal
⍤⤙≍ 0 IsScalene [3 4 3]

# scalene triangle - second and third sides are equal
⍤⤙≍ 0 IsScalene [4 3 3]

# scalene triangle - may not violate triangle inequality
⍤⤙≍ 0 IsScalene [7 3 2]
