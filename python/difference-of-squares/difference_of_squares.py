def square_of_sum(number):
    return (number * (number + 1) // 2) ** 2


def sum_of_squares(number):
    return (number * (number + 1) * (2 * number + 1)) / 6


def difference_of_squares(number):
    return square_of_sum(number) - sum_of_squares(number)
