using System;

enum Units
{
    Pounds,
    Kilograms
}

class WeighingMachine
{
    private decimal _inputWeight;
    public USWeight USDisplayWeight => new(Units == Units.Kilograms ? InputWeight * 2.20462m : InputWeight);

    public decimal InputWeight
    {
        get => _inputWeight;
        set => _inputWeight = value >= 0 ? value : throw new ArgumentOutOfRangeException();
    }

    public Units Units { get; set; } = Units.Kilograms;
    public int TareAdjustment { get; set; }
    public int DisplayWeight => (int)InputWeight - TareAdjustment;
}

struct USWeight
{
    public USWeight(decimal weightInPounds)
    {
        Pounds = (int) Math.Floor(weightInPounds);
        Ounces = (int) ((weightInPounds - Pounds) * 16.0m);
    }

    public int Pounds { get; }
    public int Ounces { get; }
}
