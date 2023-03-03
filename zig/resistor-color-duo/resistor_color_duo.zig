const std = @import("std");

pub const ColorBand = enum(u8) {
    black = 0,
    brown = 1,
    red = 2,
    orange = 3,
    yellow = 4,
    green = 5,
    blue = 6,
    violet = 7,
    grey = 8,
    white = 9,
};

pub fn colorCode(colors: [2]ColorBand) usize {
    return @enumToInt(colors[0]) * 10 + @enumToInt(colors[1]);
}
