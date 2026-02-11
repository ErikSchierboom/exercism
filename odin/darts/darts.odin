package darts

import "core:math"

score :: proc(x, y: f64) -> int {
	distance := math.hypot(x, y)
	if distance <=  1 do return 10
	if distance <=  5 do return  5
	if distance <= 10 do return  1
	return 0
}
