using System;
using System.Collections.Generic;
using System.Linq;

public class HighScores
{
    private readonly List<int> _scores; 

    public HighScores(List<int> scores) => _scores = scores;

    public List<int> Scores() => _scores;

    public int Latest() => _scores.Last();

    public int PersonalBest() => _scores.Max();

    public List<int> PersonalTop() => _scores.OrderByDescending(score => score).Take(3).ToList();

    public string Report()
    {
        var latestScoreReport = $"Your latest score was {Latest()}.";

        var differenceOfLatestToPersonalBest = PersonalBest() - Latest();
        var latestScoreComparedToPersonalBestReport = 
            differenceOfLatestToPersonalBest == 0
                ? "That's your personal best!"
                : $"That's {differenceOfLatestToPersonalBest} short of your personal best!";

        return $"{latestScoreReport} {latestScoreComparedToPersonalBestReport}";
    }
}