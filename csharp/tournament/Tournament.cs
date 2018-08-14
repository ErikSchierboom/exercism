using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;

public static class Tournament
{
    private const string LineFormat = "{0, -31}|{1,3} |{2,3} |{3,3} |{4,3} |{5,3}{6}";

    public static void Tally(MemoryStream inStream, MemoryStream outStream)
    {
        var teams = TournamentParser.ParseTeams(inStream);
        
        using (var streamWriter = new StreamWriter(outStream))
        {
            WriteHeader(streamWriter, teams);
            WriteTeams(streamWriter, teams);
        }
    }

    private static void WriteHeader(StreamWriter streamWriter, Team[] teams)
    {
        var lineEnding = teams.Length == 0 ? "" : "\n";
        streamWriter.Write(LineFormat, "Team", " MP", "  W", "  D", "  L", "  P", lineEnding);
    }

    private static void WriteTeams(StreamWriter streamWriter, Team[] teams)
    {
        for (var index = 0; index < teams.Length; index++)
        {
            var team = teams[index];
            var lineEnding = index < teams.Length - 1 ? "\n" : "";
            streamWriter.Write(LineFormat, team.Name, team.Played, team.Won, team.Drawn, team.Lost, team.Points, lineEnding);
        }
    }
}

public class TournamentParser
{
    private static readonly UTF8Encoding Encoding = new UTF8Encoding();
    private static readonly Regex GameRegex = new Regex(@"^(?<team1>.+);(?<team2>.+);(?<outcome>win|draw|loss)\s*$", RegexOptions.Compiled | RegexOptions.Multiline);

    public static Team[] ParseTeams(MemoryStream inStream)
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

        return teams.Values.OrderByDescending(t => t.Points).ThenBy(t => t.Name).ToArray();
    }

    private static IEnumerable<Game> ParseGames(MemoryStream inStream)
    {
        return GameRegex.Matches(StreamToString(inStream)).Cast<Match>().Select(ParseGame);
    }

    private static Game ParseGame(Match match)
    {
        return new Game(match.Groups["team1"].Value, match.Groups["team2"].Value, (Outcome)Enum.Parse(typeof(Outcome), match.Groups["outcome"].Value, true));
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
        Team1 = team1;
        Team2 = team2;
        Team1Outcome = outcome;
        Team2Outcome = OpponentOutcome(outcome);
    }

    public string Team1 { get; }
    public string Team2 { get; }
    public Outcome Team1Outcome { get; }
    public Outcome Team2Outcome { get; }

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
        Name = name;
    }

    public string Name { get; }
    public int Played { get; private set; }
    public int Won { get; private set; }
    public int Drawn { get; private set; }
    public int Lost { get; private set; }
    public int Points { get; private set; }

    public void Add(Outcome outcome)
    {
        Played++;

        switch (outcome)
        {
            case Outcome.Win:
                Won++;
                Points += 3;
                break;
            case Outcome.Draw:
                Drawn++;
                Points += 1;
                break;
            case Outcome.Loss:
                Lost++;
                break;
            default:
                throw new ArgumentOutOfRangeException("outcome");
        }
    }
}