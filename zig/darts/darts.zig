const std = @import("std");

pub const Coordinate = struct {
    x: f32,
    y: f32,

    pub fn init(x_coord: f32, y_coord: f32) Coordinate {
        return Coordinate{ .x = x_coord, .y = y_coord };
    }

    pub fn score(self: Coordinate) isize {
        const distance = std.math.hypot(f32, self.x, self.y);
        if (distance <= 1.0) return 10;
        if (distance <= 5.0) return 5;
        if (distance <= 10.0) return 1;
        return 0;
    }
};
