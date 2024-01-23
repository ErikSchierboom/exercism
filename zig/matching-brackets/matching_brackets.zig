const std = @import("std");
const mem = std.mem;

pub fn isBalanced(allocator: mem.Allocator, s: []const u8) !bool {
    var opened = std.ArrayList(u8).init(allocator);
    defer opened.deinit();

    for (s) |c| {
        switch (c) {
            '(', '{', '[' => try opened.append(c),
            ')', '}', ']' => {
                const last = opened.getLastOrNull();
                if (c == ')' and last == '(' or
                    c == '}' and last == '{' or
                    c == ']' and last == '[')
                {
                    _ = opened.pop();
                    continue;
                }

                return false;
            },
            else => {},
        }
    }

    return opened.items.len == 0;
}
