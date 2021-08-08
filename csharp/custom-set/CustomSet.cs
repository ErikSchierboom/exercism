using System.Collections.Generic;
using System.Linq;

public class CustomSet
{
    private readonly SortedDictionary<int, int> _items = new();

    public CustomSet(params int[] values)
    {
        foreach (var value in values.Where(value => !_items.ContainsKey(value.GetHashCode())))
            _items.Add(value.GetHashCode(), value);
    }

    public CustomSet Add(int value) => new(_items.Values.Append(value).ToArray());

    public bool Empty() => _items.Count == 0;

    public bool Contains(int value) => _items.ContainsKey(value.GetHashCode());

    public bool Subset(CustomSet right) => _items.Keys.All(key => right._items.ContainsKey(key));

    public bool Disjoint(CustomSet right) => !_items.Keys.Any(key => right._items.ContainsKey(key));

    public CustomSet Intersection(CustomSet right)
    {
        var intersectionKeys = _items.Keys.Intersect(right._items.Keys);
        return new CustomSet(GetValuesFromKeys(intersectionKeys));
    }

    public CustomSet Difference(CustomSet right)
    {
        var differenceKeys = _items.Keys.Except(right._items.Keys);
        return new CustomSet(GetValuesFromKeys(differenceKeys));
    }

    public CustomSet Union(CustomSet right) => new(_items.Values.Concat(right._items.Values).ToArray());

    private int[] GetValuesFromKeys(IEnumerable<int> keys) => keys.Select(key => _items[key]).ToArray();

    public override bool Equals(object obj) => obj is CustomSet other && _items.Keys.SequenceEqual(other._items.Keys);

    public override int GetHashCode() => _items.GetHashCode();
}