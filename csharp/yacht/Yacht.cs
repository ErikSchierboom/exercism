using System;
using System.Linq;

public enum YachtCategory { Ones, Twos, Threes, Fours, Fives, Sixes, FullHouse, FourOfAKind, LittleStraight, BigStraight, Choice, Yacht }

public static class YachtGame
{
    public static int Score(int[] dice, YachtCategory category) =>
        category switch
        {
            YachtCategory.Ones => SingleDiceScore(dice, 1),
            YachtCategory.Twos => SingleDiceScore(dice, 2),
            YachtCategory.Threes => SingleDiceScore(dice, 3),
            YachtCategory.Fours => SingleDiceScore(dice, 4),
            YachtCategory.Fives => SingleDiceScore(dice, 5),
            YachtCategory.Sixes => SingleDiceScore(dice, 6),
            YachtCategory.FullHouse => FullHouseScore(dice),
            YachtCategory.FourOfAKind => FourOfAKindScore(dice),
            YachtCategory.LittleStraight => LittleStraightScore(dice),
            YachtCategory.BigStraight => BigStraightScore(dice),
            YachtCategory.Choice => ChoiceScore(dice),
            YachtCategory.Yacht => YachtScore(dice),
            _ => throw new ArgumentOutOfRangeException(nameof(category), "Invalid category")
        };

    private static int SingleDiceScore(int[] dice, int targetDie) =>
        dice.Where(die => die == targetDie).Sum();

    private static int FullHouseScore(int[] dice) =>
        dice.Any(die => dice.Count(other => other == die) == 2) &&
        dice.Any(die => dice.Count(other => other == die) == 3) ? dice.Sum() : 0;

    private static int FourOfAKindScore(int[] dice) =>
        dice.FirstOrDefault(die => dice.Count(other => other == die) >= 4, 0) * 4;

    private static int LittleStraightScore(int[] dice) =>
        dice.Distinct().Count() == 5 && !dice.Contains(6) ? 30 : 0;

    private static int BigStraightScore(int[] dice) =>
        dice.Distinct().Count() == 5 && !dice.Contains(1) ? 30 : 0;

    private static int YachtScore(int[] dice) =>
        dice.Distinct().Count() == 1 ? 50 : 0;

    private static int ChoiceScore(int[] dice) => dice.Sum();
}

