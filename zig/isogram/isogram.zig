const std = @import("std");

pub fn isIsogram(str: []const u8) bool {
    var letters = std.bit_set.IntegerBitSet(26).initEmpty();

    for (str) |char| {
        if (!std.ascii.isAlphabetic(char)) continue;

        const letter_index = std.ascii.toLower(char) - 'a';
        if (letters.isSet(letter_index))
            return false;

        letters.set(letter_index);
    }

    return true;
}
