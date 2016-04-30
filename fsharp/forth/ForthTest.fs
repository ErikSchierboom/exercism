module ForthTest

open NUnit.Framework

open Forth

let bind f m = 
    match m with
    | Choice1Of2 x -> f x
    | Choice2Of2 _ -> m

let (>>=) m f = bind f m

[<Test>]
let ``No input, no stack`` () =
    Assert.That(formatStack empty, Is.EqualTo(""))

[<Test>]
let ``Numbers just get pushed onto the stack`` () =
    Assert.That(eval "1 2 3 4 5" empty, Is.EqualTo(Choice1Of2 "1 2 3 4 5"))

[<Test>]
let ``Non-word characters are separators`` () =
    // Note the Ogham Space Mark ( ), this is a spacing character.
    Assert.That(eval "1\NUL2\SOH3\n4\r5 6\t7" empty, Is.EqualTo(Choice1Of2 "1 2 3 4 5 6 7"))

[<Test>]
let ``Basic arithmetic`` () =
    Assert.That(eval "1 2 + 4 -" empty, Is.EqualTo(Choice1Of2 "-1"))
    Assert.That(eval "2 4 * 3 /" empty, Is.EqualTo(Choice1Of2 "2"))

[<Test>]
let ``Division by zero`` () =
    Assert.That(eval "4 2 2 - /" empty, Is.EqualTo(Choice2Of2 DivisionByZero))

[<Test>]
let ``dup`` () =
    Assert.That(eval "1 DUP" empty, Is.EqualTo(Choice1Of2 "1 1"))
    Assert.That(eval "1 2 Dup" empty, Is.EqualTo(Choice1Of2 "1 2 2"))
    Assert.That(eval "dup" empty, Is.EqualTo(Choice2Of2 StackUnderflow))

[<Test>]
let ``drop`` () =
    Assert.That(eval "1 drop" empty, Is.EqualTo(Choice1Of2 ""))
    Assert.That(eval "1 2 drop" empty, Is.EqualTo(Choice1Of2 "1"))
    Assert.That(eval "drop" empty, Is.EqualTo(Choice2Of2 StackUnderflow))

[<Test>]
let ``swap`` () =
    Assert.That(eval "1 2 swap" empty, Is.EqualTo(Choice1Of2 "2 1"))
    Assert.That(eval "1 2 3 swap" empty, Is.EqualTo(Choice1Of2 "1 3 2"))
    Assert.That(eval "1 swap" empty, Is.EqualTo(Choice2Of2 StackUnderflow))
    Assert.That(eval "swap" empty, Is.EqualTo(Choice2Of2 StackUnderflow))

[<Test>]
let ``over`` () =
    Assert.That(eval "1 2 over" empty, Is.EqualTo(Choice1Of2 "1 2 1"))
    Assert.That(eval "1 2 3 over" empty, Is.EqualTo(Choice1Of2 "1 2 3 2"))
    Assert.That(eval "1 over" empty, Is.EqualTo(Choice2Of2 StackUnderflow))
    Assert.That(eval "over" empty, Is.EqualTo(Choice2Of2 StackUnderflow))

[<Test>]
let ``Defining a new word`` () =
    let actual =
        empty
        |>  eval ": dup-twice dup dup ;"  
        >>= eval "1 dup-twice"

    Assert.That(actual, Is.EqualTo(Choice1Of2 "1 1 1"))

[<Test>]
let ``Redefining an existing word`` () =    
    let actual =
        empty
        |>  eval ": foo dup ;"  
        >>= eval ": foo dup dup ;"
        >>= eval "1 foo"
        
    Assert.That(actual, Is.EqualTo(Choice1Of2 "1 1 1"))

[<Test>]
let ``Redefining an existing built-in word`` () =  
    let actual =
        empty
        |>  eval ": swap dup ;"  
        >>= eval "1 swap"

    Assert.That(actual, Is.EqualTo(Choice1Of2 "1 1"))

[<Test>]
let ``Defining words with odd characters`` () =
    Assert.That(eval ": € 220371 ; €" empty, Is.EqualTo(Choice1Of2 "220371"))

[<Test>]
let ``Defining a number`` () =
    Assert.That(eval ": 1 2 ;" empty, Is.EqualTo(Choice2Of2 InvalidWord))

[<Test>]
let ``Calling a non-existing word`` () =
    Assert.That(eval "1 foo" empty, Is.EqualTo(Choice2Of2 (UnknownWord "foo")))