package clock

import "core:fmt"

Clock :: struct {
	minutes: int
}

MINUTES_PER_DAY :: 60 * 24

create_clock :: proc(hour, minute: int) -> Clock {
	minutes := (hour * 60 + minute) %% MINUTES_PER_DAY
	return Clock{minutes}
}

to_string :: proc(clock: Clock) -> string {
	return fmt.aprintf("%2d:%2d", clock.minutes / 60, clock.minutes % 60)
}

add :: proc(clock: ^Clock, minutes: int) {
	clock.minutes += minutes
	clock.minutes %%= MINUTES_PER_DAY
}

subtract :: proc(clock: ^Clock, minutes: int) {
	clock.minutes -= minutes
	clock.minutes %%= MINUTES_PER_DAY
}

equals :: proc(clock1, clock2: Clock) -> bool {
	return clock1.minutes == clock2.minutes
}
