package gigasecond

import "core:time/datetime"

GIGASECOND :: 1_000_000_000

add_gigasecond :: proc(moment: datetime.DateTime) -> datetime.DateTime {
	result, _ := datetime.add_delta_to_datetime(moment, datetime.Delta{seconds = GIGASECOND})
	return result
}
