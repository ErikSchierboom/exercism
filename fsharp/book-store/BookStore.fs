module BookStore

open System

let bookPrice = 8.

let discountPercentage =
    function
    | 2 ->  5.
    | 3 -> 10.
    | 4 -> 20.
    | 5 -> 25.
    | _ ->  0.

let discountedPrice books regularPrice = 
    let discount = discountPercentage books
    regularPrice * (100.0 - discount) / 100.

let regularPrice books = float books * bookPrice

let booksPrice books = 
    regularPrice books
    |> discountedPrice books

let bookGroups books =   
    books
    |> List.countBy id
    |> List.map snd
    |> List.sortByDescending id

let removeOneBook count = count - 1

let nonEmptyGroup count = count > 0

let removeBooks booksToRemove bookGroups =
    let left = 
        bookGroups
        |> List.take booksToRemove
        |> List.map removeOneBook
        |> List.filter nonEmptyGroup

    let right = List.skip booksToRemove bookGroups

    left @ right

let rec calculateTotalCostForSize totalCost bookGroups booksToRemove =
    let actualBooksToRemove = min booksToRemove (List.length bookGroups)

    match actualBooksToRemove with
    | 0 -> 
        totalCost + (List.sum bookGroups |> regularPrice)
    | _ ->
        let removedBooks = removeBooks actualBooksToRemove bookGroups
        let removedBooksPrice = booksPrice actualBooksToRemove
        let updatedTotalCost = totalCost + removedBooksPrice
        calculateTotalCostForSize updatedTotalCost removedBooks actualBooksToRemove

let total =
    function
    | [] -> 
        0.
    | books ->
       let counts = bookGroups books
       let numberOfGroups = List.length counts

       [1 .. numberOfGroups]
       |> List.map (calculateTotalCostForSize 0. counts)
       |> List.min