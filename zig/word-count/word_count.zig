const std = @import("std");
const mem = std.mem;

pub fn countWords(allocator: mem.Allocator, s: []const u8) !std.StringHashMap(u32) {
    var counts = std.StringHashMap(u32).init(allocator);
    errdefer counts.deinit();

    var iterator = mem.splitAny(u8, s, " ,\n:!&@$%^.");
    while (iterator.next()) |word| {
        if (word.len == 0) continue;

        var start: usize = if (std.ascii.isAlphanumeric(word[0])) 0 else 1;
        var stop: usize = if (std.ascii.isAlphanumeric(word[word.len - 1])) word.len else word.len - 1;

        if (start >= stop) continue;

        const lower = try std.ascii.allocLowerString(allocator, word[start..stop]);

        var entry = try counts.getOrPut(lower);
        if (entry.found_existing) {
            entry.value_ptr.* += 1;
            allocator.free(lower);
        } else {
            entry.value_ptr.* = 1;
        }
    }

    return counts;
}
