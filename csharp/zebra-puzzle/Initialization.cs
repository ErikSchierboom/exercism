using System;
using System.Linq;

internal static class Initialization
{
    private static readonly Nationality[] Nations = Enum.GetValues<Nationality>();
    private static readonly Color[] Colors = Enum.GetValues<Color>();
    private static readonly Drink[] Drinks = Enum.GetValues<Drink>();
    private static readonly Smoke[] Smokes = Enum.GetValues<Smoke>();
    private static readonly Pet[] Pets = Enum.GetValues<Pet>();
    
    public static Population RandomPopulation(int size)
    {
        var individuals = Enumerable.Range(0, size).Select(_ => RandomIndividual()).ToArray();
        return new(individuals, Selection.MostFit(individuals));
    }

    private static Individual RandomIndividual()
    {
        Random.Shared.Shuffle(Nations);
        Random.Shared.Shuffle(Colors);
        Random.Shared.Shuffle(Drinks);
        Random.Shared.Shuffle(Smokes);
        Random.Shared.Shuffle(Pets);
      
        var houses = Enumerable.Range(0, 5).Select(RandomHouse).ToArray();
        return new Individual(houses, Selection.Fitness(houses));
    }

    private static House RandomHouse(int i) => new(Nations[i], Colors[i], Drinks[i], Smokes[i], Pets[i]);
}
