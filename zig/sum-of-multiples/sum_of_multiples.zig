const std = @import("std");
const mem = std.mem;

pub fn sum(allocator: mem.Allocator, factors: []const u32, limit: u32) !u64 {
    _ = allocator;
    var result: u64 = 0;

    for (1..limit) |n| {
        for (factors) |factor| {
            if (factor != 0 and n % factor == 0) {
                result += n;
                break;
            }
        }
    }

    return result;
}
