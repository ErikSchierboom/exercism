using System.Collections.Generic;
using System.Linq;

public class GradeSchool
{
    private readonly SortedDictionary<int, SortedSet<string>> _roster = new();
    
    public bool Add(string student, int grade)
    {
        if (_roster.Values.Any(students => students.Contains(student)))
            return false;

        if (!_roster.TryAdd(grade, [student]))
            _roster[grade].Add(student);

        return true;
    }

    public IEnumerable<string> Roster() => _roster.Values.SelectMany(student => student);
    public IEnumerable<string> Grade(int grade) => _roster.GetValueOrDefault(grade, []);
}