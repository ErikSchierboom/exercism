﻿module WordSearchTest

open NUnit.Framework

open WordSearch

let formatPuzzle = List.reduce (fun x y -> x + "\n" + y)

let puzzle = 
    ["jefblpepre";
     "camdcimgtc";
     "oivokprjsm";
     "pbwasqroua";
     "rixilelhrs";
     "wolcqlirpc";
     "screeaumgr";
     "alxhpburyi";
     "jalaycalmp";
     "clojurermt"]
    |> formatPuzzle

[<Test>]
let ``Should find horizontal words written left-to-right`` () =
    let actual = find puzzle "clojure"
    Assert.That(actual, Is.EqualTo(Some ((1, 10), (7, 10))))

[<Test>]
let ``Should find horizontal words written right-to-left`` () =
    let actual = find puzzle "elixir"
    Assert.That(actual, Is.EqualTo(Some ((6, 5), (1, 5))))

[<Test>]
let ``Should find vertical words written top-to-bottom`` () =
    let actual = find puzzle "ecmascript"
    Assert.That(actual, Is.EqualTo(Some ((10, 1), (10, 10))))

[<Test>]
let ``Should find vertical words written bottom-to-top`` () =
    let actual = find puzzle "rust"
    Assert.That(actual, Is.EqualTo(Some ((9, 5), (9, 2))))

[<Test>]
let ``Should find diagonal words written top-left-to-bottom-right`` () =
    let actual = find puzzle "java"
    Assert.That(actual, Is.EqualTo(Some ((1, 1), (4, 4))))

let ``Should find diagonal upper written bottom-right-to-top-left`` () =
    let actual = find puzzle "lua"
    Assert.That(actual, Is.EqualTo(Some ((8, 9), (6, 7))))

[<Test>]
let ``Should find diagonal upper written bottom-left-to-top-right`` () =
    let actual = find puzzle "lisp"
    Assert.That(actual, Is.EqualTo(Some ((3, 6), (6, 3))))

[<Test>]
let ``Should find diagonal upper written top-right-to-bottom-left`` () =
    let actual = find puzzle "ruby"    
    Assert.That(actual, Is.EqualTo(Some ((8, 6), (5, 9))))

let ``Should not find words that are not in the puzzle`` () =
    let actual = find puzzle "haskell"
    Assert.That(actual, Is.EqualTo(None))

let ``Should be able to search differently-sized puzzles`` () =
    let differentSizePuzzle =
        ["qwertyuiopz";
         "luamsicrexe";
         "abcdefghijk"]
        |> formatPuzzle

    let actual = find differentSizePuzzle "exercism"    
    Assert.That(actual, Is.EqualTo(Some ((11, 2), (4, 2))))