const std = @import("std");

pub fn isValidIsbn10(s: []const u8) bool {
    var multiplier: u8 = 10;
    var checksum: u32 = 0;

    for (s) |c| {
        var digit: u8 = switch (c) {
            '-' => continue,
            '0'...'9' => c - '0',
            'X' => 10,
            else => return false,
        };

        if (multiplier < 1) return false;
        if (digit == 10 and multiplier > 1) return false;

        checksum += (digit * multiplier);
        multiplier -= 1;
    }

    if (multiplier > 0) return false;

    return checksum % 11 == 0;
}
