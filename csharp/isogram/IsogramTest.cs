// This file was auto-generated based on version 1.3.0 of the canonical data.

using Xunit;

public class IsogramTest
{
    [Fact]
    public void Empty_string()
    {
        Assert.True(Isogram.IsIsogram(""));
    }

    [Fact]
    public void Isogram_with_only_lower_case_characters()
    {
        Assert.True(Isogram.IsIsogram("isogram"));
    }

    [Fact]
    public void Word_with_one_duplicated_character()
    {
        Assert.False(Isogram.IsIsogram("eleven"));
    }

    [Fact]
    public void Longest_reported_english_isogram()
    {
        Assert.True(Isogram.IsIsogram("subdermatoglyphic"));
    }

    [Fact]
    public void Word_with_duplicated_character_in_mixed_case()
    {
        Assert.False(Isogram.IsIsogram("Alphabet"));
    }

    [Fact]
    public void Hypothetical_isogrammic_word_with_hyphen()
    {
        Assert.True(Isogram.IsIsogram("thumbscrew-japingly"));
    }

    [Fact]
    public void Isogram_with_duplicated_hyphen()
    {
        Assert.True(Isogram.IsIsogram("six-year-old"));
    }

    [Fact]
    public void Made_up_name_that_is_an_isogram()
    {
        Assert.True(Isogram.IsIsogram("Emily Jung Schwartzkopf"));
    }

    [Fact]
    public void Duplicated_character_in_the_middle()
    {
        Assert.False(Isogram.IsIsogram("accentor"));
    }
}