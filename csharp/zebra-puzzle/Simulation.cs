using System;

internal record struct House(Nationality Nationality, Color Color, Drink Drink, Smoke Smoke, Pet Pet);
internal record struct Individual(House[] Houses, double Fitness);
internal record struct Population(Individual[] Individuals, Individual MostFit);

internal static class Simulation
{
    private const int PopulationSize = 100_000;
    private const int MaxNumberOfGenerations = 1_000;
    
    public static Individual Run()
    {
        var population = Initialization.RandomPopulation(PopulationSize);

        for (var i = 0; i < MaxNumberOfGenerations; i++)
        {
            if (population.MostFit.Fitness >= 1.0)
                return population.MostFit;

            population = Reproduction.Evolve(population);
        }

        throw new InvalidOperationException("Could not find solution");
    }
}

