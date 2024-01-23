const std = @import("std");
const mem = std.mem;

pub fn abbreviate(allocator: mem.Allocator, words: []const u8) mem.Allocator.Error![]u8 {
    var letters = std.ArrayList(u8).init(allocator);
    defer letters.deinit();

    var tokenizer = mem.tokenizeAny(u8, words, " _-");

    while (tokenizer.next()) |token|
        try letters.append(std.ascii.toUpper(token[0]));

    return letters.toOwnedSlice();
}
