using Xunit;

public class ScaleGeneratorTests
{
    [Fact]
    public void Chromatic_scale_with_sharps()
    {
        var expected = new[] { "C", "C#", "D", "D#", "E", "F", "F#", "G", "G#", "A", "A#", "B" };
        Assert.Equal(expected, ScaleGenerator.Chromatic("C"));
    }

    [Fact]
    public void Chromatic_scale_with_flats()
    {
        var expected = new[] { "F", "Gb", "G", "Ab", "A", "Bb", "B", "C", "Db", "D", "Eb", "E" };
        Assert.Equal(expected, ScaleGenerator.Chromatic("F"));
    }

    [Fact]
    public void Simple_major_scale()
    {
        var expected = new[] { "C", "D", "E", "F", "G", "A", "B", "C" };
        Assert.Equal(expected, ScaleGenerator.Interval("C", "MMmMMMm"));
    }

    [Fact]
    public void Major_scale_with_sharps()
    {
        var expected = new[] { "G", "A", "B", "C", "D", "E", "F#", "G" };
        Assert.Equal(expected, ScaleGenerator.Interval("G", "MMmMMMm"));
    }

    [Fact]
    public void Major_scale_with_flats()
    {
        var expected = new[] { "F", "G", "A", "Bb", "C", "D", "E", "F" };
        Assert.Equal(expected, ScaleGenerator.Interval("F", "MMmMMMm"));
    }

    [Fact]
    public void Minor_scale_with_sharps()
    {
        var expected = new[] { "F#", "G#", "A", "B", "C#", "D", "E", "F#" };
        Assert.Equal(expected, ScaleGenerator.Interval("f#", "MmMMmMM"));
    }

    [Fact]
    public void Minor_scale_with_flats()
    {
        var expected = new[] { "Bb", "C", "Db", "Eb", "F", "Gb", "Ab", "Bb" };
        Assert.Equal(expected, ScaleGenerator.Interval("bb", "MmMMmMM"));
    }

    [Fact]
    public void Dorian_mode()
    {
        var expected = new[] { "D", "E", "F", "G", "A", "B", "C", "D" };
        Assert.Equal(expected, ScaleGenerator.Interval("d", "MmMMMmM"));
    }

    [Fact]
    public void Mixolydian_mode()
    {
        var expected = new[] { "Eb", "F", "G", "Ab", "Bb", "C", "Db", "Eb" };
        Assert.Equal(expected, ScaleGenerator.Interval("Eb", "MMmMMmM"));
    }

    [Fact]
    public void Lydian_mode()
    {
        var expected = new[] { "A", "B", "C#", "D#", "E", "F#", "G#", "A" };
        Assert.Equal(expected, ScaleGenerator.Interval("a", "MMMmMMm"));
    }

    [Fact]
    public void Phrygian_mode()
    {
        var expected = new[] { "E", "F", "G", "A", "B", "C", "D", "E" };
        Assert.Equal(expected, ScaleGenerator.Interval("e", "mMMMmMM"));
    }

    [Fact]
    public void Locrian_mode()
    {
        var expected = new[] { "G", "Ab", "Bb", "C", "Db", "Eb", "F", "G" };
        Assert.Equal(expected, ScaleGenerator.Interval("g", "mMMmMMM"));
    }

    [Fact]
    public void Harmonic_minor()
    {
        var expected = new[] { "D", "E", "F", "G", "A", "Bb", "Db", "D" };
        Assert.Equal(expected, ScaleGenerator.Interval("d", "MmMMmAm"));
    }

    [Fact]
    public void Octatonic()
    {
        var expected = new[] { "C", "D", "D#", "F", "F#", "G#", "A", "B", "C" };
        Assert.Equal(expected, ScaleGenerator.Interval("C", "MmMmMmMm"));
    }

    [Fact]
    public void Hexatonic()
    {
        var expected = new[] { "Db", "Eb", "F", "G", "A", "B", "Db" };
        Assert.Equal(expected, ScaleGenerator.Interval("Db", "MMMMMM"));
    }

    [Fact]
    public void Pentatonic()
    {
        var expected = new[] { "A", "B", "C#", "E", "F#", "A" };
        Assert.Equal(expected, ScaleGenerator.Interval("A", "MMAMA"));
    }

    [Fact]
    public void Enigmatic()
    {
        var expected = new[] { "G", "G#", "B", "C#", "D#", "F", "F#", "G" };
        Assert.Equal(expected, ScaleGenerator.Interval("G", "mAMMMmm"));
    }
}