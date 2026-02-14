package gigasecond

import "core:testing"
import "core:time/datetime"

@(test)
/// description = date only specification of time
test_date_only_specification_of_time :: proc(t: ^testing.T) {
	input := datetime.DateTime {
		year  = 2011,
		month = 04,
		day   = 25,
	}
	result := add_gigasecond(input)

	expected := datetime.DateTime {
		year   = 2043,
		month  = 01,
		day    = 01,
		hour   = 01,
		minute = 46,
		second = 40,
	}

	testing.expect_value(t, result, expected)
}

@(test)
/// description = second test for date only specification of time
test_second_test_for_date_only_specification_of_time :: proc(t: ^testing.T) {
	input := datetime.DateTime {
		year  = 1977,
		month = 06,
		day   = 13,
	}
	result := add_gigasecond(input)

	expected := datetime.DateTime {
		year   = 2009,
		month  = 02,
		day    = 19,
		hour   = 01,
		minute = 46,
		second = 40,
	}

	testing.expect_value(t, result, expected)
}

@(test)
/// description = third test for date only specification of time
test_third_test_for_date_only_specification_of_time :: proc(t: ^testing.T) {
	input := datetime.DateTime {
		year  = 1959,
		month = 07,
		day   = 19,
	}
	result := add_gigasecond(input)

	expected := datetime.DateTime {
		year   = 1991,
		month  = 03,
		day    = 27,
		hour   = 01,
		minute = 46,
		second = 40,
	}

	testing.expect_value(t, result, expected)
}

@(test)
/// description = full time specified
test_full_time_specified :: proc(t: ^testing.T) {
	input := datetime.DateTime {
		year   = 2015,
		month  = 01,
		day    = 24,
		hour   = 22,
		minute = 00,
		second = 00,
	}
	result := add_gigasecond(input)

	expected := datetime.DateTime {
		year   = 2046,
		month  = 10,
		day    = 02,
		hour   = 23,
		minute = 46,
		second = 40,
	}

	testing.expect_value(t, result, expected)
}

@(test)
/// description = full time with day roll-over
test_full_time_with_day_roll_over :: proc(t: ^testing.T) {
	input := datetime.DateTime {
		year   = 2015,
		month  = 01,
		day    = 24,
		hour   = 23,
		minute = 59,
		second = 59,
	}
	result := add_gigasecond(input)

	expected := datetime.DateTime {
		year   = 2046,
		month  = 10,
		day    = 03,
		hour   = 01,
		minute = 46,
		second = 39,
	}

	testing.expect_value(t, result, expected)
}
