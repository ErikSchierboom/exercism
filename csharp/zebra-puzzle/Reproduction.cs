using System;
using System.Linq;

internal static class Reproduction
{
    private const int MutationRate = 19;
    private static readonly int[] HouseIndices = [0, 1, 2, 3, 4];
    
    public static Population Evolve(Population population)
    {
        var newIndividuals = Enumerable.Range(0, population.Individuals.Length)
            .Select(_ => Reproduce(Selection.Tournament(population), Selection.Tournament(population)))
            .ToArray();
        return new(newIndividuals, Selection.MostFit(newIndividuals));
    }

    private static Individual Reproduce(Individual parent1, Individual parent2)
    {
        var child = Crossover(parent1, parent2);

        if (ShouldMutate())
            Mutate(child);

        return child;
    }

    private static Individual Crossover(Individual parent1, Individual parent2)
    {
        var parentHouses = Enumerable.Range(0, 5)
            .Select(_ => Random.Shared.Next(2) == 0 ? parent1.Houses : parent2.Houses)
            .ToArray();

        var childHouses = Enumerable.Range(0, 5)
            .Select(i => new House(
                parentHouses[0][i].Nationality, 
                parentHouses[1][i].Color, 
                parentHouses[2][i].Drink, 
                parentHouses[3][i].Smoke, 
                parentHouses[4][i].Pet
            ))
            .ToArray();

        return new Individual(childHouses, Selection.Fitness(childHouses));
    }
    
    private static bool ShouldMutate() => Random.Shared.Next(0, 100) <= MutationRate;

    private static void Mutate(Individual individual)
    {
        Random.Shared.Shuffle(HouseIndices);

        var house1 = individual.Houses[HouseIndices[0]];
        var house2 = individual.Houses[HouseIndices[1]];

        var actions = new Action[]
        {
            () => (house1.Nationality, house2.Nationality) = (house2.Nationality, house1.Nationality),
            () => (house1.Color, house2.Color) = (house2.Color, house1.Color),
            () => (house1.Drink, house2.Drink) = (house2.Drink, house1.Drink),
            () => (house1.Smoke, house2.Smoke) = (house2.Smoke, house1.Smoke),
            () => (house1.Pet, house2.Pet) = (house2.Pet, house1.Pet)
        };

        actions[Random.Shared.Next(0, actions.Length)]();
    }
}
