namespace Exercism
{
    using System;
    using System.Collections.Generic;
    using System.IO;
    using System.Linq;
    using System.Text;
    using System.Text.RegularExpressions;

    public class Tournament
    {
        private const string LineFormat = "{0, -31}|{1,3} |{2,3} |{3,3} |{4,3} |{5,3}{6}";

        public static void Tally(MemoryStream inStream, MemoryStream outStream)
        {
            using (var streamWriter = new StreamWriter(outStream))
            {
                WriteHeader(streamWriter);
                WriteTeams(inStream, streamWriter);
            }
        }

        private static void WriteHeader(StreamWriter streamWriter)
        {
            streamWriter.Write(LineFormat, "Team", " MP", "  W", "  D", "  L", "  P", Environment.NewLine);
        }

        private static void WriteTeams(MemoryStream inStream, StreamWriter streamWriter)
        {
            var teams = TournamentParser.ParseTeams(inStream);

            foreach (var team in teams.OrderByDescending(t => t.Points))
            {
                streamWriter.Write(LineFormat, team.Name, team.Played, team.Won, team.Drawn, team.Lost, team.Points, Environment.NewLine);
            }
        }
    }

    public class TournamentParser
    {
        private static readonly UTF8Encoding Encoding = new UTF8Encoding();
        private static readonly Regex GameRegex = new Regex(@"^(?<team1>.+);(?<team2>.+);(?<outcome>win|draw|loss)\s*$", RegexOptions.Compiled | RegexOptions.Multiline);

        public static IEnumerable<Team> ParseTeams(MemoryStream inStream)
        {
            var games = ParseGames(inStream);

            var teams = new Dictionary<string, Team>();

            foreach (var game in games)
            {
                if (!teams.ContainsKey(game.Team1))
                {
                    teams[game.Team1] = new Team(game.Team1);
                }

                if (!teams.ContainsKey(game.Team2))
                {
                    teams[game.Team2] = new Team(game.Team2);
                }

                teams[game.Team1].Add(game.Team1Outcome);
                teams[game.Team2].Add(game.Team2Outcome);
            }

            return teams.Values;
        }

        private static IEnumerable<Game> ParseGames(MemoryStream inStream)
        {
            return GameRegex.Matches(StreamToString(inStream)).Cast<Match>().Select(ParseGame);
        }

        private static Game ParseGame(Match match)
        {
            return new Game(match.Groups["team1"].Value, match.Groups["team2"].Value, (Outcome) Enum.Parse(typeof (Outcome), match.Groups["outcome"].Value, true));
        }

        private static string StreamToString(Stream inStream)
        {
            using (var streamReader = new StreamReader(inStream, Encoding))
            {
                return streamReader.ReadToEnd();
            }
        }
    }

    public enum Outcome
    {
        Win,
        Draw,
        Loss
    }

    public class Game
    {
        public Game(string team1, string team2, Outcome outcome)
        {
            this.Team1 = team1;
            this.Team2 = team2;
            this.Team1Outcome = outcome;
            this.Team2Outcome = OpponentOutcome(outcome);
        }

        public string Team1 { get; private set; }
        public string Team2 { get; private set; }
        public Outcome Team1Outcome { get; private set; }
        public Outcome Team2Outcome { get; private set; }

        private static Outcome OpponentOutcome(Outcome outcome)
        {
            switch (outcome)
            {
                case Outcome.Win:
                    return Outcome.Loss;
                case Outcome.Draw:
                    return Outcome.Draw;
                case Outcome.Loss:
                    return Outcome.Win;
                default:
                    throw new ArgumentOutOfRangeException();
            }
        }
    }

    public class Team
    {
        public Team(string name)
        {
            this.Name = name;
        }

        public string Name { get; private set; }
        public int Played { get; private set; }
        public int Won { get; private set; }
        public int Drawn { get; private set; }
        public int Lost { get; private set; }
        public int Points { get; private set; }

        public void Add(Outcome outcome)
        {
            this.Played++;

            switch (outcome)
            {
                case Outcome.Win:
                    this.Won++;
                    this.Points += 3;
                    break;
                case Outcome.Draw:
                    this.Drawn++;
                    this.Points += 1;
                    break;
                case Outcome.Loss:
                    this.Lost++;
                    break;
                default:
                    throw new ArgumentOutOfRangeException("outcome");
            }
        }
    }
}