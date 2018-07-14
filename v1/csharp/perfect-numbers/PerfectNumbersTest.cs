using NUnit.Framework;

[TestFixture]
public class PerfectNumbersTest
{
    [TestCase(3)]
    [TestCase(7)]
    [TestCase(13)]
    public void Can_classify_deficient_numbers(int number)
    {
        Assert.That(PerfectNumbers.Classify(number), Is.EqualTo(NumberType.Deficient));
    }
    
    [TestCase(6)]
    [TestCase(28)]
    [TestCase(496)]
    public void Can_classify_perfect_numbers(int number)
    {
        Assert.That(PerfectNumbers.Classify(number), Is.EqualTo(NumberType.Perfect));
    }
    
    [TestCase(12)]
    [TestCase(18)]
    [TestCase(20)]
    public void Can_classify_abundant_numbers(int number)
    {
        Assert.That(PerfectNumbers.Classify(number), Is.EqualTo(NumberType.Abundant));
    }
}