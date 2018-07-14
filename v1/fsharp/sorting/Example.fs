module Sorting

let swap input i j = 
    let tmp = Array.item i input
    input.[i] <- input.[j]
    input.[j] <- tmp

let bubbleSort input = 
    let sorted = Array.copy input

    for i = sorted.Length - 1 downto 0 do
        for j = 1 to i do
            if sorted.[j - 1] > sorted.[j] then
                swap sorted (j - 1) j

    sorted

let insertionSort input = 
    let sorted = Array.copy input

    for i = 1 to sorted.Length - 1 do
        let mutable j = i
        while j > 0 && sorted.[j - 1] > sorted.[j] do
            swap sorted (j - 1) j
            j <- j - 1

    sorted

let selectionSort input = 
    let sorted = Array.copy input

    for j = 0 to sorted.Length - 1 do
        let mutable min = j

        for i = j + 1 to sorted.Length - 1 do
            if sorted.[i] < sorted.[min] then 
                min <- i

        if min <> j then
            swap sorted min j

    sorted

let partition low high input =
    let pivot = Array.item high input
    let mutable i = low

    for j = low to high - 1 do
        if input.[j] <= pivot then
            swap input i j
            i <- i + 1

    swap input i high
    i

let rec quicksortRange low high input =
    if low >= high then
        input
    else
        let p = partition low high input

        input
        |> quicksortRange low (p - 1) 
        |> quicksortRange (p + 1) high

let quicksort input = 
    Array.copy input
    |> quicksortRange 0 (Array.length input - 1)