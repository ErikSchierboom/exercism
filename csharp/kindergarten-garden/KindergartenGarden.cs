using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;

public enum Plant { Violets, Radishes, Clover, Grass }

public class KindergartenGarden
{
    private static readonly string[] Students =
    {
        "Alice", "Bob", "Charlie", "David", "Eve", "Fred", "Ginny", "Harriet", "Ileana", "Joseph", "Kincaid", "Larry"
    };

    private readonly IDictionary<string, IEnumerable<Plant>> _studentPlants;

    public KindergartenGarden(string diagram) => _studentPlants = StudentPlants(diagram);

    public IEnumerable<Plant> Plants(string student) => _studentPlants[student];

    private static IDictionary<string, IEnumerable<Plant>> StudentPlants(string diagram)
    {
        var rows = diagram.Split('\n');

        return rows[0].Chunk(2)
            .Zip(rows[1].Chunk(2), (left, right) => left.Concat(right).Select(ToPlant))
            .Zip(Students)
            .ToDictionary(pair => pair.Second, pair => pair.First);
    }

    private static Plant ToPlant(char encodedPlant) =>
        Enum.GetValues<Plant>().First(plant => plant.ToString().StartsWith(encodedPlant));
}
