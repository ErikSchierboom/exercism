using Xunit;

public class AcronymTests
{
    [Fact]
    public void Basic()
    {
        Assert.Equal("PNG", Acronym.Abbreviate("Portable Network Graphics"));
    }

    [Fact]
    public void Lowercase_words()
    {
        Assert.Equal("ROR", Acronym.Abbreviate("Ruby on Rails"));
    }

    [Fact]
    public void Punctuation()
    {
        Assert.Equal("FIFO", Acronym.Abbreviate("First In, First Out"));
    }

    [Fact]
    public void All_caps_word()
    {
        Assert.Equal("GIMP", Acronym.Abbreviate("GNU Image Manipulation Program"));
    }

    [Fact]
    public void Punctuation_without_whitespace()
    {
        Assert.Equal("CMOS", Acronym.Abbreviate("Complementary metal-oxide semiconductor"));
    }

    [Fact]
    public void Very_long_abbreviation()
    {
        Assert.Equal("ROTFLSHTMDCOALM", Acronym.Abbreviate("Rolling On The Floor Laughing So Hard That My Dogs Came Over And Licked Me"));
    }

    [Fact]
    public void Consecutive_delimiters()
    {
        Assert.Equal("SIMUFTA", Acronym.Abbreviate("Something - I made up from thin air"));
    }

    [Fact]
    public void Apostrophes()
    {
        Assert.Equal("HC", Acronym.Abbreviate("Halley's Comet"));
    }

    [Fact]
    public void Underscore_emphasis()
    {
        Assert.Equal("TRNT", Acronym.Abbreviate("The Road _Not_ Taken"));
    }
}