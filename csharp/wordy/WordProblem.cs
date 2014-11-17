namespace Exercism.wordy
{
    using System;
    using System.Text.RegularExpressions;

    public class WordProblem
    {
        private static readonly Regex EquationRegex = new Regex(@"(?<left>-?\d+) (?<operation>-?plus|minus|divided by|multiplied by) (?=(?<right>-?\d+))");

        public static int Solve(string question)
        {
            var matches = EquationRegex.Matches(question);
            
            if (matches.Count == 0)
            {
                throw new ArgumentException("The question could not be parsed.", "question");
            }
            
            var result = GetStartValue(matches);

            foreach (Match match in matches)
            {
                switch (match.Groups["operation"].Value)
                {
                    case "plus":
                        result += GetRightValue(match);
                        break;
                    case"minus":
                        result -= GetRightValue(match);
                        break;
                    case"multiplied by":
                        result *= GetRightValue(match);
                        break;
                    case "divided by":
                        result /= GetRightValue(match);
                        break;
                }
            }

            return result;
        }

        private static int GetRightValue(Match match)
        {
            return Convert.ToInt32(match.Groups["right"].Value);
        }

        private static int GetStartValue(MatchCollection matches)
        {
            return Convert.ToInt32(matches[0].Groups["left"].Value);
        }
    }
}