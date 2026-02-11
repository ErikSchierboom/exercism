package line_up

import "core:fmt"

format :: proc(name: string, number: int) -> string {
	remainder := number % 10
	tens_remainder := number % 100

	suffix: string
	switch {
	case remainder == 1 && tens_remainder != 11:
		suffix = "st"
	case remainder == 2 && tens_remainder != 12:
		suffix = "nd"
	case remainder == 3 && tens_remainder != 13:
		suffix = "rd"
	case:
		suffix = "th"
	}

	return fmt.tprintf("%s, you are the %d%s customer we serve today. Thank you!", name, number, suffix)
}
