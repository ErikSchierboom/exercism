using binary;

using NUnit.Framework;

[TestFixture]
public class BinaryTest
{
    // change Ignore to false to run test case or just remove 'Ignore = true'
    [TestCase("1", Result = 1)]
    [TestCase("10", Result = 2)]
    [TestCase("11", Result = 3)]
    [TestCase("100", Result = 4)]
    [TestCase("1001", Result = 9)]
    [TestCase("11010", Result = 26)]
    [TestCase("10001101000", Result = 1128)]
    public int Binary_converts_to_decimal(string binary)
    {
        return new Binary(binary).ToDecimal();
    }
    
    [TestCase("carrot")]
    [TestCase("2")]
    [TestCase("5")]
    [TestCase("9")]
    [TestCase("134678")]
    [TestCase("abc10z")]
    public void Invalid_binary_is_decimal_0(string invalidValue)
    {
        Assert.That(new Binary(invalidValue).ToDecimal(), Is.EqualTo(0));
    }

    [Test]
    public void Binary_can_convert_formatted_strings()
    {
        Assert.That(new Binary("011").ToDecimal(), Is.EqualTo(3));
    }
}