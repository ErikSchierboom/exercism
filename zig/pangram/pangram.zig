const std = @import("std");
const AlphabetSize = 26;

pub fn isPangram(str: []const u8) bool {
    var letters = std.bit_set.IntegerBitSet(AlphabetSize).initEmpty();

    for (str) |char| {
        if (std.ascii.isUpper(char)) letters.set(char - 'A');
        if (std.ascii.isLower(char)) letters.set(char - 'a');
    }

    return letters.count() == AlphabetSize;
}
