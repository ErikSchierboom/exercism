using System;
using System.Collections.Generic;
using System.Linq;

public class Robot
{
    public Robot() => Name = RobotName.Generate();

    public string Name { get; private set; }

    public void Reset() => Name = RobotName.Generate();
}

public static class RobotName
{
    private const string Letters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    private const string Numbers = "0123456789";

    private static readonly Random Random = new();
    private static readonly Stack<string> RandomNames = Names().Shuffle().ToStack();

    public static string Generate() => RandomNames.Pop();
    
    private static IEnumerable<string> Names() =>
        from letter1 in Letters
        from letter2 in Letters
        from number1 in Numbers
        from number2 in Numbers
        from number3 in Numbers
        select $"{letter1}{letter2}{number1}{number2}{number3}";

    private static T[] Shuffle<T>(this IEnumerable<T> enumerable)
    {
        var arr = enumerable.ToArray();
        
        var n = arr.Length;  
        while (n > 1)
        {  
            n--;  
            var k = Random.Next(n + 1);  
            var value = arr[k];  
            arr[k] = arr[n];  
            arr[n] = value;  
        }

        return arr;
    }

    private static Stack<T> ToStack<T>(this IEnumerable<T> enumerable) => new(enumerable);
}
