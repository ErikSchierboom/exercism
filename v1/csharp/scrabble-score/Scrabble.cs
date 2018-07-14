﻿using System.Collections.Generic;
using System.Linq;

public class Scrabble
{
    private static readonly Dictionary<char, int> LetterScores = new Dictionary<char, int>
            {
                { 'A', 1 }, { 'E', 1 }, { 'I', 1 }, { 'O', 1 }, { 'U', 1 }, { 'L', 1 }, { 'N', 1 }, { 'R', 1 }, { 'S', 1 }, { 'T', 1 },
                { 'D', 2 }, { 'G', 2 },
                { 'B', 3 }, { 'C', 3 }, { 'M', 3 }, { 'P', 3 },
                { 'F', 4 }, { 'H', 4 }, { 'V', 4 }, { 'W', 4 }, { 'Y', 4 },
                { 'K', 5 },
                { 'J', 8 }, { 'X', 8 },
                { 'Q', 10 }, { 'Z', 10 },
            };

    private readonly string word;

    public Scrabble(string word)
    {
        this.word = word;
    }

    public int Score()
    {
        return Score(this.word);
    }

    private static int LetterScore(char c)
    {
        return LetterScores.ContainsKey(c) ? LetterScores[c] : 0;
    }

    public static int Score(string word)
    {
        return word == null ? 0 : word.ToUpperInvariant().Sum(c => LetterScore(c));
    }
}