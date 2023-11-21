const std = @import("std");

pub fn isValidIsbn10(s: []const u8) bool {
    var multiplier: u8 = 10;
    var checksum: u32 = 0;

    for (s) |c| {
        if (c == '-') continue;

        const digit: u8 = if (std.ascii.isDigit(c)) c - '0' else if (c == 'X') 10 else return false;

        if (multiplier < 1 or digit == 10 and multiplier > 1) return false;

        checksum += (digit * multiplier);
        multiplier -= 1;
    }

    return multiplier == 0 and checksum % 11 == 0;
}
