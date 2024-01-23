const std = @import("std");
const mem = std.mem;

const RnaError = error{InvalidNucleotide};

pub fn toRna(allocator: mem.Allocator, dna: []const u8) (RnaError || mem.Allocator.Error)![]const u8 {
    var rna = try allocator.alloc(u8, dna.len);

    for (dna, 0..) |nucleotide, i|
        rna[i] = switch (nucleotide) {
            'G' => 'C',
            'C' => 'G',
            'T' => 'A',
            'A' => 'U',
            else => return RnaError.InvalidNucleotide,
        };

    return rna;
}
