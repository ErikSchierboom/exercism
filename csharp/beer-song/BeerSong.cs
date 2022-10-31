using System.Linq;

public static class BeerSong
{
    private static string Verse(int number) =>
        number switch
        {
            0 => "No more bottles of beer on the wall, no more bottles of beer.\nGo to the store and buy some more, 99 bottles of beer on the wall.",
            1 => "1 bottle of beer on the wall, 1 bottle of beer.\nTake it down and pass it around, no more bottles of beer on the wall.",
            2 => "2 bottles of beer on the wall, 2 bottles of beer.\nTake one down and pass it around, 1 bottle of beer on the wall.",
            _ => $"{number} bottles of beer on the wall, {number} bottles of beer.\nTake one down and pass it around, {number - 1} bottles of beer on the wall."
        };

    public static string Recite(int startBottles, int takeDown) =>
        string.Join("\n\n", Enumerable.Range(startBottles - takeDown + 1, takeDown).Reverse().Select(Verse));
}