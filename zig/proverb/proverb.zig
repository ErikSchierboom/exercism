const std = @import("std");
const mem = std.mem;
const fmt = std.fmt;

pub fn recite(allocator: mem.Allocator, words: []const []const u8) (fmt.AllocPrintError || mem.Allocator.Error)![][]u8 {
    if (words.len == 0)
        return &.{};

    var lines = try allocator.alloc([]u8, words.len);
    errdefer allocator.free(lines);

    var i: usize = 0;
    while (i < words.len - 1) : (i += 1)
        lines[i] = try fmt.allocPrint(allocator, "For want of a {s} the {s} was lost.\n", .{ words[i], words[i + 1] });

    lines[words.len - 1] = try fmt.allocPrint(allocator, "And all for the want of a {s}.\n", .{words[0]});

    return lines;
}
