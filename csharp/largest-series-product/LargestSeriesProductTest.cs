using System;
using NUnit.Framework;
using Exercism;

[TestFixture]
public class LargestSeriesProductTest
{
    [Test]
    public void Splits_out_digits()
    {
        Assert.That(new LargestSeriesProduct("0123456789").Digits, Is.EqualTo(new[] { 0, 1, 2, 3, 4, 5, 6, 7, 8, 9 }));
    }

    [Test]
    public void Digits_maintain_order()
    {
        Assert.That(new LargestSeriesProduct("9876543210").Digits, Is.EqualTo(new[] { 9, 8, 7, 6, 5, 4, 3, 2, 1, 0 }));
    }

    [Test]
    public void Digits_is_an_empty_array_for_empty_input()
    {
        Assert.That(new LargestSeriesProduct("").Digits, Is.Empty);
    }

    [Test]
    public void Slices_digits_by_limit_given()
    {
        Assert.That(new LargestSeriesProduct("01234").GetSlices(2),
            Is.EqualTo(new[] { new[] { 0, 1 }, new[] { 1, 2 }, new[] { 2, 3 }, new[] { 3, 4 } }));
    }

    [Test]
    public void Slices_are_as_long_as_the_limit_given()
    {
        Assert.That(new LargestSeriesProduct("982347").GetSlices(3),
            Is.EqualTo(new[] { new[] { 9, 8, 2 }, new[] { 8, 2, 3 }, new[] { 2, 3, 4 }, new[] { 3, 4, 7 } }));
    }

    [Test]
    public void Cannot_slice_bigger_than_input()
    {
        var ex = Assert.Throws<ArgumentException>(() => new LargestSeriesProduct("123").GetSlices(4));
        Assert.That(ex.Message, Is.EqualTo("Slice size is too big"));
    }

    [TestCase("01234567890", 2, Result = 72)]
    [TestCase("1027839564", 3, Result = 270)]
    public int Gets_the_largest_product(string digits, int seriesLength)
    {
        return new LargestSeriesProduct(digits).GetLargestProduct(seriesLength);
    }

    [Test]
    public void Largest_product_works_for_small_numbers()
    {
        Assert.That(new LargestSeriesProduct("19").GetLargestProduct(2), Is.EqualTo(9));
    }

    [Test]
    public void Largest_product_works_for_large_numbers()
    {
        const string LARGE_NUMBER = "73167176531330624919225119674426574742355349194934";
        Assert.That(new LargestSeriesProduct(LARGE_NUMBER).GetLargestProduct(6), Is.EqualTo(23520));
    }

    [Test]
    public void Largest_product_for_empty_input_is_1()
    {
        Assert.That(new LargestSeriesProduct("").GetLargestProduct(0), Is.EqualTo(1));
    }
}
