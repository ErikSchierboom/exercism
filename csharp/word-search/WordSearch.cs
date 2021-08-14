using System.Collections.Generic;
using System.Linq;

public class WordSearch
{
    private readonly string[] _rows;
    private readonly int _width;
    private readonly int _height;
    private readonly (int, int)[] _positions;

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
        _positions = Positions();
    }

    public Dictionary<string, ((int, int), (int, int))?> Search(IEnumerable<string> words) =>
        words.ToDictionary(word => word, Search);

    private ((int, int), (int, int))? Search(string word) =>
        (from position in _positions
         from direction in Directions
         from location in Find(word, position, direction) 
         select location).FirstOrDefault();

    private IEnumerable<((int, int), (int, int))> Find(string word, (int, int) position, (int, int) direction)
    {
        var current = position;

        foreach (var letter in word)
        {
            if (FindChar(current) != letter)
            {
                yield break;
            }

            current = (current.Item1 + direction.Item1, current.Item2 + direction.Item2);
        }

        yield return (position, (current.Item1 - direction.Item1, current.Item2 - direction.Item2));
    }

    private char? FindChar((int, int) coordinate)
    {
        var (x, y) = coordinate;
        
        if (x > 0 && x <= _width && y > 0 && y <= _height)
        {
            return _rows[y - 1][x - 1];
        }

        return null;
    }

    private (int, int)[] Positions() =>
        (from x in Enumerable.Range(1, _width)
         from y in Enumerable.Range(1, _height)
         select (x, y)).ToArray();
}