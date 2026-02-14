package bob

import "core:strings"

response :: proc(input: string) -> string {
	input := strings.trim_space(input)

	switch {
	case is_silent(input):
		return "Fine. Be that way!"
	case is_question(input) && is_shout(input):
		return "Calm down, I know what I'm doing!"
	case is_question(input):
		return "Sure."
	case is_shout(input):
		return "Whoa, chill out!"
	case:
		return "Whatever."
	}
}

is_silent :: proc(input: string) -> bool {
	return len(input) == 0
}

is_question :: proc(input: string) -> bool {
	return strings.ends_with(input, "?")
}

is_shout :: proc(input: string) -> bool {
	upper_input := strings.to_upper(input, allocator = context.temp_allocator)
	lower_input := strings.to_lower(input, allocator = context.temp_allocator)
	return upper_input != lower_input && input == upper_input
}
