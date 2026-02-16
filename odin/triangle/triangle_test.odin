package triangle

import "core:testing"

@(test)
/// description = equilateral triangle -> all sides are equal
test_equilateral_triangle__all_sides_are_equal :: proc(t: ^testing.T) {
	result, err := is_equilateral(2, 2, 2)
	testing.expect(t, result)
	testing.expect_value(t, err, Error.None)
}

@(test)
/// description = equilateral triangle -> any side is unequal
test_equilateral_triangle__any_side_is_unequal :: proc(t: ^testing.T) {
	result, err := is_equilateral(2, 3, 2)
	testing.expect(t, !result)
	testing.expect_value(t, err, Error.None)
}

@(test)
/// description = equilateral triangle -> no sides are equal
test_equilateral_triangle__no_sides_are_equal :: proc(t: ^testing.T) {
	result, err := is_equilateral(5, 4, 6)
	testing.expect(t, !result)
	testing.expect_value(t, err, Error.None)
}

@(test)
/// description = equilateral triangle -> all zero sides is not a triangle
test_equilateral_triangle__all_zero_sides_is_not_a_triangle :: proc(t: ^testing.T) {
	_, err := is_equilateral(0, 0, 0)
	testing.expect_value(t, err, Error.Not_A_Triangle)
}

@(test)
/// description = equilateral triangle -> sides may be floats
test_equilateral_triangle__sides_may_be_floats :: proc(t: ^testing.T) {
	result, err := is_equilateral(0.5, 0.5, 0.5)
	testing.expect(t, result)
	testing.expect_value(t, err, Error.None)
}

@(test)
/// description = isosceles triangle -> last two sides are equal
test_isosceles_triangle__last_two_sides_are_equal :: proc(t: ^testing.T) {
	result, err := is_isosceles(3, 4, 4)
	testing.expect(t, result)
	testing.expect_value(t, err, Error.None)
}

@(test)
/// description = isosceles triangle -> first two sides are equal
test_isosceles_triangle__first_two_sides_are_equal :: proc(t: ^testing.T) {
	result, err := is_isosceles(4, 4, 3)
	testing.expect(t, result)
	testing.expect_value(t, err, Error.None)
}

@(test)
/// description = isosceles triangle -> first and last sides are equal
test_isosceles_triangle__first_and_last_sides_are_equal :: proc(t: ^testing.T) {
	result, err := is_isosceles(4, 3, 4)
	testing.expect(t, result)
	testing.expect_value(t, err, Error.None)
}

@(test)
/// description = isosceles triangle -> equilateral triangles are also isosceles
test_isosceles_triangle__equilateral_triangles_are_also_isosceles :: proc(t: ^testing.T) {
	result, err := is_isosceles(4, 4, 4)
	testing.expect(t, result)
	testing.expect_value(t, err, Error.None)
}

@(test)
/// description = isosceles triangle -> no sides are equal
test_isosceles_triangle__no_sides_are_equal :: proc(t: ^testing.T) {
	result, err := is_isosceles(2, 3, 4)
	testing.expect(t, !result)
	testing.expect_value(t, err, Error.None)
}

@(test)
/// description = isosceles triangle -> first triangle inequality violation
test_isosceles_triangle__first_triangle_inequality_violation :: proc(t: ^testing.T) {
	_, err := is_isosceles(1, 1, 3)
	testing.expect_value(t, err, Error.Not_A_Triangle)
}

@(test)
/// description = isosceles triangle -> second triangle inequality violation
test_isosceles_triangle__second_triangle_inequality_violation :: proc(t: ^testing.T) {
	_, err := is_isosceles(1, 3, 1)
	testing.expect_value(t, err, Error.Not_A_Triangle)
}

@(test)
/// description = isosceles triangle -> third triangle inequality violation
test_isosceles_triangle__third_triangle_inequality_violation :: proc(t: ^testing.T) {
	_, err := is_isosceles(3, 1, 1)
	testing.expect_value(t, err, Error.Not_A_Triangle)
}

@(test)
/// description = isosceles triangle -> sides may be floats
test_isosceles_triangle__sides_may_be_floats :: proc(t: ^testing.T) {
	result, err := is_isosceles(0.5, 0.4, 0.5)
	testing.expect(t, result)
	testing.expect_value(t, err, Error.None)
}

@(test)
/// description = scalene triangle -> no sides are equal
test_scalene_triangle__no_sides_are_equal :: proc(t: ^testing.T) {
	result, err := is_scalene(5, 4, 6)
	testing.expect(t, result)
	testing.expect_value(t, err, Error.None)
}

@(test)
/// description = scalene triangle -> all sides are equal
test_scalene_triangle__all_sides_are_equal :: proc(t: ^testing.T) {
	result, err := is_scalene(4, 4, 4)
	testing.expect(t, !result)
	testing.expect_value(t, err, Error.None)
}

@(test)
/// description = scalene triangle -> first and second sides are equal
test_scalene_triangle__first_and_second_sides_are_equal :: proc(t: ^testing.T) {
	result, err := is_scalene(4, 4, 3)
	testing.expect(t, !result)
	testing.expect_value(t, err, Error.None)
}

@(test)
/// description = scalene triangle -> first and third sides are equal
test_scalene_triangle__first_and_third_sides_are_equal :: proc(t: ^testing.T) {
	result, err := is_scalene(3, 4, 3)
	testing.expect(t, !result)
	testing.expect_value(t, err, Error.None)
}

@(test)
/// description = scalene triangle -> second and third sides are equal
test_scalene_triangle__second_and_third_sides_are_equal :: proc(t: ^testing.T) {
	result, err := is_scalene(4, 3, 3)
	testing.expect(t, !result)
	testing.expect_value(t, err, Error.None)
}

@(test)
/// description = scalene triangle -> may not violate triangle inequality
test_scalene_triangle__may_not_violate_triangle_inequality :: proc(t: ^testing.T) {
	_, err := is_scalene(7, 3, 2)
	testing.expect_value(t, err, Error.Not_A_Triangle)
}

@(test)
/// description = scalene triangle -> sides may be floats
test_scalene_triangle__sides_may_be_floats :: proc(t: ^testing.T) {
	result, err := is_scalene(0.5, 0.4, 0.6)
	testing.expect(t, result)
	testing.expect_value(t, err, Error.None)
}
