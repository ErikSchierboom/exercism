// This file was auto-generated based on version 1.1.0 of the canonical data.

using Xunit;

public class ProverbTest
{
    [Fact]
    public void Zero_pieces()
    {
        Assert.Empty(Proverb.Recite(new string[0]));
    }

    [Fact]
    public void One_piece()
    {
        var expected = new[]
        {
            "And all for the want of a nail."
        };
        Assert.Equal(expected, Proverb.Recite(new[] { "nail" }));
    }

    [Fact]
    public void Two_pieces()
    {
        var expected = new[]
        {
            "For want of a nail the shoe was lost.",
            "And all for the want of a nail."
        };
        Assert.Equal(expected, Proverb.Recite(new[] { "nail", "shoe" }));
    }

    [Fact]
    public void Three_pieces()
    {
        var expected = new[]
        {
            "For want of a nail the shoe was lost.",
            "For want of a shoe the horse was lost.",
            "And all for the want of a nail."
        };
        Assert.Equal(expected, Proverb.Recite(new[] { "nail", "shoe", "horse" }));
    }

    [Fact]
    public void Full_proverb()
    {
        var expected = new[]
        {
            "For want of a nail the shoe was lost.",
            "For want of a shoe the horse was lost.",
            "For want of a horse the rider was lost.",
            "For want of a rider the message was lost.",
            "For want of a message the battle was lost.",
            "For want of a battle the kingdom was lost.",
            "And all for the want of a nail."
        };
        Assert.Equal(expected, Proverb.Recite(new[] { "nail", "shoe", "horse", "rider", "message", "battle", "kingdom" }));
    }

    [Fact]
    public void Four_pieces_modernized()
    {
        var expected = new[]
        {
            "For want of a pin the gun was lost.",
            "For want of a gun the soldier was lost.",
            "For want of a soldier the battle was lost.",
            "And all for the want of a pin."
        };
        Assert.Equal(expected, Proverb.Recite(new[] { "pin", "gun", "soldier", "battle" }));
    }
}