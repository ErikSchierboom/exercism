using System;
using System.Text.RegularExpressions;

public static class Wordy
{
    private static readonly Regex EquationRegex = new(
        @"^What is (?<left>-?\d+)(?<operations> (?<operand>plus|minus|multiplied by|divided by) (?<right>-?\d+))*\?$", RegexOptions.Compiled);

    public static int Answer(string question) => Solve(Parse(question));

    private static Match Parse(string question) => EquationRegex.Match(question);
    
    private static int Solve(Match match)
    {
        if (match is null) throw new ArgumentException(nameof(match));
        
        if (!int.TryParse(match.Groups["left"].Value, out var left))
            throw new ArgumentException(nameof(match));

        for (var i = 0; i < match.Groups["operations"].Captures.Count; i++)
        {
            var operand = match.Groups["operand"].Captures[i].Value;
            if (!int.TryParse(match.Groups["right"].Captures[i].Value, out var right))
                throw new ArgumentException(nameof(match));

            left = ApplyOperand(left, operand, right);
        }
        
        return left;
    }

    private static int ApplyOperand(int left, string operand, int right) =>
        operand switch
        {
            "plus" => left + right,
            "minus" => left - right,
            "multiplied by" => left * right,
            "divided by" => left / right,
            _ => throw new ArgumentException(nameof(operand))
        };
}