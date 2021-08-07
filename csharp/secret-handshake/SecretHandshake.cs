using System;
using System.Collections.Generic;

public static class SecretHandshake
{
    private static readonly List<Action<List<string>>> Operations = new()
    {
        commands => commands.Add("wink"),
        commands => commands.Add("double blink"),
        commands => commands.Add("close your eyes"),
        commands => commands.Add("jump"),
        commands => commands.Reverse()
    };

    public static IEnumerable<string> Commands(int code)
    {
        var commands = new List<string>();

        for (var i = 0; i < Operations.Count; i++)
            if ((code & 1 << i) != 0)
                Operations[i](commands);

        return commands;
    }
}