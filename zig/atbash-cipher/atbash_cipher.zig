const std = @import("std");
const mem = std.mem;

pub fn encode(allocator: mem.Allocator, s: []const u8) mem.Allocator.Error![]u8 {
    var encoded = try std.ArrayList(u8).initCapacity(allocator, s.len);
    for (s) |c| try encoded.append(transpose(c) orelse continue);

    var i: usize = encoded.items.len - (encoded.items.len % 5);
    while (i >= 5 and i < encoded.items.len - 1) : (i -= 5) try encoded.insert(i, ' ');

    return encoded.toOwnedSlice();
}

pub fn decode(allocator: mem.Allocator, s: []const u8) mem.Allocator.Error![]u8 {
    var decoded = try std.ArrayList(u8).initCapacity(allocator, s.len);

    for (s) |c| try decoded.append(transpose(c) orelse continue);

    return decoded.toOwnedSlice();
}

fn transpose(c: u8) ?u8 {
    if (std.ascii.isUpper(c)) return 'z' - (c - 'A');
    if (std.ascii.isLower(c)) return 'z' - (c - 'a');
    if (std.ascii.isDigit(c)) return c;

    return null;
}
