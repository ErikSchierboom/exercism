using System.Linq;
using System.Numerics;
using Xunit;

public class DiffieHellmanTests
{
    [Fact]
    public void Private_key_is_greater_than_1_and_less_than_p()
    {
        var p = new BigInteger(7919);
        var privateKeys = Enumerable.Range(0, 10).Select(_ => DiffieHellman.PrivateKey(p)).ToArray();
        foreach (var privateKey in privateKeys)
        {
            Assert.InRange(privateKey, new BigInteger(1), p);
        }
    }

    [Fact]
    public void Private_key_is_random()
    {
        var p = new BigInteger(7919);
        var privateKeys = Enumerable.Range(0, 10).Select(_ => DiffieHellman.PrivateKey(p)).ToArray();
        Assert.Equal(privateKeys.Distinct().Count(), privateKeys.Length);
    }

    [Fact]
    public void Can_calculate_public_key_using_private_key()
    {
        var p = new BigInteger(23);
        var g = new BigInteger(5);
        var privateKey = new BigInteger(6);
        Assert.Equal(new BigInteger(8), DiffieHellman.PublicKey(p, g, privateKey));
    }

    [Fact]
    public void Can_calculate_secret_using_other_partys_public_key()
    {
        var p = new BigInteger(23);
        var theirPublicKey = new BigInteger(19);
        var myPrivateKey = new BigInteger(6);
        Assert.Equal(new BigInteger(2), DiffieHellman.Secret(p, theirPublicKey, myPrivateKey));
    }

    [Fact]
    public void Key_exchange()
    {
        var p = new BigInteger(23);
        var g = new BigInteger(5);
        var alicePrivateKey = DiffieHellman.PrivateKey(p);
        var bobPrivateKey = DiffieHellman.PrivateKey(p);
        var alicePublicKey = DiffieHellman.PublicKey(p, g, alicePrivateKey);
        var bobPublicKey = DiffieHellman.PublicKey(p, g, bobPrivateKey);
        var secretA = DiffieHellman.Secret(p, bobPublicKey, alicePrivateKey);
        var secretB = DiffieHellman.Secret(p, alicePublicKey, bobPrivateKey);
        Assert.Equal(secretA, secretB);
    }
}