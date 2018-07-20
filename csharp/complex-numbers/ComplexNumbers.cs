using System;

public struct ComplexNumber
{
    private readonly double _real;
    private readonly double _imaginary;

    public ComplexNumber(double real, double imaginary)
        => (_real, _imaginary) = (real, imaginary);

    public double Real() => _real;

    public double Imaginary() => _imaginary;

    public ComplexNumber Mul(ComplexNumber other) 
        => new ComplexNumber(Real() * other.Real() - Imaginary() * other.Imaginary(), Imaginary() * other.Real() + Real() * other.Imaginary());

    public ComplexNumber Add(ComplexNumber other)
        => new ComplexNumber(Real() + other.Real(), Imaginary() + other.Imaginary());

    public ComplexNumber Sub(ComplexNumber other)
        => new ComplexNumber(Real() - other.Real(), Imaginary() - other.Imaginary());

    public ComplexNumber Div(ComplexNumber other)
    {
        var real = (Real() * other.Real() + Imaginary() * other.Imaginary()) / (Math.Pow(other.Real(), 2) + Math.Pow(other.Imaginary(), 2));
        var imaginary = (Imaginary() * other.Real() - Real() * other.Imaginary()) / (Math.Pow(other.Real(), 2) + Math.Pow(other.Imaginary(), 2));
        
        return new ComplexNumber(real, imaginary);
    }

    public double Abs()
        => Math.Sqrt(Math.Pow(Real(), 2) + Math.Pow(Imaginary(), 2));

    public ComplexNumber Conjugate()
        => new ComplexNumber(Real(), -Imaginary());

    public ComplexNumber Exp() 
        => new ComplexNumber(Math.Exp(Real()) * Math.Cos(Imaginary()), Math.Exp(Real()) * Math.Sin(Imaginary()));
}