using System;
using System.Collections.Generic;
using System.Linq;

public static class Poker
{
    public static IEnumerable<string> BestHands(IEnumerable<string> hands) =>
        hands.ToLookup(HandScore).MaxBy(g => g.Key);

    private static int HandScore(string hand) =>
        Math.Max(Parser.ParseHand(hand).Score, Parser.ParseHand(hand.Replace('A', '1')).Score);

    private record Card(int Rank, int Suit);

    private class Hand
    {
        private readonly int[] ranks;
        private readonly int[] rankCounts;
        private readonly int[] suitCounts;

        public Hand(Card[] cards)
        {
            ranks = cards.Select(card => card.Rank).OrderByDescending(rank => cards.Count(card => card.Rank == rank)).ThenByDescending(card => card).ToArray();
            suitCounts = cards.GroupBy(card => card.Suit).Select(grouping => grouping.Count()).OrderDescending().ToArray();
            rankCounts = cards.GroupBy(card => card.Rank).Select(grouping => grouping.Count()).OrderDescending().ToArray();
        }
        
        public int Score => ranks.Prepend(HandRank).Aggregate((total, value) => total * 14 + value);

        private int HandRank =>
            IsStraightFlush ? 9 :
            IsFourOfAKind ? 8 :
            IsFullHouse ? 7 :
            IsFlush ? 6 :
            IsStraight ? 5 :
            IsThreeOfAKind ? 4 :
            IsTwoPair ? 3 :
            IsOnePair ? 2 :
            1;

        private bool IsStraightFlush => IsFlush && IsStraight;
        private bool IsFlush => suitCounts is [5];
        private bool IsStraight => rankCounts is [1, 1, 1, 1, 1] && ranks[0] - ranks[4] == 4;
        private bool IsFourOfAKind => rankCounts is [4, 1];
        private bool IsFullHouse => rankCounts is [3, 2];
        private bool IsThreeOfAKind => rankCounts is [3, 1, 1];
        private bool IsTwoPair => rankCounts is [2, 2, 1];
        private bool IsOnePair => rankCounts is [2, 1, 1, 1];
    }
    
    private static class Parser
    {
        public static Hand ParseHand(string hand) => new(ParseCards(hand));
        private static Card[] ParseCards(string hand) => hand.Split(' ').Select(ParseCard).OrderBy(card => card.Rank).ToArray();
        private static Card ParseCard(string card) => new(Rank(card), Suit(card));
        private static int Rank(string card) => ".1234567890JQKA".IndexOf(card[^2]);
        private static int Suit(string card) => ".HSDC".IndexOf(card[^1]);
    }
}
