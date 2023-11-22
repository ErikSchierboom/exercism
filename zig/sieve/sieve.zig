const std = @import("std");

pub fn primes(buffer: []u32, comptime limit: u32) []u32 {
    var sieve = std.bit_set.ArrayBitSet(u32, 1000).initFull();
    sieve.unset(0);
    sieve.unset(1);

    for (2..1000) |x| {
        if (!sieve.isSet(x)) continue;
        var multiple = x + x;
        while (multiple < 1000) : (multiple += x) sieve.unset(multiple);
    }

    var i: u32 = 0;
    var iterator = sieve.iterator(.{});
    while (iterator.next()) |prime| {
        if (prime > limit) break;
        buffer[i] = @intCast(prime);
        i += 1;
    }

    return buffer[0..i];
}
