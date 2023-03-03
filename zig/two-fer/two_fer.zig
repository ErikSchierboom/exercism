const std = @import("std");

pub fn twoFer(buffer: []u8, name: ?[]const u8) anyerror![]u8 {
    return try std.fmt.bufPrint(buffer, "One for {s}, one for me.", .{name orelse "you"});
}
