using System;
using System.Collections.Generic;
using System.Linq;

public static class Poker
{
    public static IEnumerable<string> BestHands(IEnumerable<string> hands) =>
        hands.ToLookup(Scorer.Calculate).MaxBy(g => g.Key);
    
    private record Card(int Rank, int Suit);

    private record Hand
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
        public bool IsSmallStraight => RankCounts is [1, 1, 1, 1, 1] && Ranks is [2, 3, 4, 5, 14];
        public bool IsLargeStraight => RankCounts is [1, 1, 1, 1, 1] && Ranks[4] - Ranks[0] == 4;
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
        private static int Rank(string card) => "..234567890JQKA".IndexOf(card[^2]);
        private static int Suit(string card) => ".HSDC".IndexOf(card[^1]);
    }
    
    private static class Scorer
    {
        public static int Calculate(string hand) => Calculate(Parser.ParseHand(hand));

        private static int Calculate(Hand hand)
        {
            var score = 
                StraightFlushScore(hand) ??
                FourOfAKindScore(hand) ??
                FullHouseScore(hand) ??
                FlushScore(hand) ??
                StraightScore(hand) ??
                ThreeOfAKindScore(hand) ??
                TwoPairScore(hand) ??
                OnePairScore(hand) ??
                HighCardScore(hand);

            return score.Aggregate((total, value) => total * 14 + value);
        }

        private static int[]? StraightFlushScore(Hand hand) =>
            hand.IsFlush && hand.IsSmallStraight ? hand.Ranks.Prepend(9).ToArray() :
            hand.IsFlush && hand.IsLargeStraight ? hand.Ranks.Prepend(9).ToArray() :
            null;
           
        private static int[]? FourOfAKindScore(Hand hand) => hand.IsFourOfAKind ? hand.Ranks.Prepend(8).ToArray() : null;
        private static int[]? FullHouseScore(Hand hand) => hand.IsFullHouse ? hand.Ranks.Prepend(7).ToArray() : null;
        private static int[]? FlushScore(Hand hand) => hand.IsFlush ? hand.Ranks.Prepend(6).ToArray() : null;
        
        private static int[]? StraightScore(Hand hand) => 
            hand.IsSmallStraight ? hand.Ranks.Prepend(5).ToArray() :
            hand.IsLargeStraight ? hand.Ranks.Prepend(5).ToArray() :
            null;
        
        private static int[]? ThreeOfAKindScore(Hand hand) => hand.IsThreeOfAKind ?  hand.Ranks.Prepend(4).ToArray() : null;
        private static int[]? TwoPairScore(Hand hand) => hand.IsTwoPair ? hand.Ranks.Prepend(3).ToArray() : null;
        private static int[]? OnePairScore(Hand hand) => hand.IsOnePair ? hand.Ranks.Prepend(2).ToArray() : null;
        private static int[] HighCardScore(Hand hand) => hand.Ranks.Prepend(1).ToArray();
    }
}
