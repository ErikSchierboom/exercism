package clock

import "core:testing"

@(test)
/// description = Create a new clock with an initial time -> on the hour
test_create_a_new_clock_with_an_initial_time__on_the_hour :: proc(t: ^testing.T) {
	clock := create_clock(hour = 8, minute = 0)
	result := to_string(clock)
	defer delete(result)

	testing.expect_value(t, result, "08:00")
}

@(test)
/// description = Create a new clock with an initial time -> past the hour
test_create_a_new_clock_with_an_initial_time__past_the_hour :: proc(t: ^testing.T) {
	clock := create_clock(hour = 11, minute = 9)
	result := to_string(clock)
	defer delete(result)

	testing.expect_value(t, result, "11:09")
}

@(test)
/// description = Create a new clock with an initial time -> midnight is zero hours
test_create_a_new_clock_with_an_initial_time__midnight_is_zero_hours :: proc(t: ^testing.T) {
	clock := create_clock(hour = 24, minute = 0)
	result := to_string(clock)
	defer delete(result)

	testing.expect_value(t, result, "00:00")
}

@(test)
/// description = Create a new clock with an initial time -> hour rolls over
test_create_a_new_clock_with_an_initial_time__hour_rolls_over :: proc(t: ^testing.T) {
	clock := create_clock(hour = 25, minute = 0)
	result := to_string(clock)
	defer delete(result)

	testing.expect_value(t, result, "01:00")
}

@(test)
/// description = Create a new clock with an initial time -> hour rolls over continuously
test_create_a_new_clock_with_an_initial_time__hour_rolls_over_continuously :: proc(t: ^testing.T) {
	clock := create_clock(hour = 100, minute = 0)
	result := to_string(clock)
	defer delete(result)

	testing.expect_value(t, result, "04:00")
}

@(test)
/// description = Create a new clock with an initial time -> sixty minutes is next hour
test_create_a_new_clock_with_an_initial_time__sixty_minutes_is_next_hour :: proc(t: ^testing.T) {
	clock := create_clock(hour = 1, minute = 60)
	result := to_string(clock)
	defer delete(result)

	testing.expect_value(t, result, "02:00")
}

@(test)
/// description = Create a new clock with an initial time -> minutes roll over
test_create_a_new_clock_with_an_initial_time__minutes_roll_over :: proc(t: ^testing.T) {
	clock := create_clock(hour = 0, minute = 160)
	result := to_string(clock)
	defer delete(result)

	testing.expect_value(t, result, "02:40")
}

@(test)
/// description = Create a new clock with an initial time -> minutes roll over continuously
test_create_a_new_clock_with_an_initial_time__minutes_roll_over_continuously :: proc(
	t: ^testing.T,
) {
	clock := create_clock(hour = 0, minute = 1723)
	result := to_string(clock)
	defer delete(result)

	testing.expect_value(t, result, "04:43")
}

@(test)
/// description = Create a new clock with an initial time -> hour and minutes roll over
test_create_a_new_clock_with_an_initial_time__hour_and_minutes_roll_over :: proc(t: ^testing.T) {
	clock := create_clock(hour = 25, minute = 160)
	result := to_string(clock)
	defer delete(result)

	testing.expect_value(t, result, "03:40")
}

@(test)
/// description = Create a new clock with an initial time -> hour and minutes roll over continuously
test_create_a_new_clock_with_an_initial_time__hour_and_minutes_roll_over_continuously :: proc(
	t: ^testing.T,
) {
	clock := create_clock(hour = 201, minute = 3001)
	result := to_string(clock)
	defer delete(result)

	testing.expect_value(t, result, "11:01")
}

@(test)
/// description = Create a new clock with an initial time -> hour and minutes roll over to exactly midnight
test_create_a_new_clock_with_an_initial_time__hour_and_minutes_roll_over_to_exactly_midnight :: proc(
	t: ^testing.T,
) {
	clock := create_clock(hour = 72, minute = 8640)
	result := to_string(clock)
	defer delete(result)

	testing.expect_value(t, result, "00:00")
}

@(test)
/// description = Create a new clock with an initial time -> negative hour
test_create_a_new_clock_with_an_initial_time__negative_hour :: proc(t: ^testing.T) {
	clock := create_clock(hour = -1, minute = 15)
	result := to_string(clock)
	defer delete(result)

	testing.expect_value(t, result, "23:15")
}

@(test)
/// description = Create a new clock with an initial time -> negative hour rolls over
test_create_a_new_clock_with_an_initial_time__negative_hour_rolls_over :: proc(t: ^testing.T) {
	clock := create_clock(hour = -25, minute = 0)
	result := to_string(clock)
	defer delete(result)

	testing.expect_value(t, result, "23:00")
}

@(test)
/// description = Create a new clock with an initial time -> negative hour rolls over continuously
test_create_a_new_clock_with_an_initial_time__negative_hour_rolls_over_continuously :: proc(
	t: ^testing.T,
) {
	clock := create_clock(hour = -91, minute = 0)
	result := to_string(clock)
	defer delete(result)

	testing.expect_value(t, result, "05:00")
}

@(test)
/// description = Create a new clock with an initial time -> negative minutes
test_create_a_new_clock_with_an_initial_time__negative_minutes :: proc(t: ^testing.T) {
	clock := create_clock(hour = 1, minute = -40)
	result := to_string(clock)
	defer delete(result)

	testing.expect_value(t, result, "00:20")
}

@(test)
/// description = Create a new clock with an initial time -> negative minutes roll over
test_create_a_new_clock_with_an_initial_time__negative_minutes_roll_over :: proc(t: ^testing.T) {
	clock := create_clock(hour = 1, minute = -160)
	result := to_string(clock)
	defer delete(result)

	testing.expect_value(t, result, "22:20")
}

@(test)
/// description = Create a new clock with an initial time -> negative minutes roll over continuously
test_create_a_new_clock_with_an_initial_time__negative_minutes_roll_over_continuously :: proc(
	t: ^testing.T,
) {
	clock := create_clock(hour = 1, minute = -4820)
	result := to_string(clock)
	defer delete(result)

	testing.expect_value(t, result, "16:40")
}

@(test)
/// description = Create a new clock with an initial time -> negative sixty minutes is previous hour
test_create_a_new_clock_with_an_initial_time__negative_sixty_minutes_is_previous_hour :: proc(
	t: ^testing.T,
) {
	clock := create_clock(hour = 2, minute = -60)
	result := to_string(clock)
	defer delete(result)

	testing.expect_value(t, result, "01:00")
}

@(test)
/// description = Create a new clock with an initial time -> negative hour and minutes both roll over
test_create_a_new_clock_with_an_initial_time__negative_hour_and_minutes_both_roll_over :: proc(
	t: ^testing.T,
) {
	clock := create_clock(hour = -25, minute = -160)
	result := to_string(clock)
	defer delete(result)

	testing.expect_value(t, result, "20:20")
}

@(test)
/// description = Create a new clock with an initial time -> negative hour and minutes both roll over continuously
test_create_a_new_clock_with_an_initial_time__negative_hour_and_minutes_both_roll_over_continuously :: proc(
	t: ^testing.T,
) {
	clock := create_clock(hour = -121, minute = -5810)
	result := to_string(clock)
	defer delete(result)

	testing.expect_value(t, result, "22:10")
}

@(test)
/// description = Add minutes -> add minutes
test_add_minutes__add_minutes :: proc(t: ^testing.T) {
	clock := create_clock(hour = 10, minute = 0)
	add(&clock, 3)
	result := to_string(clock)
	defer delete(result)

	testing.expect_value(t, result, "10:03")
}

@(test)
/// description = Add minutes -> add no minutes
test_add_minutes__add_no_minutes :: proc(t: ^testing.T) {
	clock := create_clock(hour = 6, minute = 41)
	add(&clock, 0)
	result := to_string(clock)
	defer delete(result)

	testing.expect_value(t, result, "06:41")
}

@(test)
/// description = Add minutes -> add to next hour
test_add_minutes__add_to_next_hour :: proc(t: ^testing.T) {
	clock := create_clock(hour = 0, minute = 45)
	add(&clock, 40)
	result := to_string(clock)
	defer delete(result)

	testing.expect_value(t, result, "01:25")
}

@(test)
/// description = Add minutes -> add more than one hour
test_add_minutes__add_more_than_one_hour :: proc(t: ^testing.T) {
	clock := create_clock(hour = 10, minute = 0)
	add(&clock, 61)
	result := to_string(clock)
	defer delete(result)

	testing.expect_value(t, result, "11:01")
}

@(test)
/// description = Add minutes -> add more than two hours with carry
test_add_minutes__add_more_than_two_hours_with_carry :: proc(t: ^testing.T) {
	clock := create_clock(hour = 0, minute = 45)
	add(&clock, 160)
	result := to_string(clock)
	defer delete(result)

	testing.expect_value(t, result, "03:25")
}

@(test)
/// description = Add minutes -> add across midnight
test_add_minutes__add_across_midnight :: proc(t: ^testing.T) {
	clock := create_clock(hour = 23, minute = 59)
	add(&clock, 2)
	result := to_string(clock)
	defer delete(result)

	testing.expect_value(t, result, "00:01")
}

@(test)
/// description = Add minutes -> add more than one day (1500 min = 25 hrs)
test_add_minutes__add_more_than_one_day_1500_min__25_hrs :: proc(t: ^testing.T) {
	clock := create_clock(hour = 5, minute = 32)
	add(&clock, 1500)
	result := to_string(clock)
	defer delete(result)

	testing.expect_value(t, result, "06:32")
}

@(test)
/// description = Add minutes -> add more than two days
test_add_minutes__add_more_than_two_days :: proc(t: ^testing.T) {
	clock := create_clock(hour = 1, minute = 1)
	add(&clock, 3500)
	result := to_string(clock)
	defer delete(result)

	testing.expect_value(t, result, "11:21")
}

@(test)
/// description = Subtract minutes -> subtract minutes
test_subtract_minutes__subtract_minutes :: proc(t: ^testing.T) {
	clock := create_clock(hour = 10, minute = 3)
	subtract(&clock, 3)
	result := to_string(clock)
	defer delete(result)

	testing.expect_value(t, result, "10:00")
}

@(test)
/// description = Subtract minutes -> subtract to previous hour
test_subtract_minutes__subtract_to_previous_hour :: proc(t: ^testing.T) {
	clock := create_clock(hour = 10, minute = 3)
	subtract(&clock, 30)
	result := to_string(clock)
	defer delete(result)

	testing.expect_value(t, result, "09:33")
}

@(test)
/// description = Subtract minutes -> subtract more than an hour
test_subtract_minutes__subtract_more_than_an_hour :: proc(t: ^testing.T) {
	clock := create_clock(hour = 10, minute = 3)
	subtract(&clock, 70)
	result := to_string(clock)
	defer delete(result)

	testing.expect_value(t, result, "08:53")
}

@(test)
/// description = Subtract minutes -> subtract across midnight
test_subtract_minutes__subtract_across_midnight :: proc(t: ^testing.T) {
	clock := create_clock(hour = 0, minute = 3)
	subtract(&clock, 4)
	result := to_string(clock)
	defer delete(result)

	testing.expect_value(t, result, "23:59")
}

@(test)
/// description = Subtract minutes -> subtract more than two hours
test_subtract_minutes__subtract_more_than_two_hours :: proc(t: ^testing.T) {
	clock := create_clock(hour = 0, minute = 0)
	subtract(&clock, 160)
	result := to_string(clock)
	defer delete(result)

	testing.expect_value(t, result, "21:20")
}

@(test)
/// description = Subtract minutes -> subtract more than two hours with borrow
test_subtract_minutes__subtract_more_than_two_hours_with_borrow :: proc(t: ^testing.T) {
	clock := create_clock(hour = 6, minute = 15)
	subtract(&clock, 160)
	result := to_string(clock)
	defer delete(result)

	testing.expect_value(t, result, "03:35")
}

@(test)
/// description = Subtract minutes -> subtract more than one day (1500 min = 25 hrs)
test_subtract_minutes__subtract_more_than_one_day_1500_min__25_hrs :: proc(t: ^testing.T) {
	clock := create_clock(hour = 5, minute = 32)
	subtract(&clock, 1500)
	result := to_string(clock)
	defer delete(result)

	testing.expect_value(t, result, "04:32")
}

@(test)
/// description = Subtract minutes -> subtract more than two days
test_subtract_minutes__subtract_more_than_two_days :: proc(t: ^testing.T) {
	clock := create_clock(hour = 2, minute = 20)
	subtract(&clock, 3000)
	result := to_string(clock)
	defer delete(result)

	testing.expect_value(t, result, "00:20")
}

@(test)
/// description = Compare two clocks for equality -> clocks with same time
test_compare_two_clocks_for_equality__clocks_with_same_time :: proc(t: ^testing.T) {
	clock1 := create_clock(hour = 15, minute = 37)
	clock2 := create_clock(hour = 15, minute = 37)
	result := equals(clock1, clock2)

	testing.expect_value(t, result, true)
}

@(test)
/// description = Compare two clocks for equality -> clocks a minute apart
test_compare_two_clocks_for_equality__clocks_a_minute_apart :: proc(t: ^testing.T) {
	clock1 := create_clock(hour = 15, minute = 36)
	clock2 := create_clock(hour = 15, minute = 37)
	result := equals(clock1, clock2)

	testing.expect_value(t, result, false)
}

@(test)
/// description = Compare two clocks for equality -> clocks an hour apart
test_compare_two_clocks_for_equality__clocks_an_hour_apart :: proc(t: ^testing.T) {
	clock1 := create_clock(hour = 14, minute = 37)
	clock2 := create_clock(hour = 15, minute = 37)
	result := equals(clock1, clock2)

	testing.expect_value(t, result, false)
}

@(test)
/// description = Compare two clocks for equality -> clocks with hour overflow
test_compare_two_clocks_for_equality__clocks_with_hour_overflow :: proc(t: ^testing.T) {
	clock1 := create_clock(hour = 10, minute = 37)
	clock2 := create_clock(hour = 34, minute = 37)
	result := equals(clock1, clock2)

	testing.expect_value(t, result, true)
}

@(test)
/// description = Compare two clocks for equality -> clocks with hour overflow by several days
test_compare_two_clocks_for_equality__clocks_with_hour_overflow_by_several_days :: proc(
	t: ^testing.T,
) {
	clock1 := create_clock(hour = 3, minute = 11)
	clock2 := create_clock(hour = 99, minute = 11)
	result := equals(clock1, clock2)

	testing.expect_value(t, result, true)
}

@(test)
/// description = Compare two clocks for equality -> clocks with negative hour
test_compare_two_clocks_for_equality__clocks_with_negative_hour :: proc(t: ^testing.T) {
	clock1 := create_clock(hour = 22, minute = 40)
	clock2 := create_clock(hour = -2, minute = 40)
	result := equals(clock1, clock2)

	testing.expect_value(t, result, true)
}

@(test)
/// description = Compare two clocks for equality -> clocks with negative hour that wraps
test_compare_two_clocks_for_equality__clocks_with_negative_hour_that_wraps :: proc(t: ^testing.T) {
	clock1 := create_clock(hour = 17, minute = 3)
	clock2 := create_clock(hour = -31, minute = 3)
	result := equals(clock1, clock2)

	testing.expect_value(t, result, true)
}

@(test)
/// description = Compare two clocks for equality -> clocks with negative hour that wraps multiple times
test_compare_two_clocks_for_equality__clocks_with_negative_hour_that_wraps_multiple_times :: proc(
	t: ^testing.T,
) {
	clock1 := create_clock(hour = 13, minute = 49)
	clock2 := create_clock(hour = -83, minute = 49)
	result := equals(clock1, clock2)

	testing.expect_value(t, result, true)
}

@(test)
/// description = Compare two clocks for equality -> clocks with minute overflow
test_compare_two_clocks_for_equality__clocks_with_minute_overflow :: proc(t: ^testing.T) {
	clock1 := create_clock(hour = 0, minute = 1)
	clock2 := create_clock(hour = 0, minute = 1441)
	result := equals(clock1, clock2)

	testing.expect_value(t, result, true)
}

@(test)
/// description = Compare two clocks for equality -> clocks with minute overflow by several days
test_compare_two_clocks_for_equality__clocks_with_minute_overflow_by_several_days :: proc(
	t: ^testing.T,
) {
	clock1 := create_clock(hour = 2, minute = 2)
	clock2 := create_clock(hour = 2, minute = 4322)
	result := equals(clock1, clock2)

	testing.expect_value(t, result, true)
}

@(test)
/// description = Compare two clocks for equality -> clocks with negative minute
test_compare_two_clocks_for_equality__clocks_with_negative_minute :: proc(t: ^testing.T) {
	clock1 := create_clock(hour = 2, minute = 40)
	clock2 := create_clock(hour = 3, minute = -20)
	result := equals(clock1, clock2)

	testing.expect_value(t, result, true)
}

@(test)
/// description = Compare two clocks for equality -> clocks with negative minute that wraps
test_compare_two_clocks_for_equality__clocks_with_negative_minute_that_wraps :: proc(
	t: ^testing.T,
) {
	clock1 := create_clock(hour = 4, minute = 10)
	clock2 := create_clock(hour = 5, minute = -1490)
	result := equals(clock1, clock2)

	testing.expect_value(t, result, true)
}

@(test)
/// description = Compare two clocks for equality -> clocks with negative minute that wraps multiple times
test_compare_two_clocks_for_equality__clocks_with_negative_minute_that_wraps_multiple_times :: proc(
	t: ^testing.T,
) {
	clock1 := create_clock(hour = 6, minute = 15)
	clock2 := create_clock(hour = 6, minute = -4305)
	result := equals(clock1, clock2)

	testing.expect_value(t, result, true)
}

@(test)
/// description = Compare two clocks for equality -> clocks with negative hours and minutes
test_compare_two_clocks_for_equality__clocks_with_negative_hours_and_minutes :: proc(
	t: ^testing.T,
) {
	clock1 := create_clock(hour = 7, minute = 32)
	clock2 := create_clock(hour = -12, minute = -268)
	result := equals(clock1, clock2)

	testing.expect_value(t, result, true)
}

@(test)
/// description = Compare two clocks for equality -> clocks with negative hours and minutes that wrap
test_compare_two_clocks_for_equality__clocks_with_negative_hours_and_minutes_that_wrap :: proc(
	t: ^testing.T,
) {
	clock1 := create_clock(hour = 18, minute = 7)
	clock2 := create_clock(hour = -54, minute = -11513)
	result := equals(clock1, clock2)

	testing.expect_value(t, result, true)
}

@(test)
/// description = Compare two clocks for equality -> full clock and zeroed clock
test_compare_two_clocks_for_equality__full_clock_and_zeroed_clock :: proc(t: ^testing.T) {
	clock1 := create_clock(hour = 24, minute = 0)
	clock2 := create_clock(hour = 0, minute = 0)
	result := equals(clock1, clock2)

	testing.expect_value(t, result, true)
}
