const std = @import("std");
const mem = std.mem;

pub const ConversionError = error{
    InvalidInputBase,
    InvalidOutputBase,
    InvalidDigit,
};

pub fn convert(
    allocator: mem.Allocator,
    digits: []const u32,
    input_base: u32,
    output_base: u32,
) (mem.Allocator.Error || ConversionError)![]u32 {
    if (input_base < 2) return ConversionError.InvalidInputBase;
    if (output_base < 2) return ConversionError.InvalidOutputBase;

    var decimal: u32 = 0;

    for (digits) |digit| {
        if (digit >= input_base) return ConversionError.InvalidDigit;
        decimal *= input_base;
        decimal += digit;
    }

    var output_digits = std.ArrayList(u32).init(allocator);
    defer output_digits.deinit();

    while (decimal > 0) : (decimal /= output_base) {
        var digit: u32 = decimal % output_base;
        try output_digits.append(digit);
    }

    if (output_digits.items.len == 0) try output_digits.append(0);

    std.mem.reverse(u32, output_digits.items);
    return try output_digits.toOwnedSlice();
}
