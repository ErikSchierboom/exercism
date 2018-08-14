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
        => new ComplexNumber(_real * other._real - _imaginary * other._imaginary, _imaginary * other._real + _real * other._imaginary);

    public ComplexNumber Add(ComplexNumber other)
        => new ComplexNumber(_real + other._real, _imaginary + other._imaginary);

    public ComplexNumber Sub(ComplexNumber other)
        => new ComplexNumber(_real - other._real, _imaginary - other._imaginary);

    public ComplexNumber Div(ComplexNumber other)
    {
        var real = (_real * other._real + _imaginary * other._imaginary) / (Math.Pow(other._real, 2) + Math.Pow(other._imaginary, 2));
        var imaginary = (_imaginary * other._real - _real * other._imaginary) / (Math.Pow(other._real, 2) + Math.Pow(other._imaginary, 2));
        
        return new ComplexNumber(real, imaginary);
    }

    public double Abs()
        => Math.Sqrt(Math.Pow(_real, 2) + Math.Pow(_imaginary, 2));

    public ComplexNumber Conjugate()
        => new ComplexNumber(_real, -_imaginary);

    public ComplexNumber Exp() 
        => new ComplexNumber(Math.Exp(_real) * Math.Cos(_imaginary), Math.Exp(_real) * Math.Sin(_imaginary));
}