const std = @import("std");

pub const Category = enum {
    ones,
    twos,
    threes,
    fours,
    fives,
    sixes,
    full_house,
    four_of_a_kind,
    little_straight,
    big_straight,
    choice,
    yacht,
};

pub fn score(dice: [5]u3, category: Category) u32 {
    return switch (category) {
        .ones => scoreSingle(dice, 1),
        .twos => scoreSingle(dice, 2),
        .threes => scoreSingle(dice, 3),
        .fours => scoreSingle(dice, 4),
        .fives => scoreSingle(dice, 5),
        .sixes => scoreSingle(dice, 6),
        .full_house => scoreFullHouse(dice),
        .four_of_a_kind => scoreFourOfAKind(dice),
        .little_straight => scoreLittleStraight(dice),
        .big_straight => scoreBigStraight(dice),
        .choice => scoreChoice(dice),
        .yacht => scoreYacht(dice),
    };
}

fn scoreSingle(dice: [5]u3, target: u3) u32 {
    var total: u32 = 0;
    for (dice) |die| total += if (die == target) target else 0;
    return total;
}

fn scoreFullHouse(dice: [5]u3) u32 {
    var sorted: [5]u3 = dice;
    std.mem.sort(u3, &sorted, {}, std.sort.asc(u3));

    if (sorted[0] == sorted[1] and sorted[2] == sorted[3] and sorted[3] == sorted[4] and sorted[1] != sorted[2] or
        sorted[0] == sorted[1] and sorted[1] == sorted[2] and sorted[3] == sorted[4] and sorted[2] != sorted[3])
        return sum(dice);

    return 0;
}

fn scoreFourOfAKind(dice: [5]u3) u32 {
    var sorted: [5]u3 = dice;
    std.mem.sort(u3, &sorted, {}, std.sort.asc(u3));
    return if (sorted[0] == sorted[3] or sorted[1] == sorted[4]) return @as(u32, @intCast(dice[1])) * 4 else 0;
}

fn scoreLittleStraight(dice: [5]u3) u32 {
    var sorted: [5]u3 = dice;
    std.mem.sort(u3, &sorted, {}, std.sort.asc(u3));
    return if (sorted[0] == 1 and sorted[1] == 2 and sorted[2] == 3 and sorted[3] == 4 and sorted[4] == 5) 30 else 0;
}

fn scoreBigStraight(dice: [5]u3) u32 {
    var sorted: [5]u3 = dice;
    std.mem.sort(u3, &sorted, {}, std.sort.asc(u3));
    return if (sorted[0] == 2 and sorted[1] == 3 and sorted[2] == 4 and sorted[3] == 5 and sorted[4] == 6) 30 else 0;
}

fn scoreChoice(dice: [5]u3) u32 {
    return sum(dice);
}

fn scoreYacht(dice: [5]u3) u32 {
    var target: u3 = dice[0];
    for (dice[1..]) |die| if (die != target) return 0;
    return 50;
}

fn sum(dice: [5]u3) u32 {
    var total: u32 = 0;
    for (dice) |die| total += die;
    return total;
}
