using NUnit.Framework;

[TestFixture]
public class BinaryTest
{
    [TestCase("1", ExpectedResult = 1)]
    [TestCase("10", ExpectedResult = 2)]
    [TestCase("11", ExpectedResult = 3)]
    [TestCase("100", ExpectedResult = 4)]
    [TestCase("1001", ExpectedResult = 9)]
    [TestCase("11010", ExpectedResult = 26)]
    [TestCase("10001101000", ExpectedResult = 1128)]
    public int Binary_converts_to_decimal(string binary)
    {
        return Binary.ToDecimal(binary);
    }
    
    [TestCase("carrot")]
    [TestCase("2")]
    [TestCase("5")]
    [TestCase("9")]
    [TestCase("134678")]
    [TestCase("abc10z")]
    public void Invalid_binary_is_decimal_0(string invalidValue)
    {
        Assert.That(Binary.ToDecimal(invalidValue), Is.EqualTo(0));
    }
    
    [Test]
    public void Binary_can_convert_formatted_strings()
    {
        Assert.That(Binary.ToDecimal("011"), Is.EqualTo(3));
    }
}