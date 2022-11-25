using System;
using System.Collections.Generic;
using System.Linq;

public static class Poker
{
    public static IEnumerable<string> BestHands(IEnumerable<string> hands)
    {
        var orderedHands = hands.Select(Parser.ParseHand).OrderDescending();
        var bestHand = orderedHands.First();
        return orderedHands.TakeWhile(hand => hand.CompareTo(bestHand) == 0).Select(hand => hand.Text).ToArray();
    }

    private record Card(int Rank, int Suit);

    private class Hand : IComparable<Hand>
    {
        public string Text { get; }
        private readonly int[] ranks;
        private readonly int[] rankCounts;
        private readonly int[] suitCounts;

        public Hand(string text, Card[] cards)
        {
            Text = text;
            ranks = cards.Select(card => card.Rank).OrderByDescending(rank => cards.Count(card => card.Rank == rank)).ThenByDescending(card => card).ToArray();
            suitCounts = cards.GroupBy(card => card.Suit).Select(grouping => grouping.Count()).OrderDescending().ToArray();
            rankCounts = cards.GroupBy(card => card.Rank).Select(grouping => grouping.Count()).OrderDescending().ToArray();
        }

        private bool IsStraightFlush => IsFlush && IsStraight;
        private bool IsFlush => suitCounts is [5];
        private bool IsStraight => rankCounts is [1, 1, 1, 1, 1] && ranks[0] - ranks[4] == 4;
        private bool IsFourOfAKind => rankCounts is [4, 1];
        private bool IsFullHouse => rankCounts is [3, 2];
        private bool IsThreeOfAKind => rankCounts is [3, 1, 1];
        private bool IsTwoPair => rankCounts is [2, 2, 1];
        private bool IsOnePair => rankCounts is [2, 1, 1, 1];

        public int CompareTo(Hand other)
        {
            if (IsStraightFlush)
                return other.IsStraightFlush ? ranks[4].CompareTo(other.ranks[4]) : 1;
            
            if (IsFourOfAKind)
                return other.IsFourOfAKind ? (ranks[4], ranks[0]).CompareTo((other.ranks[4], other.ranks[0])) : 1;
            
            if (IsFullHouse)
                return other.IsFullHouse ? (ranks[0], ranks[3]).CompareTo((other.ranks[0], other.ranks[3])) : 1;
            
            if (IsFlush)
                return other.IsFlush ? (ranks[0], ranks[1], ranks[2], ranks[3], ranks[4]).CompareTo((other.ranks[0], other.ranks[1], other.ranks[2], other.ranks[3], other.ranks[4])) : 1;

            if (IsStraight)
                return other.IsStraight ? (ranks[0], ranks[1], ranks[2], ranks[3], ranks[4]).CompareTo((other.ranks[0], other.ranks[1], other.ranks[2], other.ranks[3], other.ranks[4])) : 1;
            
            if (IsThreeOfAKind)
                return other.IsThreeOfAKind ? (ranks[0], ranks[1], ranks[2], ranks[3], ranks[4]).CompareTo((other.ranks[0], other.ranks[1], other.ranks[2], other.ranks[3], other.ranks[4])) : 1;
            
            if (IsTwoPair)
                return other.IsTwoPair ? (ranks[0], ranks[1], ranks[2], ranks[3], ranks[4]).CompareTo((other.ranks[0], other.ranks[1], other.ranks[2], other.ranks[3], other.ranks[4])) : 1;
            
            if (IsOnePair)
                return other.IsOnePair ? (ranks[0], ranks[2], ranks[3], ranks[4]).CompareTo((other.ranks[0], other.ranks[2], other.ranks[3], other.ranks[4])) : 1;

            return ranks[0].CompareTo(other.ranks[0]);
        }
    }
    
    private static class Parser
    {
        public static Hand ParseHand(string hand) => new(hand, ParseCards(hand));
        private static Card[] ParseCards(string hand) => hand.Split(' ').Select(ParseCard).OrderBy(card => card.Rank).ToArray();
        private static Card ParseCard(string card) => new(Rank(card), Suit(card));
        private static int Rank(string card) => ".1234567890JQKA".IndexOf(card[^2]);
        private static int Suit(string card) => ".HSDC".IndexOf(card[^1]);
    }
}
