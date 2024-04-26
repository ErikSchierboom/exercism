require 'general/unittest'

range =: i. @ (1 & +)
square_of_sum =: *: @ (+/ @ range)
sum_of_square=: +/ @ (*: @ range)
difference_of_squares =: square_of_sum - sum_of_square
