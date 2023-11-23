const std = @import("std");
const mem = std.mem;

pub fn detectAnagrams(
    allocator: mem.Allocator,
    word: []const u8,
    candidates: []const []const u8,
) !std.BufSet {
    var anagrams = std.BufSet.init(allocator);
    errdefer anagrams.deinit();

    const sortedWord = try std.ascii.allocLowerString(allocator, word);
    defer allocator.free(sortedWord);
    std.mem.sort(u8, sortedWord, {}, std.sort.asc(u8));

    for (candidates) |candidate| {
        if (candidate.len != word.len) continue;
        if (std.ascii.eqlIgnoreCase(word, candidate)) continue;

        const sortedCandidate = try std.ascii.allocLowerString(allocator, candidate);
        defer allocator.free(sortedCandidate);
        std.mem.sort(u8, sortedCandidate, {}, std.sort.asc(u8));

        if (std.mem.eql(u8, sortedWord, sortedCandidate)) try anagrams.insert(candidate);
    }

    return anagrams;
}
