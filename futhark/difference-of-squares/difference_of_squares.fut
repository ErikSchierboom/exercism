def square (n: i32): i32 = n ** 2

def square_of_sum (n: i32): i32 = i32.sum (1...n) |> square

def sum_of_squares (n: i32): i32 = map square (1...n) |> i32.sum

def difference_of_squares (n: i32): i32 = square_of_sum n - sum_of_squares n
