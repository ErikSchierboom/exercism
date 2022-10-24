using System;

public struct CurrencyAmount
{
    private decimal amount;
    private string currency;

    public CurrencyAmount(decimal amount, string currency) => (this.amount, this.currency) = (amount, currency);

    public static bool operator ==(CurrencyAmount x, CurrencyAmount y) =>
        x.currency == y.currency ? x.amount == y.amount : throw new ArgumentException("Mismatched currencies");

    public static bool operator !=(CurrencyAmount x, CurrencyAmount y) => !(x == y);

    public static bool operator <(CurrencyAmount x, CurrencyAmount y) =>
        x.currency == y.currency ? x.amount < y.amount : throw new ArgumentException("Mismatched currencies");

    public static bool operator >(CurrencyAmount x, CurrencyAmount y) =>
        x.currency == y.currency ? x.amount > y.amount : throw new ArgumentException("Mismatched currencies");

    public static CurrencyAmount operator +(CurrencyAmount x, CurrencyAmount y) =>
        x.currency == y.currency ? new(x.amount + y.amount, x.currency) : throw new ArgumentException("Mismatched currencies");
    
    public static CurrencyAmount operator -(CurrencyAmount x, CurrencyAmount y) =>
        x.currency == y.currency ? new(x.amount - y.amount, x.currency) : throw new ArgumentException("Mismatched currencies");

    public static CurrencyAmount operator *(CurrencyAmount x, decimal operand) =>
        new(x.amount * operand, x.currency);

    public static CurrencyAmount operator /(CurrencyAmount x, decimal operand) =>
        new(x.amount / operand, x.currency);

    public static explicit operator double(CurrencyAmount x) => (double)x.amount;

    public static implicit operator decimal(CurrencyAmount x) => x.amount;
}
