using System.Collections.Generic;
using System.Linq;

public static class SecretHandshake
{
    private const int ReverseCommand = 1 << 4;

    private static readonly Dictionary<int, string> CommandsMapping = new Dictionary<int, string>
                                                                          {
                                                                              { 1 << 0, "wink" },
                                                                              { 1 << 1, "double blink" },
                                                                              { 1 << 2, "close your eyes" },
                                                                              { 1 << 3, "jump" },
                                                                          };

    public static IEnumerable<string> Commands(int number)
    {
        var commands = CommandsMapping.Where(commandMapping => ContainsCommand(number, commandMapping.Key))
            .Select(commandMapping => commandMapping.Value);

        return ContainsCommand(number, ReverseCommand) ? commands.Reverse() : commands;
    }

    private static bool ContainsCommand(int number, int mask)
    {
        return (number & mask) != 0;
    }
}