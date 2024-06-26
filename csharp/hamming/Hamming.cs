﻿using System;
using System.Linq;

public static class Hamming
{
    public static int Distance(string strand1, string strand2)
    {
        if (strand1.Length != strand2.Length) throw new ArgumentException("Strands have different length");

        return strand1.Zip(strand2).Count(pair => pair.First != pair.Second);
    }
}