using System.Collections;

public static class FlattenArray
{
    public static IEnumerable Flatten(IEnumerable input)
    {
        foreach (var element in input)
        {
            if (element is IEnumerable enumerable)
            {
                foreach (var flattenedElement in Flatten(enumerable))
                {
                    yield return flattenedElement;
                }
            }
            else if (element is not null)
            {
                yield return element;
            }
        }
    }
}