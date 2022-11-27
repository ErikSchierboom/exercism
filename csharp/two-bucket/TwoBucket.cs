using System;
using System.Collections.Generic;

public enum Bucket { One, Two }
public record Result(int Moves, Bucket GoalBucket, int OtherBucket);
public record Buckets(int One, int Two);
public record State(int Moves, Buckets Buckets);

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

        var initialState = new State(Moves: 0, Buckets: new(One: 0, Two: 0));

        var unprocessed = new PriorityQueue<State, int>();
        unprocessed.Enqueue(initialState, initialState.Moves);

        var statesMinMoveCount = new Dictionary<Buckets, int> { [initialState.Buckets] = initialState.Moves };

        while (unprocessed.TryDequeue(out var state, out _))
        {
            if (state.Buckets.One == goal)
                return new(state.Moves, startFrom == Bucket.One ? Bucket.One : Bucket.Two, state.Buckets.Two);

            if (state.Buckets.Two == goal)
                return new(state.Moves, startFrom == Bucket.One ? Bucket.Two : Bucket.One, state.Buckets.One);

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

    private IEnumerable<State> Moves(State state)
    {
        if (state.Buckets.One == 0)
            yield return new(state.Moves + 1, new(oneCapacity, state.Buckets.Two));

        if (state.Buckets.One > 0 && state.Buckets.Two == 0)
            yield return new(state.Moves + 1, new(state.Buckets.One, twoCapacity));

        if (state.Buckets.Two == twoCapacity)
            yield return new(state.Moves + 1, new(state.Buckets.One, 0));

        if (state.Buckets.One > 0 && state.Buckets.Two < twoCapacity)
        {
            var amount = Math.Min(state.Buckets.One, twoCapacity - state.Buckets.Two);
            yield return new(state.Moves + 1, new(state.Buckets.One - amount, state.Buckets.Two + amount));
        }
    }
}