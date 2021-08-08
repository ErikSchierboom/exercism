using System;
using System.Collections.Generic;
using System.Linq;

public class CircularBuffer<T>
{
    private readonly int _capacity;
    private List<T> _items;

    public CircularBuffer(int capacity)
    {
        _capacity = capacity;
        _items = new List<T>(capacity);
    }

    public T Read()
    {
        if (_items.Count == 0) throw new InvalidOperationException("Cannot read from empty buffer");

        var value = _items[0];

        DequeueHead();

        return value;
    }

    public void Write(T value)
    {
        if (_items.Count == _capacity) throw new InvalidOperationException("Cannot write to full buffer");

        _items.Add(value);
    }

    public void Overwrite(T value)
    {
        if (_items.Count == _capacity) DequeueHead();

        Write(value);
    }

    public void Clear() => _items.Clear();

    private void DequeueHead() => _items = _items.Skip(1).ToList();
}