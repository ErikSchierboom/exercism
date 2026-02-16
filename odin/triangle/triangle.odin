package triangle

Error :: enum {
	None,
	Not_A_Triangle,
}

is_a_triangle :: proc(a: f64, b: f64, c: f64) -> bool {
	return a > 0 && b > 0 && c > 0 && a + b >= c && a + c >= b && b + c >= a
}

is_equilateral :: proc(a: f64, b: f64, c: f64) -> (bool, Error) {
	if !is_a_triangle(a, b, c) do return false, .Not_A_Triangle

	return a == b && b == c, .None
}

is_isosceles :: proc(a: f64, b: f64, c: f64) -> (bool, Error) {
	if !is_a_triangle(a, b, c) do return false, .Not_A_Triangle

	return a == b || a == c || b == c, .None
}

is_scalene :: proc(a: f64, b: f64, c: f64) -> (bool, Error) {
	if !is_a_triangle(a, b, c) do return false, .Not_A_Triangle

	return a != b && b != c && a != c, .None
}
