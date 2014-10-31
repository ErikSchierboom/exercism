using NUnit.Framework;

using octal;

[TestFixture]
public class OctalTest
{
    // change Ignore to false to run test case or just remove 'Ignore = true'
    [TestCase("1", Result = 1)]
    [TestCase("10", Result = 8)]
    [TestCase("17", Result = 15)]
    [TestCase("11", Result = 9)]
    [TestCase("130", Result = 88)]
    [TestCase("2047", Result = 1063)]
    [TestCase("7777", Result = 4095)]
    [TestCase("1234567", Result = 342391)]
    public int Octal_converts_to_decimal(string value)
    {
        return new Octal(value).ToDecimal();
    }

    [TestCase("carrot")]
    [TestCase("8")]
    [TestCase("9")]
    [TestCase("6789")]
    [TestCase("abc1z")]
    public void Invalid_octal_is_decimal_0(string invalidValue)
    {
        Assert.That(new Octal(invalidValue).ToDecimal(), Is.EqualTo(0));
    }

    [Test]
    public void Octal_can_convert_formatted_strings()
    {
        Assert.That(new Octal("011").ToDecimal(), Is.EqualTo(9));
    }
}