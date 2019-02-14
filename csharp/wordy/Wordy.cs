using System;
using System.Text.RegularExpressions;

public static class Wordy
{
    private static readonly Regex EquationRegex = new Regex(
        @"^What is (?<left>-?\d+)(?<operations> (?<operand>plus|minus|multiplied by|divided by) (?<right>-?\d+))*\?$", RegexOptions.Compiled);

    public static int Answer(string question)
    {
        var match = Parse(question);
        if (match is null)
            throw new ArgumentException();
        
        return Solve(match);
    }

    private static Match Parse(string question) => EquationRegex.Match(question);
    
    private static int Solve(Match match)
    {
        if (!int.TryParse(match.Groups["left"].Value, out var left))
            throw new ArgumentException();

        for (var i = 0; i < match.Groups["operations"].Captures.Count; i++)
        {
            var operand = match.Groups["operand"].Captures[i].Value;
            if (!int.TryParse(match.Groups["right"].Captures[i].Value, out var right))
                throw new ArgumentException();

            left = ApplyOperand(left, operand, right);
        }
        
        return left;
    }

    private static int ApplyOperand(int left, string operand, int right)
    {
        switch (operand)
        {
            case "plus": return left + right;
            case "minus": return left - right;
            case "multiplied by": return left * right;
            case "divided by": return left / right;
            default: throw new ArgumentException();

        }
    }
}