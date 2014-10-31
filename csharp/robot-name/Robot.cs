namespace robot_name
{
    using System;
    using System.Collections.Generic;
    using System.Linq;

    public class Robot
    {
        private const string Letters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
        private const string Numbers = "0123456789";

        private static readonly Random Random = new Random();

        public Robot()
        {
            this.Name = GenerateName();
        }

        public string Name { get; private set; }

        public void Reset()
        {
            this.Name = GenerateName();
        }

        private static string GenerateName()
        {
            return new string(RandomLetters().Take(2).Concat(RandomNumbers().Take(3)).ToArray());
        }

        private static IEnumerable<char> RandomLetters()
        {
            return RandomCharsFromString(Letters);
        }

        private static IEnumerable<char> RandomNumbers()
        {
            return RandomCharsFromString(Numbers);
        }

        private static IEnumerable<char> RandomCharsFromString(string str)
        {
            while (true)
            {
                yield return str[Random.Next(str.Length)];
            }
        }
    }
}