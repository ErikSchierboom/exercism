const std = @import("std");
const mem = std.mem;

const RnaError = error{InvalidNucleotide};

pub fn toRna(allocator: mem.Allocator, dna: []const u8) (RnaError || mem.Allocator.Error)![]const u8 {
    var rna = std.ArrayList(u8).init(allocator);
    errdefer rna.deinit();

    for (dna) |nucleotide|
        try rna.append(try toComplement(nucleotide));

    return rna.items;
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
