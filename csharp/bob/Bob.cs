namespace bob
{
    using System.Linq;

    public class Bob
    {
        public string Hey(string message)
        {
            if (string.IsNullOrWhiteSpace(message))
            {
                return "Fine. Be that way!";
            }

            if (message.Any(char.IsLetter) && message.ToUpperInvariant() == message)
            {
                return "Whoa, chill out!";
            }

            if (message.EndsWith("?"))
            {
                return "Sure.";
            }

            return "Whatever.";
        }
    }
}