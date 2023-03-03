const std = @import("std");

pub fn isArmstrongNumber(num: u128) bool {
    const num_digits = digit_count(num);
    var remainder: u128 = num;
    var armstrong_sum: u128 = 0;

    while (remainder != 0) : (remainder /= 10)
        armstrong_sum += std.math.pow(u128, remainder % 10, num_digits);

    return armstrong_sum == num;
}

fn digit_count(num: u128) u8 {
    var count: u8 = 0;
    var remainder = num;

    while (remainder != 0) : (remainder /= 10) count += 1;

    return count;
}
