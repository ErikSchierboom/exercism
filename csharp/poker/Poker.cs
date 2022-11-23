using System;
using System.Collections.Generic;
using System.Linq;

public static class Poker
{
    public static IEnumerable<string> BestHands(IEnumerable<string> hands) =>
        hands.ToLookup(Scorer.Calculate).MaxBy(g => g.Key);
    
    private record Card(int Rank, int Suit);

    private class Hand
    {
        public readonly int[] Ranks;
        public readonly int[] Suits;
        public readonly int[] RankCounts;

        public Hand(Card[] cards)
        {
            Ranks = cards.Select(card => card.Rank).OrderByDescending(rank => cards.Count(card => card.Rank == rank)).ThenByDescending(card => card).ToArray();
            Suits = cards.Select(card => card.Suit).ToArray();
            RankCounts = cards.GroupBy(card => card.Rank).Select(grouping => grouping.Count()).OrderDescending().ToArray();
        }

        public bool IsFlush => Suits.Distinct().Count() == 1;
        public bool IsStraight => RankCounts is [1, 1, 1, 1, 1] && Ranks[0] - Ranks[4] == 4;
        public bool IsFourOfAKind => RankCounts is [4, 1];
        public bool IsFullHouse => RankCounts is [3, 2];
        public bool IsThreeOfAKind => RankCounts is [3, 1, 1];
        public bool IsTwoPair => RankCounts is [2, 2, 1];
        public bool IsOnePair => RankCounts is [2, 1, 1, 1];
    }
    
    private static class Parser
    {
        public static Hand ParseHand(string hand) => new(ParseCards(hand));
        private static Card[] ParseCards(string hand) => hand.Split(' ').Select(ParseCard).OrderBy(card => card.Rank).ToArray();
        private static Card ParseCard(string card) => new(Rank(card), Suit(card));
        private static int Rank(string card) => ".1234567890JQKA".IndexOf(card[^2]);
        private static int Suit(string card) => ".HSDC".IndexOf(card[^1]);
    }
    
    private static class Scorer
    {
        public static int Calculate(string hand) =>
            Math.Max(
                Calculate(Parser.ParseHand(hand)),
                Calculate(Parser.ParseHand(hand.Replace('A', '1'))));

        private static int Calculate(Hand hand)
        {
            var scoreRank = 
                (hand.IsFlush && hand.IsStraight ? 9 : 0) +
                (hand.IsFourOfAKind ? 8 : 0) +
                (hand.IsFullHouse ? 7 : 0) +
                (hand.IsFlush ? 6 : 0) +
                (hand.IsStraight ? 5 : 0) +
                (hand.IsThreeOfAKind ? 4 : 0) +
                (hand.IsTwoPair ? 3 : 0) +
                (hand.IsOnePair ? 2 : 0) +
                1;

            return hand.Ranks.Prepend(scoreRank).Aggregate((total, value) => total * 14 + value);
        }
    }
}
