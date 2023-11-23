const std = @import("std");
const mem = std.mem;

pub fn abbreviate(allocator: mem.Allocator, words: []const u8) mem.Allocator.Error![]u8 {
    var letters = std.ArrayList(u8).init(allocator);
    errdefer letters.deinit();

    for (words, 0..) |c, i| {
        if (!std.ascii.isAlphabetic(c)) continue;

        if (i == 0 or words[i - 1] == ' ' or words[i - 1] == '_' or words[i - 1] == '-')
            try letters.append(std.ascii.toUpper(c));
    }

    return letters.toOwnedSlice();
}
