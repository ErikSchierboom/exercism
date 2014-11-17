using System.Collections.Generic;
using System.Linq;

namespace Exercism
{
    public class SecretHandshake
    {
        private const int ReverseCommand = 1 << 4;

        private static readonly Dictionary<int, string> CommandsMapping = new Dictionary<int, string>
                                                                          {
                                                                              { 1 << 0, "wink" },
                                                                              { 1 << 1, "double blink" },
                                                                              { 1 << 2, "close your eyes" },
                                                                              { 1 << 3, "jump" },
                                                                          };

        private readonly int number;

        public SecretHandshake(int number)
        {
            this.number = number;
        }

        public IEnumerable<string> Commands()
        {
            var commands = CommandsMapping.Where(commandMapping => this.ContainsCommand(commandMapping.Key))
                .Select(commandMapping => commandMapping.Value);

            return this.ContainsCommand(ReverseCommand) ? commands.Reverse() : commands;
        }

        private bool ContainsCommand(int mask)
        {
            return (this.number & mask) != 0;
        }
    }
}