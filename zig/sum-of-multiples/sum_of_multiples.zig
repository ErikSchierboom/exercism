const std = @import("std");
const mem = std.mem;

pub fn sum(allocator: mem.Allocator, factors: []const u32, limit: u32) !u64 {
    var bitSet = try std.bit_set.DynamicBitSet.initEmpty(allocator, limit);
    defer bitSet.deinit();

    for (factors) |factor| {
        var multiple = factor;
        while (factor > 0 and multiple < limit) : (multiple += factor) {
            bitSet.set(multiple);
        }
    }

    var result: u64 = 0;
    var iterator = bitSet.iterator(.{});
    while (iterator.next()) |i| result += i;

    return result;
}
