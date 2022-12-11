using System.Collections.Generic;
using System.Linq;

public static class Poker
{
    public static IEnumerable<string> BestHands(IEnumerable<string> hands) =>
        hands.ToLookup(hand => Parser.ParseHand(hand).Score).MaxBy(g => g.Key);

    private record Card(int Rank, int Suit);

    private record Hand(Card[] Cards)
    {
        private readonly int[] ranks = Cards
            .Select(card => card.Rank)
            .OrderByDescending(rank => Cards.Count(card => card.Rank == rank))
            .ThenByDescending(card => card)
            .ToArray();

        private readonly int[] rankCounts = Cards
            .GroupBy(card => card.Rank)
            .Select(grouping => grouping.Count())
            .OrderDescending()
            .ToArray();
        
        private readonly int[] suitCounts = Cards
            .GroupBy(card => card.Suit)
            .Select(grouping => grouping.Count())
            .OrderDescending()
            .ToArray();

        public int Score => CategoryRanks.Prepend(CategoryScore).Aggregate((total, value) => total * 14 + value);

        private int[] CategoryRanks => IsLowAceStraight ? ranks.Append(ranks[0]).Skip(1).ToArray() : ranks;
        
        private int CategoryScore =>
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
        private bool IsStraight => (rankCounts is [1, 1, 1, 1, 1] && ranks[0] - ranks[4] == 4) || IsLowAceStraight;
        private bool IsLowAceStraight => rankCounts is [1, 1, 1, 1, 1] && ranks[0] - ranks[1] is 9;
        private bool IsFourOfAKind => rankCounts is [4, 1];
        private bool IsFullHouse => rankCounts is [3, 2];
        private bool IsThreeOfAKind => rankCounts is [3, 1, 1];
        private bool IsTwoPair => rankCounts is [2, 2, 1];
        private bool IsOnePair => rankCounts is [2, 1, 1, 1];
    }

    private static class Parser
    {
        public static Hand ParseHand(string hand) => new(ParseCards(hand));
        private static Card[] ParseCards(string hand) => hand.Split(' ').Select(ParseCard).ToArray();
        private static Card ParseCard(string card) => new(ParseRank(card), ParseSuit(card));
        private static int ParseRank(string card) => "1234567890JQKA".IndexOf(card[^2]);
        private static int ParseSuit(string card) => "HSDC".IndexOf(card[^1]);
    }
}