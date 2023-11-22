const std = @import("std");

pub fn primes(buffer: []u32, comptime limit: u32) []u32 {
    var sieve = std.StaticBitSet(limit + 1).initFull();
    sieve.unset(0);
    sieve.unset(1);

    var n: u32 = 0;
    var i: u32 = 0;
    while (n <= limit) : (n += 1) {
        if (!sieve.isSet(n)) continue;

        var multiple = n + n;
        while (multiple <= limit) : (multiple += n) sieve.unset(multiple);

        buffer[i] = n;
        i += 1;
    }

    return buffer[0..i];
}
