const std = @import("std");

pub fn response(s: []const u8) []const u8 {
    if (isSilent(s)) return "Fine. Be that way!";
    if (isShout(s) and isQuestion(s)) return "Calm down, I know what I'm doing!";
    if (isQuestion(s)) return "Sure.";
    if (isShout(s)) return "Whoa, chill out!";
    return "Whatever.";
}

pub fn isSilent(s: []const u8) bool {
    for (s) |c| if (!std.ascii.isWhitespace(c)) return false;

    return true;
}

pub fn isQuestion(s: []const u8) bool {
    for (0..s.len) |i| {
        if (std.ascii.isWhitespace(s[s.len - 1 - i])) continue;
        return s[s.len - 1 - i] == '?';
    }

    return false;
}

pub fn isShout(s: []const u8) bool {
    var shout = false;

    for (s) |c| {
        if (std.ascii.isLower(c)) return false;
        if (std.ascii.isUpper(c)) shout = true;
    }

    return shout;
}
