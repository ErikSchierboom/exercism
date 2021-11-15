let square x = x * x
let natural_numbers number = List.init number (fun x -> x + 1)
let sum numbers = List.fold_left (+) 0 numbers

let square_of_sum number =  natural_numbers number |> sum |> square
let sum_of_squares number = natural_numbers number |> List.map square |> sum
let difference_of_squares number = square_of_sum number - sum_of_squares number 
