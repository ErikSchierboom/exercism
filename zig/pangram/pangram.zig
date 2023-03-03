const std = @import("std");

const AlphabetSet = std.StaticBitSet(26);

pub fn isPangram(str: []const u8) bool {
    var alphabet = AlphabetSet.initEmpty();

    for (str) |char| {
        if (std.ascii.isUpper(char)) alphabet.set(char - 'A');
        if (std.ascii.isLower(char)) alphabet.set(char - 'a');
    }

    return alphabet.count() == alphabet.capacity();
}
