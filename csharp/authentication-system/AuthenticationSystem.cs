using System.Collections.Generic;
using System.Collections.ObjectModel;

public class Authenticator
{
    private class EyeColor
    {
        public const string Blue = "blue";
        public const string Green = "green";
        public const string Brown = "brown";
        public const string Hazel = "hazel";
        public const string Brey = "grey";
    }

    public Authenticator(Identity admin) => Admin = admin;

    private IDictionary<string, Identity> developers
        = new Dictionary<string, Identity>
        {
            ["Bertrand"] = new()
            {
                Email = "bert@ex.ism",
                EyeColor = "blue"
            },

            ["Anders"] = new()
            {
                Email = "anders@ex.ism",
                EyeColor = "brown"
            }
        };

    public Identity Admin { get; }

    public IDictionary<string, Identity> GetDevelopers() => new ReadOnlyDictionary<string, Identity>(developers);
}

public struct Identity
{
    public readonly string Email { get; init; }

    public readonly string EyeColor { get; init; }
}
