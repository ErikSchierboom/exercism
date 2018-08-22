using System;

public static class RealNumberExtension
{
    public static double Expreal(this int realNumber, RationalNumber r) => r.Expreal(realNumber);
}

public struct RationalNumber
{
    public RationalNumber(int numerator, int denominator)
        => (Numerator, Denominator) = (numerator, denominator);

    public int Numerator { get; }

    public int Denominator { get; }

    public RationalNumber Add(RationalNumber r)
        => new RationalNumber(Numerator * r.Denominator + r.Numerator * Denominator, Denominator * r.Denominator).Reduce();

    public static RationalNumber operator +(RationalNumber r1, RationalNumber r2) => r1.Add(r2);

    public RationalNumber Sub(RationalNumber r)
        => new RationalNumber(Numerator * r.Denominator - r.Numerator * Denominator, Denominator * r.Denominator).Reduce();

    public static RationalNumber operator -(RationalNumber r1, RationalNumber r2) => r1.Sub(r2);

    public RationalNumber Mul(RationalNumber r)
        => new RationalNumber(Numerator * r.Numerator, Denominator * r.Denominator).Reduce();

    public static RationalNumber operator *(RationalNumber r1, RationalNumber r2) => r1.Mul(r2);

    public RationalNumber Div(RationalNumber r)
        => new RationalNumber(Numerator * r.Denominator, r.Numerator * Denominator).Reduce();

    public static RationalNumber operator /(RationalNumber r1, RationalNumber r2) => r1.Div(r2);

    public RationalNumber Abs() => new RationalNumber(Math.Abs(Numerator), Math.Abs(Denominator));

    public RationalNumber Reduce()
    {
        var divisor = Gcd(Math.Abs(Numerator), Math.Abs(Denominator));

        if (Denominator >= 0)
        {
            return new RationalNumber(Numerator / divisor, Denominator / divisor);
        }

        return new RationalNumber(Numerator * -1 / divisor, Denominator * -1 / divisor);
    }

    public RationalNumber Exprational(int power)
        => power >= 0
            ? new RationalNumber((int)Math.Pow(Numerator, power), (int)Math.Pow(Denominator, power)).Reduce()
            : new RationalNumber((int)Math.Pow(Denominator, Math.Abs(power)), (int)Math.Pow(Numerator, Math.Abs(power))).Reduce();

    public double Expreal(int baseNumber) => NthRoot(Math.Pow(baseNumber, Numerator), Denominator, 1e-9);

    private static int Gcd(int x, int y) => y == 0 ? x : Gcd(y, x % y);

    public static double NthRoot(double A, double n, double p)
    {
        var x = new double[2];
        x[0] = A;
        x[1] = A / n;
        while (Math.Abs(x[0] - x[1]) > p)
        {
            x[1] = x[0];
            x[0] = (1 / n) * (((n - 1) * x[1]) + (A / Math.Pow(x[1], n - 1)));
        }

        return x[0];
    }
}