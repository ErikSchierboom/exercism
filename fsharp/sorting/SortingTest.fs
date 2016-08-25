module SortingTest

open NUnit.Framework

open System

open Sorting

let random = new Random()

let randomNumbers = Seq.initInfinite (fun _ -> random.Next())

let randomListLength = 100

let randomList() = 
    randomNumbers 
    |> Seq.take randomListLength 
    |> Seq.toList

[<Test>]
let ``Bubble sort: empty list`` () =
    let input = []
    let expected = []
    Assert.That(bubbleSort input, Is.EqualTo(expected))

[<Test>]
let ``Bubble sort: single element list`` () =
    let input = [1]
    let expected = [1]
    Assert.That(bubbleSort input, Is.EqualTo(expected))
    
[<Test>]
let ``Bubble sort: unordered list`` () =
    let input = [2; 1; 4; 6; 5; 3]
    let expected = [1; 2; 3; 4; 5; 6]
    Assert.That(bubbleSort input, Is.EqualTo(expected))

[<Test>]
let ``Bubble sort: ordered list`` () =
    let input = [1; 2; 3; 4; 5; 6]
    let expected = [1; 2; 3; 4; 5; 6]
    Assert.That(bubbleSort input, Is.EqualTo(expected))

[<Test>]
let ``Bubble sort: random list`` () =
    let input = randomList()
    let expected = List.sort input
    Assert.That(bubbleSort input, Is.EqualTo(expected))
    
[<Test>]
let ``Bubble sort: non-integer list`` () =
    let input = ['c'; 'a'; 'd'; 'e'; 'b'; 'f']
    let expected = ['a'; 'b'; 'c'; 'd'; 'e'; 'f']
    Assert.That(bubbleSort input, Is.EqualTo(expected))

[<Test>]
let ``Insertion sort: empty list`` () =
    let input = []
    let expected = []
    Assert.That(insertionSort input, Is.EqualTo(expected))

[<Test>]
let ``Insertion sort: single element list`` () =
    let input = [1]
    let expected = [1]
    Assert.That(insertionSort input, Is.EqualTo(expected))
    
[<Test>]
let ``Insertion sort: unordered list`` () =
    let input = [2; 1; 4; 6; 5; 3]
    let expected = [1; 2; 3; 4; 5; 6]
    Assert.That(insertionSort input, Is.EqualTo(expected))

[<Test>]
let ``Insertion sort: ordered list`` () =
    let input = [1; 2; 3; 4; 5; 6]
    let expected = [1; 2; 3; 4; 5; 6]
    Assert.That(insertionSort input, Is.EqualTo(expected))

[<Test>]
let ``Insertion sort: random list`` () =
    let input = randomList()
    let expected = List.sort input
    Assert.That(insertionSort input, Is.EqualTo(expected))
    
[<Test>]
let ``Insertion sort: non-integer list`` () =
    let input = ['c'; 'a'; 'd'; 'e'; 'b'; 'f']
    let expected = ['a'; 'b'; 'c'; 'd'; 'e'; 'f']
    Assert.That(insertionSort input, Is.EqualTo(expected))
    
[<Test>]
let ``Insertion sort: does not modify input`` () =
    let input = [1.0; 2.5; 1.8; 3.4]
    insertionSort input |> ignore
    Assert.That(input, Is.EqualTo([1.0; 2.5; 1.8; 3.4]))

[<Test>]
let ``Selection sort: empty list`` () =
    let input = []
    let expected = []
    Assert.That(selectionSort input, Is.EqualTo(expected))

[<Test>]
let ``Selection sort: single element list`` () =
    let input = [1]
    let expected = [1]
    Assert.That(selectionSort input, Is.EqualTo(expected))
    
[<Test>]
let ``Selection sort: unordered list`` () =
    let input = [2; 1; 4; 6; 5; 3]
    let expected = [1; 2; 3; 4; 5; 6]
    Assert.That(selectionSort input, Is.EqualTo(expected))

[<Test>]
let ``Selection sort: ordered list`` () =
    let input = [1; 2; 3; 4; 5; 6]
    let expected = [1; 2; 3; 4; 5; 6]
    Assert.That(selectionSort input, Is.EqualTo(expected))

[<Test>]
let ``Selection sort: random list`` () =
    let input = randomList()
    let expected = List.sort input
    Assert.That(selectionSort input, Is.EqualTo(expected))
    
[<Test>]
let ``Selection sort: non-integer list`` () =
    let input = ['c'; 'a'; 'd'; 'e'; 'b'; 'f']
    let expected = ['a'; 'b'; 'c'; 'd'; 'e'; 'f']
    Assert.That(selectionSort input, Is.EqualTo(expected))
    
[<Test>]
let ``Selection sort: does not modify input`` () =
    let input = [1.0; 2.5; 1.8; 3.4]
    selectionSort input |> ignore
    Assert.That(input, Is.EqualTo([1.0; 2.5; 1.8; 3.4]))

[<Test>]
let ``Merge sort: empty list`` () =
    let input = []
    let expected = []
    Assert.That(mergeSort input, Is.EqualTo(expected))

[<Test>]
let ``Merge sort: single element list`` () =
    let input = [1]
    let expected = [1]
    Assert.That(mergeSort input, Is.EqualTo(expected))
    
[<Test>]
let ``Merge sort: unordered list`` () =
    let input = [2; 1; 4; 6; 5; 3]
    let expected = [1; 2; 3; 4; 5; 6]
    Assert.That(mergeSort input, Is.EqualTo(expected))

[<Test>]
let ``Merge sort: ordered list`` () =
    let input = [1; 2; 3; 4; 5; 6]
    let expected = [1; 2; 3; 4; 5; 6]
    Assert.That(mergeSort input, Is.EqualTo(expected))

[<Test>]
let ``Merge sort: random list`` () =
    let input = randomList()
    let expected = List.sort input
    Assert.That(mergeSort input, Is.EqualTo(expected))
    
[<Test>]
let ``Merge sort: non-integer list`` () =
    let input = ['c'; 'a'; 'd'; 'e'; 'b'; 'f']
    let expected = ['a'; 'b'; 'c'; 'd'; 'e'; 'f']
    Assert.That(mergeSort input, Is.EqualTo(expected))
    
[<Test>]
let ``Merge sort: does not modify input`` () =
    let input = [1.0; 2.5; 1.8; 3.4]
    mergeSort input |> ignore
    Assert.That(input, Is.EqualTo([1.0; 2.5; 1.8; 3.4]))

[<Test>]
let ``Quicksort: empty list`` () =
    let input = []
    let expected = []
    Assert.That(quicksort input, Is.EqualTo(expected))

[<Test>]
let ``Quicksort: single element list`` () =
    let input = [1]
    let expected = [1]
    Assert.That(quicksort input, Is.EqualTo(expected))
    
[<Test>]
let ``Quicksort: unordered list`` () =
    let input = [2; 1; 4; 6; 5; 3]
    let expected = [1; 2; 3; 4; 5; 6]
    Assert.That(quicksort input, Is.EqualTo(expected))

[<Test>]
let ``Quicksort: ordered list`` () =
    let input = [1; 2; 3; 4; 5; 6]
    let expected = [1; 2; 3; 4; 5; 6]
    Assert.That(quicksort input, Is.EqualTo(expected))

[<Test>]
let ``Quicksort: random list`` () =
    let input = randomList()
    let expected = List.sort input
    Assert.That(quicksort input, Is.EqualTo(expected))
    
[<Test>]
let ``Quicksort: non-integer list`` () =
    let input = ['c'; 'a'; 'd'; 'e'; 'b'; 'f']
    let expected = ['a'; 'b'; 'c'; 'd'; 'e'; 'f']
    Assert.That(quicksort input, Is.EqualTo(expected))
    
[<Test>]
let ``Quicksort: does not modify input`` () =
    let input = [1.0; 2.5; 1.8; 3.4]
    quicksort input |> ignore
    Assert.That(input, Is.EqualTo([1.0; 2.5; 1.8; 3.4]))

// https://en.wikipedia.org/wiki/Merge_sort