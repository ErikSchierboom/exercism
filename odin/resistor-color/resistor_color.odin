package resistor_color

Color :: enum {
	Black, Brown, Red, Orange, Yellow, Green, Blue, Violet, Grey, White
}

code :: proc(color: Color) -> int {
	return int(color)
}

colors :: proc() -> [10]Color {
	return [10]Color{.Black, .Brown, .Red, .Orange, .Yellow, .Green, .Blue, .Violet, .Grey, .White}
}
