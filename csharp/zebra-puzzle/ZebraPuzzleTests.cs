using Xunit;

public class ZebraPuzzleTests
{
    [Fact]
    public void Resident_who_drinks_water()
    {
        Assert.Equal(Nationality.Norwegian, ZebraPuzzle.DrinksWater());
    }

    [Fact]
    public void Resident_who_owns_zebra()
    {
        Assert.Equal(Nationality.Japanese, ZebraPuzzle.OwnsZebra());
    }
}