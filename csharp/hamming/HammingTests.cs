using System;
using Xunit;

public class HammingTests
{
    [Fact]
    public void Empty_strands()
    {
        Assert.Equal(0, Hamming.Distance("", ""));
    }

    [Fact]
    public void Single_letter_identical_strands()
    {
        Assert.Equal(0, Hamming.Distance("A", "A"));
    }

    [Fact]
    public void Single_letter_different_strands()
    {
        Assert.Equal(1, Hamming.Distance("G", "T"));
    }

    [Fact]
    public void Long_identical_strands()
    {
        Assert.Equal(0, Hamming.Distance("GGACTGAAATCTG", "GGACTGAAATCTG"));
    }

    [Fact]
    public void Long_different_strands()
    {
        Assert.Equal(9, Hamming.Distance("GGACGGATTCTG", "AGGACGGATTCT"));
    }

    [Fact]
    public void Disallow_first_strand_longer()
    {
        Assert.Throws<ArgumentException>(() => Hamming.Distance("AATG", "AAA"));
    }

    [Fact]
    public void Disallow_second_strand_longer()
    {
        Assert.Throws<ArgumentException>(() => Hamming.Distance("ATA", "AGTG"));
    }

    [Fact]
    public void Disallow_left_empty_strand()
    {
        Assert.Throws<ArgumentException>(() => Hamming.Distance("", "G"));
    }

    [Fact]
    public void Disallow_right_empty_strand()
    {
        Assert.Throws<ArgumentException>(() => Hamming.Distance("G", ""));
    }
}