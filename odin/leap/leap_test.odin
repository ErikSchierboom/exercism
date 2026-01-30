package leap

import "core:testing"

@(test)
/// description = year not divisible by 4 in common year
test_year_not_divisible_by_4_in_common_year :: proc(t: ^testing.T) {
	testing.expect(t, !is_leap_year(2015))
}

@(test)
/// description = year divisible by 2, not divisible by 4 in common year
test_year_divisible_by_2_not_divisible_by_4_in_common_year :: proc(t: ^testing.T) {
	testing.expect(t, !is_leap_year(1970))
}

@(test)
/// description = year divisible by 4, not divisible by 100 in leap year
test_year_divisible_by_4_not_divisible_by_100_in_leap_year :: proc(t: ^testing.T) {
	testing.expect(t, is_leap_year(1996))
}

@(test)
/// description = year divisible by 4 and 5 is still a leap year
test_year_divisible_by_4_and_5_is_still_a_leap_year :: proc(t: ^testing.T) {
	testing.expect(t, is_leap_year(1960))
}

@(test)
/// description = year divisible by 100, not divisible by 400 in common year
test_year_divisible_by_100_not_divisible_by_400_in_common_year :: proc(t: ^testing.T) {
	testing.expect(t, !is_leap_year(2100))
}

@(test)
/// description = year divisible by 100 but not by 3 is still not a leap year
test_year_divisible_by_100_but_not_by_3_is_still_not_a_leap_year :: proc(t: ^testing.T) {
	testing.expect(t, !is_leap_year(1900))
}

@(test)
/// description = year divisible by 400 is leap year
test_year_divisible_by_400_is_leap_year :: proc(t: ^testing.T) {
	testing.expect(t, is_leap_year(2000))
}

@(test)
/// description = year divisible by 400 but not by 125 is still a leap year
test_year_divisible_by_400_but_not_by_125_is_still_a_leap_year :: proc(t: ^testing.T) {
	testing.expect(t, is_leap_year(2400))
}

@(test)
/// description = year divisible by 200, not divisible by 400 in common year
test_year_divisible_by_200_not_divisible_by_400_in_common_year :: proc(t: ^testing.T) {
	testing.expect(t, !is_leap_year(1800))
}
