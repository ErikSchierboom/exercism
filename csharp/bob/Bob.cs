using System.Linq;

public static class Bob
{
    public static string Hey(string message)
    {
        if (string.IsNullOrWhiteSpace(message))
        {
            return "Fine. Be that way!";
        }

        if (message.Any(char.IsLetter) && message.ToUpperInvariant() == message)
        {
            return "Whoa, chill out!";
        }

        if (message.Trim().EndsWith("?"))
        {
            return "Sure.";
        }

        return "Whatever.";
    }
}