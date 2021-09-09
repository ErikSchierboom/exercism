# Saddle Points

Welcome to Saddle Points on Exercism's C# Track.
If you need help running the tests or submitting your code, check out `HELP.md`.

## Instructions

Detect saddle points in a matrix.

So say you have a matrix like so:

```text
    1  2  3
  |---------
1 | 9  8  7
2 | 5  3  2     <--- saddle point at column 1, row 2, with value 5
3 | 6  6  7
```

It has a saddle point at column 1, row 2.

It's called a "saddle point" because it is greater than or equal to
every element in its row and less than or equal to every element in
its column.

A matrix may have zero or more saddle points.

Your code should be able to provide the (possibly empty) list of all the
saddle points for any given matrix.

The matrix can have a different number of rows and columns (Non square).

Note that you may find other definitions of matrix saddle points online,
but the tests for this exercise follow the above unambiguous definition.

For this exercise, you will need to create a set of factors using tuples.
For more information on tuples, see [this link](https://docs.microsoft.com/en-us/dotnet/api/system.tuple?view=net-5.0).

## Source

### Created by

- @ErikSchierboom

### Contributed to by

- @GKotfis
- @j2jensen
- @jwood803
- @mrtank
- @robkeim
- @vgrigoriu
- @wolf99
- @Zureka

### Based on

J Dalbey's Programming Practice problems - http://users.csc.calpoly.edu/~jdalbey/103/Projects/ProgrammingPractice.html