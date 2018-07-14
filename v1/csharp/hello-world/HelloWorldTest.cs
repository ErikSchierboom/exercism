using NUnit.Framework;

[TestFixture]
public class HelloWorldTest
{
    [Test]
    public void No_name()
    {
        Assert.That(HelloWorld.Hello(null), Is.EqualTo("Hello, World!"));
    }

    [Test]
    public void Sample_name()
    {
        Assert.That(HelloWorld.Hello("Alice"), Is.EqualTo("Hello, Alice!"));
    }

    [Test]
    public void Other_sample_name()
    {
        Assert.That(HelloWorld.Hello("Bob"), Is.EqualTo("Hello, Bob!"));
    }
}
