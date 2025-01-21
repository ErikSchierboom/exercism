using System.Collections.Generic;
using System.Linq;

public class HighScores(List<int> scores)
{
    public List<int> Scores() => scores;

    public int Latest() => scores.Last();

    public int PersonalBest() => scores.Max();

    public List<int> PersonalTopThree() => scores.OrderDescending().Take(3).ToList();
}