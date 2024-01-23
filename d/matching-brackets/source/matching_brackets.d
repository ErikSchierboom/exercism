module matching_brackets;

import std.algorithm.mutation: remove;

bool isPaired(string input)
{
    const auto close_to_open = ['}': '{', ')': '(', ']': '['];
    int[] opened;

    foreach (char c; input) {
        switch (c) {
            case '{', '[', '(':
                opened ~= c;
                break;
            case '}', ']', ')':
                if (opened.length == 0) return false;
                if (close_to_open[c] != opened[$ - 1]) return false;

                --opened.length;
                break;
            default: break;
        }
    }

    return opened.length == 0;
}

unittest
{
    immutable int allTestsEnabled = 1;

    // Paired square brackets
    assert(isPaired("[]"));

    static if (allTestsEnabled)
    {
        // Empty string
        assert(isPaired(""));

        // Unpaired brackets
        assert(!isPaired("[["));

        // Wrong ordered brackets
        assert(!isPaired("}{"));

        // Wrong closing bracket
        assert(!isPaired("{]"));

        // Paired with whitespace
        assert(isPaired("{ }"));

        // Partially paired brackets
        assert(!isPaired("{[])"));

        // Simple nested brackets
        assert(isPaired("{[]}"));

        // Several paired brackets
        assert(isPaired("{}[]"));

        // Paired and nested brackets
        assert(isPaired("([{}({}[])])"));

        // Unopened closing brackets
        assert(!isPaired("{[)][]}"));

        // Unpaired and nested brackets
        assert(!isPaired("([{])"));

        // Paired and wrong nested brackets
        assert(!isPaired("[({]})"));

        // Paired and incomplete brackets
        assert(!isPaired("{}["));

        // Too many closing brackets
        assert(!isPaired("[]]"));

        // Math expression
        assert(isPaired("(((185 + 223.85) * 15) - 543)/2"));

        // Complex latex expression
        assert(isPaired(
                "\\left(\\begin{array}{cc} \\frac{1}{3} & x\\\\ \\mathrm{e}^{x} &... x^2 \\end{array}\\right)"));
    }
}
