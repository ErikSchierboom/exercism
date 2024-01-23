const std = @import("std");

pub fn isValid(s: []const u8) bool {
    var checksum: u32 = 0;
    var numDigits: u32 = 0;

    for (0..s.len) |i| {
        const c = s[s.len - 1 - i];
        if (c == ' ') continue;
        if (!std.ascii.isDigit(c)) return false;

        var digit = c - '0';
        if (numDigits % 2 == 1) digit *= 2;
        if (digit > 9) digit -= 9;

        checksum += digit;
        numDigits += 1;
    }

    return numDigits > 1 and checksum % 10 == 0;
}
