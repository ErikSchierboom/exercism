# Bird Watcher

Welcome to Bird Watcher on Exercism's F# Track.
If you need help running the tests or submitting your code, check out `HELP.md`.
If you get stuck on the exercise, check out `HINTS.md`, but try and solve it without using those first :)

## Introduction

An `array` in F# is a mutable collection of zero or more values with a fixed length. This means that once an array has been created, its size cannot change, but its values can. The values in an array must all have the same type. Arrays can be defined as follows:

```fsharp
let empty = [| |]
let emptyAlternative = Array.empty

let singleValue = [| 5 |]
let singleValueAlternative = Array.singleton 5

let threeValues = [| "a"; "b"; "c" |]
```

Elements can be assigned to an array or retrieved from it using an index. F# arrays are zero-based, meaning that the first element's index is always zero:

```fsharp
let numbers = [| 2; 3; 5 |]

// Update value in array
numbers.[2] <- 9

// Read value from array
numbers.[2]
// => 9
```

Arrays are either manipulated by functions and operators defined in the `Array` module, or manually using pattern matching using the _array_ pattern:

```fsharp
let describe array =
    match array with
    | [| |] -> "Empty"
    | [| 1; 2; three |] -> sprintf "1, 2, %d" three
    | _ -> "Other"

describe [| |]         // => "Empty"
describe [| 1; 2; 4 |] // => "1, 2, 4"
describe [| 5; 7; 9 |] // => "Other"
```

You can also _discard_ a value when pattern matching; when you do _not_ care about a value in a specific case (i.e. you aren't going to _use_ a value) you can use an underscore (`'_'`) to signify this:

```fsharp
let describe array =
    match array with
    | [| |] -> "Empty array"
    | [| x |] -> "Array with one item"
    | [| _; y |] -> "Array with two items (first item ignored)"
    | _ -> "Array with many items (all items ignored)"

describe []         // => "Empty array"
describe [1]        // => "Array with one item"
describe [5; 7]     // => "Array with two items (first item ignored)"
describe [5; 7; 9]  // => "Array with many items (all items ignored)"
```

The single `'_'` should always come _last_ when pattern matching, every value that _doesn't_ match any of the other cases will be handled by this case.

## Instructions

You're an avid bird watcher that keeps track of how many birds have visited your garden in the last seven days.

You have six tasks, all dealing with the numbers of birds that visited your garden.

## 1. Check what the counts were last week

For comparison purposes, you always keep a copy of last week's counts nearby, which were: 0, 2, 5, 3, 7, 8, and 4. Define the `lastWeek` binding that contains last week's counts:

```fsharp
lastWeek
// => [| 0; 2; 5; 3; 7; 8; 4 |]
```

## 2. Check how many birds visited yesterday

Implement the `yesterday` function to return how many birds visited your garden yesterday. The bird counts are ordered by day, with the first element being the count of the oldest day, and the last element being today's count.

```fsharp
yesterday [| 3; 5; 0; 7; 4; 1 |]
// => 4
```

## 3. Calculate the total number of visiting birds

Implement the `total` function to return the total number of birds that have visited your garden:

```fsharp
total [| 3; 5; 0; 7; 4; 1 |]
// => 20
```

## 4. Check if there was a day with no visiting birds

Implement the `dayWithoutBirds` function that returns `true` if there was a day at which zero birds visited the garden; otherwise, return `false`:

```fsharp
dayWithoutBirds [| 3; 5; 0; 7; 4; 1 |]
// => true
```

## 5. Increment today's count

Implement the `incrementTodaysCount` function to increment today's count and return the updated counts:

```fsharp
let birdCount = [| 3; 5; 0; 7; 4; 1 |]
incrementTodaysCount birdCount
// => [| 3; 5; 0; 7; 4; 2 |]
```

## 6. Check for odd week

Over the last year, you've found that some weeks have the same, odd patterns:
- On each even day of the week, there were no birds
- On each even day of the week, exactly 10 birds were spotted
- On each odd day of the week, exactly 5 birds were spotted

Implement the `oddWeek` function that returns `true` if the bird count pattern of this week matches one of the odd patterns:

```fsharp
oddWeek [| 1; 0; 5; 0; 12; 0; 2 |]
// => true

oddWeek [| 5; 0; 5; 12; 5; 3; 5|]
// => true
```

## Source

### Created by

- @ErikSchierboom