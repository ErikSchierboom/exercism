using Xunit;

public class AtbashCipherTest
{
    [Fact]
    public void Encode_yes()
    {
        Assert.Equal("bvh", AtbashCipher.Encode("yes"));
    }

    [Fact]
    public void Encode_no()
    {
        Assert.Equal("ml", AtbashCipher.Encode("no"));
    }

    [Fact]
    public void Encode_omg()
    {
        Assert.Equal("lnt", AtbashCipher.Encode("OMG"));
    }

    [Fact]
    public void Encode_spaces()
    {
        Assert.Equal("lnt", AtbashCipher.Encode("O M G"));
    }

    [Fact]
    public void Encode_mindblowingly()
    {
        Assert.Equal("nrmwy oldrm tob", AtbashCipher.Encode("mindblowingly"));
    }

    [Fact]
    public void Encode_numbers()
    {
        Assert.Equal("gvhgr mt123 gvhgr mt", AtbashCipher.Encode("Testing,1 2 3, testing."));
    }

    [Fact]
    public void Encode_deep_thought()
    {
        Assert.Equal("gifgs rhurx grlm", AtbashCipher.Encode("Truth is fiction."));
    }

    [Fact]
    public void Encode_all_the_letters()
    {
        Assert.Equal("gsvjf rxpyi ldmul cqfnk hlevi gsvoz abwlt", AtbashCipher.Encode("The quick brown fox jumps over the lazy dog."));
    }

    [Fact]
    public void Decode_exercism()
    {
        Assert.Equal("exercism", AtbashCipher.Decode("vcvix rhn"));
    }

    [Fact]
    public void Decode_a_sentence()
    {
        Assert.Equal("anobstacleisoftenasteppingstone", AtbashCipher.Decode("zmlyh gzxov rhlug vmzhg vkkrm thglm v"));
    }

    [Fact]
    public void Decode_numbers()
    {
        Assert.Equal("testing123testing", AtbashCipher.Decode("gvhgr mt123 gvhgr mt"));
    }

    [Fact]
    public void Decode_all_the_letters()
    {
        Assert.Equal("thequickbrownfoxjumpsoverthelazydog", AtbashCipher.Decode("gsvjf rxpyi ldmul cqfnk hlevi gsvoz abwlt"));
    }
}