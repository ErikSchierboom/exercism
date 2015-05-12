namespace Exercism
{
    using NUnit.Framework;

    [TestFixture]
    public class AcronymTest
    {
        [Test]
        public void Empty_string_abbreviated_to_empty_string()
        {
            Assert.That(Acronym.Abbreviate(string.Empty), Is.EqualTo(string.Empty));
        }

        [TestCase("Portable Network Graphics", Result = "PNG")]
        [TestCase("Ruby on Rails", Result = "ROR")]
        [TestCase("HyperText Markup Language", Result = "HTML")]
        [TestCase("First In, First Out", Result = "FIFO")]
        [TestCase("PHP: Hypertext Preprocessor", Result = "PHP")]
        [TestCase("Complementary metal-oxide semiconductor", Result = "CMOS")]
        public string Phrase_abbreviated_to_acronym(string phrase)
        {
            return Acronym.Abbreviate(phrase);
        }
    }
}