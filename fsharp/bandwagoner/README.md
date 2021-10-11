# Bandwagoner

Welcome to Bandwagoner on Exercism's F# Track.
If you need help running the tests or submitting your code, check out `HELP.md`.
If you get stuck on the exercise, check out `HINTS.md`, but try and solve it without using those first :)

## Introduction

A record is a collection of fields (which can be of different types) that belong together. To define a record the `type` keyword is used. A record's fields are defined between `{` and `}` characters, and each field has a name _and_ a type. To create a record, specify the names of the fields and assign a value to them between `{` and `}` characters. All fields must be assigned a value when creating a record. A record instance's field values can be accessed using dot-notation.

When defining/create a record, each field must either be on a separate line or separated by semicolons (`;`) when on a single line.

```fsharp
// Define a record
type Address =
    { Street: string
      HouseNumber: int }

// Create a record
let oldAddress: Address =
    { Street = "Main Street"
      HouseNumber = 17 }

// Single-line alternative
type ConciseAddress = { Street: string; HouseNumber: int }
let conciseAddress: ConciseAddress = { Street = "Main Street"; HouseNumber = 17 }
```

As records are immutable, once a record has been constructed, its field values can never change. If you'd like to change a record's values, the `with` keyword allows you to create a copy of an existing record, but with new values for one or more fields.

```fsharp
// Copy the old address but change the house number
let newAddress: Address = { oldAddress with HouseNumber = 86 }
newAddress.Street      // => "Main Street"
newAddress.HouseNumber // => 86
```

Records have _structural equality_, which means that two instances of the same record with identical values are equivalent.

Besides being able to use dot-notation to access a record's fields, records can also be _deconstructed_ in bindings and in pattern matching:

```fsharp
let myAddress: Address = { Street = "Broadway"; HouseNumber = 123 }
let { Street = myStreet; HouseNumber = myHouseNumber } = myAddress

match myAddress with
| { HouseNumber = 1 } -> printfn "First house"
| { HouseNumber = houseNumber; Street = street } -> printfn "House number %d on %s" houseNumber street
// => "House number 123 on Broadway
```

## Instructions

In this exercise you're a big sports fan and you've just discovered a passion for NBA basketball. Being new to NBA basketball, you're doing a deep dive into NBA history, keeping track of teams, coaches, their win/loss stats and comparing them against each other.

As you don't yet have a favorite team, you'll also be developing an algorithm to figure out whether to root for a particular team.

You have seven tasks to help you develop your proprietary _root-for-a-team_ algorithm.

## 1. Define the model

Define the `Coach` record with the following two fields:

- `Name`: the coach's name, of type `string`.
- `FormerPlayer`: indicates if the coach was a former player, of type `bool`.

Define the `Stats` record with the following two fields:

- `Wins`: the number of wins, of type `int`.
- `Losses`: the number of losses, of type `int`.

Define the `Team` record with the following three fields:

- `Name`: the team's name, of type `string`.
- `Coach`: the team's coach, of type `Coach`.
- `Stats`: the team's stats, of type `Stats`.

## 2. Create a team's coach

Implement the `createCoach` function that takes the coach name and its former player status as parameters, and returns its `Coach` record:

```fsharp
createCoach "Larry Bird" true
// => { Name = "Larry Bird"; FormerPlayer = true }
```

## 3. Create a team's stats

Implement the `createStats` function that takes the number of wins and the number losses as parameters, and returns its `Stats` record:

```fsharp
createStats 58 24
// => { Wins = 58; Losses = 24 }
```

## 4. Create a team

Implement the `createTeam` function that takes the team name, coach and record as parameters, and returns its `Team` record:

```fsharp
let coach = createCoach "Larry Bird" true
let record = createStats 58 24
createTeam "Indiana Pacers" coach record
// => { Name = "Indiana Pacers"
//      Coach = { Name = "Larry Bird"; FormerPlayer = true }
//      Stats = { Wins = 58; Losses = 24 } }
```

## 5. Replace the coach

NBA owners being impatient, you found that bad team results would often lead to the coach being replaced. Implement the `replaceCoach` function that takes the team and its new coach as parameters, and returns the team but with the new coach:

```fsharp
let coach = createCoach "Larry Bird" true
let record = createStats 58 24
let team = createTeam "Indiana Pacers" coach record

let newCoach = createCoach "Isiah Thomas" true
replaceCoach team newCoach
// => { Name = "Indiana Pacers"
//      Coach = { Name = "Isiah Thomas"; FormerPlayer = true }
//      Stats = { Wins = 58; Losses = 24 } }
```

## 6. Check for same team

While digging into stats, you're keeping lists of teams and their records. Sometimes, you get things wrong and there are duplicate entries on your list. Implement the `isSameTeam` function that takes two teams and returns `true` if they are the same team; otherwise, return `false`:

```fsharp
let pacersCoach = createCoach "Larry Bird" true
let pacersStats = createStats 58 24
let pacersTeam = createTeam "Indiana Pacers" pacersCoach pacersStats

let lakersCoach = createCoach "Del Harris" false
let lakersStats = createStats 61 21
let lakersTeam = createTeam "LA Lakers" lakersCoach lakersStats

isSameTeam pacersTeam lakersTeam
// => false
```

## 7. Check if you should root for a team

Having looked at many teams and matches, you've come up with an algorithm. If one of the following is true, you root for that team:

- The coach's name is "Gregg Popovich"
- The coach is a former player
- The team's name is the "Chicago Bulls"
- The team has won 60 or more games
- The team has more losses than wins

Implement the `rootForTeam` function that takes a team and returns `true` if you should root for that team; otherwise, `return` false:

```fsharp
let spursCoach = createCoach "Gregg Popovich" false
let spursStats = createStats 56 26
let spursTeam = createTeam "San Antonio Spurs" spursCoach spursStats
rootForTeam spursTeam
// => true
```

## Source

### Created by

- @ErikSchierboom

### Contributed to by

- @valentin-p