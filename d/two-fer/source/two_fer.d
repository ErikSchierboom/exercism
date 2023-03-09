module two_fer;

import std.format : format;

string twoFer(string name = "you")
{
    return format("One for %s, one for me.", name);
}

unittest
{
    // No name given
    assert(twoFer() == "One for you, one for me.");

    // A name given
    assert(twoFer("Alice") == "One for Alice, one for me.");

    // Another name given
    assert(twoFer("Bob") == "One for Bob, one for me.");
}
