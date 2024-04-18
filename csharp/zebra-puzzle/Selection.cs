using System;
using System.Linq;

internal static class Selection
{
    private const int MaxScore = 14;
    private const int TournamentSize = 5;
    
    public static Individual MostFit(Individual[] individuals) =>
        individuals.MaxBy(candidate => candidate.Fitness);

    public static Individual Tournament(Population population) =>
        Random.Shared.GetItems(population.Individuals, TournamentSize)
            .MaxBy(candidate => candidate.Fitness);

    public static double Fitness(House[] houses)
    {
        bool Adjacent(Predicate<House> first, Predicate<House> second) =>
            Math.Abs(Array.FindIndex(houses, first) - Array.FindIndex(houses, second)) == 1;
      
        var score = 0;
        if (houses.Any(house => house is { Nationality: Nationality.Englishman, Color: Color.Red })) score++;
        if (houses.Any(house => house is { Nationality: Nationality.Spaniard, Pet: Pet.Dog})) score++;
        if (houses.Any(house => house is { Drink: Drink.Coffee, Color: Color.Green })) score++;
        if (houses.Any(house => house is { Nationality: Nationality.Ukrainian, Drink: Drink.Tea })) score++;
        if (Adjacent(first => first is { Color: Color.Ivory }, second => second is { Color: Color.Green })) score++;
        if (houses.Any(house => house is { Smoke: Smoke.OldGold, Pet: Pet.Snails })) score++;
        if (houses.Any(house => house is { Smoke: Smoke.Kools, Color: Color.Yellow })) score++;
        if (houses[2] is { Drink: Drink.Milk }) score++;
        if (houses[0] is { Nationality: Nationality.Norwegian }) score++;
        if (Adjacent(first => first is { Pet: Pet.Fox }, second => second is { Smoke: Smoke.Chesterfield })) score++;
        if (Adjacent(first => first is { Smoke: Smoke.Kools }, second => second is { Pet: Pet.Horse })) score++;
        if (houses.Any(house => house is { Smoke: Smoke.LuckyStrike, Drink: Drink.OrangeJuice })) score++;
        if (houses.Any(house => house is { Nationality: Nationality.Japanese, Smoke: Smoke.Parliaments })) score++;
        if (Adjacent(first => first is { Nationality: Nationality.Norwegian }, second => second is { Color: Color.Blue })) score++;

        return (double)score / MaxScore;
    }
}
