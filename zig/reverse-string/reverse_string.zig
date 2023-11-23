pub fn reverse(buffer: []u8, s: []const u8) []u8 {
    for (s, 0..) |char, i| {
        buffer[s.len - i - 1] = char;
    }

    return buffer;
}
