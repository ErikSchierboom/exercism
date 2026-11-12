# Problematic Probabilities

Welcome to Problematic Probabilities on Exercism's Julia Track.
If you need help running the tests or submitting your code, check out `HELP.md`.
If you get stuck on the exercise, check out `HINTS.md`, but try and solve it without using those first :)

## Introduction

`Rational numbers` are fractions with an integer numerator divided by an integer denominator.

For example, we can store `2//3` as an exact fraction instead of the approximate `Float64` value `0.6666...`

The advantage is that (except in the extreme case of *integer overflow*) a rational number will remain exact, avoiding the rounding errors that are often inevitable with floating-point numbers.

Rational numbers are quite a simple numeric type and aim to work much as you would expect.
Because they have been a standard type in Julia since the early versions, most functions will accept them as input in the same way as integers and floats.

## Creating rational numbers

Creation is as simple as using `//` between two integers.

```julia-repl
julia> 3//4
3//4

julia> a = 3; b = 4;

julia> a//b
3//4
```

Common factors are automatically removed, converting the fraction to its "lowest terms": the smallest integers that accurately represent the fraction, and with a non-negative denominator.

```julia-repl
julia> 5//15
1//3

julia> 5//-15
-1//3
```

## Arithmetic with rational numbers

The usual `arithmetic operators` `+ - * / ^ %` work with rationals, essentially the same as with other numeric types.

Integers and other `Rational`s can be included and give a `Rational` result.
Including a `float` in the expression results in `float` output, with a consequent (possible) loss in precision.

If a `float` is desired, simply use the `float()` function to convert a rational.
It is quite normal to use rational numbers to preserve precision through a long calculation, then convert to a float at the end.

```julia-repl
julia> 3//4 + 1//3  # addition
13//12

julia> 3//4 * 1//3  # multiplication
1//4

julia> 3//4 / 1//3  # division
9//4

julia> 3//4 ^ 2  # exponentiation
3//16

julia> 3//4 + 5  # rational and int => rational
23//4

julia> 3//4 + 5.3  # rational and float => float
6.05

julia> float(3//4)  # casting
0.75
```

## Other operations

In Julia, rational numbers are just numbers.
The compiler will usually convert types as necessary.

However, beware that comparisons work for fractions with a finite decimal representation:

```julia-repl
julia> 3//4 == 0.75
true

julia> 3//4 < 0.74
false
```

But, otherwise, a `Rational` should be cast to a `Float` for comparisons:

```julia-repl
julia> 1//3 == 1/3
false

julia> float(1//3) == 1/3
true
```

Mathematical functions take rationals as input, but may give a floating-point result:

```julia-repl
julia> sqrt(9//16)
0.75
```

## Instructions

A research organization has noticed that some of its junior researchers have been using less-than-optimal methods in their analysis.
One of these methods is to immediately convert discrete probabilities into floats (i.e. real numbers) before doing further calculations.

Senior researchers prefer to use rational numbers in the calculations, which may provide higher precision, and would like to know if the poor practices of the junior researchers have affected the studies' outcomes.

There were two types of studies done:
- Many tests were run, each returning a discrete probability for success, and then the mean of these probabilities was calculated.
- Many independent events were tested, and the total probability for all events to occur was calculated by multiplying them together.

The senior researchers are asking you to write functions which can help them determine if there are rounding errors in the analyses from using floats, and asking you to provide a precise rational number for the outcome if there are errors.

## 1. Give the ratio of successes to trials

The `rationalize(successes, trials)` function takes two arrays, `successes` and `trials`.
For an index `i`, `successes[i]` corresponds to the number of successes which occurred in `trials[i]` number of trials.
The function returns an array of rational numbers of the successes over the number of trials, in the same order as the input arrays.

```julia-repl
julia> rationalize([1, 2, 3], [4, 5, 6])
3-element Vector{Rational{Int64}}:
 1//4
 2//5
 1//2
```

## 2. Find the real probabilities associated with successes to trials

Similarly, the `probabilities(successes, trials)` function takes two arrays, `successes` and `trials`.
It returns an array of floats of the successes over the number of trials, in the same order as the input arrays.

```julia-repl
julia> probabilities([1, 2, 3], [4, 5, 6])
3-element Vector{Float64}:
 0.25
 0.4
 0.5
```

## 3. Check the mean of the probabilities

The `checkmean(successes, trials)` takes the two arrays, `successes` and `trials`.
It checks the mean of the real probabilities against the mean of the rational probabilities.
- If the two probabilities are equal, `checkmean` returns `true`
- If the two probabilities are different, `checkmean` returns the rational probability.

```julia-repl
julia> successes, trials = [9, 4, 7, 8, 6], [22, 22, 11, 17, 12];
julia> checkmean(successes, trials)
true

julia> successes, trials = [6, 5, 9, 8, 9], [21, 19, 13, 25, 22];
julia> checkmean(successes, trials)
1873629//4754750
```

## 4. Check the independent probability

The `checkprob(successes, trials)` takes the two arrays, `successes` and `trials`.
It checks the total probability of the float probabilities against the total probability of the rational probabilities.
- If the two probabilities are equal, `checkprob` returns `true`
- If the two probabilities are different, `checkprob` returns the rational probability.

```julia-repl
julia> successes, trials = [2, 9, 4, 4, 5], [15, 11, 17, 19, 15];
julia> checkprob(successes, trials)
true

julia> successes, trials = [9, 8, 5, 4, 3], [22, 14, 19, 25, 18];
julia> checkprob(sucesses, trials)
12//7315
```

## Source

### Created by

- @depial