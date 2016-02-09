public class Deque<T>
{
    private Element first;
    private Element last;

    public void Push(T value)
    {
        var previousLast = this.last;

        this.last = new Element { Value = value, Prev = previousLast };
        this.first = this.first ?? this.last;

        if (previousLast != null)
        {
            previousLast.Next = this.last;
        }
    }

    public T Pop()
    {
        var value = this.last.Value;
        this.last = this.last.Prev;

        return value;
    }

    public T Shift()
    {
        var value = this.first.Value;
        this.first = this.first.Next;

        return value;
    }

    public void Unshift(T value)
    {
        var previousFirst = this.first;

        this.first = new Element { Value = value, Next = previousFirst };
        this.last = this.last ?? this.first;

        if (previousFirst != null)
        {
            previousFirst.Prev = this.first;
        }
    }

    private class Element
    {
        public T Value { get; set; }
        public Element Next { get; set; }
        public Element Prev { get; set; }
    }
}