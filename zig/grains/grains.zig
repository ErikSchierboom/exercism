const std = @import("std");

pub const ChessboardError = error{IndexOutOfBounds};

pub fn square(index: isize) ChessboardError!u64 {
    if (index < 1 or index > 64) return ChessboardError.IndexOutOfBounds;

    return std.math.shl(u64, 1, index - 1);
}

pub fn total() u64 {
    return std.math.maxInt(u64);
}
