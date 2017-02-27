module SortingTest

open NUnit.Framework

open System

open Sorting

let random = new Random()

let randomNumbers = Seq.initInfinite (fun _ -> random.Next())

let randomArrayLength = 100

let randomArray() = 
    randomNumbers 
    |> Seq.take randomArrayLength 
    |> Seq.toArray

[<Test>]
let ``Bubble sort: empty array`` () =
    let input = [||]
    let expected = [||]
    Assert.That(bubbleSort input, Is.EqualTo(expected))

[<Test>]
let ``Bubble sort: single element array`` () =
    let input = [|1|]
    let expected = [|1|]
    Assert.That(bubbleSort input, Is.EqualTo(expected))
    
[<Test>]
let ``Bubble sort: unordered array`` () =
    let input = [|2; 1; 4; 6; 5; 3|]
    let expected = [|1; 2; 3; 4; 5; 6|]
    Assert.That(bubbleSort input, Is.EqualTo(expected))

[<Test>]
let ``Bubble sort: ordered array`` () =
    let input = [|1; 2; 3; 4; 5; 6|]
    let expected = [|1; 2; 3; 4; 5; 6|]
    Assert.That(bubbleSort input, Is.EqualTo(expected))

[<Test>]
let ``Bubble sort: random array`` () =
    let input = randomArray()
    let expected = Array.sort input
    Assert.That(bubbleSort input, Is.EqualTo(expected))
    
[<Test>]
let ``Bubble sort: non-integer array`` () =
    let input = [|'c'; 'a'; 'd'; 'e'; 'b'; 'f'|]
    let expected = [|'a'; 'b'; 'c'; 'd'; 'e'; 'f'|]
    Assert.That(bubbleSort input, Is.EqualTo(expected))

[<Test>]
let ``Insertion sort: empty array`` () =
    let input = [||]
    let expected = [||]
    Assert.That(insertionSort input, Is.EqualTo(expected))

[<Test>]
let ``Insertion sort: single element array`` () =
    let input = [|1|]
    let expected = [|1|]
    Assert.That(insertionSort input, Is.EqualTo(expected))
    
[<Test>]
let ``Insertion sort: unordered array`` () =
    let input = [|2; 1; 4; 6; 5; 3|]
    let expected = [|1; 2; 3; 4; 5; 6|]
    Assert.That(insertionSort input, Is.EqualTo(expected))

[<Test>]
let ``Insertion sort: ordered array`` () =
    let input = [|1; 2; 3; 4; 5; 6|]
    let expected = [|1; 2; 3; 4; 5; 6|]
    Assert.That(insertionSort input, Is.EqualTo(expected))

[<Test>]
let ``Insertion sort: random array`` () =
    let input = randomArray()
    let expected = Array.sort input
    Assert.That(insertionSort input, Is.EqualTo(expected))
    
[<Test>]
let ``Insertion sort: non-integer array`` () =
    let input = [|'c'; 'a'; 'd'; 'e'; 'b'; 'f'|]
    let expected = [|'a'; 'b'; 'c'; 'd'; 'e'; 'f'|]
    Assert.That(insertionSort input, Is.EqualTo(expected))
    
[<Test>]
let ``Insertion sort: does not modify input`` () =
    let input = [|1.0; 2.5; 1.8; 3.4|]
    insertionSort input |> ignore
    Assert.That(input, Is.EqualTo([|1.0; 2.5; 1.8; 3.4|]))

[<Test>]
let ``Selection sort: empty array`` () =
    let input = [||]
    let expected = [||]
    Assert.That(selectionSort input, Is.EqualTo(expected))

[<Test>]
let ``Selection sort: single element array`` () =
    let input = [|1|]
    let expected = [|1|]
    Assert.That(selectionSort input, Is.EqualTo(expected))
    
[<Test>]
let ``Selection sort: unordered array`` () =
    let input = [|2; 1; 4; 6; 5; 3|]
    let expected = [|1; 2; 3; 4; 5; 6|]
    Assert.That(selectionSort input, Is.EqualTo(expected))

[<Test>]
let ``Selection sort: ordered array`` () =
    let input = [|1; 2; 3; 4; 5; 6|]
    let expected = [|1; 2; 3; 4; 5; 6|]
    Assert.That(selectionSort input, Is.EqualTo(expected))

[<Test>]
let ``Selection sort: random array`` () =
    let input = randomArray()
    let expected = Array.sort input
    Assert.That(selectionSort input, Is.EqualTo(expected))
    
[<Test>]
let ``Selection sort: non-integer array`` () =
    let input = [|'c'; 'a'; 'd'; 'e'; 'b'; 'f'|]
    let expected = [|'a'; 'b'; 'c'; 'd'; 'e'; 'f'|]
    Assert.That(selectionSort input, Is.EqualTo(expected))
    
[<Test>]
let ``Selection sort: does not modify input`` () =
    let input = [|1.0; 2.5; 1.8; 3.4|]
    selectionSort input |> ignore
    Assert.That(input, Is.EqualTo([|1.0; 2.5; 1.8; 3.4|]))

[<Test>]
let ``Quicksort: empty array`` () =
    let input = [||]
    let expected = [||]
    Assert.That(quicksort input, Is.EqualTo(expected))

[<Test>]
let ``Quicksort: single element array`` () =
    let input = [|1|]
    let expected = [|1|]
    Assert.That(quicksort input, Is.EqualTo(expected))
    
[<Test>]
let ``Quicksort: unordered array`` () =
    let input = [|2; 1; 4; 6; 5; 3|]
    let expected = [|1; 2; 3; 4; 5; 6|]
    Assert.That(quicksort input, Is.EqualTo(expected))

[<Test>]
let ``Quicksort: ordered array`` () =
    let input = [|1; 2; 3; 4; 5; 6|]
    let expected = [|1; 2; 3; 4; 5; 6|]
    Assert.That(quicksort input, Is.EqualTo(expected))

[<Test>]
let ``Quicksort: random array`` () =
    let input = randomArray()
    let expected = Array.sort input
    Assert.That(quicksort input, Is.EqualTo(expected))
    
[<Test>]
let ``Quicksort: non-integer array`` () =
    let input = [|'c'; 'a'; 'd'; 'e'; 'b'; 'f'|]
    let expected = [|'a'; 'b'; 'c'; 'd'; 'e'; 'f'|]
    Assert.That(quicksort input, Is.EqualTo(expected))
    
[<Test>]
let ``Quicksort: does not modify input`` () =
    let input = [|1.0; 2.5; 1.8; 3.4|]
    quicksort input |> ignore
    Assert.That(input, Is.EqualTo([|1.0; 2.5; 1.8; 3.4|]))