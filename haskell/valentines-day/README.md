# Valentines Day

Welcome to Valentines Day on Exercism's Haskell Track.
If you need help running the tests or submitting your code, check out `HELP.md`.
If you get stuck on the exercise, check out `HINTS.md`, but try and solve it without using those first :)

## Introduction

An Algebraic Data Type (ADT) represents a fixed number of named cases.
Each value of an ADT corresponds to exactly one of the named cases.

An ADT is defined using the `data` keyword, with cases separated by pipe (`|`) characters.
If none of the cases have data associated with them the ADT is similar to what other languages usually refer to as an _enumeration_ (or _enum_).

```haskell
data Season
  = Spring
  | Summer
  | Autumn
  | Winter
```

Each case of an ADT can optionally have data associated with it, and different cases can have different types of data.
When the case has data associated, a constructor is required.

```haskell
data Number
  = NInt Int      --'NInt' is the constructor for an Int Number.
  | NFloat Float  --'NFloat' is the constructor for an Float Number.
  | Invalid       --'Invalid' does not have data associated to it.
```

Creating a value for a specific case can be done by referring to its name (e.g, `NInt 22`).
As case names are just constructor functions, associated data can be passed as a regular function argument.

ADTs have _structural equality_, which means that two values for the same case and with the same (optional) data are equivalent.

While one can use `if/else` expressions to work with ADTs, the recommended way to work with them is through pattern matching using _case_ statement:

```haskell
add1 :: Number -> String
add1 number =
    case number of
      NInt    i -> show (i + 1)
      NFloat  f -> show (f + 1.0)
      Invalid   -> error "Invalid input"
```

## Instructions

In this exercise, it's Valentine's day and you are planning what to do with your partner.
Your partner has lots of ideas, and is asking you to rate the ideas, in order to find the best activity.

The following ideas are proposed by your partner:

- Playing a board game
- Chill out
- Watch a movie
- Go to a restaurant
- Take a walk

You have six tasks to help choose your Valentine's day activity.

## 1. Define the approval

For each idea your partner proposes, you respond with one of three options: yes, no or maybe.

Define the `Approval` algebraic data type to represent these options for the following three cases: `Yes`, `No` or `Maybe`.

## 2. Define the cuisines

Your partner has selected two possible restaurants: one based on Korean cuisine and the other based on Turkish cuisine.

Define the `Cuisine` algebraic data type to represent these restaurants as the following two cases: `Korean` or `Turkish`.

## 3. Define the movie genres

There are tons of movies to choose from, so to narrow things down, your partner also lists their preferred genre.

Define the `Genre` algebraic data type to represent the following genres cases: `Crime`, `Horror`, `Romance` or `Thriller`.

## 4. Define the activity

As mentioned, your partner has come up with five possible activities: playing a board game, chill out, watch a movie, go to a restaurant and taking a walk.

Define the `Activity` algebraic data type to represent these activity types:

- `BoardGame`: no associated data.
- `Chill`: no associated data.
- `Movie`: has its `Genre` as associated data.
- `Restaurant`: has its `Cuisine` as associated data.
- `Walk`: has an `Int` representing the number of kilometers to walk as associated data.

## 5. Rate the activity

Finally, you're ready to rate your partner's ideas.
This is how you feel about your partner's idea:

- Playing a board game: no.
- Chill out: no.
- Watch a movie: yes if it is a romantic movie; otherwise, no.
- Go to a restaurant: yes if the cuisine is Korean, maybe if it is Turkish.
- Take a walk: yes if the walk is less than three kilometers; maybe if it is between three and five kilometers (inclusive); otherwise, no.

Implement a function named `rateActivity` that takes an `Activity` value and returns the `Approval` based on the above sentiments.
For example:

```haskell
rateActivity (Restaurant Turkish)
-- -> Maybe
```

## Source

### Created by

- @pwadsworth