using System;
using System.Linq;

public enum YachtCategory
{
    Ones = 1,
    Twos = 2,
    Threes = 3,
    Fours = 4,
    Fives = 5,
    Sixes = 6,
    FullHouse = 7,
    FourOfAKind = 8,
    LittleStraight = 9,
    BigStraight = 10,
    Choice = 11,
    Yacht = 12,
}

public static class YachtGame
{
    public static int Score(int[] dice, YachtCategory category)
    {
        switch (category)
        {
            case YachtCategory.Ones:
                return ScoreSingleDice(dice, 1);
            case YachtCategory.Twos:
                return ScoreSingleDice(dice, 2);
            case YachtCategory.Threes:
                return ScoreSingleDice(dice, 3);
            case YachtCategory.Fours:
                return ScoreSingleDice(dice, 4);
            case YachtCategory.Fives:
                return ScoreSingleDice(dice, 5);
            case YachtCategory.Sixes:
                return ScoreSingleDice(dice, 6);
            case YachtCategory.FullHouse:
                return ScoreFullHouse(dice);
            case YachtCategory.FourOfAKind:
                return ScoreFourOfAKind(dice);
            case YachtCategory.LittleStraight:
                return ScoreLittleStraight(dice);
            case YachtCategory.BigStraight:
                return ScoreBigStraight(dice); 
            case YachtCategory.Choice:
                return ScoreChoice(dice);
            case YachtCategory.Yacht:
                return ScoreYacht(dice);
            default:
                throw new ArgumentOutOfRangeException(nameof(category), "Invalid category");
        }
    }
    
    private static int ScoreSingleDice(int[] dice, int singleDice)
        => dice.Where(x => x == singleDice).Sum();

    private static int ScoreFullHouse(int[] dice)
    {
        var groupedDice = dice.GroupBy(x => x).ToArray();
        return groupedDice.Length == 2 && groupedDice.Any(x => x.Count() == 2) ? dice.Sum() : 0;
    }

    private static int ScoreFourOfAKind(int[] dice)
    {
        var groupedDice = dice.GroupBy(x => x).ToArray();
        switch (groupedDice.Length)
        {
            case 1:
                return dice.Take(4).Sum();
            case 2 when groupedDice.Any(x => x.Count() == 4):
                return groupedDice.First(x => x.Count() == 4).Sum();
            default:
                return 0;
        }
    }

    private static int ScoreLittleStraight(int[] dice) 
        => dice.OrderBy(x => x).SequenceEqual(new[] {1, 2, 3, 4, 5}) ? 30 : 0;

    private static int ScoreBigStraight(int[] dice) 
        => dice.OrderBy(x => x).SequenceEqual(new[] {2, 3, 4, 5, 6}) ? 30 : 0;

    private static int ScoreChoice(int[] dice) 
        => dice.Sum();

    private static int ScoreYacht(int[] dice) 
        => dice.Distinct().Count() == 1 ? 50 : 0;
}

