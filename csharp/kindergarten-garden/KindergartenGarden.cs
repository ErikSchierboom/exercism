using System;
using System.Collections.Generic;
using System.Linq;

public enum Plant
{
    Violets,
    Radishes,
    Clover,
    Grass
}

public class KindergartenGarden
{
    private static readonly string[] DefaultChildren =
    {
        "Alice", "Bob", "Charlie", "David",
        "Eve", "Fred", "Ginny", "Harriet",
        "Ileana", "Joseph", "Kincaid", "Larry"
    };

    private readonly IReadOnlyDictionary<string, Plant[]> _plantsPerChild;

    public KindergartenGarden(string diagram) : this(diagram, DefaultChildren)
    {
    }

    public KindergartenGarden(string diagram, IEnumerable<string> students)
        => _plantsPerChild = GetPlantsPerChild(diagram, students);

    public IEnumerable<Plant> Plants(string student) => _plantsPerChild[student];

    private static IReadOnlyDictionary<string, Plant[]> GetPlantsPerChild(string diagram, IEnumerable<string> students)
    {
        return students
            .Select((student, index) => (student: student, plants: Plants(index)))
            .ToDictionary(x => x.student, x => x.plants);

        Plant[] Plants(int index)
        {
            var rows = diagram.Split('\n');
            var plantsOnRowOne = PlantsOnRow(0);
            var plantsOnRowTwo = PlantsOnRow(1);
            return plantsOnRowOne.Concat(plantsOnRowTwo).ToArray();

            IEnumerable<Plant> PlantsOnRow(int row) => rows[row].Skip(index * 2).Take(2).Select(ParsePlant);
        }
    }

    private static Plant ParsePlant(char encodedPlant)
    {
        switch (encodedPlant)
        {
            case 'V': return Plant.Violets;
            case 'R': return Plant.Radishes;
            case 'C': return Plant.Clover;
            case 'G': return Plant.Grass;
            default: throw new ArgumentOutOfRangeException();
        }
    }
}