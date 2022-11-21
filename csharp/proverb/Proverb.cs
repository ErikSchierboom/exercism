using System;
using System.Linq;

public static class Proverb
{
    public static string[] Recite(string[] subjects) =>
        subjects.Zip(subjects.Skip(1))
            .Select((subject => $"For want of a {subject.First} the {subject.Second} was lost."))
            .Concat(subjects.Any() ? new[] { $"And all for the want of a {subjects[0]}." } : Array.Empty<string>())
            .ToArray();
}