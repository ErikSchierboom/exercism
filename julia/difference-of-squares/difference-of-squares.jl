square_of_sum(n) = sum(1:n)^2
sum_of_squares(n) = sum((1:n) .^ 2)
difference(n) = square_of_sum(n) - sum_of_squares(n)
