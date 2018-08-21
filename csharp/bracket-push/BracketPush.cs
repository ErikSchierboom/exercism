using System.Collections.Generic;
using System.Linq;

public static class BracketPush
{
    private static readonly Dictionary<char, char> ClosingToOpeningBrackets = new Dictionary<char, char>
    {
        [']'] = '[',
        ['}'] = '{',
        [')'] = '(',
    };

    public static bool IsPaired(string input)
    {
        var unpairedBrackets = new Stack<char>();

        foreach (var character in input)
        {
            if (IsOpeningBracket(character))
            {
                unpairedBrackets.Push(character);
            }
            else if (TryGetOpeningBracketForClosingBracket(character, out var openingBracket))
            {
                if (!ClosingBracketMatchesLastUnpairedBracket(unpairedBrackets, openingBracket)) 
                    return false;
                
                unpairedBrackets.Pop();
            }
        }

        return !unpairedBrackets.Any();
    }

    private static bool IsOpeningBracket(char character)
        => ClosingToOpeningBrackets.Values.Contains(character);

    private static bool TryGetOpeningBracketForClosingBracket(char character, out char openingBracket)
        => ClosingToOpeningBrackets.TryGetValue(character, out openingBracket);

    private static bool ClosingBracketMatchesLastUnpairedBracket(Stack<char> unpairedBrackets, char openingBracket)
        => unpairedBrackets.TryPeek(out var topUnpairedBracket) && topUnpairedBracket == openingBracket;
}
