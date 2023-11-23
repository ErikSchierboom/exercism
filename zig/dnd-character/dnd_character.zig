const std = @import("std");

pub fn modifier(score: i8) i8 {
    return @divFloor(score - 10, 2);
}

pub fn ability() i8 {
    var prng = std.rand.DefaultPrng.init(@intCast(std.time.timestamp()));
    var rnd = prng.random();
    var sum: i32 = 0;
    var min: i8 = 7;

    for (0..4) |_| {
        const roll = rnd.intRangeAtMost(i8, 1, 6);
        sum += roll;
        min = @min(min, roll);
    }

    sum -= min;

    return @intCast(@divTrunc(sum, 3));
}

pub const Character = struct {
    strength: i8,
    dexterity: i8,
    constitution: i8,
    intelligence: i8,
    wisdom: i8,
    charisma: i8,
    hitpoints: i8,

    pub fn init() Character {
        const constitutionAbility = ability();
        return Character{ .strength = ability(), .dexterity = ability(), .constitution = ability(), .intelligence = ability(), .wisdom = ability(), .charisma = ability(), .hitpoints = 10 + modifier(constitutionAbility) };
    }
};
