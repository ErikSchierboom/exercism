module Sorting

let swap (input: 'T[]) i j = 
    let tmp = input.[i]
    input.[i] <- input.[j]
    input.[j] <- tmp

let bubbleSort input = 
    let sorted = Array.ofList input

    for i = sorted.Length - 1 downto 0 do
        for j = 1 to i do
            if sorted.[j - 1] > sorted.[j] then
                swap sorted (j - 1) j

    Array.toList sorted

let insertionSort input = 
    let sorted = Array.ofList input

    for i = 1 to sorted.Length - 1 do
        let mutable j = i
        while j > 0 && sorted.[j - 1] > sorted.[j] do
            swap sorted (j - 1) j
            j <- j - 1

    Array.toList sorted

let selectionSort input = 
    let sorted = Array.ofList input

    for j = 0 to sorted.Length - 1 do
        let mutable min = j

        for i = j + 1 to sorted.Length - 1 do
            if sorted.[i] < sorted.[min] then 
                min <- i

        if min <> j then
            swap sorted min j

    Array.toList sorted

let split list =
    let rec aux left right =
        function        
        | []  -> (left, right)
        | [x] -> (x::left, right)
        | x::y::tail -> aux (x::left) (y::right) tail

    aux [] [] list

let merge left right = 
    let rec aux left' right' result =
        match left', right' with
        | [], [] -> 
            result
        | [], h :: t | h :: t, [] ->
            aux [] t (h :: result)
        | hl :: tl, hr :: tr ->
            if hl < hr then
                aux tl right' (hl :: result)
            else
                aux left' tr (hr :: result)
    
    aux left right [] |> List.rev

let rec mergeSort = 
    function
    | [] -> []
    | x::[] -> [x]
    | list -> 
        let (left, right) = split list
        merge (mergeSort left) (mergeSort right)

let rec quicksort = 
    function
    | [] -> 
        []
    | pivot::tail ->
        tail
        |> List.partition (fun x -> x < pivot)
        ||> (fun l r -> quicksort l @ [pivot] @ quicksort r)