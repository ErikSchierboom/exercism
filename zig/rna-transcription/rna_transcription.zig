const std = @import("std");
const mem = std.mem;

const RnaError = error{InvalidNucleotide};

pub fn toRna(allocator: mem.Allocator, dna: []const u8) (RnaError || mem.Allocator.Error)![]const u8 {
    var rna = try allocator.alloc(u8, dna.len);
    errdefer allocator.free(rna);

    for (dna) |nucleotide, i|
        rna[i] = try toComplement(nucleotide);

    return rna;
}

fn toComplement(nucleotide: u8) RnaError!u8 {
    return switch (nucleotide) {
        'G' => 'C',
        'C' => 'G',
        'T' => 'A',
        'A' => 'U',
        else => RnaError.InvalidNucleotide,
    };
}
