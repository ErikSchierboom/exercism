const std = @import("std");

pub const QueenError = error{InitializationFailure};

pub const Queen = struct {
    x: i8,
    y: i8,

    pub fn init(row: i8, col: i8) QueenError!Queen {
        if (row < 0 or row > 7 or col < 0 or col > 7) return QueenError.InitializationFailure;

        return Queen{ .x = col, .y = row };
    }

    pub fn canAttack(self: Queen, other: Queen) !bool {
        return self.x == other.x or
            self.y == other.y or
            try std.math.absInt(self.x - other.x) == try std.math.absInt(self.y - other.y);
    }
};
