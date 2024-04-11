using System;
using System.Linq;

public enum Nationality { Norwegian, Ukrainian, Englishman, Spaniard, Japanese };
public enum Color { Red, Blue, Yellow, Ivory, Green };
public enum Drink { Tea, Milk, Coffee, OrangeJuice, Water };
public enum Smoke { LuckyStrike, OldGold, Kools, Chesterfield, Parliaments };
public enum Pet { Zebra, Fox, Horse, Snails, Dog };



public static class ZebraPuzzle
{
    public static Nationality DrinksWater() =>
        Solution.Value.Houses.First(house => house.Drink == Drink.Water).Nationality;

    public static Nationality OwnsZebra() =>
        Solution.Value.Houses.First(house => house.Pet == Pet.Zebra).Nationality;
    
    private static readonly Lazy<Individual> Solution = new(Simulation.Run);
}