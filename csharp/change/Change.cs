using System;
using System.Collections.Generic;
using System.Linq;

public static class Change
{
    public static int[] FindFewestCoins(int[] coins, int change)
    {
        if (change < 0) throw new ArgumentException("Change cannot be negative.");
        if (change > 0 && change < coins.Min()) throw new ArgumentException("Change cannot be less than minimal coin value.");
 
        return Enumerable.Range(1, change)
            .Aggregate(new Dictionary<int, int[]> {[0] = Array.Empty<int>()}, UpdateFewestCoinsForChange)
            .GetValueOrDefault(change) ?? throw new ArgumentException(nameof(change));
        
        Dictionary<int, int[]> UpdateFewestCoinsForChange(Dictionary<int, int[]> current, int subChange)
        {
            var fewestCoins = FewestCoinsForChange(current, subChange);
            if (fewestCoins != null)
                current.Add(subChange, fewestCoins);

            return current;
        }
        
        int[] FewestCoinsForChange(Dictionary<int, int[]> current, int subChange) =>
            coins.Where(coin => coin <= subChange)
                .Select(coin => current.GetValueOrDefault(subChange - coin)?.Prepend(coin).ToArray())
                .Where(fewestCoins => fewestCoins != null)
                .MinBy(fewestCoins => fewestCoins.Length);
    }
}