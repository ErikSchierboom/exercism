namespace etl
{
    using System.Collections.Generic;
    using System.Linq;

    public static class ETL
    {
        public static Dictionary<string, int> Transform(Dictionary<int, IList<string>> input)
        {
            var keyValuePairs = input.SelectMany(i => i.Value.Select(v => new KeyValuePair<string, int>(v.ToLowerInvariant(), i.Key)))
                                     .OrderBy(k => k.Key);

            return keyValuePairs.ToDictionary(kv => kv.Key, kv => kv.Value);
        }
    }
}