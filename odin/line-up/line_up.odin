package line_up

import "core:fmt"

format :: proc(name: string, number: int) -> string {
	return fmt.tprintf("%s, you are the %d%s customer we serve today. Thank you!", name, number, suffix(number))
}

suffix :: proc(number: int) -> string {
	switch number % 100 {
	case 11, 12, 13:
		return "th"
	}

	switch number % 10 {
	case 1:
		return "st"
	case 2:
		return "nd"
	case 3:
		return "rd"
	case:
		return "th"
	}
}
