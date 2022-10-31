# Tracks on Tracks on Tracks

Welcome to Tracks on Tracks on Tracks on Exercism's F# Track.
If you need help running the tests or submitting your code, check out `HELP.md`.
If you get stuck on the exercise, check out `HINTS.md`, but try and solve it without using those first :)

## Introduction

A `list` in F# is an immutable collection of zero or more values. The values in a list must all have the same type. As lists are immutable, once a list has been constructed, its value can never change. Any functions/operators that appear to modify a list (such as adding an element), will actually return a new list.

Lists can be defined as follows:

```fsharp
let empty = []
let singleValue = [5]
let threeValues = ["a"; "b"; "c"]
```

The most common way to add an element to a list is through the `::` (cons) operator:

```fsharp
let twoToFour = [2; 3; 4]
let oneToFour = 1 :: twoToFour
// => [1; 2; 3; 4]
```

F# list is have a _head_ (the first element) and a _tail_ (everything after the first element). The tail of a list is itself a list.

Lists are either manipulated by functions and operators defined in the `List` module, or manually using pattern matching using the _list_ and _cons_ patterns:

```fsharp
let describe list =
    match list with
    | [] -> "Empty list"
    | head::tail -> sprintf "Non-empty list with head: %d" head

describe []        // => "Empty list"
describe [1]       // => "Non-empty with head: 1"
describe [5; 7; 9] // => "Non-empty with head: 5"
```

You can also _discard_ a value when pattern matching; when you do _not_ care about a value in a specific case (i.e. you aren't going to _use_ a value) you can use an underscore (`'_'`) to signify this:

```fsharp
let describe list =
    match list with
    | [] -> "Empty list"
    | [x] -> "List with one item"
    | [_; y] -> "List with two items (first item ignored)"
    | _ -> "List with many items (all items ignored)"

describe []        // => "Empty list"
describe [1]       // => "List with one item"
describe [5; 7]     // => "List with two items (first item ignored)"
describe [5; 7; 9] // => "List with many items (all items ignored)"
```

The single `'_'` should always come _last_ when pattern matching, every value that _doesn't_ match any of the other cases will be handled by this case.

## Instructions

In this exercise you'll be writing code to keep track of a list of programming languages you want to learn on Exercism.

You have six tasks, which will all involve dealing with lists.

## 1. Create a new list

To keep track of the languages you want to learn, you'll need to create an new list. Define the `newList` binding that contains a new, empty list.

```fsharp
newList
// => []
```

## 2. Define an existing list

Currently, you have a piece of paper listing the languages you want to learn: F#, Clojure and Haskell. Define the `existingList` binding to represent this list.

```fsharp
existingList
// => ["F#"; "Clojure"; "Haskell"]
```

## 3. Add a new language to a list

As you explore Exercism and find more interesting languages, you want to add them to your list. Implement the `addLanguage` function to add a new language to the beginning of your list.

```fsharp
addLanguage "TypeScript" ["JavaScript"; "CoffeeScript"]
// => ["TypeScript"; "JavaScript"; "CoffeeScript"]
```

## 4. Count the languages in the list

Counting the languages one-by-one is inconvenient. Implement the `countLanguages` function to count the number of languages on your list.

```fsharp
countLanguages ["C#"; "Racket"; "Rust"; "Ruby"]
// => 4
```

## 5. Reverse the list

At some point, you realize that your list is actually ordered backwards! Implement the `reverseList` function to reverse your list.

```fsharp
reverseList ["Prolog"; "C"; "Idris"; "Assembly"]
// => ["Assembly"; "Idris"; "C"; "Prolog"]
```

## 6. Check if list is exciting

While you love all languages, F# has a special place in your heart. As such, you're really excited about a list of languages if:

- The first on the list is F#.
- The second item on the list is F# and the list contain either two or three languages.

Implement the `excitingList` function to check if a list of languages is exciting:

```fsharp
excitingList ["Nim"; "F#"]
// => true
```

## Source

### Created by

- @ErikSchierboom