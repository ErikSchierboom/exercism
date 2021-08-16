using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text.RegularExpressions;

public static class Grep
{
    private record Line(int Number, string Text, string File);

    [Flags]
    private enum Flags
    {
        None = 0,
        PrintLineNumbers = 1,
        PrintFileNames = 2,
        CaseInsensitive = 4,
        Invert = 8,
        MatchEntireLines = 16
    }

    public static string Match(string pattern, string flags, string[] files)
    {
        var parsedFlags = ParseFlags(flags);

        return parsedFlags.HasFlag(Flags.PrintFileNames)
            ? FormatMatchingFiles(pattern, parsedFlags, files)
            : FormatMatchingLines(pattern, parsedFlags, files);
    }

    private static Flags ParseFlags(string flags) => flags.Split(' ').Aggregate(Flags.None, (acc, flag) => acc | ParseFlag(flag));

    private static Flags ParseFlag(string flag) =>
        flag switch
        {
            "-n" => Flags.PrintLineNumbers,
            "-l" => Flags.PrintFileNames,
            "-i" => Flags.CaseInsensitive,
            "-v" => Flags.Invert,
            "-x" => Flags.MatchEntireLines,
            _ => Flags.None
        };

    private static Func<Line, bool> IsMatch(string pattern, Flags flags)
    {
        var matchPattern = flags.HasFlag(Flags.MatchEntireLines) ? $"^{pattern}$" : pattern;
        var options = flags.HasFlag(Flags.CaseInsensitive) ? RegexOptions.IgnoreCase : RegexOptions.None;
        var regex = new Regex(matchPattern, options);

        return line => regex.IsMatch(line.Text) != flags.HasFlag(Flags.Invert);
    }

    private static IEnumerable<Line> FindMatchingLines(string pattern, Flags flags, string file)
    {
        var isMatch = IsMatch(pattern, flags);

        return File.ReadAllLines(file)
            .Select((line, index) => new Line(index + 1, line, file))
            .Where(isMatch);
    }

    private static string FormatMatchingFile(string file) => $"{file}";

    private static string FormatMatchingFiles(string pattern, Flags flags, string[] files) =>
        files
            .Where(file => FindMatchingLines(pattern, flags, file).Any())
            .Select(FormatMatchingFile)
            .JoinToString();

    private static string FormatMatchingLine(Flags flags, string[] files, Line line)
    {
        var printLineNumbers = flags.HasFlag(Flags.PrintLineNumbers);
        var printFileName = files.Length > 1;

        return (printLineNumbers, printFileName) switch
        {
            (true, true) => $"{line.File}:{line.Number}:{line.Text}",
            (true, false) => $"{line.Number}:{line.Text}",
            (false, true) => $"{line.File}:{line.Text}",
            (false, false) => $"{line.Text}"
        };
    }

    private static string FormatMatchingLines(string pattern, Flags flags, string[] files) =>
        files
            .SelectMany(file => FindMatchingLines(pattern, flags, file))
            .Select(line => FormatMatchingLine(flags, files, line))
            .JoinToString();

    private static string JoinToString(this IEnumerable<string> strings) => string.Join("\n", strings);
}