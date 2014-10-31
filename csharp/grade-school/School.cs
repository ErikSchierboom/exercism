namespace grade_school
{
    using System.Collections.Generic;

    public class School
    {
        public School()
        {
            this.Roster = new Dictionary<int, ISet<string>>();
        }

        public IDictionary<int, ISet<string>> Roster { get; private set; }

        public ISet<string> Grade(int grade)
        {
            return this.Roster.ContainsKey(grade) ? this.Roster[grade] : new HashSet<string>();
        }

        public void Add(string student, int grade)
        {
            if (!this.Roster.ContainsKey(grade))
            {
                this.Roster[grade] = new SortedSet<string>();
            }

            this.Roster[grade].Add(student);
        }
    }
}