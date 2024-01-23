pub fn reverse(buffer: []u8, s: []const u8) []u8 {
    for (0..buffer.len) |i| buffer[i] = s[buffer.len - i - 1];
    return buffer;
}
