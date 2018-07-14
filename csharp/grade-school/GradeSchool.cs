using System;
using System.Collections.Generic;
using System.Linq;

public class School
{
    private readonly SortedList<string, int> _students = new SortedList<string, int>();

    public void Add(string student, int grade) => _students.Add(student, grade);

    public IEnumerable<string> Roster()
        => _students
            .OrderBy(student => student.Value)
            .Select(student => student.Key)
            .ToArray();

    public IEnumerable<string> Grade(int grade)
        => _students
            .Where(student => student.Value == grade)
            .Select(student => student.Key)
            .ToArray();
}