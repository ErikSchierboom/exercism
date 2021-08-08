using System;
using System.Numerics;

public static class DiffieHellman
{
    private static readonly Random Random = new();

    public static BigInteger PrivateKey(BigInteger p) => new(Random.Next(1, (int) p - 1));

    public static BigInteger PublicKey(BigInteger p, BigInteger g, BigInteger privateKey) =>
        BigInteger.ModPow(g, privateKey, p);

    public static BigInteger Secret(BigInteger p, BigInteger publicKey, BigInteger privateKey) =>
        BigInteger.ModPow(publicKey, privateKey, p);
}