using System;
using System.Collections.Generic;

public enum Bucket { One, Two }

public record Result(int Moves, Bucket GoalBucket, int OtherBucket);

public class TwoBucket
{
    private readonly int oneCapacity;
    private readonly int twoCapacity;
    private readonly Bucket startFrom;

    public TwoBucket(int oneCapacity, int twoCapacity, Bucket startFrom)
    {
        this.oneCapacity = startFrom == Bucket.One ? oneCapacity : twoCapacity;
        this.twoCapacity = startFrom == Bucket.One ? twoCapacity : oneCapacity;
        this.startFrom = startFrom;
    }

    public Result Measure(int goal)
    {
        if (goal > oneCapacity && goal > twoCapacity)
            throw new ArgumentException("Goal cannot not be reached", nameof(goal));

        var initialState = (Moves: 0, Buckets: (One: 0, Two: 0));

        var unprocessed = new PriorityQueue<(int Moves, (int One, int Two) Buckets), int>();
        unprocessed.Enqueue(initialState, initialState.Moves);

        var statesMinMoveCount = new Dictionary<(int One, int Two), int> { [initialState.Buckets] = initialState.Moves };

        while (unprocessed.TryDequeue(out var state, out _))
        {
            if (state.Buckets.One == goal)
                return new Result(state.Moves, startFrom == Bucket.One ? Bucket.One : Bucket.Two, state.Buckets.Two);

            if (state.Buckets.Two == goal)
                return new Result(state.Moves, startFrom == Bucket.One ? Bucket.Two : Bucket.One, state.Buckets.One);

            foreach (var newState in Moves(state))
            {
                if (newState.Moves >= statesMinMoveCount.GetValueOrDefault(newState.Buckets, int.MaxValue))
                    continue;

                statesMinMoveCount[newState.Buckets] = newState.Moves;
                unprocessed.Enqueue(newState, newState.Moves);
            }
        }

        throw new ArgumentException("Could not find path");
    }

    private IEnumerable<(int Moves, (int One, int Two) Buckets)> Moves((int Moves, (int One, int Two) Buckets) state)
    {
        if (state.Buckets.One == 0)
            yield return (state.Moves + 1, (oneCapacity, state.Buckets.Two));

        if (state.Buckets.One > 0 && state.Buckets.Two == 0)
            yield return (state.Moves + 1, (state.Buckets.One, twoCapacity));

        if (state.Buckets.Two == twoCapacity)
            yield return (state.Moves + 1, (state.Buckets.One, 0));

        if (state.Buckets.One > 0 && state.Buckets.Two < twoCapacity)
        {
            var amount = Math.Min(state.Buckets.One, twoCapacity - state.Buckets.Two);
            yield return (state.Moves + 1, (state.Buckets.One - amount, state.Buckets.Two + amount));
        }
    }
}