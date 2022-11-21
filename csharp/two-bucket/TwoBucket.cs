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

        var initialState = (moves: 0, one: 0, two: 0);

        var unprocessed = new PriorityQueue<(int moves, int one, int two), int>();
        unprocessed.Enqueue(initialState, initialState.moves);

        var statesMoveCount = new Dictionary<(int one, int two), int> { [(initialState.one, initialState.two)] = initialState.moves };

        while (unprocessed.TryDequeue(out var state, out _))
        {
            if (state.one == goal)
                return new Result(state.moves, startFrom == Bucket.One ? Bucket.One : Bucket.Two, state.two);

            if (state.two == goal)
                return new Result(state.moves, startFrom == Bucket.One ? Bucket.Two : Bucket.One, state.one);

            foreach (var newState in Moves(state))
            {
                if (newState.moves >= statesMoveCount.GetValueOrDefault((newState.one, newState.two), int.MaxValue))
                    continue;

                statesMoveCount[(newState.one, newState.two)] = newState.moves;
                unprocessed.Enqueue(newState, newState.moves);
            }
        }

        throw new ArgumentException("Could not find path");
    }

    private IEnumerable<(int moves, int one, int two)> Moves((int moves, int one, int two) state)
    {
        if (state.one == 0)
            yield return (state.moves + 1, oneCapacity, state.two);

        if (state.one > 0 && state.two == 0)
            yield return (state.moves + 1, state.one, twoCapacity);

        if (state.two == twoCapacity)
            yield return (state.moves + 1, state.one, 0);

        if (state.one > 0 && state.two < twoCapacity)
        {
            var amount = Math.Min(state.one, twoCapacity - state.two);
            yield return (state.moves + 1, state.one - amount, state.two + amount);
        }
    }
}
