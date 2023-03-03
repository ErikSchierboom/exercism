const std = @import("std");
const mem = std.mem;

pub const Signal = enum { wink, double_blink, close_your_eyes, jump };

pub fn calculateHandshake(allocator: mem.Allocator, number: isize) mem.Allocator.Error![]const Signal {
    var actions = std.ArrayList(Signal).init(allocator);
    errdefer actions.deinit();

    if (number & 0b00001 != 0) try actions.append(Signal.wink);
    if (number & 0b00010 != 0) try actions.append(Signal.double_blink);
    if (number & 0b00100 != 0) try actions.append(Signal.close_your_eyes);
    if (number & 0b01000 != 0) try actions.append(Signal.jump);
    if (number & 0b10000 != 0) mem.reverse(Signal, actions.items);

    return actions.items;
}
