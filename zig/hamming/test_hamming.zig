const std = @import("std");
const testing = std.testing;

const hamming = @import("hamming.zig");
const DnaError = hamming.DnaError;

test "empty strands" {
    const expected = DnaError.EmptyDnaStrands;
    const actual = comptime hamming.compute("", "");
    try testing.expectError(expected, actual);
}

test "single letter identical strands" {
    const expected = 0;
    const actual = comptime try hamming.compute("A", "A");
    try testing.expectEqual(expected, actual);
}

test "single letter different strands" {
    const expected = 1;
    const actual = comptime try hamming.compute("G", "T");
    try testing.expectEqual(expected, actual);
}

test "long identical strands" {
    const expected = 0;
    const actual = comptime try hamming
        .compute("GGACTGAAATCTG", "GGACTGAAATCTG");
    try testing.expectEqual(expected, actual);
}

test "long different strands" {
    const expected = 9;
    const actual = comptime try hamming
        .compute("GGACGGATTCTG", "AGGACGGATTCT");
    try testing.expectEqual(expected, actual);
}

test "disallow first strand longer" {
    const expected = DnaError.UnequalDnaStrands;
    const actual = comptime hamming.compute("AATG", "AAA");
    try testing.expectError(expected, actual);
}

test "disallow second strand longer" {
    const expected = DnaError.UnequalDnaStrands;
    const actual = comptime hamming.compute("ATA", "AGTG");
    try testing.expectError(expected, actual);
}

test "disallow left empty strand" {
    const expected = DnaError.EmptyDnaStrands;
    const actual = comptime hamming.compute("", "G");
    try testing.expectError(expected, actual);
}

test "disallow right empty strand" {
    const expected = DnaError.EmptyDnaStrands;
    const actual = comptime hamming.compute("G", "");
    try testing.expectError(expected, actual);
}
