using System.Linq;

public static class Proverb
{
    public static string Line(string[] subjects, int line)
    {
        if (line == 7)
        { 
            return "And all for the want of a horseshoe nail.";
        }

        return $"For want of a {subjects[line - 1]} the {subjects[line]} was lost.";
    }

    public static string[] Recite(string[] subjects) => Enumerable.Range(1, 7).Select(i => Line(subjects, i)).ToArray();
}