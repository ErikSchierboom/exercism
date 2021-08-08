using System;

public struct ComplexNumber
{
    private readonly double _real;
    private readonly double _imaginary;

    public ComplexNumber(double real, double imaginary) => (_real, _imaginary) = (real, imaginary);

    public double Real() => _real;

    public double Imaginary() => _imaginary;

    public ComplexNumber Mul(ComplexNumber other) =>
        new(_real * other._real - _imaginary * other._imaginary, _imaginary * other._real + _real * other._imaginary);

    public ComplexNumber Add(ComplexNumber other) =>
        new(_real + other._real, _imaginary + other._imaginary);

    public ComplexNumber Sub(ComplexNumber other) =>
        new(_real - other._real, _imaginary - other._imaginary);

    public ComplexNumber Div(ComplexNumber other)
    {
        var numerator = Mul(other.Conjugate());
        var denominator = other.Mul(other.Conjugate());

        return new(numerator._real / denominator._real, numerator._imaginary / denominator._real);
    }

    public ComplexNumber Exp()  =>
        new(Math.Exp(_real) * Math.Cos(_imaginary), Math.Exp(_real) * Math.Sin(_imaginary));

    public ComplexNumber Conjugate() => new(_real, -_imaginary);

    public double Abs() => Math.Sqrt(Math.Pow(_real, 2) + Math.Pow(_imaginary, 2));
}