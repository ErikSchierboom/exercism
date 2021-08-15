using System.Collections.Generic;
using System.Linq;

public class WordSearch
{
    private readonly string[] _rows;
    private readonly int _width;
    private readonly int _height;

    private static readonly (int, int)[] Directions =
    {
        ( 1,  0),
        ( 0,  1),
        (-1,  0),
        ( 0, -1),
        ( 1,  1),
        ( 1, -1),
        (-1,  1),
        (-1, -1)
    };

    public WordSearch(string puzzle)
    {
        _rows = puzzle.Split('\n');
        _width = _rows[0].Length;
        _height = _rows.Length;
    }

    public Dictionary<string, ((int, int), (int, int))?> Search(IEnumerable<string> words) =>
        words.ToDictionary(word => word, Search);

    private ((int, int), (int, int))? Search(string word) =>
        (from position in Positions()
         from direction in Directions
         from location in Find(word, position, direction) 
         select location).FirstOrDefault();

    private IEnumerable<((int, int), (int, int))> Find(string word, (int, int) position, (int, int) direction)
    {
        var current = position;

        foreach (var letter in word)
        {
            if (!ValidCoordinate(current)) yield break;
            if (_rows[current.Item2 - 1][current.Item1 - 1] != letter) yield break;

            current = (current.Item1 + direction.Item1, current.Item2 + direction.Item2);
        }

        yield return (position, (current.Item1 - direction.Item1, current.Item2 - direction.Item2));
    }

    private IEnumerable<(int, int)> Positions() =>
        from x in Enumerable.Range(1, _width)
        from y in Enumerable.Range(1, _height)
        select (x, y);

    private bool ValidCoordinate((int, int) coordinate) =>
        coordinate.Item1 > 0 && coordinate.Item1 <= _width &&
        coordinate.Item2 > 0 && coordinate.Item2 <= _height;
}