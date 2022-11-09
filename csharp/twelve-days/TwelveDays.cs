using System.Collections.Generic;
using System.Linq;

public static class TwelveDays
{
    public static string Recite(int startVerse, int endVerse) =>
        string.Join("\n", Enumerable.Range(startVerse, endVerse - startVerse + 1)
            .Select(verseNumber => Recite(verseNumber)));
    
    public static string Recite(int verseNumber) =>
        $"On the {Days[verseNumber]} day of Christmas my true love gave to me: {ToSentence(GiftsWithCount(verseNumber))}.";

    private static IEnumerable<string> GiftsWithCount(int verseNumber) =>
        Enumerable.Range(1, verseNumber)
            .Reverse()
            .Select(idx => $"{Counts[idx]} {Gifts[idx]}");

    private static string ToSentence(IEnumerable<string> gifts) => string.Join(", ", gifts).Replace(", a", ", and a");

    private static readonly string[] Days = { null, "first", "second", "third", "fourth", "fifth", "sixth", "seventh", "eighth", "ninth", "tenth", "eleventh", "twelfth" };    
    
    private static readonly string[] Counts = { null, "a", "two", "three", "four", "five", "six", "seven", "eight", "nine", "ten", "eleven", "twelve" };
    
    private static readonly string[] Gifts =
    { 
        null,
        "Partridge in a Pear Tree",
        "Turtle Doves",
        "French Hens",
        "Calling Birds",
        "Gold Rings",
        "Geese-a-Laying",
        "Swans-a-Swimming",
        "Maids-a-Milking",
        "Ladies Dancing",
        "Lords-a-Leaping",
        "Pipers Piping",
        "Drummers Drumming"
    };
}
